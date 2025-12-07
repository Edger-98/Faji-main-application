# Quick Debug Steps for "Failed to Load Events"

## Step 1: Check Backend is Running
```bash
# Test if backend is accessible
curl http://localhost:5001/api/v1/events

# Expected: JSON response with events
# If error: Start your backend server
```

## Step 2: Check App Environment
The app defaults to **PRODUCTION** mode. You need to explicitly run in dev mode:

```bash
# ❌ WRONG - This uses production URL (Heroku)
flutter run

# ✅ CORRECT - This uses localhost:5001
flutter run --dart-define=ENV=dev
```

## Step 3: Check Flutter Console Logs
When you run the app, look for these logs:

```
🚀 REQUEST[GET] => /events
```

Then you'll see either:
```
✅ RESPONSE[200] => /events  (Success!)
```
OR
```
❌ ERROR[xxx] => /events  (Problem!)
```

## Step 4: Common Error Messages

### "Connection timeout"
- Backend is not running
- Wrong port number
- Firewall blocking connection

**Fix:** Start backend on port 5001

### "Unauthorized" or "401"
- API requires authentication token
- No token set in the app

**Fix:** Set token after login:
```dart
final apiService = ref.read(apiServiceProvider);
apiService.setToken('your_jwt_token');
```

### "Resource not found" or "404"
- Backend endpoint doesn't exist
- Wrong API path

**Fix:** Check backend has `/api/v1/events` endpoint

### "Network error"
- No internet connection
- Backend URL is wrong
- Using production URL instead of dev

**Fix:** Run with `--dart-define=ENV=dev`

## Step 5: Quick Test

Add this temporary code to test the connection:

```dart
// In your main.dart or any screen
void testConnection() async {
  final dio = Dio();
  dio.options.baseUrl = 'http://localhost:5001/api/v1';
  
  try {
    print('Testing connection to: ${dio.options.baseUrl}');
    final response = await dio.get('/events');
    print('✅ SUCCESS: ${response.statusCode}');
    print('Data: ${response.data}');
  } catch (e) {
    print('❌ ERROR: $e');
  }
}
```

## Most Likely Solution

**You're probably running in production mode!**

Stop the app and restart with:
```bash
flutter run --dart-define=ENV=dev
```

This will use `localhost:5001` instead of the Heroku production URL.
