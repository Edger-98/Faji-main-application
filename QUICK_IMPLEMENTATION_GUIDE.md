# Quick Implementation Guide - Remaining Tasks

## 1. Event Creation Bottom Sheet

### Current Issue
Event creation uses a dialog, needs to be a bottom sheet.

### Implementation

**Step 1:** Find where event creation is triggered
```bash
# Search for event creation trigger
grep -r "showDialog.*event" lib/features/organize_event/
```

**Step 2:** Replace dialog with bottom sheet
```dart
// OLD: showDialog
showDialog(
  context: context,
  builder: (context) => CreateEventDialog(),
);

// NEW: showModalBottomSheet
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (context) => CreateEventBottomSheet(),
);
```

**Step 3:** Create bottom sheet widget
```dart
class CreateEventBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return Column(
            children: [
              // Drag handle
              Container(
                margin: EdgeInsets.only(top: 12.h),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: context.colors.onSurfaceVariant.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              // Your event creation form here
              Expanded(
                child: EventCreationFlowScreen(),
              ),
            ],
          );
        },
      ),
    );
  }
}
```

## 2. Search with Geolocation

### Implementation for Events Search

**File:** `lib/features/events/presentation/screens/search_screen.dart`

```dart
import 'package:fajimobileapp/core/services/location_service.dart';
import 'package:geolocator/geolocator.dart';

class SearchScreen extends ConsumerStatefulWidget {
  // ... existing code
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  Position? _userLocation;
  bool _isLoadingLocation = false;
  
  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }
  
  Future<void> _getUserLocation() async {
    setState(() => _isLoadingLocation = true);
    
    final position = await LocationService.getCurrentLocation();
    
    if (mounted) {
      setState(() {
        _userLocation = position;
        _isLoadingLocation = false;
      });
      
      // Re-sort events by distance
      _sortEventsByDistance();
    }
  }
  
  void _sortEventsByDistance() {
    if (_userLocation == null) return;
    
    final events = ref.read(eventsProvider);
    
    events.sort((a, b) {
      final distA = LocationService.calculateDistance(
        _userLocation!.latitude,
        _userLocation!.longitude,
        a.latitude,
        a.longitude,
      );
      
      final distB = LocationService.calculateDistance(
        _userLocation!.latitude,
        _userLocation!.longitude,
        b.latitude,
        b.longitude,
      );
      
      return distA.compareTo(distB);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Events'),
        actions: [
          // Location toggle button
          IconButton(
            icon: Icon(
              _userLocation != null 
                ? Icons.location_on 
                : Icons.location_off,
            ),
            onPressed: _getUserLocation,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          SearchBar(),
          
          // Location status
          if (_isLoadingLocation)
            LinearProgressIndicator(),
          
          if (_userLocation != null)
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 16.sp),
                  SizedBox(width: 8.w),
                  Text('Showing nearby events'),
                ],
              ),
            ),
          
          // Events list with distance
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                final distance = _userLocation != null
                  ? LocationService.calculateDistance(
                      _userLocation!.latitude,
                      _userLocation!.longitude,
                      event.latitude,
                      event.longitude,
                    )
                  : null;
                
                return EventCard(
                  event: event,
                  distance: distance != null 
                    ? LocationService.formatDistance(distance)
                    : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
```

### Implementation for Vendor Search

**File:** `lib/features/cohost_marketplace/presentation/screens/marketplace_screen.dart`

Same pattern as events search:
1. Get user location on init
2. Calculate distance to each vendor
3. Sort by distance
4. Display distance in vendor cards

```dart
// In vendor card
if (distance != null)
  Row(
    children: [
      Icon(Icons.location_on, size: 12.sp),
      SizedBox(width: 4.w),
      Text(
        LocationService.formatDistance(distance),
        style: AppTypography.bodySmall,
      ),
    ],
  ),
```

## 3. Session Management Fix

### Current Issue
App logs out but stays within the app.

### Implementation

**File:** `lib/core/services/session_timeout_service.dart`

```dart
class SessionTimeoutService {
  Future<void> handleSessionExpired(BuildContext context) async {
    // Clear all auth data
    final container = ProviderScope.containerOf(context);
    await container.read(authStateViewModelProvider.notifier).logout();
    
    // Show message
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Session expired. Please log in again.'),
          backgroundColor: AppColors.error,
          duration: Duration(seconds: 3),
        ),
      );
      
      // Navigate to login and clear stack
      context.go(RouteManager.intro);
    }
  }
}
```

**File:** `lib/core/services/inactivity_timeout_service.dart`

```dart
class InactivityTimeoutService {
  void _handleTimeout(BuildContext context) async {
    print('⏰ Inactivity timeout - logging out');
    
    // Clear auth
    final container = ProviderScope.containerOf(context);
    await container.read(authStateViewModelProvider.notifier).logout();
    
    // Show dialog
    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text('Session Expired'),
          content: Text('You have been logged out due to inactivity.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.go(RouteManager.intro);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
```

**File:** `lib/features/auth/presentation/viewmodels/auth_state_viewmodel.dart`

Ensure logout clears everything:
```dart
Future<void> logout() async {
  try {
    // Clear token
    await _authTokenService.clearToken();
    
    // Clear local data
    await _localDataSource.clearUserData();
    
    // Clear shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    // Update state
    state = state.copyWith(
      isAuthenticated: false,
      user: null,
      authToken: null,
    );
    
    print('✅ Logout complete');
  } catch (e) {
    print('❌ Logout error: $e');
    rethrow;
  }
}
```

## 4. CRUD Operations Verification

### Test Checklist

**Events:**
- [x] Create event - Working
- [x] Update event - Working  
- [x] Delete event - Working
- [x] Bookmark event - Working

**Vendors:**
- [ ] Create vendor profile
- [ ] Update vendor profile
- [ ] Delete vendor resource
- [ ] List vendor resources

### Testing Commands

```bash
# Run app in debug mode
flutter run --debug

# Watch logs
flutter logs

# Test specific feature
flutter run --dart-define=TEST_MODE=true
```

### Manual Testing Steps

1. **Create Event:**
   - Go to My Events tab
   - Tap "+" button
   - Fill in all details
   - Submit
   - Verify event appears in list

2. **Update Event:**
   - Open event details
   - Tap Edit tab
   - Change details
   - Save
   - Verify changes persist

3. **Delete Event:**
   - Open event details
   - Go to Settings tab
   - Tap Delete
   - Confirm
   - Verify event removed

4. **Bookmark Event:**
   - Find event in home
   - Tap bookmark icon
   - Go to Tickets tab
   - Verify event in bookmarks

## 5. Stripe Payment Integration

### Backend Requirements

Your backend needs to create payment intents. Example endpoint:

```javascript
// POST /api/v1/payments/create-intent
{
  "amount": 5000, // in cents
  "currency": "usd",
  "eventId": "event_123",
  "ticketQuantity": 2,
  "metadata": {
    "userId": "user_123",
    "eventId": "event_123"
  }
}

// Response
{
  "clientSecret": "pi_xxx_secret_xxx",
  "paymentIntentId": "pi_xxx",
  "amount": 5000,
  "currency": "usd"
}
```

### Frontend Integration

**File:** `lib/features/tickets/presentation/widgets/buy_ticket_bottom_sheet.dart`

```dart
Future<void> _proceedToPayment() async {
  // ... existing code to create purchase request
  
  final result = await purchaseUseCase(request);
  
  result.fold(
    (failure) => _showError(failure.message),
    (response) async {
      // If backend returns Stripe client secret
      if (response.payment.clientSecret != null) {
        final success = await StripeService.presentPaymentSheet(
          clientSecret: response.payment.clientSecret!,
          customerId: response.payment.customerId,
          ephemeralKey: response.payment.ephemeralKey,
        );
        
        if (success) {
          Navigator.pop(context);
          _showSuccess('Payment successful!');
        } else {
          _showError('Payment cancelled or failed');
        }
      } else {
        // Free ticket or other payment method
        Navigator.pop(context);
        _showSuccess('Tickets purchased!');
      }
    },
  );
}
```

## Testing Checklist

### Before Testing
- [ ] Run `flutter pub get`
- [ ] Update .env with Stripe keys
- [ ] Ensure backend is running
- [ ] Clear app data for fresh start

### Feature Testing
- [ ] Support email opens mail client
- [ ] FAQs expand/collapse correctly
- [ ] Rate app opens store
- [ ] Profile doesn't show wallet
- [ ] Vendor share works
- [ ] Location permission requested
- [ ] Events sorted by distance
- [ ] Vendors sorted by distance
- [ ] Session timeout works
- [ ] Logout clears everything
- [ ] Stripe payment sheet appears

### Platform Testing
- [ ] Test on iOS simulator
- [ ] Test on Android emulator
- [ ] Test on physical iOS device
- [ ] Test on physical Android device

## Common Issues & Solutions

### Issue: Location permission denied
**Solution:** 
- Check Info.plist has location descriptions
- Check AndroidManifest.xml has permissions
- Request permission before using location

### Issue: Stripe not initializing
**Solution:**
- Verify .env file has STRIPE_PUBLISHABLE_KEY
- Check key format (starts with pk_test_ or pk_live_)
- Ensure StripeService.initialize() is called in main()

### Issue: Session doesn't expire
**Solution:**
- Check SessionTimeoutService is initialized
- Verify timeout duration is set correctly
- Ensure timer is reset on user activity

### Issue: Events not sorting by distance
**Solution:**
- Verify location permission granted
- Check latitude/longitude are valid numbers
- Ensure sort function is called after location update

## Next Steps

1. Implement event creation bottom sheet
2. Add geolocation to search screens
3. Fix session management
4. Test all CRUD operations
5. Configure Stripe with real keys
6. Test on physical devices
7. Submit for review

## Support

If you encounter issues:
1. Check console logs for errors
2. Verify all dependencies installed
3. Clear build cache: `flutter clean && flutter pub get`
4. Restart IDE
5. Check this guide for solutions
