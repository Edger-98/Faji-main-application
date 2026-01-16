# Ticketing System Implementation

## What You Have
- ✅ Event creation UI with ticketing fields (free/paid, price, total seats)
- ✅ Buy ticket bottom sheet UI
- ✅ Backend on Heroku with auth and events working

## What I'll Implement
1. Ticket model and database schema
2. Ticket purchase endpoint with payment
3. QR code generation
4. Check-in with GPS verification
5. 30% verification logic
6. Escrow payment system

## Implementation Steps

### Step 1: Update Event Model (if needed)
Add ticketing fields to your existing Event schema:
```javascript
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

### Step 2: Create Ticket Model
```javascript
const ticketSchema = new mongoose.Schema({
  ticketNumber: String,
  eventId: ObjectId,
  userId: ObjectId,
  orderId: String,
  qrCode: String,
  price: Number,
  currency: String,
  status: 'valid' | 'used' | 'cancelled' | 'refunded',
  purchaseDate: Date,
  checkedIn: Boolean,
  checkedInAt: Date,
  location: {
    latitude: Number,
    longitude: Number
  }
});
```

### Step 3: Implement Endpoints
- POST /api/tickets - Purchase tickets
- POST /api/tickets/check-in - Check-in with GPS
- GET /api/tickets/:userId/purchased - Get user's tickets
- GET /api/tickets/getParticipants/:id - Get event participants

### Step 4: Test Flow
1. Create event with ticketing enabled
2. Purchase ticket
3. Receive QR code
4. Check-in at event
5. Trigger 30% verification
6. Release payments

Let me implement this now...
