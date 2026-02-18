# Vendor Status Check Setup

## Overview
Added vendor status checking on the profile page to conditionally show "Become a Vendor" or "Vendor Dashboard" based on whether the user already has a vendor account.

## Changes Made

### 1. New API Endpoint
Added to `lib/features/vendor/data/datasources/vendor_remote_datasource.dart`:
```dart
@GET('/vendor-registration/check-status')
Future<HttpResponse<dynamic>> checkVendorStatus();
```

### 2. New Entity
Created `lib/features/vendor/domain/entities/vendor_status.dart`:
- `isVendor`: Boolean indicating if user is a vendor
- `hasVendorAccount`: Boolean indicating if user has a vendor account
- `vendorId`: Optional vendor ID
- `verificationStatus`: Status (pending, under_review, verified, rejected)
- `isVerified`: Boolean for verification status
- `isActive`: Boolean for active status
- `name`: Business name
- `categories`: List of vendor categories
- `message`: Optional message

### 3. New Provider
Added to `lib/features/vendor/presentation/providers/vendor_providers.dart`:
```dart
final FutureProvider<VendorStatus?> vendorStatusProvider
```

This provider:
- Calls the `/vendor-registration/check-status` endpoint
- Returns `VendorStatus` if successful
- Returns `null` if user is not a vendor or on error

### 4. Updated Profile Screen
Modified `lib/features/profile/presentation/screens/profile_screen.dart`:
- Added vendor status check using `vendorStatusProvider`
- Conditionally renders:
  - **"Vendor Dashboard"** button if user has a vendor account
  - **"Become a Vendor"** button if user doesn't have a vendor account
  - Disabled button while loading
  - Fallback to "Become a Vendor" on error

## API Response Format

### Non-Vendor Response:
```json
{
  "success": true,
  "data": {
    "isVendor": false,
    "hasVendorAccount": false,
    "message": "User does not have a vendor account"
  }
}
```

### Vendor Response:
```json
{
  "success": true,
  "data": {
    "isVendor": true,
    "hasVendorAccount": true,
    "vendorId": "vendor_id_here",
    "verificationStatus": "verified",
    "isVerified": true,
    "isActive": true,
    "name": "Business Name",
    "categories": ["catering", "entertainment"]
  }
}
```

## Required Setup Steps

### 1. Regenerate Code
Run the following commands to generate the freezed and retrofit code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate:
- `vendor_status.freezed.dart`
- `vendor_status.g.dart`
- Updated `vendor_remote_datasource.g.dart`

### 2. Test the Flow

1. **Non-Vendor User:**
   - Open profile page
   - Should see "Become a Vendor" button
   - Clicking takes them to vendor registration

2. **Existing Vendor:**
   - Open profile page
   - Should see "Vendor Dashboard" button
   - Clicking takes them to vendor dashboard

3. **Loading State:**
   - While checking status, button is disabled
   - Shows "Become a Vendor" (non-clickable)

4. **Error State:**
   - If API fails, defaults to showing "Become a Vendor"
   - User can still attempt registration

## Benefits

1. **Prevents Duplicate Registration**: Users who are already vendors won't see the registration option
2. **Better UX**: Vendors get direct access to their dashboard
3. **Graceful Degradation**: Falls back to registration option on errors
4. **Loading States**: Provides feedback while checking status

## Notes

- The check happens automatically when the profile page loads
- Status is cached by Riverpod's FutureProvider
- To refresh status, user needs to navigate away and back to profile
- Consider adding a refresh button if real-time updates are needed
