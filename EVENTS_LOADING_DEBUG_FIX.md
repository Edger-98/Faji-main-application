# Events Loading Debug & Fix ✓

## Issue
"Upcoming Events" and "Your Events" sections showing "Failed to load" error on the home screen.

## Root Cause Analysis
The sections were failing silently without providing enough information about what went wrong. Possible causes:
1. API endpoints returning errors
2. Data parsing issues
3. Network connectivity problems
4. Authentication token issues
5. Backend endpoint not implemented

## Solutions Applied

### 1. Enhanced Error Logging
**File:** `lib/features/events/data/repositories/event_repository_impl.dart`

Added comprehensive logging to both methods:

#### getUpcomingEvents()
```dart
print('🔍 getUpcomingEvents: Starting request with limit=$limit');
print('📡 getUpcomingEvents: Calling API endpoint /events/upcoming');
print('✅ getUpcomingEvents: Response received - success: ${response.success}');
print('📊 getUpcomingEvents: Received ${data.length} events');
print('❌ getUpcomingEvents: DioException - ${e.type}, status: ${e.response?.statusCode}');
```

#### getUserEvents()
```dart
print('🔍 getUserEvents: Starting request');
print('📡 getUserEvents: Calling API endpoint /events/my-events');
print('✅ getUserEvents: Response received - status: ${response.response.statusCode}');
print('📊 getUserEvents: Response data type: ${responseData.runtimeType}');
print('📊 getUserEvents: Processing ${eventsJson.length} events');
```

### 2. Added Retry Buttons
**Files:** 
- `lib/features/home/presentation/widgets/upcoming_events_section.dart`
- `lib/features/home/presentation/widgets/your_events_section.dart`

Added retry functionality to error states:

```dart
TextButton.icon(
  onPressed: () {
    // Retry loading
    ref.invalidate(upcomingEventsProvider); // For upcoming events
    // OR
    ref.read(userEventsProvider.notifier).getUserEvents(); // For user events
  },
  icon: Icon(Icons.refresh, size: 18.sp),
  label: Text('Retry'),
)
```

### 3. Better Error Handling
- Network errors are caught and logged
- 404 errors return empty list (endpoint not implemented)
- Parsing errors are logged with stack traces
- Invalid data structures are handled gracefully

## API Endpoints Being Called

### Upcoming Events
```
GET https://faji-backend-52878caa6589.herokuapp.com/api/v1/events/upcoming?limit=10
```

### Your Events (User's Organized Events)
```
GET https://faji-backend-52878caa6589.herokuapp.com/api/v1/events/my-events
```

## Expected Response Formats

### Upcoming Events Response
```json
{
  "success": true,
  "data": [
    {
      "id": "event_id",
      "title": "Event Title",
      "description": "Event Description",
      "startDate": "2025-01-10T18:00:00.000Z",
      "endDate": "2025-01-10T22:00:00.000Z",
      "location": "Event Location",
      "imageUrl": "https://cloudinary.com/...",
      "price": 50.00,
      "totalTickets": 100,
      "availableTickets": 75,
      ...
    }
  ]
}
```

### Your Events Response
```json
{
  "success": true,
  "data": {
    "events": [
      {
        "id": "event_id",
        "name": "Event Name",
        "description": "Event Description",
        "startDate": "2025-01-10T18:00:00.000Z",
        "endDate": "2025-01-10T22:00:00.000Z",
        "host": {
          "id": "user_id",
          "name": "Host Name",
          "avatar": "https://..."
        },
        "location": {
          "address": "123 Main St",
          "latitude": 40.7128,
          "longitude": -74.0060
        },
        "media": {
          "poster": "https://cloudinary.com/..."
        },
        "imageUrl": "https://cloudinary.com/...",
        ...
      }
    ],
    "pagination": {
      "page": 1,
      "limit": 20,
      "total": 5
    }
  }
}
```

## Debugging Steps

### 1. Check Console Logs
Run the app and watch for these log messages:

**For Upcoming Events:**
```
🔍 getUpcomingEvents: Starting request with limit=10
📡 getUpcomingEvents: Calling API endpoint /events/upcoming
✅ getUpcomingEvents: Response received - success: true
📊 getUpcomingEvents: Received 5 events
```

**For Your Events:**
```
🔍 getUserEvents: Starting request
📡 getUserEvents: Calling API endpoint /events/my-events
✅ getUserEvents: Response received - status: 200
📊 getUserEvents: Response data type: _Map<String, dynamic>
📊 getUserEvents: Response keys: [success, data]
📊 getUserEvents: Data type: _Map<String, dynamic>
📊 getUserEvents: Found events field, type: List<dynamic>
📊 getUserEvents: Processing 3 events
✅ getUserEvents: Successfully parsed 3 events
```

### 2. Check for Errors
Look for error messages:

```
❌ getUpcomingEvents: DioException - DioExceptionType.response, status: 404
❌ getUpcomingEvents: Error message: Http status error [404]
❌ getUpcomingEvents: Response data: {"error": "Endpoint not found"}
```

```
❌ getUserEvents: No network connection
❌ getUserEvents: Non-200 status code
❌ getUserEvents: Invalid response format
❌ getUserEvents: Error parsing event: ...
```

### 3. Common Issues & Solutions

#### Issue: 404 Not Found
**Cause:** Backend endpoint not implemented
**Solution:** 
- Check if backend has `/events/upcoming` endpoint
- Check if backend has `/events/my-events` endpoint
- If not, endpoints return empty list gracefully

#### Issue: 401 Unauthorized
**Cause:** No auth token or expired token
**Solution:**
- Check if user is logged in
- Check if auth token is being sent in headers
- Session timeout will redirect to login

#### Issue: Network Error
**Cause:** No internet connection or backend is down
**Solution:**
- Check internet connection
- Verify backend URL: `https://faji-backend-52878caa6589.herokuapp.com`
- Check if Heroku app is awake

#### Issue: Parsing Error
**Cause:** Response format doesn't match expected structure
**Solution:**
- Check console logs for actual response structure
- Update parsing logic if backend changed format
- Check `_convertOrganizedEventToEntity` method

## User Experience Improvements

### Before:
- Shows "Failed to load events"
- No way to retry
- No information about what went wrong

### After:
- Shows "Failed to load events"
- **Retry button** to try again
- **Detailed console logs** for debugging
- **Graceful fallbacks** (empty list instead of crash)

## Testing Checklist

- [ ] Open app and check home screen
- [ ] Look at "Upcoming Events" section
- [ ] Look at "Your Events" section
- [ ] Check console logs for any errors
- [ ] If error shown, click "Retry" button
- [ ] Verify network connectivity
- [ ] Verify user is logged in
- [ ] Check backend is responding

## Next Steps

1. **Run the app** and check console logs
2. **Identify the specific error** from logs
3. **Take action based on error:**
   - 404: Backend needs to implement endpoint
   - 401: Check authentication
   - Network: Check connectivity
   - Parsing: Check response format

## Files Modified

1. ✅ `lib/features/events/data/repositories/event_repository_impl.dart`
   - Added comprehensive logging to `getUpcomingEvents()`
   - Added comprehensive logging to `getUserEvents()`

2. ✅ `lib/features/home/presentation/widgets/upcoming_events_section.dart`
   - Added retry button to error state

3. ✅ `lib/features/home/presentation/widgets/your_events_section.dart`
   - Added retry button to error state

## Summary

The events loading issue has been enhanced with:
- ✅ Detailed error logging for debugging
- ✅ Retry buttons for better UX
- ✅ Graceful error handling
- ✅ Clear console output for troubleshooting

**Next:** Run the app and check the console logs to see the exact error! 🔍
