# API Configuration

## ✅ Current Configuration

### Production URL (Default)
```
Base URL: https://faji-backend-52878caa6589.herokuapp.com/api/v1
WebSocket: wss://faji-backend-52878caa6589.herokuapp.com
```

### Development URL
```
Base URL: http://localhost:5000/api/v1
WebSocket: ws://localhost:5000
```

---

## 🚀 How to Run

### Production (Default)
```bash
flutter run
```
This will automatically use the production URL.

### Development
```bash
flutter run --dart-define=ENV=dev
```
This will use localhost:5000.

---

## 🔧 Configuration Details

**File:** `lib/core/config/api_config.dart`

**Default Environment:** Production

**URLs:**
- **Production:** `https://faji-backend-52878caa6589.herokuapp.com/api/v1`
- **Development:** `http://localhost:5000/api/v1`

---

## 📱 Build Commands

### Production Build (Default)
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

### Development Build
```bash
# Android
flutter build apk --dart-define=ENV=dev

# iOS
flutter build ios --dart-define=ENV=dev
```

---

## ✅ What's Configured

- ✅ Production URL set to Heroku backend
- ✅ Development URL set to localhost:5000
- ✅ Default environment: Production
- ✅ WebSocket URLs configured
- ✅ Timeout settings: 30 seconds
- ✅ All code intact and working

---

## 🎯 Quick Test

```bash
# Run the app (uses production by default)
flutter run

# App will connect to:
# https://faji-backend-52878caa6589.herokuapp.com/api/v1
```

---

**Status:** ✅ Production URL configured and ready!

