# Push Notifications - Quick Test Guide

**Status**: ✅ Implemented (Android Ready)

---

## 🚀 **Quick Start**

### 1. Run the App
```bash
flutter run
```

### 2. Check Logs
Look for these messages:
```
✅ Firebase initialized
✅ User granted notification permission
📱 FCM Token: [your-token-here]
✅ Firebase Notification Service initialized
```

### 3. Navigate to Notification Settings
```
Profile → Notifications
```

---

## 📱 **Test on Device**

### Android:
1. Install app on Android device
2. Grant notification permission when prompted
3. Copy FCM token from notification settings screen
4. Go to Firebase Console
5. Send test notification

### iOS (Pending):
- Need to add `GoogleService-Info.plist` first
- Then follow same steps as Android

---

## 🔥 **Send Test Notification**

### From Firebase Console:
1. Go to: https://console.firebase.google.com/
2. Select project: **fajimobile**
3. Navigate to: **Cloud Messaging**
4. Click: **"Send your first message"**
5. Fill in:
   - Title: "Test Notification"
   - Body: "This is a test"
6. Click: **"Send test message"**
7. Paste your FCM token
8. Click: **"Test"**

### Expected Result:
- ✅ Notification appears on device
- ✅ Tapping opens app
- ✅ Debug logs show message received

---

## 🧪 **Test Scenarios**

### Foreground (App Open):
1. Keep app open
2. Send notification
3. ✅ Should show local notification
4. ✅ Tap to see debug logs

### Background (App Minimized):
1. Minimize app
2. Send notification
3. ✅ Should show system notification
4. ✅ Tap to open app

### Terminated (App Closed):
1. Close app completely
2. Send notification
3. ✅ Should show system notification
4. ✅ Tap to open app

---

## 🔍 **Debug Checklist**

- [ ] Firebase initialized successfully
- [ ] Permission granted
- [ ] FCM token generated
- [ ] Token visible in settings screen
- [ ] Foreground notification works
- [ ] Background notification works
- [ ] Notification tap opens app
- [ ] Debug logs show messages

---

## ⚠️ **Common Issues**

### No FCM Token:
- Check Firebase configuration
- Verify google-services.json is in android/app/
- Check internet connection

### Permission Denied:
- Go to device Settings → Apps → Faji → Notifications
- Enable notifications manually
- Restart app

### Notification Not Showing:
- Check notification channel settings
- Verify app is not in battery optimization
- Check Do Not Disturb mode

---

## 📝 **FCM Token Location**

**In App**:
```
Profile → Notifications → Device Token (at bottom)
```

**In Logs**:
```
📱 FCM Token: [your-token-here]
```

---

## 🎯 **Quick Commands**

### Run App:
```bash
flutter run
```

### Check Logs:
```bash
flutter logs | grep -i "fcm\|notification\|firebase"
```

### Clear App Data (Reset):
```bash
# Android
adb shell pm clear com.fajimobile.app.fajimobileapp

# iOS
# Delete app and reinstall
```

---

## ✅ **Success Indicators**

- ✅ App starts without errors
- ✅ Firebase logs show initialization
- ✅ FCM token is generated
- ✅ Permission is granted
- ✅ Notification settings screen loads
- ✅ Test notification is received
- ✅ Tapping notification opens app

---

**Ready to test!** 🚀
