# PIN Screen Blank Issue - DEBUG FIX

## Problem Identified
Navigation from Phone → PIN screen works (confirmed by logs), but PIN screen renders blank.

## Root Cause
The original PIN screen (`pin_screen.dart`) likely has an issue with:
1. Context extensions (`context.colors`, `context.styles`)
2. `flutter_screenutil` responsive sizing
3. `PinInputWidget` custom widget
4. Complex layout with `IntrinsicHeight` and `ConstrainedBox`

## Solution Applied

### Created Simple PIN Screen
Created `pin_screen_simple.dart` - a minimal version without:
- No context extensions
- No flutter_screenutil
- No custom PinInputWidget
- Simple TextField instead
- Basic layout

### Updated Router
Temporarily using `PinScreenSimple` instead of `PinScreen` in `app_router.dart`

## Testing Instructions

### CRITICAL: Hot Restart Required!
**You MUST do a HOT RESTART (not hot reload) for router changes!**

#### How to Hot Restart:
- **VS Code**: `Ctrl+Shift+F5` or `Cmd+Shift+F5`
- **Android Studio**: Click "Hot Restart" button
- **Terminal**: Press `R` (capital R)

### Test Flow:
1. Hot restart the app
2. Go through: Intro → Email → Phone
3. Enter phone number (8+ digits)
4. Click Continue
5. **You should now see the simple PIN screen with:**
   - Title: "Enter 6-digit code"
   - Subtitle: "We sent a verification code..."
   - Text input field
   - Continue button

### Expected Console Output:
```
Phone screen: Navigating to PIN screen
Route name: auth-pin
Route path: /auth/pin
Navigation called successfully
PIN Screen Simple: initState called
PIN Screen Simple: build called
```

## What This Tells Us

### If Simple PIN Screen Works:
✅ Navigation is working correctly
✅ Router is configured properly
❌ Original PIN screen has a widget/layout issue

**Next Step**: Fix the original PIN screen by:
1. Removing complex layout constraints
2. Simplifying the PinInputWidget
3. Testing context extensions
4. Checking flutter_screenutil initialization

### If Simple PIN Screen Also Blank:
❌ Deeper issue with routing or app configuration
❌ Possible theme/context issue

**Next Step**: Check:
1. App initialization in main.dart
2. Theme configuration
3. MaterialApp.router setup
4. GoRouter configuration

## Files Modified

1. **Created**: `lib/features/auth/presentation/screens/pin_screen_simple.dart`
   - Simple, minimal PIN screen for debugging
   
2. **Modified**: `lib/core/routing/app_router.dart`
   - Temporarily using PinScreenSimple
   - Added import for pin_screen_simple.dart

3. **Modified**: `lib/features/auth/presentation/screens/pin_screen.dart`
   - Added debug logging (for future use)

## Reverting to Original PIN Screen

Once we identify the issue, revert the router change:

```dart
// In app_router.dart, change back to:
GoRoute(
  path: RouteManager.authPin,
  name: RouteManager.authPinName,
  pageBuilder: (context, state) => _buildPageWithTransition(
    context,
    state,
    const PinScreen(), // Back to original
  ),
),
```

## Known Issues in Original PIN Screen

### Potential Problems:
1. **Context Extensions**: `context.colors.surface` might fail if theme not initialized
2. **ScreenUtil**: `.w` and `.h` extensions need ScreenUtilInit wrapper
3. **IntrinsicHeight**: Can cause layout issues in ScrollView
4. **PinInputWidget**: Complex custom widget with animations
5. **AppText.headlineLarge**: Builder widget might have context issues

### Recommended Fixes:
1. Replace `context.colors` with `Theme.of(context).colorScheme`
2. Replace `.w` and `.h` with fixed values or MediaQuery
3. Simplify layout structure
4. Test PinInputWidget separately
5. Use direct Text widgets instead of AppText

## Next Steps

1. **Hot restart and test** the simple PIN screen
2. **Report results**: Does it work or still blank?
3. **If it works**: We'll fix the original PIN screen
4. **If it doesn't**: We'll investigate deeper routing issues

## Debug Checklist

- [ ] Hot restart performed
- [ ] Simple PIN screen loads
- [ ] Can enter PIN digits
- [ ] Continue button works
- [ ] Navigates to Name screen
- [ ] Console shows debug messages

## Additional Debug Info

### Check Theme Initialization:
```dart
// In main.dart, verify:
MaterialApp.router(
  theme: FajiAppTheme.lightTheme,
  darkTheme: FajiAppTheme.darkTheme,
  themeMode: ThemeMode.dark,
  routerConfig: AppRouter.router,
)
```

### Check ScreenUtil Initialization:
```dart
// In main.dart, verify:
ScreenUtilInit(
  designSize: const Size(393, 852),
  minTextAdapt: true,
  splitScreenMode: true,
  builder: (context, child) {
    return MaterialApp.router(...);
  },
)
```

## Success Criteria

✅ Simple PIN screen loads and displays
✅ Can enter 6-digit PIN
✅ Auto-navigates or manual continue works
✅ Proceeds to Name screen
✅ No blank screens in the flow

Once simple version works, we'll enhance it back to the Figma design.
