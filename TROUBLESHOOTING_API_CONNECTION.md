# Troubleshooting: Failed to Load Events

## Quick Checks

### 1. Verify Backend is Running
```bash
# Check if backend is running on port 5001
curl http://localhost:5001/api/v1/events

# Or check the health endpoint
curl http://localhost:5001/health
```

### 2. Check App Environment
Make sure you're running the app in development mode:
```bash
# Run with dev environment
flutter run --dart-define=ENV=dev

# Check logs to see which URL is being used
# Look for: "🚀 REQUEST[GET] => /events"
```

### 3. Check API Service Logs
The app logs all API requests. Look for:
```
🚀 REQUEST[GET] => /events
✅ RESPONSE[200] => /events
❌ ERROR[xxx] => /events
```

### 4. Test API Manually

#### For iOS Simulator / Web:
```bash
curl http://localhost:5001/api/v1/events
```

#### For Android Emulator:
```bash
# Android emulator uses 10.0.2.2 instead of localhost
curl http://10.0.2.2:5001/api/v1/events
```

### 5. Common Issues & Solutions

#### Issue: Connection Refused
**Cause:** Backend not running or wrong port
**Solution:**
```bash
# Start your backend on port 5001
cd backend
npm start  # or your start command
```

#### Issue: 401 Unauthorized
**Cause:** Missing authentication token
**Solution:**
```dart
// Set token after login
final apiService = ref.read(apiServiceProvider);
apiService.setToken('your_jwt_token');
```

#### Issue: CORS Error (Web only)
**Cause:** Backend not configured for CORS
**Solution:** Add CORS headers in backend:
```javascript
app.use(cors({
  origin: 'http://localhost:*',
  credentials: true
}));
```

#### Issue: Network Error on Android Emulator
**Cause:** Android can't reach localhost
**Solution:** The app already uses `10.0.2.2` for Android emulators automatically

### 6. Enable Debug Logging

Add this to see detailed API logs:
```dart
// In api_service.dart, the interceptor already logs:
print('🚀 REQUEST[${options.method}] => ${options.path}');
print('✅ RESPONSE[${response.statusCode}] => ${response.requestOptions.path}');
print('❌ ERROR[${error.response?.statusCode}] => ${error.requestOptions.path}');
```

### 7. Test with Mock Data

If backend is not ready, you can temporarily use mock data:
```dart
// In event_repository.dart
Future<List<EventModel>> getEvents({...}) async {
  // Temporary mock data for testing
  return [
    EventModel(
      id: 'test_1',
      name: 'Test Event',
      // ... other fields
    ),
  ];
}
```

### 8. Check Backend Response Format

The backend must return data in this format:
```json
{
  "success": true,
  "data": {
    "events": [
      {
        "id": "evt_123",
        "name": "Event Name",
        "startDate": "2025-11-30T11:40:00Z",
        "endDate": "2025-11-30T14:40:00Z",
        // ... other fields
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 1,
      "totalItems": 1
    }
  }
}
```

### 9. Verify API Endpoint

Check that your backend has this endpoint:
```
GET /api/v1/events
```

Not:
- `/events` (missing /api/v1)
- `/api/events` (missing /v1)
- `/v1/events` (missing /api)

### 10. Check Flutter Console

Run the app and check the console output:
```bash
flutter run --dart-define=ENV=dev

# Look for error messages like:
# - Connection timeout
# - Connection refused
# - 404 Not Found
# - 401 Unauthorized
# - 500 Internal Server Error
```

## Quick Test Script

Create a test file to verify the connection:

```dart
// test_api_connection.dart
import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  dio.options.baseUrl = 'http://localhost:5001/api/v1';
  
  try {
    final response = await dio.get('/events');
    print('✅ SUCCESS: ${response.statusCode}');
    print('Data: ${response.data}');
  } catch (e) {
    print('❌ ERROR: $e');
  }
}
```

Run it:
```bash
dart test_api_connection.dart
```

## Still Not Working?

1. **Check backend logs** - See what error the backend is returning
2. **Use Postman/Insomnia** - Test the API endpoint directly
3. **Check firewall** - Make sure port 5001 is not blocked
4. **Try different port** - Change to 3000 or 8080 if 5001 doesn't work
5. **Check network** - Make sure device/emulator has network access

## Need More Help?

Share these details:
1. Platform (iOS/Android/Web)
2. Error message from Flutter console
3. Backend response (from curl or Postman)
4. API service logs (🚀 REQUEST, ✅ RESPONSE, ❌ ERROR)
