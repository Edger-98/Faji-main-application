# Profile to Wallet Integration

## Overview
The profile screen has been updated to navigate to the wallet balance detail screen when clicking on the "Current Balance" card.

## Changes Made

### 1. Profile Screen Update (`lib/features/profile/presentation/screens/profile_screen.dart`)
- Wrapped the balance card in a `GestureDetector`
- Added `onTap` handler that navigates to `RouteManager.walletBalance`
- Uses GoRouter's `context.push()` for navigation

### 2. Navigation Flow
```
Profile Screen
    ↓ (Click on Current Balance card)
Balance Detail Screen (/wallet/balance)
    ↓ (Click Review)
Enter Withdrawal Amount Screen
    ↓ (Enter amount & Click Review)
Review Withdrawal Screen
    ↓ (Click Withdraw)
Withdrawal Confirmation Screen
    ↓ (Click Done)
Return to Home
```

## User Experience
1. User opens Profile screen
2. User sees "Current Balance: $230.00" card with arrow indicator
3. User taps on the balance card
4. App navigates to the full wallet balance detail screen
5. User can view balance, select bank, and initiate withdrawals

## Technical Details
- **Route**: `RouteManager.walletBalance` → `/wallet/balance`
- **Navigation Method**: `context.push(RouteManager.walletBalance)`
- **UI Indicator**: Arrow icon on the right side of the balance card
- **Gesture**: Full card is tappable for better UX

## Design Consistency
- Balance card maintains the same visual design
- Arrow icon indicates the card is tappable
- Smooth transition animation via GoRouter
- Follows the app's navigation patterns

## Testing
To test the integration:
1. Navigate to Profile screen (bottom nav, 4th tab)
2. Tap on the "Current Balance" card
3. Verify navigation to wallet balance detail screen
4. Verify back button returns to profile screen
5. Test the full withdrawal flow from wallet screen
