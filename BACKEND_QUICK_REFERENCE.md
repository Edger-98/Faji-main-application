# Backend Requirements - Quick Reference

**Date**: January 6, 2026  
**For**: Backend Development Team

---

## 🔴 **CRITICAL (Do First)**

### 1. Payment & Withdrawal Logic ⚠️
**Issue**: Money handling must be 100% correct

**Fix**:
- [ ] Verify escrow hold/release logic
- [ ] Test payment gateway integration
- [ ] Validate withdrawal processing
- [ ] Check transaction rollbacks
- [ ] Test refund scenarios
- [ ] Verify fee calculations

**Endpoints**:
- `POST /api/payments/ticket-purchase`
- `POST /api/wallet/withdraw`
- `GET /api/wallet/balance`

---

### 2. Session Management ⚠️
**Issue**: Tokens, logout, session expiry

**Fix**:
- [ ] Implement token refresh
- [ ] Add token blacklist for logout
- [ ] Set proper expiry times
- [ ] Handle concurrent sessions
- [ ] Add rate limiting for auth

**Endpoints**:
- `POST /api/auth/login`
- `POST /api/auth/refresh`
- `POST /api/auth/logout`

---

### 3. Event Creation Validation ⚠️
**Issue**: "Error pops up when tries to host party"

**Fix**:
- [ ] Add "After Party" to event type enum
- [ ] Strengthen validation rules
- [ ] Return detailed error messages
- [ ] Check for SQL injection
- [ ] Validate all required fields

**Endpoint**:
- `POST /api/events`

---

### 4. Booking Request Logic ⚠️
**Issue**: "Error in booking requests"

**Fix**:
- [ ] Implement booking state machine
- [ ] Add conflict detection
- [ ] Validate payment options
- [ ] Send notifications on status change
- [ ] Handle counter offers

**Endpoint**:
- `POST /api/marketplace/bookings`

---

### 5. Push Notifications ⚠️
**Issue**: Backend needs to send notifications

**Fix**:
- [ ] Store FCM tokens
- [ ] Send notifications on events
- [ ] Handle token refresh
- [ ] Add notification preferences
- [ ] Test iOS and Android

**Endpoints**:
- `POST /api/users/fcm-token`
- Internal: `sendNotification(userId, data)`

---

## 🟡 **HIGH PRIORITY**

### 6. CRUD Operations Audit
- [ ] Review all endpoints
- [ ] Check authorization
- [ ] Validate input
- [ ] Test edge cases

### 7. Error Handling
- [ ] Standardize error format
- [ ] Add error codes
- [ ] Return user-friendly messages

### 8. FCM Integration
- [ ] Set up FCM server key
- [ ] Create notification service
- [ ] Track delivery

---

## 🟢 **MEDIUM PRIORITY**

### 9. Geo-location Search
- [ ] Add PostGIS/spatial indexes
- [ ] Implement distance calculation
- [ ] Create search endpoints

### 10. Rate Limiting
- [ ] Add rate limiting middleware
- [ ] Configure per endpoint
- [ ] Use Redis

### 11. Logging
- [ ] Set up logging service
- [ ] Add error tracking
- [ ] Create dashboards

---

## 📋 **CHECKLIST**

### Week 1:
- [ ] Audit payment logic
- [ ] Fix session management
- [ ] Store FCM tokens
- [ ] Test notifications

### Week 2:
- [ ] Fix event validation
- [ ] Fix booking logic
- [ ] Audit CRUD operations
- [ ] Standardize errors

### Week 3:
- [ ] Geo-location search
- [ ] Rate limiting
- [ ] API documentation
- [ ] Integration tests

---

## 🧪 **TESTING**

### Must Test:
- [ ] Payment processing
- [ ] Withdrawal flow
- [ ] Token refresh
- [ ] Booking conflicts
- [ ] Notification delivery
- [ ] Authorization checks

---

## 📝 **DOCUMENTATION**

See full details in:
- `BACKEND_REQUIREMENTS_FROM_BUG_SHEET.md`

---

## 🎯 **SUCCESS CRITERIA**

- ✅ All payments work correctly
- ✅ No unauthorized access
- ✅ Notifications delivered
- ✅ No double bookings
- ✅ Clear error messages

---

**Timeline**: 5-8 weeks  
**Priority**: Critical items first  
**Status**: Ready for implementation
