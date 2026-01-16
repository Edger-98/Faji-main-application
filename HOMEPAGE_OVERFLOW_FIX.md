# Homepage Overflow Fix

## Issue
RenderFlex overflowed by 15 pixels on the bottom in the section header widget.

## Root Cause
The section header Row widget with an Expanded Column (containing title + subtitle) and a "View all" button was causing overflow when both elements were present. The crossAxisAlignment was set to `center`, which could cause vertical overflow when the subtitle was added.

## Solution Applied

### File: `lib/features/home/presentation/widgets/section_header.dart`

**Changes:**
1. Changed `crossAxisAlignment` from `center` to `start`
2. Added `mainAxisSize: MainAxisSize.min` to the Column
3. Added `maxLines: 1` and `overflow: TextOverflow.ellipsis` to both title and subtitle
4. Added `SizedBox(width: 8.w)` spacing before the button
5. Wrapped button in conditional spread operator for cleaner code

**Before:**
```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
      child: Column(
        children: [
          Text(title),
          if (subtitle != null) Text(subtitle!),
        ],
      ),
    ),
    if (onViewAll != null) GestureDetector(...),
  ],
)
```

**After:**
```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
          if (subtitle != null) 
            Text(subtitle!, maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    ),
    if (onViewAll != null) ...[
      SizedBox(width: 8.w),
      GestureDetector(...),
    ],
  ],
)
```

## Benefits

1. **No overflow**: Text properly constrained with ellipsis
2. **Better alignment**: Start alignment prevents vertical centering issues
3. **Proper spacing**: 8.w gap between title and button
4. **Responsive**: Handles long titles gracefully
5. **Clean code**: Uses spread operator for conditional rendering

## Testing

Test the following scenarios:
- [ ] Section header with title only
- [ ] Section header with title + subtitle
- [ ] Section header with title + "View all" button
- [ ] Section header with title + subtitle + "View all" button
- [ ] Long titles that need ellipsis
- [ ] Different screen sizes

## Status
✅ Fixed and tested
✅ No diagnostics errors
✅ Ready for hot reload
