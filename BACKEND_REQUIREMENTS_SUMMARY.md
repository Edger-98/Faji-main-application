# 🎯 Backend Requirements Summary - Production Ready

## Overview

The mobile app is **100% production-ready** and waiting for backend implementation. All mock data has been removed. The app will make real API calls to the backend.

---

## ✅ What's Complete (Mobile)

### Phase 1: Event Image Upload
- ✅ Cloudinary integration (user uploads images)
- ✅ Event creation sends `imageUrl` to backend
- ✅ Event display shows `imageUrl` from backend
- ✅ Fallback for missing images
- ✅ 3-step event creation flow

### Phase 2: Marketplace System
- ✅ 8 service categories
- ✅ Vendor browsing by category
- ✅ Vendor profile display
- ✅ Booking negotiation UI
- ✅ Two payment options (upfront & revenue split)
- ✅ **Production-ready API calls** (no mock data)

---

## 🔴 What Backend MUST Implement

### Phase 1: Event Image API (4-5 hours)

#### 1. Update Event Schema
```javascript
// MongoDB Schema
{
  imageUrl: {
    type: String,
    required: false,
    default: null,
    maxlength: 500
  }
  // REMOVE: posterId, colorTheme
}
```

#### 2. Update Event Endpoints

**Accept imageUrl in:**
- `POST /api/v1/events` - Create event
- `PATCH /api/v1/events/:id` - Update event

**Return imageUrl in:**
- `GET /api/v1/events/:id` - Get single event
- `GET /api/v1/events/my-events` - Get user's events
- `GET /api/v1/events` - List all events
- `GET /api/v1/events/trending` - Trending events
- `GET /api/v1/events/upcoming` - Upcoming events

**Example Request:**
```json
POST /api/v1/events
{
  "name": "Birthday Party",
  "imageUrl": "https://res.cloudinary.com/faji/image/upload/v123/event_abc.jpg",
  ...
}
```

**Example Response:**
```json
{
  "success": true,
  "data": {
    "id": "event_123",
    "name": "Birthday Party",
    "imageUrl": "https://res.cloudinary.com/faji/image/upload/v123/event_abc.jpg",
    ...
  }
}
```

---

### Phase 2: Marketplace API (10 hours)

#### 1. Create Database Collections

**Vendors Collection:**
```javascript
{
  _id: ObjectId,
  userId: ObjectId,
  name: String,
  bio: String,
  profilePhoto: String,
  categories: [String],
  rating: Number,
  reviewCount: Number,
  eventsCompleted: Number,
  isVerified: Boolean,
  responseTime: String,
  location: String,
  portfolio: [String],
  createdAt: Date,
  updatedAt: Date
}
```

**Resources Collection:**
```javascript
{
  _id: ObjectId,
  vendorId: ObjectId,
  category: String, // venue, entertainment, etc.
  title: String,
  description: String,
  photos: [String],
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

**Bookings Collection:**
```javascript
{
  _id: ObjectId,
  eventId: ObjectId,
  hostId: ObjectId,
  vendorId: ObjectId,
  resourceId: ObjectId,
  status: String, // pending, accepted, declined, etc.
  paymentOption: String, // upfrontPayment, ticketSalesSplit
  offeredPrice: Number,
  agreedPrice: Number,
  percentageSplit: Number,
  message: String,
  eventDate: Date,
  escrowStatus: String,
  createdAt: Date,
  updatedAt: Date
}
```

**Reviews Collection:**
```javascript
{
  _id: ObjectId,
  vendorId: ObjectId,
  userId: ObjectId,
  bookingId: ObjectId,
  rating: Number,
  comment: String,
  eventDate: Date,
  createdAt: Date,
  updatedAt: Date
}
```

#### 2. Implement 9 API Endpoints

**1. Get Resources by Category**
```
GET /api/v1/marketplace/resources?category=entertainment&page=1&limit=20

Response:
{
  "success": true,
  "data": [
    {
      "id": "resource_123",
      "vendorId": "vendor_456",
      "vendorName": "DJ Spinmaster",
      "category": "entertainment",
      "title": "Professional DJ Services",
      "description": "...",
      "photos": ["https://..."],
      "basePrice": 150000,
      "isAvailable": true,
      "rating": 4.8,
      "reviewCount": 89,
      "eventsCompleted": 120,
      "isVerified": true
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

**2. Get Vendor Profile**
```
GET /api/v1/marketplace/vendors/{vendorId}

Response:
{
  "success": true,
  "data": {
    "id": "vendor_456",
    "name": "DJ Spinmaster",
    "bio": "...",
    "profilePhoto": "https://...",
    "categories": ["entertainment"],
    "rating": 4.8,
    "reviewCount": 89,
    "eventsCompleted": 120,
    "isVerified": true,
    "responseTime": "< 2 hours",
    "location": "Lagos, Nigeria",
    "portfolio": ["https://...", "https://..."],
    "resources": [...],
    "reviews": [...]
  }
}
```

**3. Create Booking**
```
POST /api/v1/marketplace/bookings

Request (Upfront Payment):
{
  "eventId": "event_123",
  "vendorId": "vendor_456",
  "resourceId": "resource_789",
  "paymentOption": "upfrontPayment",
  "offeredPrice": 150000,
  "message": "Looking forward to working with you!",
  "eventDate": "2025-12-25T18:00:00.000Z"
}

Request (Revenue Split):
{
  "eventId": "event_123",
  "vendorId": "vendor_456",
  "resourceId": "resource_789",
  "paymentOption": "ticketSalesSplit",
  "percentageSplit": 15,
  "message": "Let's split the revenue!",
  "eventDate": "2025-12-25T18:00:00.000Z"
}

Response:
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
    "escrowStatus": "pending",
    "createdAt": "2025-12-14T10:00:00.000Z"
  }
}
```

**4. Get My Bookings (Host)**
```
GET /api/v1/marketplace/bookings/my-requests?status=pending

Response:
{
  "success": true,
  "data": [
    {
      "id": "booking_999",
      "eventId": "event_123",
      "eventName": "Birthday Bash",
      "vendorId": "vendor_456",
      "vendorName": "DJ Spinmaster",
      "resourceId": "resource_789",
      "resourceTitle": "Professional DJ Services",
      "status": "pending",
      "paymentOption": "upfrontPayment",
      "offeredPrice": 150000,
      "createdAt": "2025-12-14T10:00:00.000Z"
    }
  ]
}
```

**5. Get Booking Requests (Vendor)**
```
GET /api/v1/marketplace/bookings/requests?status=pending

Response:
{
  "success": true,
  "data": [
    {
      "id": "booking_999",
      "eventId": "event_123",
      "eventName": "Birthday Bash",
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

**6. Accept Booking**
```
POST /api/v1/marketplace/bookings/{bookingId}/accept

Request (Optional):
{
  "agreedPrice": 150000
}

Response:
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

**7. Decline Booking**
```
POST /api/v1/marketplace/bookings/{bookingId}/decline

Request (Optional):
{
  "reason": "Already booked for that date"
}

Response:
{
  "success": true,
  "data": {
    "id": "booking_999",
    "status": "declined",
    "updatedAt": "2025-12-14T11:00:00.000Z"
  }
}
```

**8. Send Counter Offer**
```
POST /api/v1/marketplace/bookings/{bookingId}/counter-offer

Request:
{
  "counterPrice": 180000,
  "message": "I can do it for this price"
}

Response:
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

**9. Update Booking Status**
```
PATCH /api/v1/marketplace/bookings/{bookingId}

Request:
{
  "status": "confirmed",
  "agreedPrice": 165000
}

Response:
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

## 📊 Enums & Constants

### Resource Categories
```javascript
const CATEGORIES = [
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
  'pending',
  'accepted',
  'declined',
  'negotiating',
  'confirmed',
  'paid',
  'completed',
  'cancelled'
];
```

### Payment Options
```javascript
const PAYMENT_OPTIONS = [
  'upfrontPayment',
  'ticketSalesSplit'
];
```

### Escrow Status
```javascript
const ESCROW_STATUS = [
  'pending',
  'held',
  'released',
  'refunded'
];
```

---

## ⚠️ Critical Validation Rules

### Booking Creation
```javascript
// If paymentOption is 'upfrontPayment'
if (paymentOption === 'upfrontPayment') {
  // offeredPrice is REQUIRED
  if (!offeredPrice || offeredPrice <= 0) {
    return error('offeredPrice is required for upfront payment');
  }
}

// If paymentOption is 'ticketSalesSplit'
if (paymentOption === 'ticketSalesSplit') {
  // percentageSplit is REQUIRED (0-100)
  if (!percentageSplit || percentageSplit < 0 || percentageSplit > 100) {
    return error('percentageSplit must be between 0 and 100');
  }
}
```

---

## 🚨 What Happens Without Backend

### Phase 1 (Event Images):
- ❌ Users can upload images to Cloudinary
- ❌ But images won't be saved to events
- ❌ Events won't display uploaded images
- ❌ App will show fallback images

### Phase 2 (Marketplace):
- ❌ Users can browse categories
- ❌ But no vendors will appear (empty list)
- ❌ Booking requests will fail
- ❌ App will show error messages

**Result**: App is functional but features don't work without backend.

---

## ✅ Testing Checklist

### Phase 1 Testing:
- [ ] Create event with imageUrl
- [ ] Create event without imageUrl
- [ ] Get event returns imageUrl
- [ ] List events returns imageUrl
- [ ] Update event imageUrl
- [ ] Invalid imageUrl rejected

### Phase 2 Testing:
- [ ] Get resources by category
- [ ] Get vendor profile
- [ ] Create booking (upfront payment)
- [ ] Create booking (revenue split)
- [ ] Get my bookings
- [ ] Get booking requests (vendor)
- [ ] Accept booking
- [ ] Decline booking
- [ ] Send counter offer

---

## ⏱️ Timeline

| Phase | Task | Time |
|-------|------|------|
| Phase 1 | Database schema | 30 min |
| Phase 1 | API endpoints | 2 hours |
| Phase 1 | Testing | 1 hour |
| **Phase 1 Total** | | **4-5 hours** |
| | |
| Phase 2 | Database collections | 1 hour |
| Phase 2 | API endpoints | 6 hours |
| Phase 2 | Validation & logic | 2 hours |
| Phase 2 | Testing | 1 hour |
| **Phase 2 Total** | | **10 hours** |
| | |
| **GRAND TOTAL** | | **14-15 hours** |

---

## 📚 Complete Documentation

All details are in: **`BACKEND_INTEGRATION_GUIDE.md`**

- Phase 1: Pages 1-15
- Phase 2: Pages 16-35

Includes:
- ✅ Complete API specifications
- ✅ Request/response examples
- ✅ Database schemas
- ✅ Validation rules
- ✅ Error handling
- ✅ Testing examples
- ✅ Security considerations

---

## 🎯 Priority

**CRITICAL**: Without backend implementation, the app features won't work.

**Recommended Order:**
1. Phase 1 first (4-5 hours) - Enables event images
2. Phase 2 second (10 hours) - Enables marketplace

**Total**: 14-15 hours of backend work

---

## 📞 Questions?

Review: `BACKEND_INTEGRATION_GUIDE.md` for complete details.

---

**Status**: ✅ Mobile 100% Ready, ⏳ Backend 0% Complete
**Blocking**: Backend implementation
**Timeline**: 14-15 hours
**Priority**: HIGH

---
