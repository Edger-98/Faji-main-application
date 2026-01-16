# Backend Requirements - From Bug Sheet Analysis

**Date**: January 6, 2026  
**Purpose**: Document backend fixes needed based on reported issues  
**Status**: Requirements Documented

---

## 📋 **ORIGINAL BUG SHEET ISSUES**

From the user's bug report:
```
1. Ensure logic around payment and withdrawal is implemented properly
2. Correct error handling for authentication
3. Error handling for most sessions in app still inconsistent
4. Error pops up when tries to host party
5. After party section for event type
6. Event and vendor search within app uses geo location
7. Wishlist/Budget feature (can be removed for now)
8. Ensure Vendors have a link for their profiles
9. Support only should have email and FAQS
10. Rate app feature in app not working
11. Can remove wallet from profile since it has own navigation
12. Ensure notification works properly
13. Error in booking requests
14. Settings button leads to debug data
15. A lot of logic loopholes, mostly crud operations
16. Logs out after a while but still stays within app
17. Onboarding screen for new users
```

---

## ✅ **FRONTEND COMPLETED (12 Issues)**

These have been fully implemented on the frontend:
1. ✅ Authentication error handling (401 messages)
2. ✅ Event creation error handling
3. ✅ After party event type added
4. ✅ Vendor profile sharing
5. ✅ Support page (Email + FAQs)
6. ✅ Rate app feature
7. ✅ Wallet removed from profile
8. ✅ Booking requests error handling
9. ✅ Debug data removed
10. ✅ Logout functionality
11. ✅ Onboarding screen
12. ✅ Push notifications

---

## 🔴 **BACKEND REQUIREMENTS (Critical)**

### 1. Payment & Withdrawal Logic ⚠️ CRITICAL

**Issue**: "Ensure logic around payment and withdrawal is implemented properly"

**Current Status**: 
- Frontend has wallet screens
- Payment flow exists
- Withdrawal screens exist
- **Backend logic needs verification**

**Backend Requirements**:

#### Payment Processing:
```
POST /api/payments/ticket-purchase
- Validate ticket availability
- Process payment via Paystack
- Create transaction record
- Update ticket inventory
- Send confirmation email
- Return payment status

Required Fields:
{
  "eventId": "string",
  "ticketTypeId": "string",
  "quantity": number,
  "amount": number,
  "paymentMethod": "paystack",
  "paymentReference": "string"
}

Response:
{
  "success": true,
  "transactionId": "string",
  "tickets": [
    {
      "ticketId": "string",
      "qrCode": "string",
      "ticketNumber": "string"
    }
  ]
}
```

#### Withdrawal Logic:
```
POST /api/wallet/withdraw
- Validate user has sufficient balance
- Check minimum withdrawal amount
- Verify bank details
- Create withdrawal request
- Update wallet balance (pending)
- Process via payment gateway
- Update status on completion
- Send confirmation

Required Fields:
{
  "amount": number,
  "bankAccountId": "string",
  "reason": "string" (optional)
}

Business Rules:
- Minimum withdrawal: ₦1,000
- Maximum per transaction: ₦500,000
- Processing time: 1-3 business days
- Fees: 1.5% + ₦100 (capped at ₦2,000)
- Available balance only (not pending)
```

#### Escrow System:
```
Ticket Sales Flow:
1. User buys ticket → Payment goes to escrow
2. Event happens → 24 hours after event
3. No disputes → Release to host (70%)
4. Platform fee → 30%
5. Vendor payments → From host's share

Vendor Booking Flow:
1. Host books vendor → Payment to escrow
2. Service delivered → Vendor confirms
3. Host confirms → Release payment
4. Dispute → Admin review → Resolution

Escrow Rules:
- Hold period: 24 hours after event
- Dispute window: 7 days
- Auto-release if no dispute
- Refund policy: Before event only
```

**Critical Issues to Fix**:
- [ ] Verify escrow hold logic
- [ ] Test payment gateway integration
- [ ] Validate withdrawal processing
- [ ] Check transaction rollback on failure
- [ ] Ensure atomic operations
- [ ] Test refund scenarios
- [ ] Verify fee calculations
- [ ] Check balance updates are accurate

---

### 2. Session Management & Authentication ⚠️ CRITICAL

**Issue**: "Error handling for most sessions in app still inconsistent"

**Current Status**:
- Frontend handles 401 errors properly
- Logout works on frontend
- **Backend session management needs review**

**Backend Requirements**:

#### Token Management:
```
POST /api/auth/login
- Generate JWT token
- Set expiry: 7 days
- Store refresh token
- Return user data + token

POST /api/auth/refresh
- Validate refresh token
- Generate new access token
- Extend session
- Return new token

POST /api/auth/logout
- Invalidate access token
- Invalidate refresh token
- Clear session data
- Return success

Token Structure:
{
  "accessToken": "JWT token",
  "refreshToken": "Refresh token",
  "expiresIn": 604800, // 7 days in seconds
  "tokenType": "Bearer"
}
```

#### Session Validation:
```
Middleware: validateSession
- Check token exists
- Verify token signature
- Check token expiry
- Validate user still exists
- Check user is not banned
- Return 401 if invalid

Error Responses:
{
  "error": "TOKEN_EXPIRED",
  "message": "Your session has expired. Please login again.",
  "code": 401
}

{
  "error": "INVALID_TOKEN",
  "message": "Invalid authentication token.",
  "code": 401
}

{
  "error": "USER_NOT_FOUND",
  "message": "User account not found.",
  "code": 401
}
```

**Critical Issues to Fix**:
- [ ] Implement token refresh mechanism
- [ ] Add token blacklist for logout
- [ ] Set proper token expiry times
- [ ] Handle concurrent sessions
- [ ] Add rate limiting for auth endpoints
- [ ] Implement session timeout warnings
- [ ] Add device tracking (optional)
- [ ] Test token refresh flow

---

### 3. Event Creation & Validation ⚠️ HIGH

**Issue**: "Error pops up when tries to host party"

**Current Status**:
- Frontend validates input
- Frontend shows clear errors
- **Backend validation needs strengthening**

**Backend Requirements**:

#### Event Creation Endpoint:
```
POST /api/events
- Validate all required fields
- Check user permissions
- Validate date is in future
- Validate expected guests > 0
- Check for duplicate events
- Create event record
- Return event details

Validation Rules:
{
  "title": {
    "required": true,
    "minLength": 3,
    "maxLength": 100
  },
  "description": {
    "required": true,
    "minLength": 10,
    "maxLength": 5000
  },
  "eventDate": {
    "required": true,
    "format": "ISO8601",
    "mustBeFuture": true
  },
  "expectedGuests": {
    "required": true,
    "min": 1,
    "max": 100000
  },
  "eventType": {
    "required": true,
    "enum": ["Birthday", "Wedding", "Corporate", "Engagement", "After Party", "Other"]
  }
}

Error Response:
{
  "error": "VALIDATION_ERROR",
  "message": "Event validation failed",
  "details": [
    {
      "field": "expectedGuests",
      "message": "Expected guests must be greater than 0"
    }
  ]
}
```

**Critical Issues to Fix**:
- [ ] Add "After Party" to event type enum
- [ ] Strengthen validation rules
- [ ] Return detailed error messages
- [ ] Check for SQL injection
- [ ] Validate image URLs
- [ ] Check location data format
- [ ] Validate ticket pricing
- [ ] Test edge cases

---

### 4. Booking Request Logic ⚠️ HIGH

**Issue**: "Error in booking requests"

**Current Status**:
- Frontend sends booking requests
- Frontend handles errors
- **Backend booking logic needs review**

**Backend Requirements**:

#### Booking Creation:
```
POST /api/marketplace/bookings
- Validate event exists
- Validate vendor exists
- Validate service exists
- Check vendor availability
- Check event date conflicts
- Create booking request
- Notify vendor
- Return booking details

Required Fields:
{
  "eventId": "string",
  "vendorId": "string",
  "resourceId": "string",
  "paymentOption": "upfrontPayment" | "ticketSalesSplit",
  "offeredPrice": number,
  "percentageSplit": number (if ticketSalesSplit),
  "message": "string" (optional),
  "eventDate": "ISO8601"
}

Validation:
- Event must belong to requesting user
- Vendor must be verified
- Service must be active
- Price must be > 0
- Event date must be in future
- No duplicate bookings for same event+vendor

Response:
{
  "success": true,
  "booking": {
    "id": "string",
    "status": "pending",
    "vendorId": "string",
    "eventId": "string",
    "createdAt": "ISO8601"
  }
}
```

#### Booking Status Flow:
```
States:
1. pending → Vendor hasn't responded
2. accepted → Vendor accepted
3. rejected → Vendor rejected
4. counter_offered → Vendor sent counter offer
5. confirmed → Host confirmed counter offer
6. completed → Service delivered
7. cancelled → Cancelled by either party

Transitions:
pending → accepted (vendor)
pending → rejected (vendor)
pending → counter_offered (vendor)
counter_offered → confirmed (host)
counter_offered → rejected (host)
accepted → confirmed (host pays)
confirmed → completed (after event)
any → cancelled (with reason)
```

**Critical Issues to Fix**:
- [ ] Implement booking state machine
- [ ] Add conflict detection
- [ ] Validate payment options
- [ ] Send notifications on status change
- [ ] Handle counter offers
- [ ] Add booking cancellation logic
- [ ] Test concurrent bookings
- [ ] Add booking history

---

### 5. Geo-location Search 🔵 MEDIUM

**Issue**: "Event and vendor search within app uses geo location"

**Current Status**:
- Frontend has location fields
- No search implementation
- **Backend needs geo-search endpoints**

**Backend Requirements**:

#### Geo-location Search:
```
GET /api/events/search
Query Parameters:
- lat: number (latitude)
- lng: number (longitude)
- radius: number (in km, default: 10)
- category: string (optional)
- date: ISO8601 (optional)
- limit: number (default: 20)
- offset: number (default: 0)

Response:
{
  "events": [
    {
      "id": "string",
      "title": "string",
      "distance": 2.5, // km from user
      "location": {
        "lat": number,
        "lng": number,
        "address": "string"
      }
    }
  ],
  "total": number
}

GET /api/vendors/search
Query Parameters:
- lat: number
- lng: number
- radius: number (default: 25)
- category: string (optional)
- rating: number (optional, min rating)
- limit: number
- offset: number

Response:
{
  "vendors": [
    {
      "id": "string",
      "name": "string",
      "distance": 5.2,
      "rating": 4.8,
      "category": "string"
    }
  ],
  "total": number
}
```

#### Database Requirements:
```sql
-- Add spatial indexes
CREATE INDEX idx_events_location ON events USING GIST (
  ST_MakePoint(longitude, latitude)::geography
);

CREATE INDEX idx_vendors_location ON vendors USING GIST (
  ST_MakePoint(longitude, latitude)::geography
);

-- Distance calculation function
CREATE FUNCTION calculate_distance(
  lat1 FLOAT, lng1 FLOAT,
  lat2 FLOAT, lng2 FLOAT
) RETURNS FLOAT AS $$
  -- Haversine formula
  -- Returns distance in kilometers
$$;
```

**Implementation Requirements**:
- [ ] Add PostGIS extension (if PostgreSQL)
- [ ] Create spatial indexes
- [ ] Implement distance calculation
- [ ] Add radius filtering
- [ ] Sort by distance
- [ ] Cache popular searches
- [ ] Add map bounds search
- [ ] Test performance with large datasets

---

### 6. CRUD Operations Audit 🔵 MEDIUM

**Issue**: "A lot of logic loopholes, mostly crud operations on events, vendor listing, bookmark etc"

**Current Status**:
- Basic CRUD exists
- Authorization may be incomplete
- **Needs comprehensive audit**

**Backend Requirements**:

#### Events CRUD:
```
POST /api/events
- ✅ Create event
- ⚠️ Check: User can only create for themselves
- ⚠️ Check: Validate all fields
- ⚠️ Check: Handle image uploads

GET /api/events/:id
- ✅ Get event details
- ⚠️ Check: Public events visible to all
- ⚠️ Check: Private events only to attendees
- ⚠️ Check: Draft events only to owner

PUT /api/events/:id
- ⚠️ Update event
- ⚠️ Check: Only owner can update
- ⚠️ Check: Can't update past events
- ⚠️ Check: Notify attendees of changes

DELETE /api/events/:id
- ⚠️ Delete event
- ⚠️ Check: Only owner can delete
- ⚠️ Check: Can't delete if tickets sold
- ⚠️ Check: Refund tickets if deleted
- ⚠️ Check: Soft delete vs hard delete

GET /api/events/my-events
- ✅ Get user's events
- ⚠️ Check: Only return user's events
- ⚠️ Check: Include draft events
- ⚠️ Check: Pagination
```

#### Vendor CRUD:
```
POST /api/vendors/register
- ✅ Register as vendor
- ⚠️ Check: User not already vendor
- ⚠️ Check: Validate business info
- ⚠️ Check: Verify documents

GET /api/vendors/:id
- ✅ Get vendor profile
- ⚠️ Check: Only show verified vendors
- ⚠️ Check: Include ratings/reviews
- ⚠️ Check: Show availability

PUT /api/vendors/:id
- ⚠️ Update vendor profile
- ⚠️ Check: Only vendor can update own profile
- ⚠️ Check: Re-verify if critical info changes
- ⚠️ Check: Validate new data

POST /api/vendors/:id/services
- ⚠️ Add service
- ⚠️ Check: Only vendor can add services
- ⚠️ Check: Validate pricing
- ⚠️ Check: Validate service details

DELETE /api/vendors/:id/services/:serviceId
- ⚠️ Delete service
- ⚠️ Check: Only vendor can delete
- ⚠️ Check: Can't delete if active bookings
- ⚠️ Check: Soft delete preferred
```

#### Bookmarks/Favorites:
```
POST /api/bookmarks
- ⚠️ Add bookmark
- ⚠️ Check: User authenticated
- ⚠️ Check: Event/vendor exists
- ⚠️ Check: No duplicate bookmarks

DELETE /api/bookmarks/:id
- ⚠️ Remove bookmark
- ⚠️ Check: User owns bookmark
- ⚠️ Check: Bookmark exists

GET /api/bookmarks
- ⚠️ Get user's bookmarks
- ⚠️ Check: Only return user's bookmarks
- ⚠️ Check: Include event/vendor details
- ⚠️ Check: Pagination

Note: Frontend has removed bookmark feature,
but backend should keep for potential future use.
```

**Audit Checklist**:
- [ ] Review all CRUD endpoints
- [ ] Check authorization on every endpoint
- [ ] Validate input on all POST/PUT
- [ ] Test with invalid data
- [ ] Check for SQL injection
- [ ] Test concurrent operations
- [ ] Verify soft delete vs hard delete
- [ ] Check cascade deletes
- [ ] Test pagination
- [ ] Verify rate limiting

---

### 7. Push Notification Integration ⚠️ HIGH

**Issue**: "Ensure notification works properly"

**Current Status**:
- Frontend fully implemented
- FCM tokens generated
- **Backend needs to send notifications**

**Backend Requirements**:

#### FCM Token Management:
```
POST /api/users/fcm-token
- Store FCM token for user
- Associate with device
- Update if token changes
- Return success

Required Fields:
{
  "fcmToken": "string",
  "deviceType": "ios" | "android",
  "deviceId": "string" (optional)
}

Database Schema:
{
  userId: ObjectId,
  fcmToken: String,
  deviceType: String,
  deviceId: String,
  createdAt: Date,
  updatedAt: Date,
  isActive: Boolean
}
```

#### Send Notifications:
```
Function: sendNotification(userId, notification)

Parameters:
{
  userId: "string",
  notification: {
    title: "string",
    body: "string",
    data: {
      type: "event" | "booking" | "message" | "payment",
      entityId: "string",
      action: "string"
    }
  }
}

FCM Payload:
{
  "to": "FCM_TOKEN",
  "notification": {
    "title": "New Booking Request",
    "body": "You have a new booking request from John Doe"
  },
  "data": {
    "type": "booking",
    "entityId": "booking_123",
    "action": "view_booking"
  },
  "priority": "high",
  "content_available": true
}
```

#### Notification Triggers:
```
Event Notifications:
- Event created → Notify followers
- Event updated → Notify attendees
- Event starting soon → Notify attendees (24h, 1h before)
- Event cancelled → Notify attendees

Booking Notifications:
- Booking request → Notify vendor
- Booking accepted → Notify host
- Booking rejected → Notify host
- Counter offer → Notify host
- Booking confirmed → Notify both
- Service completed → Notify both

Payment Notifications:
- Payment received → Notify host
- Payout processed → Notify host
- Refund issued → Notify user

Message Notifications:
- New message → Notify recipient
- Unread messages → Daily summary
```

**Implementation Requirements**:
- [ ] Set up FCM server key
- [ ] Create notification service
- [ ] Store FCM tokens
- [ ] Handle token refresh
- [ ] Send notifications on events
- [ ] Add notification preferences
- [ ] Track notification delivery
- [ ] Handle failed notifications
- [ ] Add notification history
- [ ] Test on iOS and Android

---

## 🟡 **BACKEND IMPROVEMENTS (Nice to Have)**

### 1. Error Handling Standardization

**Current Issues**:
- Inconsistent error formats
- Generic error messages
- Missing error codes

**Requirements**:
```javascript
// Standard error response format
{
  "error": "ERROR_CODE",
  "message": "User-friendly message",
  "details": {
    "field": "fieldName",
    "reason": "Specific reason"
  },
  "code": 400,
  "timestamp": "ISO8601"
}

// Error codes
AUTH_001: Invalid credentials
AUTH_002: Token expired
AUTH_003: Unauthorized access
EVENT_001: Event not found
EVENT_002: Invalid event data
PAYMENT_001: Payment failed
PAYMENT_002: Insufficient balance
BOOKING_001: Booking conflict
BOOKING_002: Vendor unavailable
```

**Implementation**:
- [ ] Create error handler middleware
- [ ] Define error code constants
- [ ] Standardize all error responses
- [ ] Add error logging
- [ ] Create error documentation

---

### 2. API Rate Limiting

**Requirements**:
```
Rate Limits:
- Authentication: 5 requests/minute
- Event creation: 10 requests/hour
- Search: 100 requests/minute
- General API: 1000 requests/hour

Response Headers:
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1609459200

Error Response (429):
{
  "error": "RATE_LIMIT_EXCEEDED",
  "message": "Too many requests. Please try again later.",
  "retryAfter": 60
}
```

**Implementation**:
- [ ] Add rate limiting middleware
- [ ] Configure limits per endpoint
- [ ] Add Redis for distributed rate limiting
- [ ] Return proper headers
- [ ] Log rate limit violations

---

### 3. API Versioning

**Requirements**:
```
URL Structure:
/api/v1/events
/api/v2/events (when breaking changes)

Headers:
Accept: application/vnd.faji.v1+json

Deprecation:
- Announce 3 months before
- Support old version for 6 months
- Return deprecation warnings
```

**Implementation**:
- [ ] Add version prefix to routes
- [ ] Create v1 namespace
- [ ] Plan for v2 migration
- [ ] Document version differences

---

### 4. Logging & Monitoring

**Requirements**:
```
Log Levels:
- ERROR: Critical errors
- WARN: Warnings
- INFO: Important events
- DEBUG: Detailed debugging

Log Format:
{
  "timestamp": "ISO8601",
  "level": "ERROR",
  "service": "api",
  "endpoint": "/api/events",
  "method": "POST",
  "userId": "user_123",
  "error": "Error message",
  "stack": "Stack trace"
}

Monitoring:
- API response times
- Error rates
- Database query times
- Payment success rates
- Notification delivery rates
```

**Implementation**:
- [ ] Set up logging service (Winston, Bunyan)
- [ ] Add request logging middleware
- [ ] Set up error tracking (Sentry)
- [ ] Add performance monitoring
- [ ] Create dashboards

---

## 📋 **PRIORITY MATRIX**

### 🔴 Critical (Do First):
1. **Payment & Withdrawal Logic** - Money handling must be correct
2. **Session Management** - Security critical
3. **Event Creation Validation** - Core functionality
4. **Booking Request Logic** - Core functionality
5. **Push Notification Integration** - User engagement

### 🟡 High Priority (Do Next):
6. **CRUD Operations Audit** - Security and data integrity
7. **Error Handling Standardization** - Better UX
8. **FCM Token Management** - Required for notifications

### 🟢 Medium Priority (Nice to Have):
9. **Geo-location Search** - Enhanced feature
10. **API Rate Limiting** - Prevent abuse
11. **Logging & Monitoring** - Operations
12. **API Versioning** - Future-proofing

---

## 🧪 **TESTING REQUIREMENTS**

### Unit Tests:
- [ ] Payment processing logic
- [ ] Withdrawal calculations
- [ ] Token validation
- [ ] Event validation
- [ ] Booking state transitions
- [ ] Distance calculations
- [ ] Authorization checks

### Integration Tests:
- [ ] Payment gateway integration
- [ ] FCM notification sending
- [ ] Database transactions
- [ ] API endpoint flows
- [ ] Authentication flows

### Load Tests:
- [ ] Concurrent bookings
- [ ] High-volume searches
- [ ] Payment processing under load
- [ ] Notification sending at scale

---

## 📝 **DOCUMENTATION NEEDED**

### API Documentation:
- [ ] OpenAPI/Swagger spec
- [ ] Authentication guide
- [ ] Error code reference
- [ ] Rate limiting details
- [ ] Webhook documentation

### Developer Guides:
- [ ] Setup instructions
- [ ] Environment configuration
- [ ] Database migrations
- [ ] Deployment guide
- [ ] Troubleshooting guide

---

## 🎯 **SUCCESS CRITERIA**

### Payment System:
- ✅ All payments process correctly
- ✅ Withdrawals complete within SLA
- ✅ Escrow holds and releases properly
- ✅ No money lost in transactions
- ✅ Refunds work correctly

### Session Management:
- ✅ Tokens expire properly
- ✅ Refresh tokens work
- ✅ Logout invalidates tokens
- ✅ No unauthorized access
- ✅ Concurrent sessions handled

### Booking System:
- ✅ No double bookings
- ✅ State transitions work
- ✅ Notifications sent on changes
- ✅ Counter offers work
- ✅ Cancellations handled

### Notifications:
- ✅ Notifications delivered reliably
- ✅ FCM tokens stored correctly
- ✅ All notification types work
- ✅ iOS and Android both work
- ✅ Notification preferences respected

---

## 📞 **NEXT STEPS FOR BACKEND TEAM**

### Week 1:
1. Review this document
2. Audit payment & withdrawal logic
3. Fix critical security issues
4. Implement FCM token storage
5. Test notification sending

### Week 2:
1. Strengthen event validation
2. Fix booking request logic
3. Audit CRUD operations
4. Standardize error responses
5. Add comprehensive logging

### Week 3:
1. Implement geo-location search
2. Add rate limiting
3. Complete API documentation
4. Write integration tests
5. Performance testing

### Week 4:
1. Final testing
2. Security audit
3. Load testing
4. Deploy to staging
5. User acceptance testing

---

## ✅ **SUMMARY**

### Critical Backend Issues:
1. ⚠️ Payment & withdrawal logic verification
2. ⚠️ Session management improvements
3. ⚠️ Event creation validation
4. ⚠️ Booking request logic fixes
5. ⚠️ Push notification integration

### Total Requirements:
- **Critical**: 5 items
- **High Priority**: 3 items
- **Medium Priority**: 4 items
- **Total**: 12 backend requirements

### Estimated Timeline:
- **Critical fixes**: 2-3 weeks
- **High priority**: 1-2 weeks
- **Medium priority**: 2-3 weeks
- **Total**: 5-8 weeks

---

**End of Backend Requirements**  
**Date**: January 6, 2026  
**Status**: Documented ✅  
**Next**: Backend team review and implementation
