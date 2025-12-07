# Mobile Integration Status - Event Management

## What's Complete ✅

### UI/UX Implementation
All screens are fully designed and functional with placeholder data:

#### 1. My Events Screen (`tickets_content.dart`)
- ✅ Tab navigation (UPCOMING, BOOKMARKED, PAST)
- ✅ Filter chips (All, Guest, Creator, Co-Planner)
- ✅ Event cards with gradient design
- ✅ Countdown timer display
- ✅ Navigation to event details
- ✅ Create Event button
- ✅ Empty states

#### 2. Event Details Screen (`event_details_tabbed_screen.dart`)
- ✅ Header with event name and share button
- ✅ 6 tabs with scroll indicator
- ✅ Tab navigation (PLAN, GUEST, CHAT, SETTINGS, EDIT, PROMOTE)

#### 3. PLAN Tab (`tabs/plan_tab.dart`)
- ✅ Event info card (compact design)
- ✅ Budget card with progress indicator
- ✅ Task tracker with checkboxes
- ✅ Vendors list with online status
- ✅ Location card with map placeholder
- ✅ Planners list
- ✅ Sell tickets card
- ✅ More tools card
- ✅ All buttons show feedback

#### 4. GUEST Tab (`tabs/guest_tab.dart`)
- ✅ Search bar
- ✅ Filter chips
- ✅ Guest list with status badges
- ✅ Scan QR button
- ✅ Add Guest button

#### 5. CHAT Tab (`tabs/chat_tab.dart`)
- ✅ Message list display
- ✅ Text input field
- ✅ Send button with state management
- ✅ Attachment buttons
- ✅ Real-time message sending (local)
- ✅ Timestamp generation

#### 6. SETTINGS Tab (`tabs/settings_tab.dart`)
- ✅ All toggle switches
- ✅ Website link field
- ✅ RSVP button customization
- ✅ Poster upload button
- ✅ Media upload button
- ✅ Privacy settings

#### 7. EDIT Tab (`tabs/edit_tab.dart`)
- ✅ Color theme selector
- ✅ Event name field
- ✅ Category dropdown
- ✅ Date & time pickers
- ✅ Description field with AI button
- ✅ Logistics fields
- ✅ Save button

#### 8. PROMOTE Tab (`tabs/promote_tab.dart`)
- ✅ Party Promoters card
- ✅ Broadcast card
- ✅ Action buttons

---

## What Needs Backend Integration 🔌

### Priority 1 - Critical (Week 1)

#### Event List Screen
```dart
// File: lib/features/tickets/presentation/screens/tickets_content.dart
// Lines: ~15-30

// TODO: Replace with API call
final eventsProvider = FutureProvider<List<Event>>((ref) async {
  final response = await http.get('/api/v1/events?status=upcoming');
  return parseEvents(response);
});
```

**Required:**
- GET `/api/v1/events` endpoint
- Event model with: id, name, role, dates, host, stats
- Pagination support

#### Event Details Screen
```dart
// File: lib/features/organize_event/presentation/screens/event_details_tabbed_screen.dart
// Lines: ~20-40

// TODO: Replace with API call
final eventDetailsProvider = FutureProvider.family<Event, String>((ref, eventId) async {
  final response = await http.get('/api/v1/events/$eventId');
  return parseEventDetails(response);
});
```

**Required:**
- GET `/api/v1/events/{id}` endpoint
- Complete event data model
- Budget, tasks, vendors, planners data

---

### Priority 2 - Core Features (Week 2)

#### Guest Management
```dart
// File: lib/features/organize_event/presentation/screens/tabs/guest_tab.dart
// Lines: ~50-80

// TODO: Implement
class GuestRepository {
  Future<List<Guest>> getGuests(String eventId) async {
    final response = await http.get('/api/v1/events/$eventId/guests');
    return parseGuests(response);
  }
  
  Future<Guest> addGuest(String eventId, GuestData data) async {
    final response = await http.post('/api/v1/events/$eventId/guests', body: data);
    return parseGuest(response);
  }
}
```

**Required:**
- GET `/api/v1/events/{id}/guests` endpoint
- POST `/api/v1/events/{id}/guests` endpoint
- Guest model with status tracking

#### Chat Integration
```dart
// File: lib/features/organize_event/presentation/screens/tabs/chat_tab.dart
// Lines: ~30-60

// TODO: Implement WebSocket
class ChatService {
  StreamController<Message> _messageController;
  WebSocketChannel? _channel;
  
  void connect(String eventId) {
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://api.example.com/events/$eventId/chat'),
    );
    _channel!.stream.listen((message) {
      _messageController.add(parseMessage(message));
    });
  }
  
  Future<void> sendMessage(String eventId, String content) async {
    await http.post('/api/v1/events/$eventId/messages', body: {
      'content': content,
      'type': 'user'
    });
  }
}
```

**Required:**
- GET `/api/v1/events/{id}/messages` endpoint
- POST `/api/v1/events/{id}/messages` endpoint
- WebSocket connection for real-time updates

---

### Priority 3 - Enhanced Features (Week 3)

#### Task Management
```dart
// File: lib/features/organize_event/presentation/screens/tabs/plan_tab.dart
// Lines: ~300-350

// TODO: Implement
Future<void> updateTaskStatus(String eventId, String taskId, String status) async {
  await http.patch('/api/v1/events/$eventId/tasks/$taskId', body: {
    'status': status
  });
  ref.refresh(taskListProvider(eventId));
}
```

#### Settings Updates
```dart
// File: lib/features/organize_event/presentation/screens/tabs/settings_tab.dart
// Lines: ~100-150

// TODO: Implement
Future<void> updateSettings(String eventId, EventSettings settings) async {
  await http.patch('/api/v1/events/$eventId/settings', body: settings.toJson());
}
```

#### Media Upload
```dart
// File: lib/features/organize_event/presentation/screens/tabs/settings_tab.dart
// Lines: ~200-250

// TODO: Implement
Future<String> uploadMedia(String eventId, File file, String type) async {
  final request = http.MultipartRequest(
    'POST',
    Uri.parse('/api/v1/events/$eventId/media'),
  );
  request.files.add(await http.MultipartFile.fromPath('file', file.path));
  request.fields['type'] = type;
  
  final response = await request.send();
  final data = await response.stream.bytesToString();
  return parseMediaUrl(data);
}
```

---

## Files That Need Updates

### 1. Create API Service Layer
**New File:** `lib/core/services/api_service.dart`
```dart
class ApiService {
  final String baseUrl = 'https://api.example.com/api/v1';
  final Dio _dio;
  
  ApiService(this._dio) {
    _dio.options.baseUrl = baseUrl;
    _dio.interceptors.add(AuthInterceptor());
  }
  
  Future<Response> get(String path, {Map<String, dynamic>? queryParams});
  Future<Response> post(String path, {dynamic data});
  Future<Response> patch(String path, {dynamic data});
  Future<Response> delete(String path);
}
```

### 2. Create Event Repository
**New File:** `lib/features/organize_event/data/repositories/event_repository.dart`
```dart
class EventRepository {
  final ApiService _apiService;
  
  Future<List<Event>> getEvents({String? status, String? role});
  Future<Event> getEventDetails(String eventId);
  Future<Event> updateEvent(String eventId, EventUpdateData data);
  Future<void> deleteEvent(String eventId);
}
```

### 3. Create Riverpod Providers
**New File:** `lib/features/organize_event/presentation/providers/event_providers.dart`
```dart
final eventRepositoryProvider = Provider<EventRepository>((ref) {
  return EventRepository(ref.read(apiServiceProvider));
});

final eventsListProvider = FutureProvider<List<Event>>((ref) async {
  return ref.read(eventRepositoryProvider).getEvents();
});

final eventDetailsProvider = FutureProvider.family<Event, String>((ref, id) async {
  return ref.read(eventRepositoryProvider).getEventDetails(id);
});
```

### 4. Update Existing Screens
**Files to modify:**
- `lib/features/tickets/presentation/screens/tickets_content.dart`
  - Replace hardcoded event data with provider
  - Add loading states
  - Add error handling

- `lib/features/organize_event/presentation/screens/event_details_tabbed_screen.dart`
  - Fetch event details on init
  - Pass data to tabs
  - Add refresh functionality

- All tab files in `lib/features/organize_event/presentation/screens/tabs/`
  - Replace SnackBar notifications with actual API calls
  - Add loading indicators
  - Handle errors gracefully

---

## Dependencies to Add

Add these to `pubspec.yaml`:

```yaml
dependencies:
  # HTTP Client
  dio: ^5.4.0
  
  # WebSocket
  web_socket_channel: ^2.4.0
  
  # State Management (already have riverpod)
  flutter_riverpod: ^2.4.9
  
  # Local Storage
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  
  # Image Handling
  image_picker: ^1.0.5
  cached_network_image: ^3.3.0
  
  # Utilities
  intl: ^0.18.1  # For date formatting
  uuid: ^4.2.1   # For generating IDs
```

---

## Testing Strategy

### Unit Tests
```dart
// test/features/organize_event/data/repositories/event_repository_test.dart
void main() {
  group('EventRepository', () {
    test('getEvents returns list of events', () async {
      // Test implementation
    });
    
    test('getEventDetails returns event', () async {
      // Test implementation
    });
  });
}
```

### Widget Tests
```dart
// test/features/tickets/presentation/screens/tickets_content_test.dart
void main() {
  testWidgets('displays event list', (tester) async {
    // Test implementation
  });
}
```

### Integration Tests
```dart
// integration_test/event_flow_test.dart
void main() {
  testWidgets('complete event creation flow', (tester) async {
    // Test full flow from list to details
  });
}
```

---

## Environment Configuration

**New File:** `lib/core/config/environment.dart`
```dart
class Environment {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api-dev.example.com/api/v1',
  );
  
  static const String wsBaseUrl = String.fromEnvironment(
    'WS_BASE_URL',
    defaultValue: 'wss://api-dev.example.com',
  );
}
```

**Update:** `.env` files
```env
# .env.dev
API_BASE_URL=https://api-dev.example.com/api/v1
WS_BASE_URL=wss://api-dev.example.com

# .env.staging
API_BASE_URL=https://api-staging.example.com/api/v1
WS_BASE_URL=wss://api-staging.example.com

# .env.production
API_BASE_URL=https://api.example.com/api/v1
WS_BASE_URL=wss://api.example.com
```

---

## Timeline Estimate

### Week 1: Foundation
- [ ] Set up API service layer
- [ ] Create repositories
- [ ] Set up Riverpod providers
- [ ] Implement event list API
- [ ] Implement event details API

### Week 2: Core Features
- [ ] Guest management integration
- [ ] Chat integration (HTTP)
- [ ] Task management
- [ ] Settings updates
- [ ] Add loading states

### Week 3: Enhanced Features
- [ ] WebSocket for real-time chat
- [ ] Media upload
- [ ] Budget management
- [ ] Vendor/Planner management
- [ ] Error handling & retry logic

### Week 4: Polish
- [ ] Offline support
- [ ] Image caching
- [ ] Performance optimization
- [ ] Testing
- [ ] Bug fixes

---

## Current Status Summary

**UI/UX:** 100% Complete ✅
**Backend Integration:** 0% Complete ⏳
**Testing:** 0% Complete ⏳

**Next Steps:**
1. Backend team implements APIs (see `BACKEND_API_REQUIREMENTS.md`)
2. Mobile team creates service layer
3. Integration testing
4. Production deployment

---

## Questions or Issues?

- **Backend API Questions:** See `BACKEND_API_REQUIREMENTS.md`
- **Quick Reference:** See `API_QUICK_REFERENCE.md`
- **Slack:** #mobile-backend-integration
- **JIRA:** Create ticket with label `event-integration`

**Last Updated:** November 30, 2024
