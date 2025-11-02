# Wallet Navigation Debug Guide

## Issue
Clicking on "Current Balance" card in Profile screen doesn't navigate to wallet.

## Changes Made

### 1. Updated Profile Screen
- Changed from `GestureDetector` to `InkWell` for better tap detection
- Added `Ink` widget for proper Material ripple effect
- Added debug print statements to verify tap is being registered
- Route: `RouteManager.walletBalance` → `/wallet/balance`

### 2. Debug Steps

#### Check Console Output
When you tap the balance card, you should see in the console:
```
Balance card tapped!
Navigating to: /wallet/balance
```

If you see these messages but navigation doesn't happen, the issue is with the router.
If you don't see these messages, the tap isn't being registered.

#### Verify Router Registration
The wallet routes are registered in `lib/core/routing/app_router.dart`:
- `/wallet/balance` → `BalanceDetailScreen`
- `/wallet/enter-amount` → `EnterWithdrawalAmountScreen`
- `/wallet/review` → `ReviewWithdrawalScreen`
- `/wallet/confirmation` → `WithdrawalConfirmationScreen`
- `/wallet/history` → `TransactionHistoryScreen`

### 3. Required Actions

**IMPORTANT: You MUST do a HOT RESTART (not hot reload) for router changes to take effect!**

#### How to Hot Restart:
1. **VS Code**: Press `Ctrl+Shift+F5` (Windows/Linux) or `Cmd+Shift+F5` (Mac)
2. **Android Studio**: Click the "Hot Restart" button (🔄 with red square)
3. **Terminal**: Press `R` (capital R) in the terminal where `flutter run` is running

### 4. Testing Checklist

After hot restart:
- [ ] Open the app
- [ ] Navigate to Profile screen (4th tab in bottom nav)
- [ ] Check console for any errors
- [ ] Tap on "Current Balance" card
- [ ] Check console for debug messages
- [ ] Verify navigation to wallet balance screen
- [ ] Test back button returns to profile

### 5. Alternative Navigation Test

To test if the route works at all, try navigating from another screen:
```dart
// Add a test button somewhere
ElevatedButton(
  onPressed: () => context.push('/wallet/balance'),
  child: Text('Test Wallet'),
)
```

### 6. Common Issues

#### Issue: Tap not registering
- **Solution**: The InkWell should fix this. Make sure you're tapping the card area.

#### Issue: Route not found
- **Solution**: Do a hot restart (not hot reload). Router changes require restart.

#### Issue: Import errors
- **Solution**: Check that `lib/features/wallet/wallet.dart` exports all screens.

#### Issue: Context.push not working
- **Solution**: Verify `go_router` package is imported in profile_screen.dart.

### 7. Verification Code

The current implementation in profile_screen.dart:
```dart
InkWell(
  onTap: () {
    debugPrint('Balance card tapped!');
    debugPrint('Navigating to: ${RouteManager.walletBalance}');
    context.push(RouteManager.walletBalance);
  },
  borderRadius: BorderRadius.circular(39.5),
  child: Ink(
    // ... card content
  ),
)
```

### 8. Expected Behavior

1. User taps "Current Balance" card
2. Console shows: "Balance card tapped!"
3. Console shows: "Navigating to: /wallet/balance"
4. Screen transitions to Balance Detail Screen
5. User sees wallet balance, bank selection, and withdraw options

### 9. If Still Not Working

Try this direct approach in profile_screen.dart:
```dart
InkWell(
  onTap: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BalanceDetailScreen(),
      ),
    );
  },
  // ... rest of code
)
```

But you'll need to import:
```dart
import 'package:fajimobileapp/features/wallet/wallet.dart';
```

This bypasses GoRouter to test if the screen itself works.
