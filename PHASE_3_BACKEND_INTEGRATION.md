# Phase 3: Backend Integration - Implementation Complete ✅

## Overview
This phase implements the complete backend integration layer for the event management system. All API services, repositories, models, and providers are now in place and ready to connect to the backend.

---

## What Was Implemented

### 1. Core Services Layer ✅

#### API Service (`lib/core/services/api_service.dart`)
- Complete HTTP client using Dio
- Request/response interceptors with logging
- Comprehensive error handling
- Token management (set/remove)
- File upload support
- Methods: GET, POST, PATCH, DELETE

**Features:**
- Automatic error parsing and user-friendly messages
- Timeout handling
- Network error detection
- Status code-based error handling (401, 403, 404, 422, 429, 500)

---

### 2. Data Models ✅

#### Event Model (`lib/core/models/event_model.dart`)
Complete event data structure with:
- Event details (name, description, dates, category)
- Host information
- Location data
- Budget tracking
- Settings configuration
- Media (poster, pre-event media)
- Statistics (guests, tasks, vendors, planners)
- Color theme

**Sub-models:**
- `HostModel` - Event host information
- `LocationModel` - Address and coordinates
- `BudgetModel` - Financial tracking
- `EventSettingsModel` - Privacy and configuration
- `EventMediaModel` - Images and media
- `EventStatsModel` - Event statistics

#### Task Model (`lib/core/models/task_model.dart`)
- Task details (title, description, status)
- Due dates
- Assigned user
- Completion tracking
- Task statistics

#### Guest Model (`lib/core/models/guest_model.dart`)
- Guest information (name, phone, email)
- RSVP status
- Online status
- Invitation tracking
- Guest statistics

#### Message Model (`lib/core/models/message_model.dart`)
- Message content and type
- Sender information
- Timestamps
- Read status

---

### 3. Repository Layer ✅

#### Event Repository (`lib/features/organize_event/data/repositories/event_repository.dart`)
```dart
✅ getEvents() - Fetch events with filters
✅ getEventDetails() - Get complete event data
✅ toggleBookmark() - Bookmark/unbookmark events
✅ updateEvent() - Update event information
✅ updateSettings() - Update event settings
✅ uploadMedia() - Upload poster/media
✅ deleteEvent() - Delete event
```

#### Task Repository (`lib/features/organize_event/data/repositories/task_repository.dart`)
```dart
✅ getTasks() - Fetch task list with stats
✅ updateTaskStatus() - Mark tasks complete/incomplete
```

#### Guest Repository (`lib/features/organize_event/data/repositories/guest_repository.dart`)
```dart
✅ getGuests() - Fetch guest list with filters
✅ addGuest() - Add new guest
```

#### Message Repository (`lib/features/organize_event/data/repositories/message_repository.dart`)
```dart
✅ getMessages() - Fetch message history
✅ sendMessage() - Send new message
```

---

### 4. State Management (Riverpod) ✅

#### Event Providers (`lib/features/organize_event/presentation/providers/event_providers.dart`)

**Providers:**
- `eventsListProvider` - Events list with filters
- `eventDetailsProvider` - Single event details
- `currentTabProvider` - Active tab state
- `currentRoleFilterProvider` - Role filter state
- `currentFiltersProvider` - Computed filters
- `filteredEventsProvider` - Filtered events

**Features:**
- Auto-dispose for memory efficiency
- Family providers for parameterized queries
- Computed providers for derived state
- Filter management (status, role, bookmarked)

---

## File Structure

```
lib/
├── core/
│   ├── services/
│   │   └── api_service.dart              ✅ NEW
│   └── models/
│       ├── event_model.dart              ✅ NEW
│       ├── task_model.dart               ✅ NEW
│       ├── guest_model.dart              ✅ NEW
│       └── message_model.dart            ✅ NEW
│
└── features/
    └── organize_event/
        ├── data/
        │   └── repositories/
        │       ├── event_repository.dart     ✅ NEW
        │       ├── task_repository.dart      ✅ NEW
        │       ├── guest_repository.dart     ✅ NEW
        │       └── message_repository.dart   ✅ NEW
        │
        └── presentation/
            └── providers/
                └── event_providers.dart      ✅ NEW
```

---

## How to Use

### 1. Initialize API Service

```dart
// In your app initialization or login success
final apiService = ref.read(apiServiceProvider);
apiService.setToken('your_jwt_token_here');
```

### 2. Fetch Events

```dart
// In your widget
final eventsAsync = ref.watch(filteredEventsProvider);

eventsAsync.when(
  data: (events) => ListView.builder(
    itemCount: events.length,
    itemBuilder: (context, index) {
      final event = events[index];
      return EventCard(event: event);
    },
  ),
  loading: () => CircularProgressIndicator(),
  error: (error, stack) => ErrorWidget(error: error),
);
```

### 3. Change Filters

```dart
// Change tab
ref.read(currentTabProvider.notifier).state = 'upcoming';

// Change role filter
ref.read(currentRoleFilterProvider.notifier).state = 'creator';
```

### 4. Get Event Details

```dart
final eventAsync = ref.watch(eventDetailsProvider('evt_123'));

eventAsync.when(
  data: (event) => EventDetailsView(event: event),
  loading: () => CircularProgressIndicator(),
  error: (error, stack) => ErrorWidget(error: error),
);
```

### 5. Update Event

```dart
final repository = ref.read(eventRepositoryProvider);

try {
  await repository.updateEvent('evt_123', {
    'name': 'Updated Name',
    'description': 'New description',
  });
  
  // Refresh the event details
  ref.refresh(eventDetailsProvider('evt_123'));
  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Event updated successfully')),
  );
} catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Error: $e')),
  );
}
```

### 6. Add Guest

```dart
final repository = ref.read(guestRepositoryProvider);

try {
  await repository.addGuest(
    'evt_123',
    name: 'John Doe',
    phone: '+2348012345678',
    email: 'john@example.com',
  );
  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Guest added successfully')),
  );
} catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Error: $e')),
  );
}
```

### 7. Send Message

```dart
final repository = ref.read(messageRepositoryProvider);

try {
  await repository.sendMessage('evt_123', 'Hello everyone!');
  
  // Message sent successfully
} catch (e) {
  // Handle error
}
```

---

## Next Steps

### Phase 4: Screen Integration (Week 1)

#### 1. Update My Events Screen
**File:** `lib/features/tickets/presentation/screens/tickets_content.dart`

Replace hardcoded data with:
```dart
final eventsAsync = ref.watch(filteredEventsProvider);
```

#### 2. Update Event Details Screen
**File:** `lib/features/organize_event/presentation/screens/event_details_tabbed_screen.dart`

Fetch event on init:
```dart
final eventAsync = ref.watch(eventDetailsProvider(widget.eventId));
```

#### 3. Update PLAN Tab
**File:** `lib/features/organize_event/presentation/screens/tabs/plan_tab.dart`

- Connect budget display
- Connect task list
- Implement task status updates

#### 4. Update GUEST Tab
**File:** `lib/features/organize_event/presentation/screens/tabs/guest_tab.dart`

- Connect guest list
- Implement add guest functionality
- Add search and filters

#### 5. Update CHAT Tab
**File:** `lib/features/organize_event/presentation/screens/tabs/chat_tab.dart`

- Connect message history
- Implement send message
- Add real-time updates (WebSocket)

#### 6. Update SETTINGS Tab
**File:** `lib/features/organize_event/presentation/screens/tabs/settings_tab.dart`

- Connect settings updates
- Implement media upload

#### 7. Update EDIT Tab
**File:** `lib/features/organize_event/presentation/screens/tabs/edit_tab.dart`

- Connect event update
- Implement save functionality

---

## API Endpoints Reference

### Events
```
GET    /api/v1/events                    # List events
GET    /api/v1/events/{id}               # Event details
POST   /api/v1/events/{id}/bookmark      # Toggle bookmark
PATCH  /api/v1/events/{id}               # Update event
PATCH  /api/v1/events/{id}/settings      # Update settings
POST   /api/v1/events/{id}/media         # Upload media
DELETE /api/v1/events/{id}               # Delete event
```

### Tasks
```
GET    /api/v1/events/{id}/tasks         # List tasks
PATCH  /api/v1/events/{id}/tasks/{tid}   # Update task
```

### Guests
```
GET    /api/v1/events/{id}/guests        # List guests
POST   /api/v1/events/{id}/guests        # Add guest
```

### Messages
```
GET    /api/v1/events/{id}/messages      # List messages
POST   /api/v1/events/{id}/messages      # Send message
```

---

## Error Handling

All repositories throw exceptions with user-friendly messages:

```dart
try {
  await repository.someMethod();
} catch (e) {
  // e.toString() contains user-friendly message
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(e.toString())),
  );
}
```

**Error Types:**
- Connection timeout
- Unauthorized (401)
- Forbidden (403)
- Not found (404)
- Validation error (422)
- Rate limit (429)
- Server error (500)

---

## Testing

### Unit Tests
```dart
test('getEvents returns list of events', () async {
  final repository = EventRepository(mockApiService);
  final events = await repository.getEvents();
  expect(events, isA<List<EventModel>>());
});
```

### Widget Tests
```dart
testWidgets('displays event list', (tester) async {
  await tester.pumpWidget(
    ProviderScope(
      child: MyEventsScreen(),
    ),
  );
  
  expect(find.byType(EventCard), findsWidgets);
});
```

---

## Configuration

### Base URL
Update in `lib/core/services/api_service.dart`:

```dart
_dio.options.baseUrl = 'http://localhost:5000/api/v1';  // Development
// _dio.options.baseUrl = 'https://api.example.com/api/v1';  // Production
```

### Android Emulator
Use `http://10.0.2.2:5000/api/v1` instead of `localhost`

### iOS Simulator
Add to `Info.plist`:
```xml
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsLocalNetworking</key>
  <true/>
</dict>
```

---

## Performance Considerations

1. **Auto-dispose Providers** - All providers auto-dispose when not in use
2. **Pagination** - Repositories support pagination (default 20 items)
3. **Caching** - Riverpod automatically caches provider results
4. **Error Recovery** - Use `ref.refresh()` to retry failed requests

---

## Dependencies

All required dependencies are already in `pubspec.yaml`:
- ✅ `dio: ^5.7.0` - HTTP client
- ✅ `flutter_riverpod: ^2.5.1` - State management
- ✅ `intl: ^0.20.2` - Date formatting

---

## Summary

**Phase 3 Status:** ✅ Complete

**What's Ready:**
- ✅ API service layer with error handling
- ✅ Complete data models for all entities
- ✅ Repository layer for all features
- ✅ Riverpod providers for state management
- ✅ Filter and pagination support
- ✅ File upload capability

**What's Next:**
- 🔄 Connect screens to repositories
- 🔄 Replace hardcoded data with API calls
- 🔄 Add loading states
- 🔄 Implement error handling in UI
- 🔄 Add WebSocket for real-time chat

**Timeline:** Ready for Phase 4 screen integration

---

**Last Updated:** November 30, 2024
**Status:** Backend integration layer complete and ready for use
