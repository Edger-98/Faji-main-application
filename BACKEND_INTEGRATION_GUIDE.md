# Backend Integration Guide - Event Image Upload Feature

## 📋 Overview

The mobile app has been updated to use Cloudinary for image uploads instead of the poster/theme system. This document provides complete specifications for backend integration.

---

## 🎯 What Changed

### OLD System (Remove):
- Events had `posterId` (string) - reference to predefined posters
- Events had `colorTheme` (string) - reference to color themes
- Backend served `/api/v1/event-posters` endpoint
- Backend served `/api/v1/event-themes` endpoint

### NEW System (Implement):
- Events have `imageUrl` (string, optional) - direct Cloudinary URL
- Mobile app uploads images to Cloudinary
- Mobile app sends imageUrl in event creation
- Backend stores and returns imageUrl

---

## 🔧 API Changes Required

### 1. Event Creation Endpoint

**Endpoint**: `POST /api/v1/events`

#### Request Body Changes:

**REMOVE These Fields**:
```json
{
  "posterId": "poster_show_up_turn_up",  // ❌ REMOVE
  "colorTheme": "theme_blue"              // ❌ REMOVE
}
```

**ADD This Field**:
```json
{
  "imageUrl": "https://res.cloudinary.com/your-cloud/image/upload/v123/faji/events/event_abc.jpg"  // ✅ ADD (OPTIONAL)
}
```

#### Complete NEW Request Example:
```json
{
  "name": "Birthday Bash 2025",
  "description": "Join us for an amazing celebration!",
  "category": "Birthday",
  "emoji": "🎂",
  "startDate": "2025-12-20T18:00:00.000Z",
  "endDate": "2025-12-20T23:00:00.000Z",
  "imageUrl": "https://res.cloudinary.com/faji-app/image/upload/v1733587200/faji/events/event_6935b31a82f7611a5707e7f3.jpg",
  "location": {
    "address": "123 Party Street, Lagos",
    "latitude": 6.5244,
    "longitude": 3.3792
  },
  "expectedGuests": 100,
  "budget": 500000,
  "settings": {
    "isPublic": false,
    "websiteLink": "birthday-bash-2025",
    "rsvpButtonText": "Celebrate With Us",
    "keepMemoriesPrivate": false,
    "disableGuestMemories": false,
    "acceptGuestContributions": true,
    "disablePublicRSVP": false,
    "enableWebhook": false
  }
}
```

#### Field Specifications:

| Field | Type | Required | Description | Validation |
|-------|------|----------|-------------|------------|
| `imageUrl` | String | **NO** | Full Cloudinary URL | Max 500 chars, Valid URL format |

**Validation Rules**:
```javascript
imageUrl: {
  type: String,
  required: false,
  default: null,
  maxlength: 500,
  validate: {
    validator: function(v) {
      // Optional: Validate Cloudinary URL format
      if (!v) return true; // Allow null/empty
      return v.startsWith('https://res.cloudinary.com/');
    },
    message: 'Invalid Cloudinary URL format'
  }
}
```

---

### 2. Event Response Changes

**Endpoint**: `GET /api/v1/events/:id`

#### Response Body Changes:

**REMOVE These Fields**:
```json
{
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
  }
}
```

**ADD This Field**:
```json
{
  "imageUrl": "https://res.cloudinary.com/your-cloud/image/upload/v123/faji/events/event_abc.jpg"  // ✅ ADD
}
```

#### Complete NEW Response Example:
```json
{
  "success": true,
  "data": {
    "id": "6935b31a82f7611a5707e7f3",
    "name": "Birthday Bash 2025",
    "description": "Join us for an amazing celebration!",
    "category": "Birthday",
    "emoji": "🎂",
    "startDate": "2025-12-20T18:00:00.000Z",
    "endDate": "2025-12-20T23:00:00.000Z",
    "imageUrl": "https://res.cloudinary.com/faji-app/image/upload/v1733587200/faji/events/event_6935b31a82f7611a5707e7f3.jpg",
    "host": {
      "id": "692d9aab95951571e197a8ae",
      "name": "John Doe",
      "email": "john@example.com",
      "avatar": "https://..."
    },
    "location": {
      "address": "123 Party Street, Lagos",
      "latitude": 6.5244,
      "longitude": 3.3792
    },
    "media": {
      "preEventMedia": []  // Keep for other media
    },
    "expectedGuests": 100,
    "budget": {
      "total": 500000,
      "spent": 0,
      "remaining": 500000,
      "currency": "NGN",
      "currencySymbol": "₦"
    },
    "settings": {
      "isPublic": false,
      "websiteLink": "birthday-bash-2025",
      "rsvpButtonText": "Celebrate With Us"
    },
    "stats": {
      "expectedGuests": 100,
      "confirmedGuests": 0,
      "invitedGuests": 0
    },
    "status": "upcoming",
    "createdAt": "2025-12-07T17:02:18.177Z",
    "updatedAt": "2025-12-07T17:02:18.177Z"
  }
}
```

---

### 3. All Event Endpoints to Update

Update these endpoints to include `imageUrl` in responses:

| Endpoint | Method | Changes |
|----------|--------|---------|
| `POST /api/v1/events` | POST | Accept `imageUrl` in request |
| `GET /api/v1/events/:id` | GET | Return `imageUrl` in response |
| `GET /api/v1/events/my-events` | GET | Return `imageUrl` for all events |
| `PATCH /api/v1/events/:id` | PATCH | Accept `imageUrl` in update |
| `GET /api/v1/events` | GET | Return `imageUrl` in list |
| `GET /api/v1/events/trending` | GET | Return `imageUrl` in list |
| `GET /api/v1/events/upcoming` | GET | Return `imageUrl` in list |

---

### 4. Endpoints to Remove (Optional)

These endpoints are no longer needed:

| Endpoint | Method | Status |
|----------|--------|--------|
| `GET /api/v1/event-themes` | GET | ❌ Can be removed |
| `GET /api/v1/event-posters` | GET | ❌ Can be removed |

**Note**: Keep them if other parts of the system still use them.

---

## 🗄️ Database Schema Changes

### Event Model/Schema Updates

#### MongoDB Example:

**REMOVE Fields**:
```javascript
{
  posterId: String,      // ❌ Remove
  colorTheme: String,    // ❌ Remove
  theme: Object,         // ❌ Remove
  media: {
    posterId: String,    // ❌ Remove
    poster: String,      // ❌ Remove (or keep for backward compatibility)
    preEventMedia: []
  }
}
```

**ADD Field**:
```javascript
{
  imageUrl: {
    type: String,
    required: false,
    default: null,
    maxlength: 500,
    validate: {
      validator: function(v) {
        if (!v) return true;
        return v.startsWith('https://res.cloudinary.com/');
      },
      message: 'Invalid Cloudinary URL format'
    }
  }
}
```

#### PostgreSQL Example:

```sql
-- Remove columns (if using SQL)
ALTER TABLE events DROP COLUMN poster_id;
ALTER TABLE events DROP COLUMN color_theme;

-- Add column
ALTER TABLE events ADD COLUMN image_url VARCHAR(500);
```

---

## 🔄 Migration Strategy

### Option 1: Clean Break (Recommended for Development)

```javascript
// 1. Add imageUrl field to schema
// 2. Remove posterId and colorTheme fields
// 3. Update all existing events to have imageUrl: null
db.events.updateMany({}, { 
  $set: { imageUrl: null },
  $unset: { posterId: "", colorTheme: "", theme: "" }
});
```

### Option 2: Backward Compatibility (Production)

```javascript
// Keep old fields but mark as deprecated
{
  imageUrl: String,           // NEW field
  posterId: String,           // DEPRECATED - keep for old clients
  colorTheme: String,         // DEPRECATED - keep for old clients
  
  // In API responses, prioritize imageUrl
  get displayImage() {
    return this.imageUrl || this.media?.poster || null;
  }
}
```

**Recommendation**: Use Option 1 since this is early development.

---

## 📝 Implementation Checklist

### Backend Tasks:

#### 1. Database Changes:
- [ ] Add `imageUrl` field to Event schema
- [ ] Remove `posterId` field (or mark deprecated)
- [ ] Remove `colorTheme` field (or mark deprecated)
- [ ] Remove `theme` object (or mark deprecated)
- [ ] Run migration script
- [ ] Verify schema changes

#### 2. API Updates:
- [ ] Update `POST /api/v1/events` to accept `imageUrl`
- [ ] Update `GET /api/v1/events/:id` to return `imageUrl`
- [ ] Update `GET /api/v1/events/my-events` to return `imageUrl`
- [ ] Update `PATCH /api/v1/events/:id` to accept `imageUrl`
- [ ] Update all event list endpoints to return `imageUrl`
- [ ] Remove validation for `posterId` (if required)
- [ ] Remove validation for `colorTheme` (if required)

#### 3. Response Formatting:
- [ ] Remove `posterId` from responses
- [ ] Remove `colorTheme` from responses
- [ ] Remove `theme` object from responses
- [ ] Add `imageUrl` to all event responses
- [ ] Handle null/empty `imageUrl` gracefully

#### 4. Testing:
- [ ] Test event creation with `imageUrl`
- [ ] Test event creation without `imageUrl`
- [ ] Test event retrieval returns `imageUrl`
- [ ] Test event update with `imageUrl`
- [ ] Test all list endpoints return `imageUrl`
- [ ] Test with invalid `imageUrl` format
- [ ] Test with very long `imageUrl`

---

## 🧪 Testing Examples

### Test Case 1: Create Event with Image

**Request**:
```bash
POST /api/v1/events
Content-Type: application/json
Authorization: Bearer <token>

{
  "name": "Test Event",
  "category": "Party",
  "startDate": "2025-12-20T18:00:00.000Z",
  "endDate": "2025-12-20T23:00:00.000Z",
  "imageUrl": "https://res.cloudinary.com/test/image/upload/v123/test.jpg",
  "expectedGuests": 50
}
```

**Expected Response**:
```json
{
  "success": true,
  "data": {
    "id": "...",
    "name": "Test Event",
    "imageUrl": "https://res.cloudinary.com/test/image/upload/v123/test.jpg",
    ...
  }
}
```

### Test Case 2: Create Event without Image

**Request**:
```bash
POST /api/v1/events
Content-Type: application/json
Authorization: Bearer <token>

{
  "name": "Test Event",
  "category": "Party",
  "startDate": "2025-12-20T18:00:00.000Z",
  "endDate": "2025-12-20T23:00:00.000Z",
  "expectedGuests": 50
}
```

**Expected Response**:
```json
{
  "success": true,
  "data": {
    "id": "...",
    "name": "Test Event",
    "imageUrl": null,  // or omit field
    ...
  }
}
```

### Test Case 3: Get Event

**Request**:
```bash
GET /api/v1/events/6935b31a82f7611a5707e7f3
Authorization: Bearer <token>
```

**Expected Response**:
```json
{
  "success": true,
  "data": {
    "id": "6935b31a82f7611a5707e7f3",
    "name": "Test Event",
    "imageUrl": "https://res.cloudinary.com/test/image/upload/v123/test.jpg",
    // Should NOT have: posterId, colorTheme, theme
    ...
  }
}
```

---

## 🔍 Validation Rules

### imageUrl Field:

```javascript
// Validation function
function validateImageUrl(url) {
  // Allow null/empty
  if (!url || url.trim() === '') {
    return true;
  }
  
  // Check length
  if (url.length > 500) {
    return false;
  }
  
  // Check format (optional but recommended)
  if (!url.startsWith('https://res.cloudinary.com/')) {
    return false;
  }
  
  // Check valid URL
  try {
    new URL(url);
    return true;
  } catch {
    return false;
  }
}
```

### Error Responses:

```json
// Invalid imageUrl format
{
  "success": false,
  "error": {
    "code": "INVALID_IMAGE_URL",
    "message": "imageUrl must be a valid Cloudinary URL"
  }
}

// imageUrl too long
{
  "success": false,
  "error": {
    "code": "IMAGE_URL_TOO_LONG",
    "message": "imageUrl must be less than 500 characters"
  }
}
```

---

## 📊 Example Cloudinary URLs

The mobile app will send URLs in these formats:

### Standard Upload:
```
https://res.cloudinary.com/faji-app/image/upload/v1733587200/faji/events/event_6935b31a82f7611a5707e7f3.jpg
```

### With Transformations (mobile handles this):
```
https://res.cloudinary.com/faji-app/image/upload/c_fill,w_600,h_400,q_auto/v1733587200/faji/events/event_6935b31a82f7611a5707e7f3.jpg
```

**Note**: Backend should store the URL as-is, without modification.

---

## 🛡️ Security Considerations

### 1. URL Validation
- ✅ Validate URL format
- ✅ Check URL length (max 500 chars)
- ✅ Optionally verify Cloudinary domain
- ❌ Do NOT download/verify image exists (performance)

### 2. XSS Prevention
- ✅ Sanitize imageUrl if displaying in web views
- ✅ Escape special characters in responses
- ✅ Use Content Security Policy headers

### 3. No File Upload
- ❌ Backend should NOT handle file uploads
- ✅ Cloudinary handles all uploads
- ✅ Backend only stores URLs

---

## 🚀 Deployment Steps

### 1. Pre-Deployment:
- [ ] Review all code changes
- [ ] Run unit tests
- [ ] Run integration tests
- [ ] Test with mobile app (staging)
- [ ] Review database migration script

### 2. Deployment:
- [ ] Backup database
- [ ] Run migration script
- [ ] Deploy backend changes
- [ ] Verify API endpoints
- [ ] Test with mobile app (production)

### 3. Post-Deployment:
- [ ] Monitor error logs
- [ ] Check API response times
- [ ] Verify event creation works
- [ ] Verify event display works
- [ ] Monitor Cloudinary usage

---

## 📞 Support & Questions

### Mobile Team Contact:
- For questions about imageUrl format
- For example Cloudinary URLs
- For testing coordination
- For integration issues

### Common Questions:

**Q: What if imageUrl is null?**
A: That's fine! Events can be created without images. Mobile app shows fallback.

**Q: Should we validate the image exists?**
A: No, that would slow down API. Mobile app handles broken images.

**Q: Can we keep old posterId for backward compatibility?**
A: Yes, but not recommended. Better to have clean break.

**Q: What about existing events?**
A: Set imageUrl to null. Mobile app will show fallback.

---

## ✅ Acceptance Criteria

Backend integration is complete when:

- [ ] `POST /api/v1/events` accepts `imageUrl` field
- [ ] `GET /api/v1/events/:id` returns `imageUrl` field
- [ ] `GET /api/v1/events/my-events` returns `imageUrl` for all events
- [ ] `PATCH /api/v1/events/:id` accepts `imageUrl` updates
- [ ] All event list endpoints return `imageUrl`
- [ ] `posterId` and `colorTheme` removed from responses
- [ ] Events can be created without `imageUrl`
- [ ] Invalid `imageUrl` is rejected with clear error
- [ ] Mobile app can create events with images
- [ ] Mobile app can display events with images
- [ ] All tests passing
- [ ] Documentation updated

---

## 📈 Timeline Estimate

| Task | Time | Owner |
|------|------|-------|
| Database schema changes | 30 min | Backend |
| API endpoint updates | 1-2 hours | Backend |
| Testing | 1 hour | Backend |
| Mobile app testing | 1 hour | Mobile |
| Bug fixes | 1 hour | Both |
| **Total** | **4-5 hours** | |

---

## 🎯 Success Metrics

After integration:
- ✅ Events created with images display correctly
- ✅ Events without images show fallback
- ✅ No errors in logs
- ✅ API response times unchanged
- ✅ Mobile app works smoothly
- ✅ Users can upload and see images

---

**Status**: Ready for Backend Implementation

**Priority**: High

**Complexity**: Low-Medium

**Risk**: Low (backward compatible if needed)

---

For questions or clarification, contact the mobile development team.


---

# PHASE 2: MARKETPLACE (VENDOR/CO-HOST SYSTEM)

## 📋 Overview

The marketplace feature allows event hosts to discover, request, and hire vendors (co-hosts) who offer various services like venues, entertainment, catering, security, etc.

---

## 🎯 What's New in Phase 2

### Features Implemented:
1. **Resource Categories** - 8 categories (Venue, Entertainment, Promotion, Security, Catering, Media, Equipment, Staffing)
2. **Vendor Discovery** - Browse vendors by category
3. **Vendor Profiles** - Detailed profiles with ratings, reviews, portfolio
4. **Booking System** - Send booking requests to vendors
5. **Negotiation** - Two payment options (upfront or revenue split)
6. **Request Management** - Track booking status

---

## 🔧 API Endpoints Required

### 1. Get Resources by Category

**Endpoint**: `GET /api/v1/marketplace/resources`

**Query Parameters**:
```
category: string (required) - venue, entertainment, promotion, security, catering, media, equipment, staffing
page: number (optional) - default: 1
limit: number (optional) - default: 20
```

**Response Example**:
```json
{
  "success": true,
  "data": [
    {
      "id": "resource_123",
      "vendorId": "vendor_456",
      "vendorName": "DJ Spinmaster",
      "category": "entertainment",
      "title": "Professional DJ Services",
      "description": "Experienced DJ with 10+ years...",
      "photos": [
        "https://res.cloudinary.com/..."
      ],
      "basePrice": 150000,
      "isAvailable": true,
      "rating": 4.8,
      "reviewCount": 89,
      "eventsCompleted": 120,
      "isVerified": true,
      "createdAt": "2025-12-01T10:00:00.000Z"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 45,
    "pages": 3
  }
}
```

---

### 2. Get Vendor Profile

**Endpoint**: `GET /api/v1/marketplace/vendors/{vendorId}`

**Response Example**:
```json
{
  "success": true,
  "data": {
    "id": "vendor_456",
    "name": "DJ Spinmaster",
    "bio": "Professional DJ specializing in...",
    "profilePhoto": "https://res.cloudinary.com/...",
    "categories": ["entertainment"],
    "rating": 4.8,
    "reviewCount": 89,
    "eventsCompleted": 120,
    "isVerified": true,
    "responseTime": "< 2 hours",
    "location": "Lagos, Nigeria",
    "portfolio": [
      "https://res.cloudinary.com/...",
      "https://res.cloudinary.com/..."
    ],
    "resources": [
      {
        "id": "resource_123",
        "title": "Professional DJ Services",
        "basePrice": 150000,
        "isAvailable": true
      }
    ],
    "reviews": [
      {
        "id": "review_789",
        "userId": "user_101",
        "userName": "Sarah Johnson",
        "rating": 5.0,
        "comment": "Amazing service!",
        "eventDate": "2025-11-15T00:00:00.000Z",
        "createdAt": "2025-11-20T10:00:00.000Z"
      }
    ]
  }
}
```

---

### 3. Create Booking Request

**Endpoint**: `POST /api/v1/marketplace/bookings`

**Request Body**:
```json
{
  "eventId": "event_123",
  "vendorId": "vendor_456",
  "resourceId": "resource_789",
  "paymentOption": "upfrontPayment",
  "offeredPrice": 150000,
  "message": "Looking forward to working with you!",
  "eventDate": "2025-12-25T18:00:00.000Z"
}
```

**OR (Revenue Split)**:
```json
{
  "eventId": "event_123",
  "vendorId": "vendor_456",
  "resourceId": "resource_789",
  "paymentOption": "ticketSalesSplit",
  "percentageSplit": 15,
  "message": "Let's split the revenue!",
  "eventDate": "2025-12-25T18:00:00.000Z"
}
```

**Field Specifications**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `eventId` | String | YES | Event ID |
| `vendorId` | String | YES | Vendor/Co-host ID |
| `resourceId` | String | YES | Resource ID |
| `paymentOption` | String | YES | "upfrontPayment" or "ticketSalesSplit" |
| `offeredPrice` | Number | Conditional | Required if paymentOption = "upfrontPayment" |
| `percentageSplit` | Number | Conditional | Required if paymentOption = "ticketSalesSplit" (0-100) |
| `message` | String | NO | Optional message to vendor |
| `eventDate` | String | NO | Event date (ISO 8601) |

**Response Example**:
```json
{
  "success": true,
  "data": {
    "id": "booking_999",
    "eventId": "event_123",
    "hostId": "user_001",
    "vendorId": "vendor_456",
    "resourceId": "resource_789",
    "status": "pending",
    "paymentOption": "upfrontPayment",
    "offeredPrice": 150000,
    "agreedPrice": null,
    "percentageSplit": null,
    "message": "Looking forward to working with you!",
    "eventDate": "2025-12-25T18:00:00.000Z",
    "escrowStatus": "pending",
    "createdAt": "2025-12-14T10:00:00.000Z",
    "updatedAt": "2025-12-14T10:00:00.000Z"
  }
}
```

---

### 4. Get My Bookings (Host Side)

**Endpoint**: `GET /api/v1/marketplace/bookings/my-requests`

**Query Parameters**:
```
status: string (optional) - pending, accepted, declined, negotiating, confirmed, paid, completed, cancelled
```

**Response Example**:
```json
{
  "success": true,
  "data": [
    {
      "id": "booking_999",
      "eventId": "event_123",
      "eventName": "Birthday Bash 2025",
      "vendorId": "vendor_456",
      "vendorName": "DJ Spinmaster",
      "resourceId": "resource_789",
      "resourceTitle": "Professional DJ Services",
      "status": "pending",
      "paymentOption": "upfrontPayment",
      "offeredPrice": 150000,
      "agreedPrice": null,
      "createdAt": "2025-12-14T10:00:00.000Z"
    }
  ]
}
```

---

### 5. Get Booking Requests (Vendor Side)

**Endpoint**: `GET /api/v1/marketplace/bookings/requests`

**Query Parameters**:
```
status: string (optional) - pending, accepted, declined, negotiating, confirmed, paid, completed, cancelled
```

**Response Example**:
```json
{
  "success": true,
  "data": [
    {
      "id": "booking_999",
      "eventId": "event_123",
      "eventName": "Birthday Bash 2025",
      "hostId": "user_001",
      "hostName": "John Doe",
      "resourceId": "resource_789",
      "resourceTitle": "Professional DJ Services",
      "status": "pending",
      "paymentOption": "upfrontPayment",
      "offeredPrice": 150000,
      "message": "Looking forward to working with you!",
      "eventDate": "2025-12-25T18:00:00.000Z",
      "createdAt": "2025-12-14T10:00:00.000Z"
    }
  ]
}
```

---

### 6. Accept Booking (Vendor Side)

**Endpoint**: `POST /api/v1/marketplace/bookings/{bookingId}/accept`

**Request Body (Optional)**:
```json
{
  "agreedPrice": 150000
}
```

**Response Example**:
```json
{
  "success": true,
  "data": {
    "id": "booking_999",
    "status": "accepted",
    "agreedPrice": 150000,
    "updatedAt": "2025-12-14T11:00:00.000Z"
  }
}
```

---

### 7. Decline Booking (Vendor Side)

**Endpoint**: `POST /api/v1/marketplace/bookings/{bookingId}/decline`

**Request Body (Optional)**:
```json
{
  "reason": "Already booked for that date"
}
```

**Response Example**:
```json
{
  "success": true,
  "data": {
    "id": "booking_999",
    "status": "declined",
    "updatedAt": "2025-12-14T11:00:00.000Z"
  }
}
```

---

### 8. Send Counter Offer (Vendor Side)

**Endpoint**: `POST /api/v1/marketplace/bookings/{bookingId}/counter-offer`

**Request Body**:
```json
{
  "counterPrice": 180000,
  "message": "I can do it for this price"
}
```

**Response Example**:
```json
{
  "success": true,
  "data": {
    "id": "booking_999",
    "status": "negotiating",
    "counterPrice": 180000,
    "updatedAt": "2025-12-14T11:00:00.000Z"
  }
}
```

---

### 9. Update Booking Status

**Endpoint**: `PATCH /api/v1/marketplace/bookings/{bookingId}`

**Request Body**:
```json
{
  "status": "confirmed",
  "agreedPrice": 165000
}
```

**Response Example**:
```json
{
  "success": true,
  "data": {
    "id": "booking_999",
    "status": "confirmed",
    "agreedPrice": 165000,
    "updatedAt": "2025-12-14T12:00:00.000Z"
  }
}
```

---

## 🗄️ Database Schema Changes

### New Collections/Tables

#### 1. Vendors Collection

```javascript
{
  _id: ObjectId,
  userId: ObjectId,              // Reference to User
  name: String,
  bio: String,
  profilePhoto: String,          // Cloudinary URL
  categories: [String],          // Array of category names
  rating: Number,                // Average rating (0-5)
  reviewCount: Number,
  eventsCompleted: Number,
  isVerified: Boolean,
  responseTime: String,          // e.g., "< 2 hours"
  location: String,
  portfolio: [String],           // Array of Cloudinary URLs
  createdAt: Date,
  updatedAt: Date
}
```

#### 2. Resources Collection

```javascript
{
  _id: ObjectId,
  vendorId: ObjectId,            // Reference to Vendor
  category: String,              // venue, entertainment, etc.
  title: String,
  description: String,
  photos: [String],              // Array of Cloudinary URLs
  basePrice: Number,
  isAvailable: Boolean,
  rating: Number,
  reviewCount: Number,
  eventsCompleted: Number,
  isVerified: Boolean,
  createdAt: Date,
  updatedAt: Date
}
```

#### 3. Bookings Collection

```javascript
{
  _id: ObjectId,
  eventId: ObjectId,             // Reference to Event
  hostId: ObjectId,              // Reference to User (event host)
  vendorId: ObjectId,            // Reference to Vendor
  resourceId: ObjectId,          // Reference to Resource
  status: String,                // pending, accepted, declined, etc.
  paymentOption: String,         // upfrontPayment, ticketSalesSplit
  offeredPrice: Number,
  agreedPrice: Number,
  percentageSplit: Number,       // 0-100
  message: String,
  eventDate: Date,
  escrowStatus: String,          // pending, held, released, refunded
  createdAt: Date,
  updatedAt: Date
}
```

#### 4. Reviews Collection

```javascript
{
  _id: ObjectId,
  vendorId: ObjectId,            // Reference to Vendor
  userId: ObjectId,              // Reference to User (reviewer)
  bookingId: ObjectId,           // Reference to Booking
  rating: Number,                // 1-5
  comment: String,
  eventDate: Date,
  createdAt: Date,
  updatedAt: Date
}
```

---

## 📊 Enums and Constants

### Resource Categories
```javascript
const RESOURCE_CATEGORIES = [
  'venue',
  'entertainment',
  'promotion',
  'security',
  'catering',
  'media',
  'equipment',
  'staffing'
];
```

### Booking Status
```javascript
const BOOKING_STATUS = [
  'pending',      // Request sent, awaiting response
  'accepted',     // Vendor accepted
  'declined',     // Vendor declined
  'negotiating',  // In negotiation
  'confirmed',    // Terms agreed, payment pending
  'paid',         // Payment completed
  'completed',    // Event completed
  'cancelled'     // Booking cancelled
];
```

### Payment Options
```javascript
const PAYMENT_OPTIONS = [
  'upfrontPayment',    // Pay fixed amount upfront
  'ticketSalesSplit'   // Pay percentage of ticket sales
];
```

### Escrow Status
```javascript
const ESCROW_STATUS = [
  'pending',    // Awaiting payment
  'held',       // Funds held in escrow
  'released',   // Funds released to vendor
  'refunded'    // Funds refunded to host
];
```

---

## 🔍 Validation Rules

### Resource Creation
```javascript
{
  category: {
    type: String,
    required: true,
    enum: RESOURCE_CATEGORIES
  },
  title: {
    type: String,
    required: true,
    minlength: 10,
    maxlength: 100
  },
  description: {
    type: String,
    required: true,
    minlength: 50,
    maxlength: 1000
  },
  basePrice: {
    type: Number,
    required: true,
    min: 0,
    max: 100000000
  },
  photos: {
    type: [String],
    validate: {
      validator: function(v) {
        return v.length >= 1 && v.length <= 10;
      },
      message: 'Must have 1-10 photos'
    }
  }
}
```

### Booking Creation
```javascript
{
  paymentOption: {
    type: String,
    required: true,
    enum: PAYMENT_OPTIONS
  },
  offeredPrice: {
    type: Number,
    required: function() {
      return this.paymentOption === 'upfrontPayment';
    },
    min: 0
  },
  percentageSplit: {
    type: Number,
    required: function() {
      return this.paymentOption === 'ticketSalesSplit';
    },
    min: 0,
    max: 100
  }
}
```

---

## 🧪 Testing Examples

### Test Case 1: Browse Vendors

**Request**:
```bash
GET /api/v1/marketplace/resources?category=entertainment&page=1&limit=10
Authorization: Bearer <token>
```

**Expected Response**:
```json
{
  "success": true,
  "data": [
    {
      "id": "resource_123",
      "vendorName": "DJ Spinmaster",
      "title": "Professional DJ Services",
      "basePrice": 150000,
      "rating": 4.8,
      "reviewCount": 89
    }
  ]
}
```

### Test Case 2: Create Booking (Upfront Payment)

**Request**:
```bash
POST /api/v1/marketplace/bookings
Authorization: Bearer <token>
Content-Type: application/json

{
  "eventId": "event_123",
  "vendorId": "vendor_456",
  "resourceId": "resource_789",
  "paymentOption": "upfrontPayment",
  "offeredPrice": 150000,
  "message": "Looking forward to working with you!"
}
```

**Expected Response**:
```json
{
  "success": true,
  "data": {
    "id": "booking_999",
    "status": "pending",
    "offeredPrice": 150000
  }
}
```

### Test Case 3: Create Booking (Revenue Split)

**Request**:
```bash
POST /api/v1/marketplace/bookings
Authorization: Bearer <token>
Content-Type: application/json

{
  "eventId": "event_123",
  "vendorId": "vendor_456",
  "resourceId": "resource_789",
  "paymentOption": "ticketSalesSplit",
  "percentageSplit": 15,
  "message": "Let's split the revenue!"
}
```

**Expected Response**:
```json
{
  "success": true,
  "data": {
    "id": "booking_999",
    "status": "pending",
    "percentageSplit": 15
  }
}
```

---

## 🛡️ Security Considerations

### 1. Authorization
- Only event hosts can create bookings
- Only vendors can accept/decline bookings
- Users can only view their own bookings

### 2. Validation
- Validate event exists and belongs to user
- Validate vendor and resource exist
- Validate payment option matches required fields
- Validate percentage split is 0-100

### 3. Business Logic
- Prevent double booking same resource for same date
- Prevent booking if vendor is not available
- Prevent booking if event date is in the past
- Prevent status changes if not authorized

---

## 📈 Timeline Estimate

| Task | Time | Owner |
|------|------|-------|
| Database schema design | 1 hour | Backend |
| API endpoint implementation | 4 hours | Backend |
| Validation & business logic | 2 hours | Backend |
| Testing | 2 hours | Backend |
| Integration testing | 1 hour | Both |
| **Total** | **10 hours** | |

---

## ✅ Acceptance Criteria

Phase 2 is complete when:

- [ ] All 9 API endpoints implemented
- [ ] Database collections created
- [ ] Vendors can be browsed by category
- [ ] Bookings can be created with both payment options
- [ ] Vendors can accept/decline bookings
- [ ] Booking status updates work correctly
- [ ] Mobile app can browse vendors
- [ ] Mobile app can send booking requests
- [ ] Mobile app can view booking status
- [ ] All validation rules enforced
- [ ] All tests passing

---

## 🎯 Success Metrics

After Phase 2 integration:
- ✅ Hosts can browse vendors by category
- ✅ Hosts can view vendor profiles
- ✅ Hosts can send booking requests
- ✅ Vendors receive booking notifications
- ✅ Two payment options work correctly
- ✅ Booking status tracking works
- ✅ No errors in logs

---

## 📞 Mobile Team Notes

### What's Implemented (Mobile):
1. ✅ Resource categories screen (8 categories)
2. ✅ Vendor list screen (browse by category)
3. ✅ Vendor profile screen (detailed view)
4. ✅ Booking negotiation screen (send requests)
5. ✅ Two payment options (upfront & revenue split)
6. ✅ Mock data for development
7. ✅ State management with Riverpod
8. ✅ API service layer ready
9. ✅ Repository pattern implemented
10. ✅ Integration with event creation flow

### What's Pending (Mobile):
- ⏳ Switch from mock data to real API (toggle in repository)
- ⏳ Booking list screen (view sent requests)
- ⏳ Booking status tracking
- ⏳ Vendor dashboard (for vendors to manage requests)
- ⏳ Payment integration
- ⏳ Escrow system

### Integration Points:
- Event creation flow → Resource categories → Vendor list → Vendor profile → Booking negotiation
- After event creation, if "Enable Vendors Feature" is ON, user can browse and book vendors
- Event ID is passed through the flow for booking creation

---

**Status**: Ready for Backend Implementation

**Priority**: High

**Complexity**: Medium

**Risk**: Low (well-defined requirements)

---

For questions or clarification, contact the mobile development team.
