# Backend Quick Start Guide

**For**: Backend Development Team  
**Purpose**: Quick reference to get started with API implementation  
**Main Document**: `BACKEND_API_SPECIFICATION_V2.md`

---

## 🚨 START HERE: Critical Fixes

### 1. Fix Mongoose Data Leak (30 minutes)
**Problem**: API returns Mongoose internal data causing mobile app crashes

**Solution**:
```javascript
// Find all your API routes and add .lean()

// ❌ BEFORE
router.get('/events', async (req, res) => {
  const events = await Event.find();
  res.json({ data: events });
});

// ✅ AFTER
router.get('/events', async (req, res) => {
  const events = await Event.find().lean();
  res.json({ success: true, data: events });
});
```

**Apply to these endpoints**:
- `GET /api/events`
- `GET /api/events/:id`
- `GET /api/events/my-events`
- All other GET endpoints returning Mongoose documents

---

## 📋 Priority Implementation Order

### Week 1: Critical (Blocking Mobile Testing)

#### Day 1-2: Fix Existing Issues
- [ ] Add `.lean()` to all Mongoose queries
- [ ] Standardize response format: `{success: true, data: {...}}`
- [ ] Change `organizer` fields to `host` in database
- [ ] Test all existing endpoints

#### Day 3-5: Ticket System
- [ ] `POST /api/tickets/purchase` - Purchase tickets
- [ ] `POST /api/tickets/validate-promo` - Validate promo codes
- [ ] `POST /api/tickets/check-in` - Check-in guests
- [ ] Integrate Paystack for payments
- [ ] Generate QR codes for tickets

### Week 2: Core Features

#### Day 1-3: Co-Host System
- [ ] `POST /api/events/:eventId/cohosts/invite`
- [ ] `GET /api/cohosts/invitations`
- [ ] `POST /api/cohosts/invitations/:id/accept`
- [ ] `POST /api/cohosts/invitations/:id/decline`
- [ ] `GET /api/cohosts/dashboard/:eventId`

#### Day 4-5: Event Verification
- [ ] Track check-in percentage
- [ ] Trigger verification at 30% check-in
- [ ] Release escrow payments
- [ ] Distribute revenue to host/co-hosts

### Week 3: Vendor System

#### Day 1-3: Vendor Bookings
- [ ] `POST /api/marketplace/bookings/:id/accept`
- [ ] `POST /api/marketplace/bookings/:id/decline`
- [ ] `POST /api/marketplace/bookings/:id/counter-offer`
- [ ] Escrow payment handling

#### Day 4-5: Vendor Management
- [ ] `GET /api/marketplace/vendors/me/stats`
- [ ] `GET /api/marketplace/bookings/requests`
- [ ] Payment release after event

### Week 4: Wallet & Polish

#### Day 1-3: Wallet Operations
- [ ] `GET /api/wallet/balance`
- [ ] `GET /api/wallet/transactions`
- [ ] `POST /api/wallet/withdraw`
- [ ] `POST /api/wallet/topup`

#### Day 4-5: Testing & Bug Fixes
- [ ] End-to-end testing
- [ ] Performance optimization
- [ ] Bug fixes

---

## 🗄️ Database Changes Required

### 1. Update Events Table
```sql
-- Rename organizer fields to host
ALTER TABLE events 
  CHANGE COLUMN organizer_id host_id VARCHAR(255),
  CHANGE COLUMN organizer_name host_name VARCHAR(255),
  CHANGE COLUMN organizer_image host_image VARCHAR(255);

-- Add ticketing fields
ALTER TABLE events
  ADD COLUMN ticketing_enabled BOOLEAN DEFAULT FALSE,
  ADD COLUMN ticket_price DECIMAL(10,2),
  ADD COLUMN total_tickets INT,
  ADD COLUMN available_tickets INT,
  ADD COLUMN sold_tickets INT DEFAULT 0,
  ADD COLUMN is_sold_out BOOLEAN DEFAULT FALSE;

-- Add verification fields
ALTER TABLE events
  ADD COLUMN checked_in_guests INT DEFAULT 0,
  ADD COLUMN is_verified BOOLEAN DEFAULT FALSE,
  ADD COLUMN verified_at TIMESTAMP;
```

### 2. Create New Tables
```sql
-- Co-hosts table
CREATE TABLE cohosts (
  id VARCHAR(255) PRIMARY KEY,
  event_id VARCHAR(255) REFERENCES events(id),
  user_id VARCHAR(255) REFERENCES users(id),
  revenue_share DECIMAL(5,2),
  status ENUM('pending', 'accepted', 'declined'),
  earnings DECIMAL(10,2) DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Co-host invitations table
CREATE TABLE cohost_invitations (
  id VARCHAR(255) PRIMARY KEY,
  event_id VARCHAR(255) REFERENCES events(id),
  host_id VARCHAR(255) REFERENCES users(id),
  invitee_id VARCHAR(255) REFERENCES users(id),
  revenue_share DECIMAL(5,2),
  message TEXT,
  status ENUM('pending', 'accepted', 'declined', 'expired'),
  expires_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Wallet transactions table
CREATE TABLE wallet_transactions (
  id VARCHAR(255) PRIMARY KEY,
  user_id VARCHAR(255) REFERENCES users(id),
  type ENUM('credit', 'debit'),
  amount DECIMAL(10,2),
  source ENUM('ticket_sales', 'cohost_earnings', 'vendor_earnings', 'withdrawal', 'topup'),
  reference_id VARCHAR(255),
  description TEXT,
  status ENUM('pending', 'completed', 'failed'),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 📝 Response Format Standard

### Success Response
```javascript
{
  "success": true,
  "data": {
    // Your data here
  }
}
```

### Error Response
```javascript
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid request data",
    "details": [
      {
        "field": "ticketing.price",
        "message": "Price must be greater than 0"
      }
    ]
  }
}
```

### List Response with Pagination
```javascript
{
  "success": true,
  "data": {
    "items": [...],  // or "events", "vendors", etc.
    "pagination": {
      "page": 1,
      "limit": 20,
      "total": 150,
      "pages": 8
    }
  }
}
```

---

## 🔑 Key Business Logic

### 1. Ticket Purchase Flow
```
1. User selects tickets
2. Apply promo code (if any)
3. Calculate total: (price × quantity) - discount
4. Process payment via Paystack
5. Hold payment in escrow
6. Generate QR codes
7. Send tickets via email
8. Update available_tickets count
```

### 2. Event Verification (30% Rule)
```
1. Guest checks in with QR code + GPS
2. Verify location within 100m of venue
3. Mark ticket as used
4. Increment checked_in_guests
5. Calculate: checkInPercentage = (checkedIn / total) × 100
6. If checkInPercentage >= 30%:
   - Set isVerified = true
   - Release all escrow payments
   - Distribute revenue to host/co-hosts
   - Release vendor payments
7. If < 30% after event ends:
   - Refund all ticket holders
   - Cancel vendor bookings
```

### 3. Revenue Distribution
```
Total Revenue: ₦500,000
- Platform Fee (10%): ₦50,000
- Vendor Expenses: ₦150,000
= Net Revenue: ₦300,000

Distribution:
- Host (75%): ₦225,000
- Co-host 1 (15%): ₦45,000
- Co-host 2 (10%): ₦30,000
```

---

## 🔌 Integration Requirements

### 1. Paystack (Payment Gateway)
```javascript
const paystack = require('paystack')(process.env.PAYSTACK_SECRET_KEY);

// Initialize payment
const response = await paystack.transaction.initialize({
  email: user.email,
  amount: total * 100, // Convert to kobo
  callback_url: `${process.env.API_URL}/api/payments/callback`,
  metadata: {
    eventId: event.id,
    ticketCount: quantity,
    userId: user.id
  }
});

// Verify payment
const verification = await paystack.transaction.verify(reference);
```

### 2. Cloudinary (Image Upload)
```javascript
const cloudinary = require('cloudinary').v2;

cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET
});

// Upload image
const result = await cloudinary.uploader.upload(file.path, {
  folder: 'events',
  transformation: [
    { width: 800, height: 600, crop: 'fill' }
  ]
});
```

### 3. QR Code Generation
```javascript
const QRCode = require('qrcode');

// Generate QR code
const qrCodeUrl = await QRCode.toDataURL(
  JSON.stringify({
    ticketId: ticket.id,
    eventId: event.id,
    userId: user.id
  })
);
```

---

## 🧪 Testing Endpoints

### Using cURL

#### Create Event
```bash
curl -X POST http://localhost:5001/api/v1/events \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Test Event",
    "startDate": "2024-12-31T18:00:00Z",
    "ticketing": {
      "enabled": true,
      "price": 5000,
      "totalTickets": 100
    }
  }'
```

#### Purchase Tickets
```bash
curl -X POST http://localhost:5001/api/v1/tickets/purchase \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "eventId": "evt_123",
    "quantity": 2,
    "promoCode": "EARLY2024"
  }'
```

#### Invite Co-Host
```bash
curl -X POST http://localhost:5001/api/v1/events/evt_123/cohosts/invite \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "userId": "usr_456",
    "revenueShare": 25,
    "message": "Join me as co-host!"
  }'
```

---

## 📚 Documentation References

### Main Documents
1. **BACKEND_API_SPECIFICATION_V2.md** - Complete API specification (2,220 lines)
2. **BACKEND_URGENT_FIX_MONGOOSE_DATA.md** - Critical Mongoose issue details
3. **BACKEND_API_SPEC_V2_UPDATE_SUMMARY.md** - What was updated

### Supporting Documents
4. **FINAL_USER_FLOWS_AND_FIXES_SUMMARY.md** - Mobile implementation status
5. **VENDOR_SYSTEM_FINAL_COMPLETE.md** - Vendor system details
6. **INTEGRATION_COMPLETE_SUMMARY.md** - Integration guide

---

## ✅ Daily Checklist

### Every Day
- [ ] Use `.lean()` on all Mongoose queries
- [ ] Return standardized response format
- [ ] Test endpoints with mobile team
- [ ] Update API documentation
- [ ] Commit code with clear messages

### Before Pushing
- [ ] Run tests
- [ ] Check for Mongoose data leaks
- [ ] Verify response format
- [ ] Test with Postman/cURL
- [ ] Update changelog

---

## 🆘 Common Issues & Solutions

### Issue 1: "Invalid events data format"
**Cause**: Mongoose internal data in response  
**Fix**: Add `.lean()` to query

### Issue 2: "No host specified in URI"
**Cause**: Empty imageUrl field  
**Fix**: Return null or placeholder URL

### Issue 3: "Nested events response"
**Cause**: Inconsistent response format  
**Fix**: Standardize to `{success: true, data: {...}}`

### Issue 4: "organizer_id not found"
**Cause**: Database still uses old field names  
**Fix**: Run migration to rename fields

---

## 🎯 Success Criteria

### Week 1 Complete When:
- [ ] All Mongoose queries use `.lean()`
- [ ] All responses follow standard format
- [ ] Database fields renamed (organizer → host)
- [ ] Ticket purchase API working
- [ ] Promo code validation working

### Week 2 Complete When:
- [ ] Co-host invitations working
- [ ] Co-host dashboard showing data
- [ ] Event verification triggering at 30%
- [ ] Escrow payments releasing

### Week 3 Complete When:
- [ ] Vendor bookings working
- [ ] Counter offers working
- [ ] Vendor payments releasing
- [ ] Vendor dashboard showing stats

### Week 4 Complete When:
- [ ] Wallet operations working
- [ ] All endpoints tested
- [ ] Mobile app fully integrated
- [ ] Ready for production

---

## 📞 Support

### Questions?
- **API Spec**: See `BACKEND_API_SPECIFICATION_V2.md`
- **Mobile Integration**: Ask mobile team
- **Business Logic**: See specification Section 12
- **Database Schema**: See Appendix E

### Issues?
- **Bugs**: Create GitHub issue
- **Clarifications**: Ask in Slack #backend-dev
- **Urgent**: Contact tech lead

---

**Remember**: The mobile app is 100% complete and waiting for these APIs. Your work directly unblocks the entire mobile team! 🚀

---

**Last Updated**: December 26, 2024  
**Status**: Ready for Implementation ✅
