# Ticketing System - Verification Checklist

## ✅ Files Created

### Backend Files
- [x] `backend/models/Ticket.js` - Ticket model with all fields
- [x] `backend/controllers/ticket.controller.js` - All 6 endpoints
- [x] `backend/routes/ticket.routes.js` - Route configuration
- [x] `backend/test-ticketing.sh` - Test script

### Flutter App
- [x] `lib/core/config/api_config.dart` - Updated to use localhost

---

## 📋 Pre-Test Requirements

Before testing, ensure you have:

### 1. Backend Setup
```bash
# Your backend should have these files:
backend/
├── server.js (or app.js/index.js)
├── package.json
├── .env
├── models/
│   ├── User.js
│   ├── Event.js
│   └── Ticket.js ✅ NEW
├── controllers/
│   ├── auth.controller.js
│   ├── event.controller.js
│   └── ticket.controller.js ✅ NEW
├── routes/
│   ├── auth.routes.js
│   ├── event.routes.js
│   └── ticket.routes.js ✅ NEW
└── middleware/
    └── auth.js
```

### 2. Dependencies Required
```json
{
  "dependencies": {
    "express": "^4.18.2",
    "mongoose": "^8.0.3",
    "qrcode": "^1.5.3",  // ⚠️ REQUIRED for QR generation
    "jsonwebtoken": "^9.0.2",
    "bcryptjs": "^2.4.3",
    "dotenv": "^16.3.1",
    "cors": "^2.8.5"
  }
}
```

**ACTION NEEDED**: Install qrcode package
```bash
npm install qrcode
```

### 3. Server.js Must Include Ticket Routes
```javascript
// In your server.js or app.js
app.use('/api/v1/tickets', require('./routes/ticket.routes'));
```

### 4. Event Model Must Have Ticketing Fields
```javascript
// In your Event model
ticketing: {
  enabled: { type: Boolean, default: false },
  price: { type: Number, default: 0 },
  currency: { type: String, default: 'NGN' },
  currencySymbol: { type: String, default: '₦' },
  totalTickets: { type: Number, default: 0 },
  availableTickets: { type: Number, default: 0 },
  soldTickets: { type: Number, default: 0 }
},
isSoldOut: { type: Boolean, default: false },
checkedInGuests: { type: Number, default: 0 },
isVerified: { type: Boolean, default: false },
verifiedAt: Date
```

---

## 🧪 Testing Steps

### Step 1: Install Dependencies
```bash
cd [your-backend-directory]
npm install qrcode
```

### Step 2: Add Ticket Routes to Server
Add this line to your server.js:
```javascript
app.use('/api/v1/tickets', require('./routes/ticket.routes'));
```

### Step 3: Start Backend
```bash
npm start
# or
npm run dev
```

Verify it's running:
```bash
curl http://localhost:5001/health
```

### Step 4: Run Manual Tests

#### Test 1: Register/Login
```bash
# Register
curl -X POST http://localhost:5001/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "password123",
    "userName": "Test User",
    "phoneNo": "+1234567890"
  }'

# Login (save the token)
curl -X POST http://localhost:5001/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "password123"
  }'
```

#### Test 2: Create Event with Ticketing
```bash
TOKEN="YOUR_TOKEN_FROM_LOGIN"

curl -X POST http://localhost:5001/api/v1/events \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "name": "Test Concert",
    "description": "Test event with tickets",
    "category": "Concert",
    "emoji": "🎵",
    "startDate": "2024-12-31T18:00:00Z",
    "endDate": "2024-12-31T23:00:00Z",
    "location": {
      "address": "123 Main St",
      "latitude": 6.5244,
      "longitude": 3.3792
    },
    "ticketing": {
      "enabled": true,
      "price": 5000,
      "currency": "NGN",
      "currencySymbol": "₦",
      "totalTickets": 100
    }
  }'
```

#### Test 3: Purchase Tickets
```bash
EVENT_ID="EVENT_ID_FROM_STEP_2"

curl -X POST http://localhost:5001/api/v1/tickets \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d "{
    \"eventId\": \"$EVENT_ID\",
    \"quantity\": 2,
    \"promoCode\": \"EARLY2024\",
    \"paymentMethod\": \"stripe\"
  }"
```

**Expected Response**:
```json
{
  "success": true,
  "data": {
    "orderId": "ord_...",
    "tickets": [
      {
        "id": "...",
        "ticketNumber": "TKT-TES-...",
        "qrCode": "data:image/png;base64,..."
      }
    ],
    "payment": {
      "subtotal": 10000,
      "discount": 1000,
      "platformFee": 900,
      "total": 9900,
      "currency": "NGN"
    }
  }
}
```

#### Test 4: Get Purchased Tickets
```bash
USER_ID="YOUR_USER_ID"

curl -X GET "http://localhost:5001/api/v1/tickets/$USER_ID/purchased" \
  -H "Authorization: Bearer $TOKEN"
```

#### Test 5: Check-In
```bash
TICKET_ID="TICKET_ID_FROM_PURCHASE"

curl -X POST http://localhost:5001/api/v1/tickets/check-in \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d "{
    \"ticketId\": \"$TICKET_ID\",
    \"eventId\": \"$EVENT_ID\",
    \"location\": {
      \"latitude\": 6.5244,
      \"longitude\": 3.3792,
      \"accuracy\": 10
    }
  }"
```

**Expected Response**:
```json
{
  "success": true,
  "data": {
    "checkedIn": true,
    "checkedInAt": "2024-12-26T...",
    "eventVerification": {
      "checkInPercentage": 2,
      "isVerified": false
    }
  }
}
```

---

## ✅ Success Criteria

Mark each as complete after testing:

### Backend Tests
- [ ] Backend starts without errors
- [ ] `/health` endpoint responds
- [ ] Can register/login user
- [ ] Can create event with ticketing
- [ ] Can purchase tickets
- [ ] QR codes are generated
- [ ] Can get purchased tickets
- [ ] Can check-in attendee
- [ ] GPS validation works (rejects if > 100m)
- [ ] 30% verification triggers (test with 30+ tickets)
- [ ] Event ticket counts update correctly
- [ ] isSoldOut flag works

### Database Verification
- [ ] Tickets collection created
- [ ] Tickets have all required fields
- [ ] Event.ticketing fields populated
- [ ] Event.checkedInGuests increments
- [ ] Event.isVerified updates at 30%

### Flutter App Tests
- [ ] App connects to localhost:5001
- [ ] Can create event with ticketing
- [ ] Buy ticket bottom sheet works
- [ ] Can purchase tickets
- [ ] QR codes display correctly
- [ ] Can view purchased tickets

---

## 🐛 Common Issues & Solutions

### Issue 1: "Cannot find module 'qrcode'"
**Solution**: 
```bash
npm install qrcode
```

### Issue 2: "Cannot POST /api/v1/tickets"
**Solution**: Add ticket routes to server.js:
```javascript
app.use('/api/v1/tickets', require('./routes/ticket.routes'));
```

### Issue 3: "Event not found"
**Solution**: Make sure event was created successfully and use correct EVENT_ID

### Issue 4: "Ticketing not enabled"
**Solution**: Ensure event has `ticketing.enabled: true` when creating

### Issue 5: "Location mismatch"
**Solution**: Use same coordinates as event location (within 100m)

---

## 📊 Test Results Template

```
TICKETING SYSTEM TEST RESULTS
Date: ___________
Tester: ___________

Backend Tests:
[ ] Server starts: ___________
[ ] Purchase tickets: ___________
[ ] QR generation: ___________
[ ] Check-in: ___________
[ ] Verification: ___________

Flutter App Tests:
[ ] Create event: ___________
[ ] Buy tickets: ___________
[ ] View tickets: ___________

Issues Found:
1. ___________
2. ___________

Status: [ ] PASS  [ ] FAIL
Notes: ___________
```

---

## 🎯 Next Steps After Verification

Once all tests pass:
1. ✅ Mark ticketing as COMPLETE
2. Document any issues found
3. Move to next phase (Co-Host System)
4. Deploy to Heroku

---

## 📞 Need Help?

If tests fail:
1. Check backend logs for errors
2. Verify MongoDB is running
3. Check all dependencies installed
4. Verify routes are registered
5. Test with Postman first before Flutter app

---

**STATUS**: ⏳ AWAITING VERIFICATION

Please run the tests and confirm:
- [ ] All backend tests pass
- [ ] Flutter app can purchase tickets
- [ ] QR codes work
- [ ] Check-in works
- [ ] 30% verification triggers

Once confirmed, we'll move to the next phase! 🚀
