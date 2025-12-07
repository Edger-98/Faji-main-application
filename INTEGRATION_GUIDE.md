# Mobile App Integration Guide - Event Management

## Overview
This guide shows how to integrate the mobile app with the backend APIs. The backend is ready at `http://localhost:5000` with all endpoints documented in the Postman collection.

---

## Step 1: Setup API Service Layer

### 1.1 Add Dependencies

Add to `pubspec.yaml`:
```yaml
dependencies:
  dio: ^5.4.0
  flutter_riverpod: ^2.4.9  # Already have this
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  cached_network_image: ^3.3.0
  intl: ^0.18.1
```

Run:
```bash
flutter pub get
```

### 1.2 Create API Service

**File:** `lib/core/services/api_service.dart`
```dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  final Dio _dio;
  
  ApiService(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: 'http://localhost:5000/api/v1',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    
    // Add interceptors
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }
  
  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    return await _dio.get(path, queryParameters: queryParams);
  }
  
  Future<Response> post(String path, {dynamic data}) async {
    return await _dio.post(path, data: data);
  }
  
  Future<Response> patch(String path, {dynamic data}) async {
    return await _dio.patch(path, data: data);
  }
  
  Future<Response> delete(String path) async {
    return await _dio.delete(path);
  }
}

// Auth Interceptor
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Get token from storage
    final token = getStoredToken(); // Implement this
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Handle unauthorized - redirect to login
    }
    handler.next(err);
  }
}

// Provider
final dioProvider = Provider<Dio>((ref) => Dio());

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService(ref.read(dioProvider));
});
```

---

## Step 2: Create Data Models

### 2.1 Event Model

**File:** `lib/features/organize_event/data/models/event_model.dart`
```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    required String id,
    required String name,
    String? description,
    required String category,
    required String emoji,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
    required String role,
    required bool isBookmarked,
    required HostModel host,
    LocationModel? location,
    required BudgetModel budget,
    required EventSettingsModel settings,
    required EventMediaModel media,
    required EventStatsModel stats,
    required String colorTheme,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}

@freezed
class HostModel with _$HostModel {
  const factory HostModel({
    required String id,
    required String name,
    String? email,
    String? phone,
    String? avatar,
  }) = _HostModel;

  factory HostModel.fromJson(Map<String, dynamic> json) =>
      _$HostModelFromJson(json);
}

@freezed
class BudgetModel with _$BudgetModel {
  const factory BudgetModel({
    required double total,
    required double spent,
    required double remaining,
    required String currency,
    required String currencySymbol,
    List<BudgetItemModel>? items,
    double? progress,
  }) = _BudgetModel;

  factory BudgetModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetModelFromJson(json);
}

@freezed
class EventStatsModel with _$EventStatsModel {
  const factory EventStatsModel({
    required int expectedGuests,
    required int confirmedGuests,
    required int invitedGuests,
    required int taskCount,
    required int completedTasks,
    required int vendorCount,
    required int plannerCount,
  }) = _EventStatsModel;

  factory EventStatsModel.fromJson(Map<String, dynamic> json) =>
      _$EventStatsModelFromJson(json);
}

// Add other models: LocationModel, EventSettingsModel, EventMediaModel, etc.
```

---

## Step 3: Create Repository

### 3.1 Event Repository

**File:** `lib/features/organize_event/data/repositories/event_repository.dart`
```dart
import 'package:dio/dio.dart';
import '../models/event_model.dart';
import '../../../../core/services/api_service.dart';

class EventRepository {
  final ApiService _apiService;

  EventRepository(this._apiService);

  // Get Events List
  Future<EventListResponse> getEvents({
    String status = 'all',
    String role = 'all',
    bool? bookmarked,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiService.get('/events', queryParams: {
        'status': status,
        'role': role,
        if (bookmarked != null) 'bookmarked': bookmarked,
        'page': page,
        'limit': limit,
      });

      return EventListResponse.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Get Event Details
  Future<EventModel> getEventDetails(String eventId) async {
    try {
      final response = await _apiService.get('/events/$eventId');
      return EventModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Create Event
  Future<EventModel> createEvent(Map<String, dynamic> eventData) async {
    try {
      final response = await _apiService.post('/events', data: eventData);
      return EventModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Update Event
  Future<void> updateEvent(String eventId, Map<String, dynamic> updates) async {
    try {
      await _apiService.patch('/events/$eventId', data: updates);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Bookmark Event
  Future<void> bookmarkEvent(String eventId, bool bookmarked) async {
    try {
      await _apiService.post('/events/$eventId/bookmark', data: {
        'bookmarked': bookmarked,
      });
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Get Budget
  Future<BudgetModel> getBudget(String eventId) async {
    try {
      final response = await _apiService.get('/events/$eventId/budget');
      return BudgetModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Get Tasks
  Future<TaskListResponse> getTasks(String eventId) async {
    try {
      final response = await _apiService.get('/events/$eventId/tasks');
      return TaskListResponse.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Update Task Status
  Future<void> updateTaskStatus(String eventId, String taskId, String status) async {
    try {
      await _apiService.patch('/events/$eventId/tasks/$taskId', data: {
        'status': status,
      });
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Get Guests
  Future<GuestListResponse> getGuests(
    String eventId, {
    String status = 'all',
    String? search,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await _apiService.get('/events/$eventId/guests', queryParams: {
        'status': status,
        if (search != null && search.isNotEmpty) 'search': search,
        'page': page,
        'limit': limit,
      });
      return GuestListResponse.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Add Guest
  Future<GuestModel> addGuest(String eventId, Map<String, dynamic> guestData) async {
    try {
      final response = await _apiService.post('/events/$eventId/guests', data: guestData);
      return GuestModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Get Messages
  Future<MessageListResponse> getMessages(
    String eventId, {
    int page = 1,
    int limit = 50,
  }) async {
    try {
      final response = await _apiService.get('/events/$eventId/messages', queryParams: {
        'page': page,
        'limit': limit,
      });
      return MessageListResponse.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Send Message
  Future<MessageModel> sendMessage(String eventId, String content) async {
    try {
      final response = await _apiService.post('/events/$eventId/messages', data: {
        'content': content,
        'type': 'user',
      });
      return MessageModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Error Handler
  Exception _handleError(DioException error) {
    if (error.response != null) {
      final errorData = error.response!.data;
      return Exception(errorData['error']['message'] ?? 'An error occurred');
    }
    return Exception('Network error: ${error.message}');
  }
}

// Provider
final eventRepositoryProvider = Provider<EventRepository>((ref) {
  return EventRepository(ref.read(apiServiceProvider));
});
```

---

## Step 4: Create Riverpod Providers

### 4.1 Event Providers

**File:** `lib/features/organize_event/presentation/providers/event_providers.dart`
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/event_model.dart';
import '../../data/repositories/event_repository.dart';

// Events List Provider
final eventsListProvider = FutureProvider.family<EventListResponse, EventFilters>(
  (ref, filters) async {
    final repository = ref.read(eventRepositoryProvider);
    return await repository.getEvents(
      status: filters.status,
      role: filters.role,
      bookmarked: filters.bookmarked,
      page: filters.page,
      limit: filters.limit,
    );
  },
);

// Event Details Provider
final eventDetailsProvider = FutureProvider.family<EventModel, String>(
  (ref, eventId) async {
    final repository = ref.read(eventRepositoryProvider);
    return await repository.getEventDetails(eventId);
  },
);

// Budget Provider
final budgetProvider = FutureProvider.family<BudgetModel, String>(
  (ref, eventId) async {
    final repository = ref.read(eventRepositoryProvider);
    return await repository.getBudget(eventId);
  },
);

// Tasks Provider
final tasksProvider = FutureProvider.family<TaskListResponse, String>(
  (ref, eventId) async {
    final repository = ref.read(eventRepositoryProvider);
    return await repository.getTasks(eventId);
  },
);

// Guests Provider
final guestsProvider = FutureProvider.family<GuestListResponse, GuestFilters>(
  (ref, filters) async {
    final repository = ref.read(eventRepositoryProvider);
    return await repository.getGuests(
      filters.eventId,
      status: filters.status,
      search: filters.search,
      page: filters.page,
      limit: filters.limit,
    );
  },
);

// Messages Provider
final messagesProvider = FutureProvider.family<MessageListResponse, String>(
  (ref, eventId) async {
    final repository = ref.read(eventRepositoryProvider);
    return await repository.getMessages(eventId);
  },
);

// Filter Classes
class EventFilters {
  final String status;
  final String role;
  final bool? bookmarked;
  final int page;
  final int limit;

  EventFilters({
    this.status = 'all',
    this.role = 'all',
    this.bookmarked,
    this.page = 1,
    this.limit = 20,
  });
}

class GuestFilters {
  final String eventId;
  final String status;
  final String? search;
  final int page;
  final int limit;

  GuestFilters({
    required this.eventId,
    this.status = 'all',
    this.search,
    this.page = 1,
    this.limit = 20,
  });
}
```

---

## Step 5: Update UI Screens

### 5.1 Update My Events Screen

**File:** `lib/features/tickets/presentation/screens/tickets_content.dart`

Replace the hardcoded data with:

```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
  final filters = EventFilters(status: 'upcoming', role: _selectedFilter.toLowerCase());
  final eventsAsync = ref.watch(eventsListProvider(filters));

  return SafeArea(
    bottom: false,
    child: Column(
      children: [
        _buildHeader(),
        _buildTabBar(),
        _buildFilterChips(),
        
        // Replace hardcoded list with async data
        Expanded(
          child: eventsAsync.when(
            data: (eventList) => _buildEventList(eventList.events),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: $error'),
                  ElevatedButton(
                    onPressed: () => ref.refresh(eventsListProvider(filters)),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildEventList(List<EventModel> events) {
  if (events.isEmpty) {
    return Center(child: Text('No events found'));
  }
  
  return ListView.builder(
    padding: EdgeInsets.symmetric(horizontal: 24.w),
    itemCount: events.length,
    itemBuilder: (context, index) {
      final event = events[index];
      return Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: _buildEventCard(
          eventId: event.id,
          role: event.role,
          eventName: event.name,
          date: _formatDate(event.startDate),
          countdown: _calculateCountdown(event.endDate),
        ),
      );
    },
  );
}
```

### 5.2 Update Event Details Screen

**File:** `lib/features/organize_event/presentation/screens/event_details_tabbed_screen.dart`

```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
  final eventAsync = ref.watch(eventDetailsProvider(widget.eventId));

  return Scaffold(
    backgroundColor: AppColors.background,
    body: eventAsync.when(
      data: (event) => SafeArea(
        child: Column(
          children: [
            _buildHeader(event.name),
            _buildTabBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  PlanTab(eventId: widget.eventId, event: event),
                  GuestTab(eventId: widget.eventId),
                  ChatTab(eventId: widget.eventId),
                  SettingsTab(eventId: widget.eventId, event: event),
                  EditTab(eventId: widget.eventId, event: event),
                  PromoteTab(eventId: widget.eventId),
                ],
              ),
            ),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    ),
  );
}
```

### 5.3 Update PLAN Tab

**File:** `lib/features/organize_event/presentation/screens/tabs/plan_tab.dart`

Replace SnackBar calls with actual API calls:

```dart
// Budget Card - Replace onTap
onTap: () async {
  try {
    final budget = await ref.read(budgetProvider(eventId).future);
    // Navigate to budget details screen
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
},

// Task Checkbox - Replace onTap
onTap: () async {
  try {
    await ref.read(eventRepositoryProvider).updateTaskStatus(
      eventId,
      taskId,
      'completed',
    );
    ref.invalidate(tasksProvider(eventId));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Task marked as complete')),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
},
```

### 5.4 Update CHAT Tab

**File:** `lib/features/organize_event/presentation/screens/tabs/chat_tab.dart`

Replace local message handling with API:

```dart
void _sendMessage() async {
  if (_messageController.text.trim().isEmpty) return;

  final content = _messageController.text.trim();
  _messageController.clear();

  try {
    await ref.read(eventRepositoryProvider).sendMessage(widget.eventId, content);
    ref.invalidate(messagesProvider(widget.eventId));
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error sending message: $e')),
    );
  }
}

@override
Widget build(BuildContext context, WidgetRef ref) {
  final messagesAsync = ref.watch(messagesProvider(widget.eventId));

  return Column(
    children: [
      Expanded(
        child: messagesAsync.when(
          data: (messageList) => ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: messageList.messages.length,
            itemBuilder: (context, index) {
              final message = messageList.messages[index];
              return _buildMessage(message);
            },
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
        ),
      ),
      _buildChatInput(),
    ],
  );
}
```

---

## Step 6: Testing

### 6.1 Test Event List
```bash
# Start the app
flutter run

# Expected: See events from API
# If empty: Check backend is running on localhost:5000
```

### 6.2 Test Event Details
```bash
# Tap on an event card
# Expected: Navigate to details screen with 6 tabs
# Expected: See real data in PLAN tab
```

### 6.3 Test Chat
```bash
# Go to CHAT tab
# Type a message and send
# Expected: Message appears in list
# Expected: Message saved to backend
```

---

## Step 7: Error Handling

Add global error handler:

**File:** `lib/core/utils/error_handler.dart`
```dart
class ErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is DioException) {
      if (error.response != null) {
        final data = error.response!.data;
        return data['error']['message'] ?? 'An error occurred';
      }
      return 'Network error. Please check your connection.';
    }
    return error.toString();
  }

  static void showError(BuildContext context, dynamic error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(getErrorMessage(error)),
        backgroundColor: Colors.red,
      ),
    );
  }
}
```

---

## Step 8: Environment Configuration

**File:** `lib/core/config/environment.dart`
```dart
class Environment {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:5000/api/v1',
  );
}
```

Update API service to use:
```dart
baseUrl: Environment.apiBaseUrl,
```

---

## Checklist

### Phase 1 - Event List (Week 1)
- [ ] Setup API service layer
- [ ] Create event models
- [ ] Create event repository
- [ ] Update My Events screen with API
- [ ] Test event list loading
- [ ] Test event filtering
- [ ] Test bookmark functionality

### Phase 2 - Event Details (Week 2)
- [ ] Update Event Details screen with API
- [ ] Connect PLAN tab to budget API
- [ ] Connect PLAN tab to tasks API
- [ ] Connect GUEST tab to guests API
- [ ] Test add guest functionality
- [ ] Add loading states
- [ ] Add error handling

### Phase 3 - Chat & Settings (Week 3)
- [ ] Connect CHAT tab to messages API
- [ ] Test send message functionality
- [ ] Connect SETTINGS tab to settings API
- [ ] Connect EDIT tab to update API
- [ ] Test update event functionality
- [ ] Add pull-to-refresh

### Phase 4 - Polish (Week 4)
- [ ] Add offline caching with Hive
- [ ] Add image caching
- [ ] Optimize performance
- [ ] Add retry logic
- [ ] Write tests
- [ ] Fix bugs

---

## Common Issues & Solutions

### Issue 1: Network Error
**Problem:** Can't connect to localhost
**Solution:** 
- Android emulator: Use `http://10.0.2.2:5000`
- iOS simulator: Use `http://localhost:5000`
- Physical device: Use your computer's IP address

### Issue 2: 401 Unauthorized
**Problem:** Missing or invalid token
**Solution:** Implement proper token storage and refresh

### Issue 3: Data Not Updating
**Problem:** Stale data in providers
**Solution:** Use `ref.invalidate()` after mutations

---

## Next Steps

1. **Start with Phase 1** - Get event list working
2. **Test thoroughly** - Ensure data loads correctly
3. **Add Phase 2** - Event details and tabs
4. **Implement Phase 3** - Chat and settings
5. **Polish Phase 4** - Performance and UX

---

## Support

- **Backend API Docs:** See `BACKEND_API_REQUIREMENTS.md`
- **Postman Collection:** Import the provided JSON
- **Questions:** Contact backend team on Slack #mobile-backend-integration

**Last Updated:** November 30, 2024
