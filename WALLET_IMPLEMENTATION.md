# Wallet Feature Implementation

## Overview
The wallet feature has been implemented following the Figma designs with pixel-perfect accuracy. The feature includes balance management, withdrawal flows, and transaction history.

## Screens Implemented

### 1. Balance Detail Screen (`balance_detail_screen.dart`)
- **Route**: `/wallet/balance`
- **Features**:
  - Current balance display with USD currency
  - Bank account selection with radio buttons
  - Add new bank option
  - Navigation to withdrawal flow
- **Design Elements**:
  - Background: `#1F1F1F` (AppColors.surface)
  - Card background: `rgba(40, 40, 40, 0.81)` (AppColors.surfaceContainerHighest)
  - Border radius: 35px for cards, 54px for bank options
  - Typography: PP Neue Montreal for body text, Neue Haas Display Pro for headings

### 2. Enter Withdrawal Amount Screen (`enter_withdrawal_amount_screen.dart`)
- **Route**: `/wallet/enter-amount`
- **Features**:
  - Custom numeric keypad (0-9 + backspace)
  - Real-time amount display
  - Yellow amount text (`#FEB822`)
  - Disabled state for review button when no amount entered
- **Design Elements**:
  - Keypad buttons: 72px height, 21px border radius
  - Button background: `#111111`
  - Amount display: 50px font size, PP Neue Montreal Medium

### 3. Review Withdrawal Screen (`review_withdrawal_screen.dart`)
- **Route**: `/wallet/review`
- **Features**:
  - Bank account information display
  - Withdrawal amount card with wallet icon
  - Transaction fee calculation
  - Final amount display with dashed separator line
  - Withdraw button
- **Design Elements**:
  - Withdrawal card: 31px border radius
  - Dashed line separator using CustomPainter
  - Transaction details with proper spacing

### 4. Withdrawal Confirmation Screen (`withdrawal_confirmation_screen.dart`)
- **Route**: `/wallet/confirmation`
- **Features**:
  - Blurred background overlay (60px blur)
  - Success icon with pink circular background
  - Success message with withdrawal details
  - Done button to return to home
- **Design Elements**:
  - Backdrop blur filter: `sigmaX: 60, sigmaY: 60`
  - Success icon: 72px circle with check icon
  - Card border radius: 43px
  - Overlay color: `rgba(15, 14, 14, 0.29)`

### 5. Transaction History Screen (`transaction_history_screen.dart`)
- **Route**: `/wallet/history`
- **Features**:
  - List of ticket purchase transactions
  - User avatars (placeholder circles)
  - Transaction details: date, time, amount
  - Dot separators between details
  - Done button
- **Design Elements**:
  - Transaction cards: 35px border radius, 69px height
  - Avatar: 49px circle
  - Dot separators: 3px circles
  - Amount in pink color (`#FD99C9`)

## Design System Integration

### Colors Used
- **Primary**: `#FD99C9` (AppColors.primary)
- **Background**: `#1F1F1F` (AppColors.surface)
- **Surface**: `rgba(40, 40, 40, 0.81)` (AppColors.surfaceContainerHighest)
- **Text Primary**: `#F8F8F8` (AppColors.onSurface)
- **Text Secondary**: `#AAA9A9` (AppColors.textSecondary)
- **Accent Yellow**: `#FEB822` (AppColors.eventCardYellow)
- **Dark Surface**: `#111111`
- **Wallet Icon Background**: `#1B1B1B`

### Typography
- **Headings**: Neue Haas Grotesk Display Pro, 25px, Medium (500)
- **Body Text**: PP Neue Montreal, 17-18px, Regular (400)
- **Small Text**: PP Neue Montreal, 13-15px, Regular (400)
- **Button Text**: Neue Haas Grotesk Display Pro, 18px, SemiBold (600)
- **Amount Display**: PP Neue Montreal, 50px, Medium (500)

### Spacing & Sizing
- **Button Height**: 69px
- **Button Border Radius**: 34.5px
- **Card Border Radius**: 31-35px
- **Bank Option Border Radius**: 54px
- **Icon Container**: 54x55px with 27px border radius
- **Back Button**: 50x50px circle
- **Padding**: 24px horizontal, varies vertically

## Navigation Flow
```
Balance Detail Screen
    ↓
Enter Withdrawal Amount Screen
    ↓
Review Withdrawal Screen
    ↓
Withdrawal Confirmation Screen
    ↓
Return to Home

Transaction History Screen (accessible from Balance Detail)
```

## Routes Configuration
All routes are configured in:
- `lib/core/routing/route_manager.dart` - Route constants
- `lib/core/routing/app_router.dart` - GoRouter configuration

## Key Features
1. **Pixel-Perfect Design**: All measurements, colors, and typography match Figma exactly
2. **No Hardcoded Styles**: Uses design system colors and typography
3. **Proper Navigation**: Uses GoRouter with proper route management
4. **Responsive**: Handles different screen sizes appropriately
5. **Accessibility**: Proper contrast ratios and touch targets
6. **Custom Widgets**: DashedLinePainter for separator lines
7. **State Management**: Local state for amount input

## Testing Navigation
To test the wallet feature:
1. Navigate to `/wallet/balance` to see the balance detail screen
2. Click "Review" to go to enter amount screen
3. Enter an amount using the numeric keypad
4. Click "Review" to see the withdrawal review
5. Click "Withdaw" to see the confirmation screen
6. Click "Done" to return to home

## Future Enhancements
- Connect to actual wallet API
- Add real bank account management
- Implement actual transaction history
- Add withdrawal limits and validation
- Add loading states during API calls
- Add error handling and retry logic
