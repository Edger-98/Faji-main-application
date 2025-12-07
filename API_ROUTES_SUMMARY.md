# API Routes Summary

## Base URL Configuration

All API routes use the `/api/v1` prefix through the base URL configuration in `lib/core/config/api_config.dart`:

```dart
// Development
http://localhost:5001/api/v1

// Staging
https://faji-backend-52878caa6589.herokuapp.com/api/v1

// Production
http://localhost:5001/api/v1

// Android Emulator
http://10.0.2.2:5001/api/v1
```

## How It Works

**Base URL** (from ApiConfig) + **Endpoint** (from Repository) = **Final URL**

Example:
- Base: `http://localhost:5001/api/v1`
- Endpoint: `/events`
- **Final**: `http://localhost:5001/api/v1/events` ✅

## All API Endpoints

### Events
- `GET /api/v1/events` - List events
- `GET /api/v1/events/{id}` - Event details
- `POST /api/v1/events` - Create event
- `PATCH /api/v1/events/{id}` - Update event
- `DELETE /api/v1/events/{id}` - Delete event
- `POST /api/v1/events/{id}/bookmark` - Toggle bookmark
- `PATCH /api/v1/events/{id}/settings` - Update settings

### Guests
- `GET /api/v1/events/{id}/guests` - List guests
- `POST /api/v1/events/{id}/guests` - Add guest

### Tasks
- `GET /api/v1/events/{id}/tasks` - List tasks
- `PATCH /api/v1/events/{id}/tasks/{taskId}` - Update task

### Messages
- `GET /api/v1/events/{id}/messages` - List messages
- `POST /api/v1/events/{id}/messages` - Send message

### Budget
- `GET /api/v1/events/{id}/budget` - Get budget

### Vendors
- `GET /api/v1/events/{id}/vendors` - List vendors

### Planners
- `GET /api/v1/events/{id}/planners` - List planners

## Repository Pattern

All repositories follow this pattern:

```dart
class EventRepository {
  final ApiService _api;
  
  Future<EventModel> getEventDetails(String eventId) async {
    // ✅ Correct: No /api/v1 prefix (it's in base URL)
    final response = await _api.get('/events/$eventId');
    return EventModel.fromJson(response.data['data']);
  }
}
```

## Configuration

The base URL is automatically selected based on the environment:

```bash
# Development
flutter run --dart-define=ENV=dev

# Staging
flutter run --dart-define=ENV=staging

# Production
flutter run --dart-define=ENV=production
```

## ✅ Status

All API routes are correctly configured with the `/api/v1` prefix through the base URL. No changes needed!
