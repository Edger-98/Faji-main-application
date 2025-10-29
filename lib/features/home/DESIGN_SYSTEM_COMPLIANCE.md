# Design System Compliance - Home Feature

## Issue Identified
The initial implementation had inline `TextStyle` objects scattered throughout the widgets, breaking the established design system pattern.

## Design System Pattern
The app uses a centralized typography system with predefined text styles accessed via:
- `AppText.displayLarge()` - 37sp, Neue Haas Display Pro, 600 weight
- `AppText.displayMedium()` - 32sp, Neue Haas Display Pro, 600 weight
- `AppText.headlineLarge()` - 28sp, Neue Haas Display Pro, 600 weight
- `AppText.headlineMedium()` - 24sp, Neue Haas Display Pro, 600 weight
- `AppText.titleLarge()` - 22sp, Neue Haas Display Pro, 600 weight
- `AppText.labelLarge()` - 18sp, Neue Haas Display Pro, 600 weight
- `AppText.bodyLarge()` - 17sp, PP Neue Montreal, 100 weight
- `AppText.bodyMedium()` - 16sp, PP Neue Montreal, 100 weight
- `AppText.bodySmall()` - 14sp, PP Neue Montreal, 100 weight

## Corrections Made

### 1. Home Header (`home_header.dart`)
**Before:**
```dart
AppText(
  'Hi, Chineme!',
  style: TextStyle(
    fontFamily: 'Neue Haas Grotesk Display Pro',
    fontWeight: FontWeight.w600,
    fontSize: 34.sp,
    ...
  ),
)
```

**After:**
```dart
AppText.displayLarge(
  'Hi, Chineme!',
  color: const Color(0xFFF8F8F8),
)
```

### 2. Event Card (`event_card.dart`)
- Live badge: Changed to `AppText.bodySmall()`
- Event title: Changed to `AppText.bodyMedium()`
- Date/time/price: Changed to `AppText.bodySmall()`

### 3. Section Headers (`section_header.dart`)
- Title: Changed to `AppText.headlineMedium()`
- "View all" link: Changed to `AppText.labelLarge()`

### 4. Category Filter (`category_filter_section.dart`)
- Category labels: Changed to `AppText.bodyLarge()`

### 5. Search Bar (`home_search_bar.dart`)
- Placeholder text: Changed to `AppText.labelLarge()`

### 6. Upcoming Event Card (`upcoming_event_card.dart`)
- Live badge: Changed to `AppText.bodySmall()`
- Month: Changed to `AppText.bodySmall()`
- Day: Changed to `AppText.headlineMedium()`
- Organizer name: Changed to `AppText.bodyMedium()`
- Location: Changed to `AppText.bodySmall()`

### 7. Flash Deal Section (`flash_deal_section.dart`)
- Title: Changed to `AppText.headlineMedium()`
- Timer: Changed to `AppText.labelLarge()`
- "Tap for $20": Changed to `AppText.displayMedium()`
- Promocode label: Changed to `AppText.bodySmall()`
- Description: Changed to `AppText.bodySmall()`

### 8. Organizer Card (`organizer_card.dart`)
- Name: Changed to `AppText.bodyMedium()`

## Benefits of This Approach

1. **Consistency**: All text follows the same design system
2. **Maintainability**: Changes to typography can be made in one place
3. **Responsiveness**: Built-in responsive scaling via ScreenUtil
4. **Type Safety**: Compile-time checking of text styles
5. **Readability**: Code is cleaner and more semantic
6. **Theme Support**: Easy to switch between light/dark themes

## Best Practices Going Forward

✅ **DO:**
- Use `AppText.styleName()` for all text
- Pass only `color` parameter when needed
- Use semantic style names (e.g., `headlineMedium` for section titles)

❌ **DON'T:**
- Create inline `TextStyle` objects
- Hardcode font families or sizes
- Use raw `Text()` widgets directly
- Duplicate style definitions

## Example Usage

```dart
// Section title
AppText.headlineMedium(
  'Trending Events',
  color: const Color(0xFFF8F8F8),
)

// Body text
AppText.bodyMedium(
  'Event description',
  maxLines: 2,
  color: Colors.white,
)

// Small label
AppText.bodySmall(
  'Wed 22/03',
  color: const Color(0xFFAAA9A9),
)
```
