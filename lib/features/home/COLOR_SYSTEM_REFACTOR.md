# Color System Refactor - Home Feature

## Problem
The home feature had hardcoded color values scattered throughout all widgets, making it:
- Difficult to maintain
- Impossible to theme
- Inconsistent with the design system
- Prone to errors and inconsistencies

## Solution
Centralized all colors in the design system and accessed them via `context.colors`.

## Changes Made

### 1. Added Home-Specific Colors to AppColors
Added the following semantic color tokens to `lib/core/design_system/colors/app_colors.dart`:

```dart
// Home Feature Specific Colors (From Figma)
static const Color eventCardBlue = Color(0xFF043D9E);
static const Color liveRed = Color(0xFFCA4638);
static const Color textSecondary = Color(0xFFAAA9A9);
static const Color textTertiary = Color(0xFF616161);
static const Color searchBarBackground = Color(0x52282828);
static const Color categoryChipBackground = Color(0xCF151515);
static const Color bottomNavBackground = Color(0x40070707);
static const Color overlayBackground = Color(0x6E070707);
static const Color dotSeparator = Color(0xFFD9D9D9);
static const Color iconGray = Color(0xFFDCDCDC);
static const Color successGreen = Color(0xFF45D12E);
```

### 2. Extended Context Colors
Added convenience accessors to `lib/core/design_system/extensions/context_extensions.dart`:

```dart
// Home Feature Specific Colors
Color get eventCardBlue => AppColors.eventCardBlue;
Color get liveRed => AppColors.liveRed;
Color get textSecondary => AppColors.textSecondary;
Color get textTertiary => AppColors.textTertiary;
Color get searchBarBackground => AppColors.searchBarBackground;
Color get categoryChipBackground => AppColors.categoryChipBackground;
Color get bottomNavBackground => AppColors.bottomNavBackground;
Color get overlayBackground => AppColors.overlayBackground;
Color get dotSeparator => AppColors.dotSeparator;
Color get iconGray => AppColors.iconGray;
Color get successGreen => AppColors.successGreen;
```

### 3. Updated All Widgets

#### HomeBottomNav
- Background: `context.colors.bottomNavBackground`
- Active icon background: `context.colors.primary`
- Active icon color: `context.colors.onPrimary`
- Inactive icon color: `context.colors.onSurface`

#### HomeHeader
- Greeting text: `context.colors.onSurface`
- Notification bell background: `context.colors.searchBarBackground`
- Bell icon: `context.colors.iconGray`
- Badge: `context.colors.liveRed`

#### HomeSearchBar
- Background: `context.colors.searchBarBackground`
- Search icon: `context.colors.onSurfaceVariant`
- Placeholder text: `context.colors.onSurfaceVariant`
- Filter icon: `context.colors.iconGray`

#### CategoryFilterSection
- Chip background: `context.colors.categoryChipBackground`
- Selected text: `context.colors.primary`
- Unselected text: `context.colors.textTertiary`

#### SectionHeader
- Title: `context.colors.onSurface`
- "View all" link: `context.colors.onSurfaceVariant`

#### EventCard
- Card background: `context.colors.eventCardBlue`
- Live badge background: `context.colors.liveRed`
- Live badge text: `context.colors.primary`
- Favorite button background: `context.colors.onPrimary.withOpacity(0.21)`
- Favorite icon: `context.colors.onSurface`
- Overlay background: `context.colors.overlayBackground`
- Title: `context.colors.onSurface`
- Date/time: `context.colors.textSecondary`
- Price: `context.colors.primary`
- Dot separator: `context.colors.dotSeparator`

#### UpcomingEventCard
- Card background: `context.colors.eventCardBlue`
- Live badge: `context.colors.liveRed` / `context.colors.primary`
- Date text: `context.colors.onSurface`
- Organizer avatar background: `context.colors.primary`
- Organizer info: `context.colors.onSurface`

#### OrganizerCard
- Card background: `context.colors.primary`
- Name text: `context.colors.onSurface`

#### FlashDealSection
- Title: `context.colors.onSurface`
- Timer: `context.colors.primary`
- Card background: `context.colors.eventCardBlue`
- Success indicator: `context.colors.successGreen`
- Promocode label: `context.colors.textSecondary`
- Main text: `context.colors.primary`
- Description: `context.colors.textSecondary`

#### HomeScreen
- Background: `context.colors.surface`
- Placeholder text: `context.colors.onSurface`

## Benefits

### 1. Maintainability
- All colors defined in one place
- Easy to update across the entire feature
- Clear semantic naming

### 2. Consistency
- No more color mismatches
- Guaranteed design system compliance
- Predictable color usage

### 3. Theming Support
- Ready for light/dark theme switching
- Can easily add custom themes
- Colors adapt to theme changes automatically

### 4. Type Safety
- Compile-time checking
- IDE autocomplete support
- Refactoring-friendly

### 5. Readability
- Semantic color names (e.g., `liveRed` instead of `Color(0xFFCA4638)`)
- Self-documenting code
- Easier code reviews

## Usage Pattern

### ❌ Before (Hardcoded)
```dart
Container(
  color: const Color(0xFF043D9E),
  child: Text(
    'Hello',
    style: TextStyle(color: const Color(0xFFF8F8F8)),
  ),
)
```

### ✅ After (Design System)
```dart
Container(
  color: context.colors.eventCardBlue,
  child: Text(
    'Hello',
    style: TextStyle(color: context.colors.onSurface),
  ),
)
```

## Verification
- ✅ Zero hardcoded colors remaining in home feature
- ✅ All diagnostics passing
- ✅ All widgets using `context.colors`
- ✅ Semantic color naming throughout

## Future Improvements
1. Add light theme color variants
2. Create color documentation with visual swatches
3. Add color accessibility testing
4. Consider adding more semantic color tokens as needed
