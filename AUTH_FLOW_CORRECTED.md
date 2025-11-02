# Auth Flow Correction - Email → PIN (Not Phone → PIN)

## Issue Identified
The auth flow was incorrect. It was going:
❌ **Wrong**: Email → Phone → PIN → Name → Password → Home

## Correct Flow (From Figma)
✅ **Correct**: Email → PIN → Name → Password → Home

## Changes Made

### 1. Updated Email Screen
**File**: `lib/features/auth/presentation/screens/email_screen.dart`

Changed navigation from:
```dart
context.goNamed(RouteManager.authPhoneName); // Wrong
```

To:
```dart
context.goNamed(RouteManager.authPinName); // Correct
```

### 2. Updated AUTH_FLOW.md
- Removed Phone screen from main sign-up flow
- Updated step numbers
- Corrected flow diagram
- Updated PIN screen description (verifies email, not phone)

### 3. PIN Screen Design (From Figma)
Based on node-id=2-455:
- **Title**: "Enter 6-digit code" (28px, Neue Haas Display Pro, 600 weight)
- **Subtitle**: "We sent a verification code to your email chineme@gmail.com" (17px, PP Neue Montreal, 100 weight)
- **PIN Input**: 6 visual lines (23px width, 3px height, #454545 color)
- **Resend Link**: "Didn't receive code? Request again"
- **Continue Button**: 337x59px, #FD99C9 background, 29.5px border radius
- **Back Button**: Top left, 50x50px circle

## Correct Sign-Up Flow

```
1. Intro Screen
   ↓ (Get Started)
2. Email Screen
   ↓ (Enter email, click Continue)
3. PIN Screen (Verify Email)
   ↓ (Enter 6-digit code)
4. Name Screen
   ↓ (Enter full name)
5. Password Screen
   ↓ (Create password)
6. Home Screen
```

## Phone Screen Purpose
The Phone screen (`/auth/phone`) exists but is **NOT part of the main sign-up flow**.
It may be used for:
- Optional phone verification later
- Profile completion
- Two-factor authentication setup

## Testing Instructions

### CRITICAL: Hot Restart Required!
**You MUST do a HOT RESTART for these changes to take effect!**

#### How to Hot Restart:
- **VS Code**: `Ctrl+Shift+F5` or `Cmd+Shift+F5`
- **Android Studio**: Click "Hot Restart" button
- **Terminal**: Press `R` (capital R)

### Test the Correct Flow:
1. Hot restart the app
2. Navigate: Intro → Email
3. Enter valid email (e.g., test@example.com)
4. Click Continue
5. **Should now go to PIN screen** (not Phone screen)
6. Enter 6-digit PIN
7. Should navigate to Name screen
8. Continue through Password → Home

### Expected Console Output:
```
Email screen: Navigating to PIN screen
PIN Screen Simple: initState called
PIN Screen Simple: build called
```

## Files Modified

1. **lib/features/auth/presentation/screens/email_screen.dart**
   - Changed navigation from authPhoneName to authPinName
   - Added debug logging

2. **AUTH_FLOW.md**
   - Updated flow diagram
   - Removed Phone screen from main flow
   - Corrected step numbers
   - Updated descriptions

3. **lib/core/routing/app_router.dart** (already done)
   - Using PinScreenSimple temporarily for debugging

## Why This Matters

### User Experience:
- **Faster onboarding**: One less step (no phone entry)
- **Email verification**: Confirms email is valid and accessible
- **Standard flow**: Most apps verify email first, phone is optional

### Technical:
- Matches Figma design exactly
- PIN screen designed for email verification
- Phone screen is separate feature

## Next Steps

1. **Hot restart** the app
2. **Test Email → PIN** navigation
3. **Verify PIN screen loads** (simple version)
4. **Complete the flow** to Name → Password → Home
5. **Once working**: Replace PinScreenSimple with proper PinScreen

## PIN Screen Implementation

### Current: Simple Version
Using `PinScreenSimple` for debugging - basic TextField input.

### Future: Figma Design
Will implement proper PIN screen with:
- 6 visual indicator lines
- Hidden input fields
- Auto-focus and auto-advance
- Smooth animations
- Exact Figma styling

## Verification Checklist

After hot restart:
- [ ] Email screen loads
- [ ] Enter valid email
- [ ] Click Continue
- [ ] PIN screen loads (not Phone screen)
- [ ] Can enter 6 digits
- [ ] Continue to Name screen
- [ ] Complete flow to Home

## Common Issues

### Issue: Still goes to Phone screen
**Solution**: Hot restart required (not hot reload)

### Issue: PIN screen blank
**Solution**: Using simple version now, should work

### Issue: Can't enter PIN
**Solution**: Click on the text field, keyboard should appear

## Success Criteria

✅ Email → PIN navigation works
✅ PIN screen displays (simple version)
✅ Can enter 6-digit code
✅ Continues to Name screen
✅ Full flow completes to Home

Once this works, we'll implement the proper Figma-designed PIN screen with visual indicators.
