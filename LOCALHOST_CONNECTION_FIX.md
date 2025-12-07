# Localhost Connection Fix

## Problem
```
❌ ERROR: Connection refused
Message: The connection errored: Connection refused
```

This happens because `localhost` on a device/emulator refers to the device itself, not your computer.

## Solutions

### ✅ Solution 1: Android Emulator (RECOMMENDED)

**Already Fixed!** The config now uses `10.0.2.2` which is the special IP that Android Emulator uses to reach the host machine.

```dart
// lib/core/config/api_config.dart
static const String _devBaseUrl = 'http://10.0.2.2:5001/api/v1';
```

**Just restart your app** and it should work!

### ✅ Solution 2: Physical Device or iOS Simulator

You need to use your computer's actual IP address.

#### Step 1: Find Your Computer's IP

**Mac/Linux:**
```bash
ifconfig | grep "inet " | grep -v 127.0.0.1
# Look for something like: inet 192.168.1.100
```

**Windows:**
```cmd
ipconfig
# Look for IPv4 Address: 192.168.1.100
```

#### Step 2: Update the Config

Replace `10.0.2.2` with your computer's IP:

```dart
// lib/core/config/api_config.dart
static const String _devBaseUrl = 'http://192.168.1.100:5001/api/v1';
//                                        ^^^^^^^^^^^^^^
//                                        Your computer's IP
```

#### Step 3: Ensure Same Network

Make sure:
- ✅ Your computer and device are on the same WiFi network
- ✅ Your firewall allows connections on port 5001
- ✅ Your backend server is running on `0.0.0.0:5001` (not just `localhost:5001`)

### ✅ Solution 3: Use Staging/Production Server

If you don't want to deal with local network setup, use the remote server:

```dart
// lib/core/config/api_config.dart
static const String _devBaseUrl = 'https://faji-backend-52878caa6589.herokuapp.com/api/v1';
```

## Testing the Connection

### Test 1: Check if backend is reachable

**From your computer:**
```bash
curl http://localhost:5001/api/v1/auth/register/email
```

**From Android Emulator (using adb):**
```bash
adb shell
curl http://10.0.2.2:5001/api/v1/auth/register/email
```

### Test 2: Check backend server binding

Make sure your backend is listening on `0.0.0.0` not just `localhost`:

```javascript
// Node.js example
app.listen(5001, '0.0.0.0', () => {
  console.log('Server running on 0.0.0.0:5001');
});
```

## Current Configuration

```dart
// Development (Android Emulator)
http://10.0.2.2:5001/api/v1

// Staging/Production
https://faji-backend-52878caa6589.herokuapp.com/api/v1
```

## Quick Fix Checklist

- [x] Changed `localhost` to `10.0.2.2` in config
- [ ] Restart the Flutter app
- [ ] Verify backend is running on port 5001
- [ ] Check backend is bound to `0.0.0.0` not just `localhost`
- [ ] Test the connection

## Still Not Working?

1. **Check backend logs** - Is it receiving the request?
2. **Check firewall** - Is port 5001 blocked?
3. **Try the staging server** - Use the Heroku URL instead
4. **Check Android network permissions** - Already configured in AndroidManifest.xml

## Environment Variables

You can also switch environments:

```bash
# Use staging server
flutter run --dart-define=ENV=staging

# Use dev (10.0.2.2)
flutter run --dart-define=ENV=dev
```
