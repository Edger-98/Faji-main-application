# Faji Mobile App

Flutter-based event management platform built with Clean Architecture.

---

## Quick Start

### 1. Set Backend URL
Update `lib/core/config/api_config.dart` with your backend URL.

### 2. Run the App
```bash
flutter run --dart-define=ENV=dev
```

---

## Architecture

```
lib/
├── core/
│   ├── config/          # Environment & API configuration
│   ├── design_system/   # Theme, colors, typography, components
│   ├── models/          # Shared data models
│   ├── routing/         # App navigation
│   └── services/        # HTTP, auth, storage services
│
└── presentation/        # App-level widgets & providers
```

---

## Build & Run

### Development
```bash
flutter run --dart-define=ENV=dev
```

### Staging
```bash
flutter run --dart-define=ENV=staging
```

### Production
```bash
flutter run --dart-define=ENV=production
```

### Release Builds
```bash
# Android
flutter build apk --release --dart-define=ENV=production

# iOS
flutter build ipa --dart-define=ENV=production
```

---

## Configuration

### Environment Variables
```bash
--dart-define=ENV=dev|staging|production
```

### API Endpoints
Configured in `lib/core/config/api_config.dart`:
- **Development:** `http://localhost:5000/api/v1`
- **Staging:** `https://api-staging.faji.app/api/v1`
- **Production:** `https://api.faji.app/api/v1`

---

## Typography

The app uses **SF Pro Display** as the primary font. To switch fonts, change one line in `lib/core/design_system/typography/app_fonts.dart`:

```dart
static const String primary = sfProDisplay; // change this
```

---

## Dependencies

- `flutter_riverpod` — State management
- `dio` — HTTP client
- `go_router` — Navigation
- `flutter_screenutil` — Responsive design
- `flutter_stripe` — Payments
- `firebase_core` — Firebase services

Full list in [pubspec.yaml](pubspec.yaml).

---

## Testing

```bash
flutter test
flutter test integration_test
```

---

## Troubleshooting

**Android emulator can't connect to localhost?**
Use `10.0.2.2` instead of `localhost` in your API config.

**iOS simulator can't connect?**
Enable `NSAllowsLocalNetworking` in `Info.plist`.

---

**Version:** 1.0.2  
**Status:** Production Ready
