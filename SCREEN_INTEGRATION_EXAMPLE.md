# Screen Integration Example

This document shows exactly how to integrate the backend API into your existing screens.

---

## Example: My Events Screen Integration

### Before (Hardcoded Data)

```dart
// Old approach with hardcoded data
Widget _buildUpcomingTab() {
  return Stack(
    children: [
      ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemCount: 3, // Hardcoded count
        itemBuilder: (context, index) {
          return _buildEventCard(
            eventId: 'evt_$index',
            role: 'creator',
            eventName: 'Sample Event',
            date: 'Nov 30th',
            countdown: '5 Hours 30 Mins 15 Secs',
          );
        },
      ),
      _buildCreateEventButton(),
    ],
  );
}
```

### After (API Integration)

```dart
// New approach with API data
Widget _buildUpcomingTab() {
  final eventsAsync = ref.watch(filteredEventsProvider);
  
  return eventsAsync.when(
    data: (events) => Stack(
      children: [
        events.isEmpty
            ? _buildEmptyState()
            : ListView.builder(
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
              ),
        _buildCreateEventButton(),
      ],
    ),
    loading: () => const Center(
      child: CircularProgressIndicator(),
    ),
    error: (error, stack) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: Colors.red),
          SizedBox(height: 16),
          Text(
            'Failed to load events',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => ref.refresh(filteredEventsProvider),
            child: Text('Retry'),
          ),
        ],
      ),
    ),
  );
}

// Helper methods
String _formatDate(DateTime date) {
  final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
                  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return '${months[date.month - 1]} ${date.day}${_getDaySuffix(date.day)}';
}

String _getDaySuffix(int day) {
  if (day >= 11 && day <= 13) return 'th';
  switch (day % 10) {
    case 1: return 'st';
    case 2: return 'nd';
    case 3: return 'rd';
    default: return 'th';
  }
}

String _calculateCountdown(DateTime endDate) {
  final now = DateTime.now();
  final diff = endDate.difference(now);
  
  if (diff.isNegative) return 'Event ended';
  
  final hours = diff.inHours;
  final mins = diff.inMinutes % 60;
  final secs = diff.inSeconds % 60;
  
  return '$hours Hours $mins Mins $secs Secs';
}

Widget _buildEmptyState() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.event_busy, size: 64, color: Colors.grey),
        SizedBox(height: 16),
        Text(
          'No events yet',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'Create your first event to get started',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );
}
```

---

## Example: Event Details Screen Integration

### Before (Hardcoded Data)

```dart
class EventDetailsTabbedScreen extends ConsumerStatefulWidget {
  final String eventId;
  
  const EventDetailsTabbedScreen({
    super.key,
    required this.eventId,
  });
  
  @override
  ConsumerState<EventDetailsTabbedScreen> createState() => _EventDetailsTabbedScreenState();
}

class _EventDetailsTabbedScreenState extends ConsumerState<EventDetailsTabbedScreen> {
  int _currentTabIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RonkeLols'), // Hardcoded
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Share functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }
}
```

### After (API Integration)

```dart
class EventDetailsTabbedScreen extends ConsumerStatefulWidget {
  final String eventId;
  
  const EventDetailsTabbedScreen({
    super.key,
    required this.eventId,
  });
  
  @override
  ConsumerState<EventDetailsTabbedScreen> createState() => _EventDetailsTabbedScreenState();
}

class _EventDetailsTabbedScreenState extends ConsumerState<EventDetailsTabbedScreen> {
  int _currentTabIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    final eventAsync = ref.watch(eventDetailsProvider(widget.eventId));
    
    return eventAsync.when(
      data: (event) => Scaffold(
        appBar: AppBar(
          title: Text(event.name), // Dynamic from API
          actions: [
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () => _shareEvent(event),
            ),
          ],
        ),
        body: Column(
          children: [
            _buildTabBar(),
            Expanded(
              child: _buildTabContent(event),
            ),
          ],
        ),
      ),
      loading: () => Scaffold(
        appBar: AppBar(
          title: Text('Loading...'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48, color: Colors.red),
              SizedBox(height: 16),
              Text('Failed to load event'),
              SizedBox(height: 8),
              Text(error.toString()),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(eventDetailsProvider(widget.eventId)),
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildTabContent(EventModel event) {
    switch (_currentTabIndex) {
      case 0:
        return PlanTab(event: event);
      case 1:
        return GuestTab(eventId: event.id);
      case 2:
        return ChatTab(eventId: event.id);
      case 3:
        return SettingsTab(event: event);
      case 4:
        return EditTab(event: event);
      case 5:
        return PromoteTab(event: event);
      default:
        return PlanTab(event: event);
    }
  }
  
  void _shareEvent(EventModel event) {
    // Share functionality with event data
  }
}
```

---

## Example: Add Guest Functionality

### Before (Placeholder)

```dart
void _showAddGuestDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Add Guest'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Phone'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Guest added')), // Fake
            );
          },
          child: Text('Add'),
        ),
      ],
    ),
  );
}
```

### After (API Integration)

```dart
void _showAddGuestDialog(BuildContext context) {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Add Guest'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name *'),
          ),
          SizedBox(height: 8),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(labelText: 'Phone'),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 8),
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            if (nameController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Name is required')),
              );
              return;
            }
            
            Navigator.pop(context);
            
            try {
              final repository = ref.read(guestRepositoryProvider);
              await repository.addGuest(
                widget.eventId,
                name: nameController.text,
                phone: phoneController.text.isEmpty ? null : phoneController.text,
                email: emailController.text.isEmpty ? null : emailController.text,
              );
              
              // Refresh guest list
              ref.invalidate(guestListProvider(widget.eventId));
              
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Guest added successfully')),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: $e')),
              );
            }
          },
          child: Text('Add'),
        ),
      ],
    ),
  );
}
```

---

## Example: Send Message Functionality

### Before (Placeholder)

```dart
void _sendMessage() {
  if (_messageController.text.trim().isEmpty) return;
  
  setState(() {
    _messages.add({
      'type': 'user',
      'content': _messageController.text,
      'sender': 'You',
      'time': 'Just now',
    });
    _messageController.clear();
  });
}
```

### After (API Integration)

```dart
Future<void> _sendMessage() async {
  if (_messageController.text.trim().isEmpty) return;
  
  final content = _messageController.text.trim();
  _messageController.clear();
  
  // Optimistic update - add message immediately
  setState(() {
    _isSending = true;
  });
  
  try {
    final repository = ref.read(messageRepositoryProvider);
    await repository.sendMessage(widget.eventId, content);
    
    // Refresh message list
    ref.invalidate(messageListProvider(widget.eventId));
    
    setState(() {
      _isSending = false;
    });
  } catch (e) {
    setState(() {
      _isSending = false;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to send message: $e')),
    );
    
    // Restore message to input
    _messageController.text = content;
  }
}
```

---

## Example: Update Task Status

### Before (Placeholder)

```dart
void _toggleTaskStatus(String taskId, bool isCompleted) {
  setState(() {
    // Update local state only
  });
  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Task updated')),
  );
}
```

### After (API Integration)

```dart
Future<void> _toggleTaskStatus(String taskId, bool isCompleted) async {
  try {
    final repository = ref.read(taskRepositoryProvider);
    await repository.updateTaskStatus(
      widget.eventId,
      taskId,
      isCompleted ? 'completed' : 'not_started',
    );
    
    // Refresh task list
    ref.invalidate(taskListProvider(widget.eventId));
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task updated successfully')),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to update task: $e')),
    );
  }
}
```

---

## Common Patterns

### 1. Loading State
```dart
eventsAsync.when(
  data: (events) => YourWidget(events),
  loading: () => CircularProgressIndicator(),
  error: (error, stack) => ErrorWidget(error),
);
```

### 2. Refresh Data
```dart
// Refresh a provider
ref.refresh(eventsListProvider);

// Invalidate and refetch
ref.invalidate(eventDetailsProvider(eventId));
```

### 3. Error Handling
```dart
try {
  await repository.someMethod();
  // Success
} catch (e) {
  // Show error to user
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(e.toString())),
  );
}
```

### 4. Optimistic Updates
```dart
// Update UI immediately
setState(() {
  // Update local state
});

try {
  // Then update backend
  await repository.update();
} catch (e) {
  // Revert on error
  setState(() {
    // Revert local state
  });
}
```

---

## Step-by-Step Integration Checklist

### For Each Screen:

1. **Add Provider Import**
   ```dart
   import 'package:flutter_riverpod/flutter_riverpod.dart';
   import '../providers/event_providers.dart';
   ```

2. **Convert to ConsumerWidget/ConsumerStatefulWidget**
   ```dart
   // Before
   class MyScreen extends StatefulWidget
   
   // After
   class MyScreen extends ConsumerStatefulWidget
   ```

3. **Watch Providers**
   ```dart
   final data = ref.watch(someProvider);
   ```

4. **Handle States**
   ```dart
   data.when(
     data: (value) => SuccessWidget(value),
     loading: () => LoadingWidget(),
     error: (error, stack) => ErrorWidget(error),
   );
   ```

5. **Update Actions**
   ```dart
   // Replace fake actions with real API calls
   final repository = ref.read(repositoryProvider);
   await repository.someMethod();
   ```

6. **Refresh Data**
   ```dart
   // After mutations
   ref.invalidate(dataProvider);
   ```

---

## Testing Your Integration

### 1. Start Backend
```bash
# Make sure backend is running
curl http://localhost:5000/api/v1/events
```

### 2. Set Auth Token
```dart
// In your app initialization
final apiService = ref.read(apiServiceProvider);
apiService.setToken('your_test_token');
```

### 3. Test Each Feature
- ✅ Events load
- ✅ Event details load
- ✅ Filters work
- ✅ Add guest works
- ✅ Send message works
- ✅ Update task works
- ✅ Update settings works

### 4. Test Error Cases
- ❌ No internet
- ❌ Invalid token
- ❌ Server error
- ❌ Validation error

---

## Next Steps

1. Start with **My Events Screen** (easiest)
2. Then **Event Details Screen**
3. Then each tab one by one:
   - PLAN Tab
   - GUEST Tab
   - CHAT Tab
   - SETTINGS Tab
   - EDIT Tab
   - PROMOTE Tab

---

**Estimated Time:** 1-2 hours per screen
**Difficulty:** Easy to Medium
**Support:** See `PHASE_3_BACKEND_INTEGRATION.md` for full reference

