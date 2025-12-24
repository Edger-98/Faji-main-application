# Backend Requirements - Phase 1: Event Image Upload

## Overview
The mobile app now uses Cloudinary for image uploads instead of the poster/theme system. The backend needs to be updated to accept `imageUrl` instead of `posterId` and `colorTheme`.

---

## API Changes Required

### 1. Event Creation Endpoint

**Endpoint**: `POST /api/v1/events`

#### OLD Request Body (Remove):
```json
{
  "name": "My Event",
  "description": "Event description",
  "category": "Party",
  "emoji": "🎉",
  "startDate": "2025-12-20T18:00:00.000Z",
  "endDate": "2025-12-20T23:00:00.000Z",
  "posterId": "poster_show_up_turn_up",  // ❌ REMOVE
  "colorTheme": "theme_blue",             // ❌ REMOVE
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

#### NEW Request Body (Add):
```json
{
  "name": "My Event",
  "description": "Event description",
  "category": "Party",
  "emoji": "🎉",
  "startDate": "2025-12-20T18:00:00.000Z",
  "endDate": "2025-12-20T23:00:00.000Z",
  "imageUrl": "https://res.cloudinary.com/your-cloud/image/upload/v123/faji/events/event_abc123.jpg",  // ✅ NEW (OPTIONAL)
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

#### Field Changes:
- **REMOVE**: `posterId` (string)
- **REMOVE**: `colorTheme` (string)
- **ADD**: `imageUrl` (string, optional) - Full Cloudinary URL

#### Validation Rules:
- `imageUrl` is **OPTIONAL** (events can be created without images)
- If provided, `imageUrl` should be a valid URL
- Recommended: Validate that URL is from Cloudinary domain
- Max length: 500 characters

---

### 2. Event Response (GET /api/v1/events/:id)

#### OLD Response:
```json
{
  "success": true,
  "data": {
    "id": "6935b31a82f7611a5707e7f3",
    "name": "My Event",
    "description": "Event description",
    "category": "Party",
    "emoji": "🎉",
    "startDate": "2025-12-20T18:00:00.000Z",
    "endDate": "2025-12-20T23:00:00.000Z",
    "host": {
      "id": "692d9aab95951571e197a8ae",
      "name": "John Doe",
      "email": "john@example.com",
      "avatar": "https://..."
    },
    "location": {
      "address": "123 Main St",
      "latitude": 0,
      "longitude": 0
    },
    "media": {
      "posterId": "poster_show_up_turn_up",  // ❌ REMOVE
      "poster": "https://...",                // ❌ REMOVE (or keep for backward compatibility)
      "preEventMedia": []
    },
    "colorTheme": "theme_blue",  // ❌ REMOVE
    "theme": {                   // ❌ REMOVE
      "id": "theme_blue",
      "name": "Blue Theme",
      "colors": ["#1E3A8A", "#3B82F6"]
    },
    "expectedGuests": 100,
    "budget": {
      "total": 5000,
      "spent": 0,
      "remaining": 5000,
      "currency": "NGN"
    },
    "settings": {
      "isPublic": false,
      "websiteLink": "my-event",
      "rsvpButtonText": "Celebrate With Us"
    },
    "status": "upcoming",
    "createdAt": "2025-12-07T17:02:18.177Z",
    "updatedAt": "2025-12-07T17:02:18.177Z"
  }
}
```

#### NEW Response:
```json
{
  "success": true,
  "data": {
    "id": "6935b31a82f7611a5707e7f3",
    "name": "My Event",
    "description": "Event description",
    "category": "Party",
    "emoji": "🎉",
    "startDate": "2025-12-20T18:00:00.000Z",
    "endDate": "2025-12-20T23:00:00.000Z",
    "imageUrl": "https://res.cloudinary.com/your-cloud/image/upload/v123/faji/events/event_abc123.jpg",  // ✅ NEW
    "host": {
      "id": "692d9aab95951571e197a8ae",
      "name": "John Doe",
      "email": "john@example.com",
      "avatar": "https://..."
    },
    "location": {
      "address": "123 Main St",
      "latitude": 0,
      "longitude": 0
    },
    "media": {
      "preEventMedia": []  // Keep for other media
    },
    "expectedGuests": 100,
    "budget": {
      "total": 5000,
      "spent": 0,
      "remaining": 5000,
      "currency": "NGN"
    },
    "settings": {
      "isPublic": false,
      "websiteLink": "my-event",
      "rsvpButtonText": "Celebrate With Us"
    },
    "status": "upcoming",
    "createdAt": "2025-12-07T17:02:18.177Z",
    "updatedAt": "2025-12-07T17:02:18.177Z"
  }
}
```

---

## Database Schema Changes

### Event Model/Schema

#### REMOVE Fields:
```javascript
posterId: String,      // Remove
colorTheme: String,    // Remove
theme: Object,         // Remove
media.posterId: String,// Remove
media.poster: String,  // Remove (or keep for backward compatibility)
```

#### ADD Fields:
```javascript
imageUrl: {
  type: String,
  required: false,  // Optional
  default: null,
  maxlength: 500,
  validate: {
    validator: function(v) {
      // Optional: Validate Cloudinary URL format
      return !v || v.startsWith('https://res.cloudinary.com/');
    },
    message: 'Invalid image URL format'
  }
}
```

---

## Migration Strategy

### Option 1: Clean Break (Recommended for Development)
1. Remove `posterId`, `colorTheme`, `theme` fields completely
2. Add `imageUrl` field
3. Update all existing events to have `imageUrl: null`
4. Mobile app handles null images with fallback

### Option 2: Backward Compatibility (If needed)
1. Keep old fields but mark as deprecated
2. Add new `imageUrl` field
3. Accept both old and new formats in API
4. Gradually migrate existing events
5. Remove old fields in future version

**Recommendation**: Use Option 1 since this is early development

---

## API Endpoints to Update

### Required Updates:
1. ✅ `POST /api/v1/events` - Create event (accept imageUrl)
2. ✅ `GET /api/v1/events/:id` - Get event details (return imageUrl)
3. ✅ `GET /api/v1/events/my-events` - Get user events (return imageUrl)
4. ✅ `PATCH /api/v1/events/:id` - Update event (accept imageUrl)
5. ✅ `GET /api/v1/events` - List events (return imageUrl)
6. ✅ `GET /api/v1/events/trending` - Trending events (return imageUrl)
7. ✅ `GET /api/v1/events/upcoming` - Upcoming events (return imageUrl)

### Can Be Removed:
- ❌ `GET /api/v1/event-themes` - No longer needed
- ❌ `GET /api/v1/event-posters` - No longer needed

---

## Testing Checklist

### Backend Tests:
- [ ] Create event with imageUrl
- [ ] Create event without imageUrl (should work)
- [ ] Get event returns imageUrl correctly
- [ ] Update event imageUrl
- [ ] List events returns imageUrl for all events
- [ ] Old events without imageUrl return null (not error)
- [ ] Invalid imageUrl format is rejected (if validation added)

### Integration Tests:
- [ ] Mobile app can create event with image
- [ ] Mobile app can create event without image
- [ ] Event displays correctly with image
- [ ] Event displays fallback without image
- [ ] Event lists show images correctly

---

## Example Cloudinary URLs

The mobile app will upload images to Cloudinary and send URLs in this format:

```
https://res.cloudinary.com/{cloud_name}/image/upload/v{version}/faji/events/event_{eventId}.jpg
```

Example:
```
https://res.cloudinary.com/faji-app/image/upload/v1733587200/faji/events/event_6935b31a82f7611a5707e7f3.jpg
```

With transformations (mobile app handles this):
```
https://res.cloudinary.com/faji-app/image/upload/c_fill,w_600,h_400,q_auto/v1733587200/faji/events/event_6935b31a82f7611a5707e7f3.jpg
```

---

## Fallback Strategy

### When imageUrl is null or empty:
1. **Option A**: Return a default placeholder URL
2. **Option B**: Return null and let mobile app handle fallback
3. **Option C**: Generate a gradient based on event category

**Recommendation**: Option B (mobile app already has fallback logic)

---

## Security Considerations

1. **URL Validation**: Optionally validate that imageUrl is from your Cloudinary account
2. **No File Upload**: Backend should NOT handle file uploads (Cloudinary handles this)
3. **URL Length**: Limit imageUrl to reasonable length (500 chars)
4. **XSS Prevention**: Sanitize imageUrl if displaying in web views

---

## Timeline

- **Backend Changes**: 2-3 hours
- **Database Migration**: 30 minutes
- **Testing**: 1 hour
- **Deployment**: 30 minutes

**Total**: ~4-5 hours

---

## Questions?

Contact mobile team if:
- Need clarification on imageUrl format
- Want to see example Cloudinary URLs
- Need help with migration strategy
- Have concerns about backward compatibility

---

## Status

- [ ] Backend changes implemented
- [ ] Database migrated
- [ ] API tested
- [ ] Mobile app tested with new backend
- [ ] Deployed to staging
- [ ] Deployed to production
