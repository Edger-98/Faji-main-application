# Backend Missing Features - Implementation Guide

**Current Status**: Auth ✅ | Events ✅ (needs Mongoose fix) | Everything else ⏳

---

## ✅ WHAT YOU ALREADY HAVE WORKING

### Authentication System
- User registration
- Login
- JWT tokens
- All auth endpoints

### Events System  
- Create events
- Get events
- Update events
- Delete events
- My events
- Event details

**Issue**: Mongoose data leak (needs `.lean()` fix)

---

## ⏳ WHAT NEEDS TO BE IMPLEMENTED

Based on your Flutter app's API calls and Postman collection:

### 1. TICKETING SYSTEM (CRITICAL - Week 1)

**What Your Flutter App Needs:**
- `POST /api/tickets` - Purchase tickets
- `POST /api/tickets/validate` - Validate ticket
- `POST /api/tickets/check-in` - Check-in attendee
- `GET /api/tickets/:userId/purchased` - Get user's tickets
- `GET /api/tickets/getParticipants/:id` - Get event participants
- `GET /api/tickets/totalTicketsSold/:eventId` - Get total sold

**Files to Create:**
```
backend/
├── models/
│   └── Ticket.js                    ⏳ NEW
├── controllers/
│   └── ticket.controller.js         ⏳ NEW
├── routes/
│   └── ticket.routes.js             ⏳ NEW
└── utils/
    ├── qrcode.js                    ⏳ NEW
    └── payment.js                   ⏳ NEW
```

**Key Features:**
- Purchase tickets with payment
- Generate QR codes
- Check-in with GPS verification
- Track sold tickets
- Update event.ticketing.soldTickets
- Set event.isSoldOut when tickets run out

### 2. EVENT VERIFICATION SYSTEM (CRITICAL - Week 1)

**Business Logic:**
- When guest checks in → increment event.checkedInGuests
- Calculate: checkInPercentage = (checkedInGuests / soldTickets) × 100
- If checkInPercentage >= 30% → trigger verification
  - Set event.isVerified = true
  - Release escrow payments
  - Distribute revenue to host/co-hosts
  - Release vendor payments
- If < 30% after event ends → refund all tickets

**Files to Update:**
```
backend/
├── controllers/
│   ├── ticket.controller.js         ⏳ Add check-in logic
│   └── event.controller.js          ⏳ Add verification logic
└── utils/
    ├── verification.js              ⏳ NEW
    └── revenue.js                   ⏳ NEW
```

### 3. CO-HOST SYSTEM (HIGH - Week 2)

**What Your Flutter App Needs:**
- `POST /events/:id/cohosts/invite` - Invite co-host
- `GET /cohosts/invitations` - Get invitations
- `POST /cohosts/invitations/:id/accept` - Accept invitation
- `POST /cohosts/invitations/:id/decline` - Decline invitation
- `GET /events/:id/cohosts` - Get event co-hosts
- `DELETE /events/:id/cohosts/:id` - Remove co-host
- `GET /cohosts/dashboard/:eventId` - Co-host dashboard

**Files to Create:**
```
backend/
├── models/
│   ├── CoHost.js                    ⏳ NEW
│   └── CoHostInvitation.js          ⏳ NEW
├── controllers/
│   └── cohost.controller.js         ⏳ NEW
└── routes/
    └── cohost.routes.js             ⏳ NEW
```

### 4. WALLET SYSTEM (MEDIUM - Week 2)

**What Your Flutter App Needs:**
- `GET /wallet/balance` - Get wallet balance
- `GET /wallet/transactions` - Get transaction history
- `POST /wallet/withdraw` - Withdraw funds
- `POST /wallet/topup` - Top-up wallet
- `GET /wallet/earnings` - Get earnings breakdown

**Files to Create:**
```
backend/
├── models/
│   ├── Wallet.js                    ⏳ NEW
│   └── Transaction.js               ⏳ NEW
├── controllers/
│   └── wallet.controller.js         ⏳ NEW
└── routes/
    └── wallet.routes.js             ⏳ NEW
```

### 5. VENDOR SYSTEM (MEDIUM - Week 3)

**What Your Flutter App Needs:**
- `POST /vendor-registration/register` - Register as vendor
- `POST /vendor-registration/documents` - Upload documents
- `POST /vendor-registration/portfolio` - Upload portfolio
- `POST /vendor-registration/bank-details` - Add bank details
- `GET /vendor-registration/profile` - Get vendor profile
- `PATCH /vendor-registration/profile` - Update profile
- `DELETE /vendor-registration/portfolio/:imageId` - Delete image

**Files to Create:**
```
backend/
├── models/
│   ├── Vendor.js                    ⏳ NEW
│   └── VendorDocument.js            ⏳ NEW
├── controllers/
│   └── vendor.controller.js         ⏳ NEW
└── routes/
    └── vendor-registration.routes.js ⏳ NEW
```

### 6. MARKETPLACE & BOOKINGS (MEDIUM - Week 3)

**What Your Flutter App Needs:**
- `POST /marketplace/vendors/me/resources` - Add service
- `GET /marketplace/vendors/me/resources` - Get my services
- `PATCH /marketplace/vendors/me/resources/:id` - Update service
- `DELETE /marketplace/vendors/me/resources/:id` - Delete service
- `GET /marketplace/bookings/requests` - Get booking requests
- `POST /marketplace/bookings/:id/accept` - Accept booking
- `POST /marketplace/bookings/:id/decline` - Decline booking
- `POST /marketplace/bookings/:id/counter-offer` - Counter offer
- `GET /marketplace/vendors/me/stats` - Get vendor stats
- `GET /marketplace/vendors/me` - Get complete profile

**Files to Create:**
```
backend/
├── models/
│   ├── VendorResource.js            ⏳ NEW
│   └── Booking.js                   ⏳ NEW
├── controllers/
│   └── marketplace.controller.js    ⏳ NEW
└── routes/
    └── marketplace.routes.js        ⏳ NEW
```

---

## 🎯 IMPLEMENTATION PRIORITY

### Week 1: Ticketing & Verification (CRITICAL)
**Why**: Your Flutter app has buy ticket UI ready, users need to purchase tickets

**Tasks:**
1. Fix Mongoose data leak in existing Event endpoints (use `.lean()`)
2. Create Ticket model
3. Implement ticket purchase with payment
4. Implement QR code generation
5. Implement check-in with GPS
6. Implement 30% verification logic
7. Implement escrow release

**Deliverable**: Users can buy tickets, check-in, and events get verified

### Week 2: Co-Hosts & Wallet (HIGH)
**Why**: Revenue distribution needs co-host system, wallet needed for payouts

**Tasks:**
1. Create CoHost and CoHostInvitation models
2. Implement invitation system
3. Implement revenue sharing calculation
4. Create Wallet and Transaction models
5. Implement wallet operations
6. Implement earnings tracking by source

**Deliverable**: Co-hosts can be invited, revenue distributed, wallet functional

### Week 3: Vendors & Marketplace (MEDIUM)
**Why**: Complete the ecosystem with vendor services

**Tasks:**
1. Create Vendor models
2. Implement vendor registration
3. Implement service management
4. Implement booking system
5. Implement counter offers
6. Implement vendor payments

**Deliverable**: Full marketplace with vendor bookings

---

## 🔧 IMMEDIATE FIXES NEEDED

### 1. Fix Mongoose Data Leak (30 minutes)

**Problem**: Your backend returns Mongoose internal data

**Solution**: Add `.lean()` to all queries

**Example:**
```javascript
// ❌ BAD
const events = await Event.find();
res.json({ data: events });

// ✅ GOOD
const events = await Event.find().lean();
res.json({ success: true, data: events });
```

**Files to Fix:**
- Event controller - all GET endpoints
- Any other controllers returning Mongoose documents

### 2. Add Ticketing Fields to Event Model (if not already there)

**Check if Event model has:**
```javascript
ticketing: {
  enabled: Boolean,
  price: Number,
  currency: String,
  currencySymbol: String,
  totalTickets: Number,
  availableTickets: Number,
  soldTickets: Number
},
isSoldOut: Boolean,
checkedInGuests: Number,
isVerified: Boolean,
verifiedAt: Date
```

---

## 📝 NEXT STEPS

**I will now:**
1. ✅ NOT touch your existing auth system
2. ✅ NOT recreate your Event model
3. ✅ ONLY create the missing features
4. ✅ Start with Week 1: Ticketing & Verification

**Would you like me to:**
1. Start implementing the Ticketing system?
2. First show you the Ticket model design?
3. Focus on fixing the Mongoose leak first?

Let me know what you'd like me to implement first!
