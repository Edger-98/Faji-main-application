# Phase 1: Critical Fixes - Status Report

## Completed ✅

### 1. Authentication Bug Fix ✅
**Problem**: Token not available after registration, requiring app restart and manual login.

**Solution Implemented**:
- Added `AuthTokenService.initialize()` call after registration completion
- Token now syncs from secure storage to API service headers immediately
- Users can access authenticated features right after registration

**Files Modified**:
- `lib/features/auth/presentation/screens/password_screen.dart`
- `lib/features/auth/data/repositories/auth_repository_impl.dart`

**Testing Required**:
- [ ] Create new account
- [ ] Verify home page loads without errors
- [ ] Verify user events fetch successfully
- [ ] Confirm no logout/login needed

---

### 2. Cloudinary Integration Setup ✅
**Completed**:
- Added dependencies: `image_picker: ^1.0.7`, `cloudinary_public: ^0.21.0`
- Created `lib/core/config/cloudinary_config.dart` with configuration
- Created `lib/core/services/cloudinary_service.dart` with full upload functionality
- Added environment variables to `.env`

**Features Available**:
- Pick image from gallery
- Pick image from camera
- Upload to Cloudinary with folder organization
- Image optimization and transformations
- File size validation (10MB limit)

**Configuration Needed**:
User must set in `.env`:
```
CLOUDINARY_CLOUD_NAME=your_cloud_name_here
CLOUDINARY_UPLOAD_PRESET=your_upload_preset_here
```

---

## In Progress 🚧

### 3. Event Image Upload (Replace Poster/Theme)

#### Current State:
- Event creation has 5 steps (0-4)
- Step 3: Poster selection
- Step 4: Theme selection
- Both need to be replaced with single image upload

#### Plan:
**Option A: Add Image Upload to Step 1 (Event Details)**
- Add image picker button to `create_event_details_screen.dart`
- Upload image to Cloudinary when selected
- Store imageUrl in event creation entity
- Remove Steps 3 & 4 entirely
- Update flow to go: Step 0 → Step 1 → Step 2 → Create Event

**Option B: Replace Step 3 with Image Upload**
- Keep step structure
- Replace poster selection screen with image upload screen
- Remove Step 4 (theme)
- Update flow to go: Step 0 → Step 1 → Step 2 → Step 3 (Image) → Create Event

**Recommendation**: Option A (simpler, fewer steps, better UX)

---

## Next Steps

### Immediate (Today):
1. **Update Event Creation Entity**
   - Remove `selectedPosterId` and `selectedThemeId`
   - Add `imageUrl` field
   - Regenerate freezed files

2. **Update Event Creation Flow**
   - Add image upload to Step 1 (Event Details screen)
   - Remove poster selection screen
   - Remove theme selection screen
   - Update step navigation (0 → 1 → 2 → Create)

3. **Update Event Creation Repository**
   - Remove poster/theme from API payload
   - Add imageUrl to API payload
   - Update backend integration

4. **Update Event Display**
   - Update event cards to show imageUrl
   - Update event details to show imageUrl
   - Add fallback for missing images

### Testing (After Implementation):
- [ ] Create event with image upload
- [ ] Verify image uploads to Cloudinary
- [ ] Verify event displays image correctly
- [ ] Test without image (fallback)
- [ ] Test on Android emulator
- [ ] Test image size limits
- [ ] Test different image formats

---

## Files That Need Modification

### Event Creation:
- [ ] `lib/features/organize_event/domain/entities/event_creation_entity.dart`
- [ ] `lib/features/organize_event/presentation/viewmodels/event_creation_viewmodel.dart`
- [ ] `lib/features/organize_event/presentation/screens/create_event_details_screen.dart`
- [ ] `lib/features/organize_event/presentation/screens/event_poster_screen.dart` - DELETE
- [ ] `lib/features/organize_event/presentation/screens/event_theme_screen.dart` - DELETE
- [ ] `lib/features/organize_event/data/repositories/event_creation_repository.dart`

### Event Display:
- [ ] `lib/features/home/presentation/widgets/event_card.dart`
- [ ] `lib/features/organize_event/presentation/screens/event_details_tabbed_screen.dart`
- [ ] `lib/features/events/domain/entities/event_entity.dart`
- [ ] `lib/features/events/data/models/event_model.dart`

### Navigation:
- [ ] `lib/features/organize_event/presentation/screens/event_creation_flow_screen.dart`

---

## Backend API Changes Required

The backend needs to:
1. Accept `imageUrl` field in event creation
2. Remove `posterId` and `colorTheme` requirements
3. Update event response to include `imageUrl`
4. Make image optional (allow events without images)

**API Endpoint**: `POST /api/v1/events`

**New Payload Structure**:
```json
{
  "name": "Event Name",
  "description": "Event Description",
  "category": "Party",
  "emoji": "🎉",
  "startDate": "2025-12-20T18:00:00.000Z",
  "endDate": "2025-12-20T23:00:00.000Z",
  "imageUrl": "https://res.cloudinary.com/...",  // NEW
  "location": {
    "address": "123 Main St",
    "latitude": 0,
    "longitude": 0
  },
  "expectedGuests": 100,
  "budget": 5000,
  "settings": {
    "isPublic": false,
    "websiteLink": "my-event",
    "rsvpButtonText": "Celebrate With Us"
  }
}
```

---

## Estimated Time Remaining

- Update entity & models: 30 minutes
- Add image upload to UI: 1 hour
- Update repository & API calls: 30 minutes
- Update event display components: 1 hour
- Testing & bug fixes: 1 hour

**Total**: ~4 hours

---

## Questions for Product Owner

1. **Cloudinary Credentials**: Do you have Cloudinary account credentials, or should I create a test account?

2. **Image Requirements**:
   - Should image upload be required or optional?
   - What should be the fallback if no image is provided?
   - Any specific image dimensions/aspect ratio?

3. **Backend Status**: Is the backend ready to accept `imageUrl` instead of `posterId`/`colorTheme`?

4. **Priority**: Should I complete Phase 1 fully before moving to Phase 2, or start Phase 2 planning in parallel?

---

## Risk & Mitigation

**Risk**: Backend not ready for imageUrl field
**Mitigation**: Can temporarily send both (imageUrl + posterId/theme) for backward compatibility

**Risk**: Cloudinary upload failures
**Mitigation**: Implement retry logic and clear error messages

**Risk**: Large image files causing slow uploads
**Mitigation**: Compress images before upload (already implemented in CloudinaryService)

---

## Success Criteria

Phase 1 is complete when:
- ✅ Users can register and access home without relogging
- ✅ Users can upload event images during creation
- ✅ Event images display correctly in all views
- ✅ Old poster/theme system is completely removed
- ✅ All tests pass
- ✅ No regressions in existing functionality
