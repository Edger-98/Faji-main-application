# Event Details Tabbed Screen

This directory contains the implementation of the event details screen with tabs, similar to the design shown in the screenshots.

## Structure

### Main Screen
- `event_details_tabbed_screen.dart` - Main screen with tab navigation

### Tabs
1. **plan_tab.dart** - Event planning tools and sections
   - Event info card with countdown
   - Budget management
   - Task tracker
   - Vendors list
   - Location map
   - Planners
   - Sell tickets section
   - More tools

2. **guest_tab.dart** - Guest list and management
   - Search functionality
   - Filter chips (All, Create Group, Confirmed, Invited)
   - Guest list with status badges
   - Scan QR and Add Guest buttons

3. **chat_tab.dart** - Event chat with planners
   - System messages
   - User messages
   - Event link sharing card
   - Chat input with attachments

4. **settings_tab.dart** - Event settings and preferences
   - Event publicity toggle
   - Event website link
   - RSVP button customization
   - Event poster upload
   - Pre-event media upload
   - RSVP note
   - Privacy preferences (Keep Memories Private, Disable Guest Memories, etc.)

5. **edit_tab.dart** - Edit event details
   - Color theme selection
   - Event name and category
   - Date & time management
   - Event description with AI generation
   - Logistics (guest count, budget)

6. **promote_tab.dart** - Event promotion tools
   - Party Promoters (commission-based promotion)
   - Broadcast messaging

## Usage

```dart
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_details_tabbed_screen.dart';

// Navigate to event details
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => EventDetailsTabbedScreen(
      eventId: 'event_123',
      eventName: 'RonkeLols',
    ),
  ),
);

// Or using GoRouter
context.push('/event-details-tabbed?eventId=event_123&eventName=RonkeLols');
```

## Features

- Tab-based navigation (PLAN, GUEST, CHAT, SETTINGS, EDIT, PROMOTE)
- Consistent design system using AppColors and AppTypography
- Responsive layout with ScreenUtil
- State management with Riverpod
- Smooth animations and transitions

## Next Steps

To integrate this into your app:

1. Add route to `route_manager.dart`:
```dart
static const String eventDetailsTabbedScreen = '/event-details-tabbed';
```

2. Add route to `app_router.dart`:
```dart
GoRoute(
  path: RouteManager.eventDetailsTabbedScreen,
  name: 'event-details-tabbed',
  pageBuilder: (context, state) {
    final eventId = state.uri.queryParameters['eventId'] ?? '';
    final eventName = state.uri.queryParameters['eventName'] ?? '';
    return _buildPageWithTransition(
      context,
      state,
      EventDetailsTabbedScreen(
        eventId: eventId,
        eventName: eventName,
      ),
    );
  },
),
```

3. Connect to your event data providers
4. Implement actual functionality for buttons and actions
5. Add real data fetching and state management
