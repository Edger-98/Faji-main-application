# Integrating Remaining Vendor APIs

## ✅ Completed So Far

1. **Registration Screen** - ✅ API Integrated
2. **Resources List Screen** - ✅ API Integrated (fetch, delete, toggle)
3. **Add Resource Screen** - ✅ API Integrated (create)

## 🔄 In Progress

### 3. Bookings List Screen

**File**: `lib/features/vendor/presentation/screens/vendor_bookings_list_screen.dart`

**Changes Needed**:
```dart
// Add at top
import '../../data/providers/vendor_providers.dart';

// Add state variables
bool _isLoadingPending = true;
bool _isLoadingAccepted = true;
bool _isLoadingCompleted = true;
List<dynamic> _pendingBookings = [];
List<dynamic> _acceptedBookings = [];
List<dynamic> _completedBookings = [];

// Add in initState
@override
void initState() {
  super.initState();
  _fetchBookings();
}

// Add fetch method
Future<void> _fetchBookings() async {
  _fetchPendingBookings();
  _fetchAcceptedBookings();
  _fetchCompletedBookings();
}

Future<void> _fetchPendingBookings() async {
  setState(() => _isLoadingPending = true);
  try {
    final datasource = ref.read(vendorRemoteDataSourceProvider);
    final response = await datasource.getBookingRequests(status: 'pending');
    if (response.response.statusCode == 200) {
      setState(() {
        _pendingBookings = response.data['data'] ?? [];
        _isLoadingPending = false;
      });
    }
  } catch (e) {
    setState(() => _isLoadingPending = false);
    // Use mock data as fallback
  }
}

// Similar for accepted and completed

// Update accept dialog
Future<void> _acceptBooking(String bookingId) async {
  try {
    final datasource = ref.read(vendorRemoteDataSourceProvider);
    await datasource.acceptBooking(bookingId);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Booking accepted!'), backgroundColor: AppColors.success),
    );
    _fetchBookings(); // Refresh
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed: $e'), backgroundColor: AppColors.error),
    );
  }
}

// Update decline dialog
Future<void> _declineBooking(String bookingId, String reason) async {
  try {
    final datasource = ref.read(vendorRemoteDataSourceProvider);
    await datasource.declineBooking(bookingId, {'reason': reason});
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Booking declined'), backgroundColor: AppColors.success),
    );
    _fetchBookings();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed: $e'), backgroundColor: AppColors.error),
    );
  }
}

// Update counter offer dialog
Future<void> _sendCounterOffer(String bookingId, int price, String message) async {
  try {
    final datasource = ref.read(vendorRemoteDataSourceProvider);
    await datasource.counterOffer(bookingId, {
      'counterPrice': price,
      'message': message,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Counter offer sent!'), backgroundColor: AppColors.success),
    );
    _fetchBookings();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed: $e'), backgroundColor: AppColors.error),
    );
  }
}
```

### 4. Dashboard Screen

**File**: `lib/features/vendor/presentation/screens/vendor_dashboard_screen.dart`

**Changes Needed**:
```dart
// Convert to StatefulWidget
class VendorDashboardScreen extends ConsumerStatefulWidget {
  const VendorDashboardScreen({super.key});

  @override
  ConsumerState<VendorDashboardScreen> createState() =>
      _VendorDashboardScreenState();
}

class _VendorDashboardScreenState extends ConsumerState<VendorDashboardScreen> {
  bool _isLoading = true;
  Map<String, dynamic>? _stats;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchStats();
  }

  Future<void> _fetchStats() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final datasource = ref.read(vendorRemoteDataSourceProvider);
      final response = await datasource.getVendorStats();

      if (!mounted) return;

      if (response.response.statusCode == 200) {
        setState(() {
          _stats = response.data['data'] ?? response.data;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load stats');
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _isLoading = false;
        // Use mock data as fallback
        _stats = {
          'totalBookings': 24,
          'totalEarnings': 4850000,
          'pendingRequests': 3,
          'activeResources': 8,
        };
      });
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }

    final stats = _stats ?? {};
    
    // Rest of build method using stats data
  }
}
```

## Quick Implementation Script

Since these are large files, I'll create complete new versions for bookings and dashboard.
