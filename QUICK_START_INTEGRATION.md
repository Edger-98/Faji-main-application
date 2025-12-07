# Quick Start - Event Management Integration

## 🚀 Get Started in 30 Minutes

This guide gets you from zero to working event list in 30 minutes.

---

## Prerequisites

✅ Backend API running at `http://localhost:5000`  
✅ Valid JWT token for testing  
✅ Flutter project setup complete

---

## Step 1: Install Dependencies (5 min)

Add to `pubspec.yaml`:
```yaml
dependencies:
  dio: ^5.4.0
```

Run:
```bash
flutter pub get
```

---

## Step 2: Create API Service (10 min)

**Create:** `lib/core/services/api_service.dart`

```dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  final Dio _dio;
  
  ApiService() : _dio = Dio() {
    _dio.options.baseUrl = 'http://localhost:5000/api/v1';
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }
  
  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }
  
  Future<Response> get(String path, {Map<String, dynamic>? params}) {
    return _dio.get(path, queryParameters: params);
  }
  
  Future<Response> post(String path, {dynamic data}) {
    return _dio.post(path, data: data);
  }
  
  Future<Response> patch(String path, {dynamic data}) {
    return _dio.patch(path, data: data);
  }
}

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
```

---

## Step 3: Create Event Repository (10 min)

**Create:** `lib/features/organize_event/data/repositories/event_repository.dart`

```dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/api_service.dart';

class EventRepository {
  final ApiService _api;
  
  EventRepository(this._api);
  
  Future<List<Map<String, dynamic>>> getEvents() async {
    try {
      final response = await _api.get('/events', params: {
        'status': 'upcoming',
        'role': 'all',
      });
      
      final data = response.data['data'];
      return List<Map<String, dynamic>>.from(data['events']);
    } catch (e) {
      throw Exception('Failed to load events: $e');
    }
  }
  
  Future<Map<String, dynamic>> getEventDetails(String eventId) async {
    try {
      final response = await _api.get('/events/$eventId');
      return response.data['data'];
    } catch (e) {
      throw Exception('Failed to load event details: $e');
    }
  }
}

final eventRepositoryProvider = Provider<EventRepository>((ref) {
  return EventRepository(ref.read(apiServiceProvider));
});

final eventsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  return ref.read(eventRepositoryProvider).getEvents();
});
```

---

## Step 4: Update My Events Screen (5 min)

**Update:** `lib/features/tickets/presentation/screens/tickets_content.dart`

Find the `_buildUpcomingTab()` method and replace with:

```dart
Widget _buildUpcomingTab() {
  final eventsAsync = ref.watch(eventsProvider);
  
  return eventsAsync.when(
    data: (events) => Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: _buildEventCard(
                eventId: event['id'],
                role: event['role'],
                eventName: event['name'],
                date: _formatDate(event['startDate']),
                countdown: _calculateCountdown(event['endDate']),
              ),
            );
          },
        ),
        _buildCreateEventButton(),
      ],
    ),
    loading: () => const Center(child: CircularProgressIndicator()),
    error: (error, stack) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error loading events'),
          ElevatedButton(
            onPressed: () => ref.refresh(eventsProvider),
            child: const Text('Retry'),
          ),
        ],
      ),
    ),
  );
}

String _formatDate(String isoDate) {
  final date = DateTime.parse(isoDate);
  final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return '${months[date.month - 1]} ${date.day}${_getDaySuffix(date.day)}';
}

String _getDaySuffix(int day) {
  if (day >= 11 && day <= 13) return 'th';
  switch (day % 10) {
    case 1: return 'st';
    case 2: return 'nd';
    case 3: return 'rd';
    default: return 'th';
  }
}

String _calculateCountdown(String isoDate) {
  final end = DateTime.parse(isoDate);
  final now = DateTime.now();
  final diff = end.difference(now);
  
  final hours = diff.inHours;
  final mins = diff.inMinutes % 60;
  final secs = diff.inSeconds % 60;
  
  return '$hours Hours $mins Mins $secs Secs';
}
```

---

## Step 5: Set Auth Token

Before testing, set your auth token:

```dart
// In your app initialization or login success
final apiService = ref.read(apiServiceProvider);
apiService.setToken('your_jwt_token_here');
```

---

## Step 6: Test! 🎉

```bash
flutter run
```

**Expected Results:**
1. ✅ App loads
2. ✅ My Events screen shows
3. ✅ Events load from API
4. ✅ Event cards display correctly
5. ✅ Tapping card navigates to details

---

## Troubleshooting

### Events Not Loading?

**Check 1:** Backend is running
```bash
curl http://localhost:5000/api/v1/events
```

**Check 2:** Token is set
```dart
print(apiService._dio.options.headers['Authorization']);
```

**Check 3:** Check console for errors
```dart
// Add to ApiService constructor
_dio.interceptors.add(LogInterceptor(
  requestBody: true,
  responseBody: true,
  error: true,
));
```

### Android Emulator Can't Connect?

Change base URL to:
```dart
baseUrl: 'http://10.0.2.2:5000/api/v1'
```

### iOS Simulator Can't Connect?

Enable local network in `Info.plist`:
```xml
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsLocalNetworking</key>
  <true/>
</dict>
```

---

## What's Next?

After events list works:

1. **Event Details** - Connect event details screen
2. **PLAN Tab** - Connect budget, tasks, vendors
3. **GUEST Tab** - Connect guest list and add guest
4. **CHAT Tab** - Connect messages and send
5. **SETTINGS Tab** - Connect settings updates
6. **EDIT Tab** - Connect event updates

See `INTEGRATION_GUIDE.md` for detailed steps.

---

## Quick Reference

### API Endpoints
```
GET    /api/v1/events                    # List events
GET    /api/v1/events/{id}               # Event details
GET    /api/v1/events/{id}/budget        # Budget
GET    /api/v1/events/{id}/tasks         # Tasks
GET    /api/v1/events/{id}/guests        # Guests
GET    /api/v1/events/{id}/messages      # Messages
POST   /api/v1/events/{id}/messages      # Send message
PATCH  /api/v1/events/{id}               # Update event
```

### Base URL
```
Development: http://localhost:5000/api/v1
Production:  https://api.example.com/api/v1
```

### Auth Header
```
Authorization: Bearer {your_jwt_token}
```

---

## Success Criteria

✅ Events load from API  
✅ Event cards display correctly  
✅ Navigation to details works  
✅ No console errors  
✅ Loading states show  
✅ Error handling works  

---

**Time to Complete:** ~30 minutes  
**Difficulty:** Easy  
**Next:** See `INTEGRATION_GUIDE.md` for full integration

Good luck! 🚀
