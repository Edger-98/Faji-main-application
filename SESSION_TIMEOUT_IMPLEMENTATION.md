# Session Timeout Implementation ✓

## Overview
Implemented automatic session timeout handling that redirects users to the Welcome Back screen with a notification when their authentication token expires or becomes invalid.

## What Was Implemented

### 1. Enhanced Auth Interceptor
**File:** `lib/core/network/interceptors/auth_interceptor.dart`

**Changes:**
- Added static callback `onSessionTimeout` for handling session expiration
- Enhanced `_handleUnauthorized()` to clear both auth and refresh tokens
- Triggers callback when 401 (Unauthorized) response is received
- Added logging for better debugging

**Key Features:**
```dart
// Callback mechanism for session timeout
static void Function()? onSessionTimeout;

// Clears all auth data on 401
await _storage.delete(key: 'auth_token');
await _storage.delete(key: 'refresh_token');

// Triggers the callback
if (onSessionTimeout != null) {
  onSessionTimeout!();
}
```

### 2. Session Timeout Service
**File:** `lib/core/services/session_timeout_service.dart`

**Features:**
- Singleton service for centralized session timeout handling
- Prevents multiple simultaneous timeout handlers
- Shows user-friendly notification
- Automatically navigates to Welcome Back screen
- Context-aware with mounted checks

**Key Methods:**
- `initialize(BuildContext)` - Set up service with app context
- `_handleSessionTimeout()` - Handle timeout event
- `_showSessionTimeoutNotification()` - Display toast notification
- `updateContext(BuildContext)` - Update context when navigating
- `triggerSessionTimeout()` - Manual trigger for testing

**Notification Details:**
- Type: Warning (yellow/orange)
- Title: "Session Expired"
- Message: "Your session has expired. Please log in again to continue."
- Duration: 4 seconds
- Position: Top center
- Features: Progress bar, dismissible, pause on hover

### 3. App Integration
**File:** `lib/main.dart`

**Changes:**
- Imported `SessionTimeoutService`
- Initialize service in `addPostFrameCallback` after app builds
- Service is ready to handle session timeouts throughout the app

```dart
WidgetsBinding.instance.addPostFrameCallback((_) {
  // ... existing code ...
  
  // Initialize session timeout service with context
  SessionTimeoutService().initialize(context);
});
```

## How It Works

### Flow Diagram
```
API Request with Token
        ↓
   401 Response
        ↓
  Auth Interceptor
        ↓
  Clear Tokens
        ↓
Trigger Callback
        ↓
Session Timeout Service
        ↓
Show Notification
        ↓
Navigate to Welcome Back
        ↓
User Re-authenticates
```

### Detailed Flow

1. **User Makes API Request**
   - Auth interceptor adds token to request headers
   - Request is sent to backend

2. **Token Expired/Invalid**
   - Backend returns 401 Unauthorized
   - Auth interceptor catches the error

3. **Clear Authentication**
   - Delete `auth_token` from secure storage
   - Delete `refresh_token` from secure storage
   - Log the event

4. **Trigger Timeout Handler**
   - Call `SessionTimeoutService._handleSessionTimeout()`
   - Check if already handling (prevent duplicates)
   - Verify context is mounted

5. **Show Notification**
   - Display toast with session expired message
   - 4-second duration with progress bar
   - User-friendly warning style

6. **Navigate to Welcome Back**
   - Wait 500ms for notification to appear
   - Navigate to `/welcome-back` route
   - User sees their profile info and password field

7. **User Re-authenticates**
   - Enter password
   - Login with existing email
   - New token is stored
   - Navigate to home screen

## User Experience

### Before Session Timeout
- User is browsing the app normally
- Making API requests with valid token

### During Session Timeout
1. **Notification Appears** (Top of screen)
   ```
   ⚠️ Session Expired
   Your session has expired. Please log in again to continue.
   ```

2. **Automatic Navigation** (After 500ms)
   - Smoothly transitions to Welcome Back screen
   - No jarring experience or crashes

### On Welcome Back Screen
- User sees their profile picture placeholder
- "Welcome back, [Name]"
- Email address displayed
- Password field ready for input
- "Continue" button to re-authenticate
- Option to switch accounts

### After Re-authentication
- User is logged back in
- Navigated to home screen
- Can continue using the app normally

## Benefits

✅ **Automatic Handling** - No manual intervention needed
✅ **User-Friendly** - Clear notification explains what happened
✅ **Secure** - Tokens are cleared immediately
✅ **Smooth UX** - Graceful transition to login screen
✅ **No Crashes** - Proper context and mounted checks
✅ **Prevents Duplicates** - Flag prevents multiple handlers
✅ **Centralized** - Single service handles all timeouts
✅ **Testable** - Manual trigger method for testing

## Testing Scenarios

### Test 1: Natural Token Expiration
1. Log in to the app
2. Wait for token to expire (or modify backend to expire quickly)
3. Make any API request (browse events, view profile, etc.)
4. **Expected:** Notification appears, redirected to Welcome Back

### Test 2: Invalid Token
1. Log in to the app
2. Manually corrupt the token in secure storage
3. Make any API request
4. **Expected:** Notification appears, redirected to Welcome Back

### Test 3: Multiple Simultaneous Requests
1. Log in with expired token
2. Make multiple API requests at once
3. **Expected:** Single notification, single redirect (no duplicates)

### Test 4: Context Unmounted
1. Log in with expired token
2. Navigate away quickly while request is pending
3. **Expected:** No crash, graceful handling

### Test 5: Manual Trigger (Testing)
```dart
// In any screen for testing
SessionTimeoutService().triggerSessionTimeout();
```
**Expected:** Notification appears, redirected to Welcome Back

## Configuration

### Notification Customization
Edit `lib/core/services/session_timeout_service.dart`:

```dart
// Change notification duration
autoCloseDuration: const Duration(seconds: 4),

// Change notification position
alignment: Alignment.topCenter,

// Change notification style
type: ToastificationType.warning,
style: ToastificationStyle.fillColored,

// Customize text
title: const Text('Session Expired'),
description: const Text('Your session has expired...'),
```

### Navigation Delay
```dart
// Adjust delay before navigation (default 500ms)
Future.delayed(const Duration(milliseconds: 500), () {
  // Navigation code
});
```

## Security Considerations

✅ **Immediate Token Clearing** - Tokens deleted as soon as 401 is detected
✅ **Secure Storage** - Uses FlutterSecureStorage for token management
✅ **No Token Exposure** - Tokens never logged or displayed
✅ **Refresh Token Cleared** - Both auth and refresh tokens removed
✅ **Re-authentication Required** - User must enter password again

## Future Enhancements

### Potential Improvements:
1. **Token Refresh** - Attempt to refresh token before showing timeout
2. **Activity Tracking** - Track user activity and warn before timeout
3. **Countdown Timer** - Show countdown before session expires
4. **Remember Last Screen** - Return to last screen after re-login
5. **Biometric Re-auth** - Use fingerprint/face ID for quick re-auth
6. **Offline Mode** - Handle timeout differently when offline

## Troubleshooting

### Issue: Notification Not Showing
**Solution:** Check that ToastificationWrapper is in widget tree (already in main.dart)

### Issue: Not Redirecting to Welcome Back
**Solution:** Verify context is initialized in SessionTimeoutService

### Issue: Multiple Notifications
**Solution:** Check `_isHandlingTimeout` flag is working correctly

### Issue: Crash on Navigation
**Solution:** Verify mounted checks are in place

## Files Modified

1. ✅ `lib/core/network/interceptors/auth_interceptor.dart` - Enhanced 401 handling
2. ✅ `lib/core/services/session_timeout_service.dart` - New service created
3. ✅ `lib/main.dart` - Initialize session timeout service

## Files Used (No Changes)

- `lib/features/auth/presentation/screens/welcome_back_screen.dart` - Already perfect
- `lib/core/routing/route_manager.dart` - Already has welcomeBack route
- `lib/core/routing/app_router.dart` - Already configured

## Summary

Session timeout is now fully implemented with:
- Automatic detection of expired/invalid tokens
- User-friendly notification
- Smooth navigation to Welcome Back screen
- Secure token clearing
- Robust error handling
- Great user experience

Users will never be stuck with expired tokens or see cryptic errors. They'll get a clear message and be guided to re-authenticate seamlessly! 🎉
