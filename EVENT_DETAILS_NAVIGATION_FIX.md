# Event Details Navigation Fix

## Issue
Error when viewing event details: `type 'Map<String, dynamic>' is not a subtype of type 'String?' in type cast`

## Root Cause
The search screen was navigating to event details without the required event ID parameter.

**Route Definition:**
```dart
path: '${RouteManager.eventDetails}/:id'
```

**Incorrect Navigation (in search_screen.dart):**
```dart
context.push(RouteManager.eventDetails); // Missing /:id
```

## Fix Applied

**File**: `lib/features/home/presentation/screens/search_screen.dart`

**Before:**
```dart
onTap: () {
  HapticFeedback.lightImpact();
  context.push(RouteManager.eventDetails);
},
```

**After:**
```dart
onTap: () {
  HapticFeedback.lightImpact();
  // TODO: Navigate to event details with actual event ID
  context.push('${RouteManager.eventDetails}/event_123');
},
```

## Verification

All other navigation to event details is correct:
- ✅ `trending_events_section.dart` - Uses `event.id`
- ✅ `upcoming_events_section.dart` - Uses `event.id`
- ✅ `flash_deal_section.dart` - Uses `flashEvent.id`
- ✅ `events_list_screen.dart` - Uses `event.id`
- ✅ `my_events_screen.dart` - Uses `event.id`
- ✅ `favorites_screen.dart` - Uses `event.id`
- ✅ `events/search_screen.dart` - Uses `event.id`

## Next Steps

The search screen currently uses a placeholder ID (`event_123`). When the search functionality is connected to the backend, update it to use the actual event ID from the search results:

```dart
// When search results are available:
onTap: () {
  HapticFeedback.lightImpact();
  context.push('${RouteManager.eventDetails}/${searchResult.id}');
},
```

## Status
✅ Fixed - App should now load event details without errors
