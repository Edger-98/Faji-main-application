# Core Services

Reusable services for common functionality across the app.

## Bottom Sheet Service

A centralized service for showing consistent bottom sheets throughout the app.

### Features

1. **Custom Bottom Sheets** - Show any widget in a bottom sheet with consistent styling
2. **List Bottom Sheets** - Quick selection from a list of items
3. **Confirmation Bottom Sheets** - Ask for user confirmation
4. **Consistent Design** - All bottom sheets follow the design system
5. **Customizable** - Control dismissibility, drag behavior, height, etc.

### Usage

#### Custom Bottom Sheet

```dart
import 'package:fajimobileapp/core/services/services.dart';

// Show custom content
final result = await BottomSheetService.show<String>(
  context: context,
  title: 'Select Option',
  child: YourCustomWidget(),
);
```

#### List Bottom Sheet

```dart
final selected = await BottomSheetService.showList<String>(
  context: context,
  title: 'Choose Category',
  items: [
    BottomSheetItem(label: 'Music', value: 'music', icon: Icons.music_note),
    BottomSheetItem(label: 'Sports', value: 'sports', icon: Icons.sports),
    BottomSheetItem(label: 'Art', value: 'art', icon: Icons.palette),
  ],
  selectedValue: currentCategory,
);
```

#### Confirmation Bottom Sheet

```dart
final confirmed = await BottomSheetService.showConfirmation(
  context: context,
  title: 'Delete Event',
  message: 'Are you sure you want to delete this event?',
  confirmText: 'Delete',
  cancelText: 'Cancel',
  isDangerous: true, // Shows red button
);

if (confirmed == true) {
  // User confirmed
}
```

### Parameters

#### `show<T>()`
- `context` - BuildContext (required)
- `child` - Widget to display (required)
- `title` - Optional title for the bottom sheet
- `isDismissible` - Can dismiss by tapping outside (default: true)
- `enableDrag` - Can drag to dismiss (default: true)
- `height` - Custom height (optional)

#### `showList<T>()`
- `context` - BuildContext (required)
- `title` - Title for the list (required)
- `items` - List of BottomSheetItem (required)
- `selectedValue` - Currently selected value (optional)

#### `showConfirmation()`
- `context` - BuildContext (required)
- `title` - Title (required)
- `message` - Confirmation message (required)
- `confirmText` - Confirm button text (default: 'Confirm')
- `cancelText` - Cancel button text (default: 'Cancel')
- `isDangerous` - Show as dangerous action (default: false)

### Design System Integration

All bottom sheets automatically use:
- Theme colors from `context.colors`
- Typography from `AppText`
- Consistent border radius (28px top corners)
- Drag handle indicator
- Proper spacing and padding

### Example: Filter Bottom Sheet

See `lib/features/home/presentation/widgets/filter_bottom_sheet.dart` for a complete example of a custom bottom sheet with:
- Multiple filter options
- Category chips
- Radio buttons
- Sliders
- Date picker
- Apply/Clear actions
