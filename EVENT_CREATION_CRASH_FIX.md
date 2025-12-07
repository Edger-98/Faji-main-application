# Event Creation Crash Fix

## Problem

App crashed when clicking "Create Event" button with a very long stack trace but no clear error message.

## Potential Causes

1. **Navigation Error** - EventDetailsTabbedScreen might be expecting data that's not available
2. **Missing Event Data** - Created event might be missing required fields
3. **State Update Error** - Trying to update state after widget is disposed

## Solutions Applied

### 1. Added Try-Catch Around Navigation

**Before:**
```dart
if (createdEvent != null) {
  ScaffoldMessenger.of(context).showSnackBar(...);
  Navigator.pushReplacement(...);  // Could crash here
  ref.invalidate(filteredEventsProvider);
}
```

**After:**
```dart
if (createdEvent != null) {
  try {
    ScaffoldMessenger.of(context).showSnackBar(...);
    ref.invalidate(filteredEventsProvider);  // Refresh first
    Navigator.pushReplacement(...);  // Then navigate
  } catch (e) {
    // Show error and go back instead of crashing
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Event created! Error navigating: $e'),
        backgroundColor: AppColors.warning,
      ),
    );
    Navigator.pop(context);
  }
}
```

### 2. Added Debug Logging

Added print statements to track the event creation flow:
```dart
print('🎯 Creating event with:');
print('   startDate: $startDate');
print('   endDate: $endDate');
print('   websiteLink: $websiteLink');
print('   themeId: $_selectedThemeId');
print('   posterId: ${state.eventData.selectedPosterId}');

final createdEvent = await viewModel.createEvent(...);

print('✅ Event created: ${createdEvent?.id}');
```

### 3. Reordered Operations

Changed order to refresh data before navigation:
1. Show success message
2. Refresh events list (invalidate provider)
3. Navigate to event details

This ensures the event list is updated before we try to navigate.

## How to Debug

### Check Console Logs

When you click "Create Event", you should see:
```
🎯 Creating event with:
   startDate: 2025-12-08 18:00:00.000
   endDate: 2025-12-08 21:00:00.000
   websiteLink: my-event
   themeId: theme_purple
   posterId: poster_xyz

🚀 REQUEST[POST] => http://10.0.2.2:5001/api/v1/events
✅ RESPONSE[201] => { success: true, data: {...} }

✅ Event created: 692d9d6495951571e197a8c4
```

### If It Still Crashes

1. **Check the exact error message** in the console (before the stack trace)
2. **Check if EventDetailsTabbedScreen exists** and has correct parameters
3. **Check if the event ID is valid**
4. **Try commenting out the navigation** to see if event creation works:

```dart
// Temporarily comment out navigation
// Navigator.pushReplacement(
//   context,
//   MaterialPageRoute(
//     builder: (context) => EventDetailsTabbedScreen(
//       eventId: createdEvent.id,
//       eventName: createdEvent.name,
//     ),
//   ),
// );

// Just go back for now
Navigator.pop(context);
```

## Common Issues

### Issue 1: EventDetailsTabbedScreen Not Found
**Error:** `Undefined class 'EventDetailsTabbedScreen'`
**Solution:** Check if the import is correct or if the screen exists

### Issue 2: Missing Event Fields
**Error:** `The getter 'id' was called on null`
**Solution:** Event creation failed, check API response

### Issue 3: Context Used After Dispose
**Error:** `Looking up a deactivated widget's ancestor is unsafe`
**Solution:** Already handled with `if (mounted)` check

### Issue 4: Provider Not Found
**Error:** `Could not find a provider for filteredEventsProvider`
**Solution:** Check if the provider is defined and imported

## Testing Steps

1. **Run the app** with console visible
2. **Fill event details** (name, dates, etc.)
3. **Select a poster**
4. **Select a theme**
5. **Click "Create Event"**
6. **Watch console logs** for:
   - 🎯 Creating event message
   - 🚀 API request
   - ✅ API response
   - ✅ Event created message
7. **Check result:**
   - Success message appears
   - Navigation works OR error message shows
   - Event appears in list

## Files Modified

1. ✅ `lib/features/organize_event/presentation/screens/event_theme_screen.dart`
   - Added try-catch around navigation
   - Added debug logging
   - Reordered operations (refresh before navigate)
   - Added fallback behavior (go back if navigation fails)

## Status

✅ **Error Handling Added** - Won't crash silently
✅ **Debug Logging Added** - Can track what's happening
✅ **Fallback Behavior** - Goes back if navigation fails
⏳ **Testing Needed** - Run and check console logs

The app should now either navigate successfully OR show a clear error message instead of crashing.
