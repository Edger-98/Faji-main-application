# Implementation Plan - January 6, 2026

## Requirements to Implement

### 1. Event Creation Dialog → Bottom Sheet ✓
- Convert event creation dialog to bottom sheet
- Improve navigation handling

### 2. Payment Integration with Stripe
- Implement Flutter Stripe package properly
- Handle payment flow for ticket purchases
- Handle withdrawal logic for vendors

### 3. Geolocation for Search
- Add geolocation to event search
- Add geolocation to vendor search
- Use user's location for nearby results

### 4. Vendor Profile Sharing ✓
- Already implemented in vendor_profile_screen.dart
- Share button with profile link functionality

### 5. Support Screen Updates
- Keep only Email and FAQs
- Create FAQs screen with app details
- Remove other support options

### 6. Rate App Feature Fix
- Fix in_app_review implementation
- Ensure it works properly on both platforms

### 7. Remove Wallet from Profile
- Wallet has its own navigation tab
- Remove wallet link from profile screen

### 8. Settings Debug Data Cleanup
- Remove debug data from settings
- Keep only necessary settings

### 9. CRUD Operations Fixes
- Event operations (create, update, delete, bookmark)
- Vendor listing operations
- Ensure all operations work properly

### 10. Session Management Fix
- Fix logout after inactivity
- Ensure proper navigation after logout
- Don't stay in app after session expires

## Implementation Order

1. ✅ Vendor profile sharing (already done)
2. Support screen with FAQs
3. Remove wallet from profile
4. Clean up settings
5. Fix rate app feature
6. Add geolocation to search
7. Stripe payment integration
8. Session management fix
9. CRUD operations verification
10. Event creation bottom sheet

## Files to Modify

- lib/features/support/presentation/screens/support_screen.dart
- lib/features/support/presentation/screens/faqs_screen.dart (new)
- lib/features/profile/presentation/screens/profile_screen.dart
- lib/features/profile/presentation/screens/account_settings_screen.dart
- lib/features/events/presentation/screens/search_screen.dart
- lib/features/cohost_marketplace/presentation/screens/marketplace_screen.dart
- lib/features/tickets/presentation/widgets/buy_ticket_bottom_sheet.dart
- lib/features/auth/presentation/viewmodels/auth_state_viewmodel.dart
- pubspec.yaml (add geolocator if needed)
