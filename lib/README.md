# FajiMobile App Architecture

This Flutter application follows Clean Architecture principles with feature-based modularization.

## Architecture Overview

```
lib/
├── core/                    # Shared utilities and configurations
│   ├── constants/          # App-wide constants
│   ├── config/             # Environment and app configuration
│   └── utils/              # Utility classes and helpers
├── data/                   # Data layer - external concerns
│   ├── models/            # Data transfer objects
│   ├── repositories/      # Repository implementations
│   ├── datasources/       # API and local data sources
│   └── services/          # External service integrations
├── domain/                 # Business logic layer
│   ├── entities/          # Business objects
│   ├── repositories/      # Repository contracts
│   └── usecases/          # Business use cases
├── presentation/           # UI layer
│   ├── providers/         # Riverpod providers and state
│   ├── screens/           # Screen widgets
│   ├── widgets/           # Reusable UI components
│   └── controllers/       # UI controllers
└── features/              # Feature-based modules
    ├── auth/              # Authentication feature
    ├── profile/           # User profile feature
    ├── dashboard/         # Dashboard feature
    └── notifications/     # Notifications feature
```

## Key Components

### Core Module
- **AppConstants**: Application-wide constants
- **Config**: Environment variable management using flutter_dotenv
- **AppInitializer**: Handles app initialization and setup
- **Logger**: Centralized logging utility with production safety

### Environment Configuration
The app supports multiple environments:
- Development (`.env.dev`)
- Staging (`.env.staging`)
- Production (`.env.production`)

Environment is selected using the `ENVIRONMENT` build flag:
```bash
flutter run --dart-define=ENVIRONMENT=dev
flutter run --dart-define=ENVIRONMENT=staging
flutter run --dart-define=ENVIRONMENT=production
```

### Feature Modules
Each feature follows the same internal structure:
```
features/[feature_name]/
├── data/
│   ├── models/
│   ├── repositories/
│   └── datasources/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── providers/
    ├── screens/
    ├── widgets/
    └── controllers/
```

## Dependency Flow

Dependencies flow inward following Clean Architecture principles:
- **Presentation** depends on **Domain**
- **Data** depends on **Domain**
- **Domain** has no external dependencies
- **Core** provides shared utilities to all layers

## Getting Started

1. Ensure all environment variables are properly configured in the `.env.*` files
2. Run `flutter pub get` to install dependencies
3. Run the app with the desired environment:
   ```bash
   flutter run --dart-define=ENVIRONMENT=dev
   ```

## State Management

The app uses Riverpod for state management with the following patterns:
- Providers for dependency injection
- StateNotifier for complex state management
- Consumer widgets for UI state consumption

## Code Generation

The app uses code generation for:
- JSON serialization (json_serializable)
- Immutable data classes (freezed)
- Riverpod providers (riverpod_generator)

Run code generation with:
```bash
flutter packages pub run build_runner build
```