# Quick Reference Card - Backend Integration

## 🚀 Getting Started (5 Minutes)

### 1. Set Auth Token
```dart
final apiService = ref.read(apiServiceProvider);
apiService.setToken('your_jwt_token');
```

### 2. Watch Events
```dart
final eventsAsync = ref.watch(filteredEventsProvider);

eventsAsync.when(
  data: (events) => YourWidget(events),
  loading: () => CircularProgressIndicator(),
  error: (error, stack) => ErrorWidget(error),
);
```

### 3. Change Filters
```dart
// Change tab
ref.read(currentTabProvider.notifier).state = 'upcoming';

// Change role
ref.read(currentRoleFilterProvider.notifier).state = 'creator';
```

---

## 📦 Available Providers

### Events
```dart
filteredEventsProvider              // Current filtered events
eventDetailsProvider(eventId)       // Single event details
currentTabProvider                  // Current tab state
currentRoleFilterProvider           // Current role filter
```

### Repositories
```dart
eventRepositoryProvider             // Event operations
taskRepositoryProvider              // Task operations
guestRepositoryProvider             // Guest operations
messageRepositoryProvider           // Message operations
```

---

## 🔧 Common Operations

### Fetch Events
```dart
final events = await ref.read(eventRepositoryProvider).getEvents(
  status: 'upcoming',
  role: 'creator',
);
```

### Get Event Details
```dart
final event = await ref.read(eventRepositoryProvider).getEventDetails('evt_123');
```

### Update Event
```dart
await ref.read(eventRepositoryProvider).updateEvent('evt_123', {
  'name': 'New Name',
  'description': 'New description',
});
```

### Add Guest
```dart
await ref.read(guestRepositoryProvider).addGuest(
  'evt_123',
  name: 'John Doe',
  phone: '+2348012345678',
);
```

### Send Message
```dart
await ref.read(messageRepositoryProvider).sendMessage(
  'evt_123',
  'Hello everyone!',
);
```

### Update Task
```dart
await ref.read(taskRepositoryProvider).updateTaskStatus(
  'evt_123',
  'task_456',
  'completed',
);
```

---

## 🔄 Refresh Data

### Refresh Provider
```dart
ref.refresh(filteredEventsProvider);
```

### Invalidate Provider
```dart
ref.invalidate(eventDetailsProvider('evt_123'));
```

---

## ⚠️ Error Handling

### Try-Catch Pattern
```dart
try {
  await repository.someMethod();
  // Success
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Success!')),
  );
} catch (e) {
  // Error
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(e.toString())),
  );
}
```

---

## 📱 API Endpoints

```
GET    /api/v1/events                    # List events
GET    /api/v1/events/{id}               # Event details
POST   /api/v1/events/{id}/bookmark      # Toggle bookmark
PATCH  /api/v1/events/{id}               # Update event
DELETE /api/v1/events/{id}               # Delete event

GET    /api/v1/events/{id}/tasks         # List tasks
PATCH  /api/v1/events/{id}/tasks/{tid}   # Update task

GET    /api/v1/events/{id}/guests        # List guests
POST   /api/v1/events/{id}/guests        # Add guest

GET    /api/v1/events/{id}/messages      # List messages
POST   /api/v1/events/{id}/messages      # Send message
```

---

## 🎯 Quick Tips

1. **Always use ref.watch() in build method**
2. **Use ref.read() in callbacks/methods**
3. **Handle all three states: data, loading, error**
4. **Refresh after mutations**
5. **Show user feedback for all actions**

---

## 📚 Documentation

- `QUICK_START_INTEGRATION.md` - 30-min guide
- `SCREEN_INTEGRATION_EXAMPLE.md` - Code examples
- `PHASE_3_BACKEND_INTEGRATION.md` - Technical details
- `BACKEND_API_REQUIREMENTS.md` - API reference

---

## 🐛 Troubleshooting

### Events not loading?
```dart
// Check token
print(apiService._dio.options.headers['Authorization']);

// Check backend
curl http://localhost:5000/api/v1/events
```

### Android can't connect?
```dart
// Use 10.0.2.2 instead of localhost
baseUrl: 'http://10.0.2.2:5000/api/v1'
```

### iOS can't connect?
Add to `Info.plist`:
```xml
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsLocalNetworking</key>
  <true/>
</dict>
```

---

**Keep this card handy while integrating!** 📌

