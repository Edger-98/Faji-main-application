# Phase 1 Implementation - Critical Fixes

## Status: IN PROGRESS

---

## 1. Authentication Bug Fix ✅ COMPLETED

### Problem
After account creation, the authentication token was not available on the home page. Users had to close the app and log in again to access authenticated features.

### Root Cause
The token was being saved to secure storage during registration, but was NOT being set in the API service's headers. This meant:
1. Token saved to `FlutterSecureStorage` ✅
2. Token NOT set in `Dio` headers ❌
3. Navigation to home screen happens
4. Home screen tries to fetch data → API calls fail (no auth header)

### Solution
Added `AuthTokenService.initialize()` call immediately after successful registration to sync the token from storage to the API service.

**Files Modified:**
- `lib/features/auth/presentation/screens/password_screen.dart`
  - Added `await ref.read(authTokenServiceProvider).initialize()` after registration completes
  - This loads the token from secure storage and sets it in the API service headers

**Flow After Fix:**
1. User completes registration → Token saved to storage
2. `AuthTokenService.initialize()` called → Token loaded and set in API headers
3. Auth state updated with user data
4. Navigate to home → All API calls now have auth token ✅

### Testing Checklist
- [ ] Create new account
- [ ] Verify home page loads without errors
- [ ] Verify user events are fetched successfully
- [ ] Verify no need to logout/login again

---

## 2. Event Image Upload (Replace Poster/Theme) 🚧 IN PROGRESS

### Requirements
- Remove poster and theme selection from event creation
- Replace with single image upload
- Upload images to Cloudinary
- Display uploaded image in event listings and details

### Implementation Plan

#### A. Cloudinary Setup
1. Add Cloudinary credentials to `.env` files
2. Create Cloudinary service for image uploads
3. Add image picker dependency

#### B. Update Event Creation Flow
1. Remove Step 4 (Theme Selection Screen)
2. Update Step 3 (Event Details) to include image upload
3. Remove theme/poster from event creation model
4. Update API calls to send image URL instead of poster/theme

#### C. Update Event Display
1. Update event cards to show uploaded image
2. Update event details screen to show uploaded image
3. Add fallback for events without images
4. Update all event list views

#### D. Backend Integration
1. Update event creation API to accept `imageUrl` field
2. Remove `posterId` and `colorTheme` fields
3. Update event response model

### Files to Modify
- [ ] `lib/features/organize_event/presentation/screens/event_theme_screen.dart` - REMOVE
- [ ] `lib/features/organize_event/presentation/screens/event_details_screen.dart` - Add image upload
- [ ] `lib/features/organize_event/data/models/event_creation_model.dart` - Update fields
- [ ] `lib/features/organize_event/domain/entities/event_entity.dart` - Update fields
- [ ] `lib/features/home/presentation/widgets/event_card.dart` - Display uploaded image
- [ ] `lib/features/organize_event/presentation/screens/event_details_tabbed_screen.dart` - Display uploaded image

### New Files to Create
- [ ] `lib/core/services/cloudinary_service.dart` - Image upload service
- [ ] `lib/core/config/cloudinary_config.dart` - Cloudinary configuration

---

## 3. Navigation & State Management ✅ MOSTLY COMPLETE

### Current Status
- Event lists refresh after creation ✅
- Event lists refresh after deletion ✅
- Navigation after event creation works ✅

### Remaining Tasks
- [ ] Verify all edge cases after image upload implementation
- [ ] Test navigation flow with new image upload

---

## Next Steps

1. **Immediate**: Set up Cloudinary integration
2. **Then**: Update event creation flow to use image upload
3. **Then**: Update all event display components
4. **Finally**: Test complete flow end-to-end

---

## Environment Variables Needed

Add to `.env`, `.env.dev`, `.env.staging`, `.env.production`:

```properties
# Cloudinary Configuration
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret
CLOUDINARY_UPLOAD_PRESET=your_upload_preset
```

---

## Dependencies to Add

```yaml
# pubspec.yaml
dependencies:
  image_picker: ^1.0.7  # For selecting images
  cloudinary_public: ^0.21.0  # For Cloudinary uploads
  cached_network_image: ^3.3.1  # For efficient image loading (if not already added)
```

---

## Timeline

- **Auth Fix**: ✅ Completed
- **Cloudinary Setup**: 30 minutes
- **Event Creation Update**: 1-2 hours
- **Event Display Update**: 1-2 hours
- **Testing**: 1 hour

**Total Estimated Time**: 4-6 hours
