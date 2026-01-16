# Ticket Selling Plan - Complete Strategy

## 🎯 Executive Summary

The ticket selling system is the **core revenue driver** for Faji. Here's the complete plan from ticket creation to revenue distribution.

---

## 📊 Current Status

### ✅ What's Built (Frontend)
- **Buy Ticket Screen** - Ticket selection with quantity counter
- **Payment Screen** - Payment processing UI
- **Payment Success Screen** - Confirmation screen
- **My Events Screen** - View purchased tickets
- **Event Creation Flow** - Includes ticketing setup
- **Wallet Screen** - View earnings and transactions

### ⚠️ What's Missing (Backend)
- Payment gateway integration
- Ticket generation and validation
- Revenue processing logic
- Wallet transaction system
- QR code generation
- Refund/cancellation flow

---

## 🎫 Ticket Selling Flow

### 1. Event Creation (Host Side)

```
Host creates event → Set ticket details → Publish
```

**Ticket Configuration:**
- **Ticket types**: General, VIP, Early Bird, etc.
- **Pricing**: Per ticket type
- **Quantity**: Total tickets available per type
- **Sales period**: Start/end dates
- **Limits**: Max tickets per purchase

**Backend Needs:**
```
POST /api/events
Body: {
  title, description, date, location,
  ticketing: {
    types: [
      {
        name: "General Admission",
        price: 50.00,
        quantity: 100,
        available: 100
      },
      {
        name: "VIP",
        price: 150.00,
        quantity: 20,
        available: 20
      }
    ],
    salesStart: "2025-01-01T00:00:00Z",
    salesEnd: "2025-01-15T23:59:59Z",
    maxPerPurchase: 10
  }
}
```

---

### 2. Ticket Purchase (Guest Side)

```
Browse events → Select event → Buy tickets → Make payment → Receive ticket
```

#### Step 1: Browse & Select
- User sees event in Home feed
- Taps event card → Event details screen
- Sees ticket availability and pricing

#### Step 2: Ticket Selection
**Screen**: `buy_ticket_screen.dart` (already built)

Features:
- Select ticket type
- Choose quantity (+ / - buttons)
- Apply promo code
- See total price calculation
- Proceed to payment

**Backend Needs:**
```
GET /api/events/{id}/tickets
Response: {
  types: [
    {
      id: "ticket_type_1",
      name: "General Admission",
      price: 50.00,
      available: 85,
      description: "Standard entry"
    }
  ],
  maxPerPurchase: 10,
  salesActive: true
}

POST /api/tickets/reserve
Body: {
  eventId: "event_123",
  ticketTypeId: "ticket_type_1",
  quantity: 3
}
Response: {
  reservationId: "res_456",
  expiresAt: "2025-12-26T10:15:00Z", // 15 min hold
  totalAmount: 150.00
}
```

#### Step 3: Payment Processing
**Screen**: `make_payment_screen.dart` (already built)

**Payment Gateway Options:**
1. **Paystack** (Recommended for Nigeria/Africa)
2. **Flutterwave** (Alternative)
3. **Stripe** (International)

**Integration Flow:**
```dart
// 1. Initialize payment
final response = await PaymentService.initializePayment(
  amount: totalAmount,
  email: userEmail,
  reference: reservationId,
);

// 2. Open payment gateway
await PaymentService.openPaymentGateway(
  paymentUrl: response.authorizationUrl,
);

// 3. Verify payment
final verified = await PaymentService.verifyPayment(
  reference: reservationId,
);

// 4. Complete ticket purchase
if (verified) {
  await TicketService.completePurchase(reservationId);
}
```

**Backend Needs:**
```
POST /api/payments/initialize
Body: {
  reservationId: "res_456",
  amount: 150.00,
  currency: "USD",
  email: "user@example.com"
}
Response: {
  paymentId: "pay_789",
  authorizationUrl: "https://paystack.com/pay/xyz",
  reference: "res_456"
}

POST /api/payments/verify
Body: {
  reference: "res_456"
}
Response: {
  status: "success",
  amount: 150.00,
  paidAt: "2025-12-26T10:10:00Z"
}

POST /api/tickets/complete-purchase
Body: {
  reservationId: "res_456",
  paymentId: "pay_789"
}
Response: {
  tickets: [
    {
      id: "ticket_001",
      qrCode: "base64_encoded_qr",
      ticketNumber: "FAJI-2025-001"
    },
    {
      id: "ticket_002",
      qrCode: "base64_encoded_qr",
      ticketNumber: "FAJI-2025-002"
    },
    {
      id: "ticket_003",
      qrCode: "base64_encoded_qr",
      ticketNumber: "FAJI-2025-003"
    }
  ]
}
```

#### Step 4: Ticket Delivery
**Screen**: `payment_successful_screen.dart` (already built)

Features:
- Show success message
- Display ticket details
- Generate QR codes
- Send email confirmation
- Add to "My Tickets"

**Backend Needs:**
```
GET /api/tickets/my-tickets
Response: {
  upcoming: [
    {
      id: "ticket_001",
      eventId: "event_123",
      eventName: "Summer Music Festival",
      eventDate: "2025-01-15T18:00:00Z",
      ticketType: "General Admission",
      qrCode: "base64_encoded_qr",
      ticketNumber: "FAJI-2025-001",
      status: "valid"
    }
  ],
  past: [...],
  cancelled: [...]
}
```

---

## 💰 Revenue Processing Flow

### Critical Order (MUST FOLLOW)

```
Ticket Sale → Platform Fee → Vendor Fees → Revenue Split → Wallet Credit
```

### Step-by-Step Breakdown

#### 1. Ticket Sale Occurs
```
User buys 3 tickets @ $50 each = $150
```

#### 2. Platform Fee (10%)
```
Platform Fee = $150 × 10% = $15
Remaining = $150 - $15 = $135
```

#### 3. Vendor Flat-Rate Fees
```
Vendor 1 (DJ): $500 (flat rate)
Vendor 2 (Photographer): $300 (flat rate)
Total Vendor Fees = $800

Remaining after vendors = $135 - $800 = -$665
```

**Note**: If vendor fees exceed revenue, they're paid from event pool (host responsibility).

#### 4. Revenue Split (Host + Co-Hosts)
```
Remaining Revenue Pool = $135 (if no vendors) or after vendor fees

Host Share (50%) = $67.50
Co-Host 1 Share (25%) = $33.75
Co-Host 2 Share (25%) = $33.75
```

#### 5. Wallet Credit (Source Tagged)
```
Host Wallet: +$67.50 (source: "hosting")
Co-Host 1 Wallet: +$33.75 (source: "co-hosting")
Co-Host 2 Wallet: +$33.75 (source: "co-hosting")
Vendor 1 Wallet: +$500 (source: "vendor")
Vendor 2 Wallet: +$300 (source: "vendor")
Platform: +$15 (platform fee)
```

### Backend Implementation

```
POST /api/revenue/process
Body: {
  eventId: "event_123",
  ticketSaleId: "sale_456",
  amount: 150.00
}

Processing Logic:
1. Calculate platform fee (10%)
2. Deduct vendor flat-rate fees
3. Calculate remaining pool
4. Split pool by revenue shares
5. Create wallet transactions for each recipient
6. Update event revenue totals
7. Send notifications

Response: {
  platformFee: 15.00,
  vendorFees: 800.00,
  revenuePool: -665.00, // Negative = host owes
  distributions: [
    {
      userId: "host_123",
      amount: 67.50,
      source: "hosting",
      walletTransactionId: "wt_001"
    },
    {
      userId: "cohost_456",
      amount: 33.75,
      source: "co-hosting",
      walletTransactionId: "wt_002"
    }
  ]
}
```

---

## 🏦 Wallet System

### Wallet Features

1. **Balance Display**
   - Available balance
   - Pending payouts
   - Breakdown by source (hosting, co-hosting, vendor)

2. **Transaction History**
   - All credits and debits
   - Source tagging
   - Event references
   - Date and status

3. **Withdrawal**
   - Minimum withdrawal amount
   - Bank account linking
   - Processing time (1-3 business days)
   - Withdrawal fees (if any)

### Backend Needs

```
GET /api/wallet/balance
Response: {
  available: 1250.00,
  pending: 350.00,
  bySource: {
    hosting: 800.00,
    coHosting: 250.00,
    vendor: 200.00
  },
  currency: "USD"
}

GET /api/wallet/transactions
Query: ?source=hosting&limit=20&offset=0
Response: {
  transactions: [
    {
      id: "wt_001",
      type: "credit",
      amount: 67.50,
      source: "hosting",
      eventId: "event_123",
      eventName: "Summer Music Festival",
      description: "Ticket sales revenue",
      date: "2025-12-26T10:15:00Z",
      status: "completed"
    }
  ],
  total: 45,
  hasMore: true
}

POST /api/wallet/withdraw
Body: {
  amount: 500.00,
  bankAccountId: "bank_123",
  currency: "USD"
}
Response: {
  withdrawalId: "wd_456",
  amount: 500.00,
  fee: 5.00,
  netAmount: 495.00,
  status: "pending",
  estimatedArrival: "2025-12-29T00:00:00Z"
}
```

---

## 🎟️ Ticket Validation System

### At Event Entry

```
Guest arrives → Shows QR code → Host scans → Validates → Entry granted/denied
```

### Validation Flow

1. **Host/Staff Scans QR Code**
   - Use device camera
   - Read QR code data
   - Send to backend for validation

2. **Backend Validates**
   - Check ticket exists
   - Verify not already used
   - Confirm event match
   - Check ticket status (valid/cancelled/refunded)

3. **Response**
   - ✅ Valid: Mark as used, grant entry
   - ❌ Invalid: Show reason, deny entry

### Backend Needs

```
POST /api/tickets/validate
Body: {
  ticketId: "ticket_001",
  eventId: "event_123",
  scannedBy: "host_123",
  scannedAt: "2025-01-15T18:05:00Z"
}
Response: {
  valid: true,
  ticket: {
    id: "ticket_001",
    ticketNumber: "FAJI-2025-001",
    ticketType: "General Admission",
    holderName: "John Doe",
    holderEmail: "john@example.com",
    purchaseDate: "2025-12-26T10:15:00Z"
  },
  message: "Valid ticket - Entry granted"
}

// If invalid:
Response: {
  valid: false,
  reason: "already_used",
  usedAt: "2025-01-15T18:03:00Z",
  message: "This ticket has already been scanned"
}
```

---

## 🔄 Refund & Cancellation Flow

### Refund Scenarios

1. **Event Cancelled by Host**
   - Full refund to all ticket holders
   - Automatic processing
   - Email notifications

2. **User Requests Refund**
   - Within refund window (e.g., 7 days before event)
   - Partial refund (minus processing fee)
   - Requires approval

3. **Dispute/Fraud**
   - Manual review
   - Case-by-case basis

### Backend Needs

```
POST /api/tickets/refund
Body: {
  ticketId: "ticket_001",
  reason: "event_cancelled",
  refundAmount: 50.00
}
Response: {
  refundId: "ref_789",
  amount: 50.00,
  status: "processing",
  estimatedCompletion: "2025-12-28T00:00:00Z"
}

POST /api/events/{id}/cancel
Body: {
  reason: "Venue unavailable",
  refundAll: true
}
Response: {
  eventId: "event_123",
  ticketsToRefund: 85,
  totalRefundAmount: 4250.00,
  refundIds: ["ref_790", "ref_791", ...],
  status: "processing"
}
```

---

## 📊 Host Dashboard - Ticket Sales

### What Hosts See

**Screen**: `event_details_tabbed_screen.dart` → Dashboard Tab

**Metrics:**
- Total tickets sold / Total tickets
- Revenue generated
- Tickets by type breakdown
- Sales over time graph
- Recent purchases list

### Backend Needs

```
GET /api/events/{id}/dashboard
Response: {
  ticketSales: {
    total: 85,
    available: 15,
    byType: [
      {
        name: "General Admission",
        sold: 75,
        available: 25,
        revenue: 3750.00
      },
      {
        name: "VIP",
        sold: 10,
        available: 10,
        revenue: 1500.00
      }
    ]
  },
  revenue: {
    gross: 5250.00,
    platformFee: 525.00,
    vendorFees: 800.00,
    net: 3925.00,
    yourShare: 1962.50, // 50% as host
    pending: 1962.50,
    paid: 0.00
  },
  recentPurchases: [
    {
      buyerName: "John Doe",
      ticketType: "General Admission",
      quantity: 2,
      amount: 100.00,
      purchaseDate: "2025-12-26T10:15:00Z"
    }
  ],
  salesChart: {
    labels: ["Dec 20", "Dec 21", "Dec 22", ...],
    data: [5, 12, 8, 15, 20, 10, 15]
  }
}
```

---

## 🚀 Implementation Priority

### Phase 1: Core Ticket Selling (2 weeks)
**Priority**: CRITICAL

1. **Payment Gateway Integration** (5 days)
   - Choose provider (Paystack recommended)
   - Integrate SDK
   - Test payment flow
   - Handle webhooks

2. **Ticket Generation** (3 days)
   - Create ticket records
   - Generate QR codes
   - Email delivery
   - PDF generation

3. **Basic Revenue Processing** (4 days)
   - Platform fee calculation
   - Wallet credit system
   - Transaction records

4. **My Tickets Screen** (2 days)
   - Connect to API
   - Display purchased tickets
   - Show QR codes

### Phase 2: Advanced Features (2 weeks)

1. **Ticket Validation** (3 days)
   - QR scanner for hosts
   - Validation API
   - Entry tracking

2. **Revenue Split Logic** (4 days)
   - Co-host revenue sharing
   - Vendor fee deduction
   - Complex calculations

3. **Refund System** (4 days)
   - Refund processing
   - Event cancellation flow
   - Dispute handling

4. **Host Dashboard** (3 days)
   - Sales analytics
   - Revenue breakdown
   - Real-time updates

### Phase 3: Optimization (1 week)

1. **Promo Codes** (2 days)
2. **Ticket Tiers** (2 days)
3. **Group Purchases** (2 days)
4. **Waitlist** (1 day)

---

## 💡 Key Decisions Needed

### 1. Payment Gateway
**Options:**
- ✅ **Paystack** (Recommended)
  - Best for Nigeria/Africa
  - Lower fees (1.5% + ₦100)
  - Easy integration
  - Good documentation

- **Flutterwave**
  - Alternative option
  - Similar features
  - Slightly higher fees

- **Stripe**
  - International focus
  - Higher fees in Africa
  - Best for global expansion

**Recommendation**: Start with Paystack, add Stripe later for international.

### 2. Platform Fee
**Current Plan**: 10% of ticket sales

**Considerations:**
- Industry standard: 5-15%
- Competitors: Eventbrite (3.5% + $1.59), Ticketmaster (varies)
- Our value: Vendor marketplace, co-host system, wallet

**Recommendation**: 10% is fair, review after 6 months.

### 3. Payout Schedule
**Options:**
- Immediate (after event)
- Weekly batch
- Monthly batch
- On-demand (with fee)

**Recommendation**: 
- Automatic payout 3 days after event
- On-demand available (2% fee)

### 4. Refund Policy
**Options:**
- Full refund up to 7 days before
- Partial refund (minus 10% fee)
- No refunds (strict)

**Recommendation**:
- Full refund if event cancelled
- Partial refund (90%) up to 7 days before
- No refund within 7 days (unless special case)

---

## 📈 Success Metrics

### Track These KPIs:

1. **Ticket Sales**
   - Total tickets sold
   - Average ticket price
   - Conversion rate (views → purchases)

2. **Revenue**
   - Gross merchandise value (GMV)
   - Platform fee revenue
   - Average order value

3. **User Behavior**
   - Time to purchase
   - Cart abandonment rate
   - Repeat purchase rate

4. **Payment**
   - Payment success rate
   - Failed payment reasons
   - Refund rate

5. **Host Satisfaction**
   - Payout speed
   - Dashboard usage
   - Support tickets

---

## 🎯 Next Immediate Steps

1. **Choose Payment Gateway** (Today)
   - Sign up for Paystack
   - Get API keys
   - Review documentation

2. **Design Database Schema** (Tomorrow)
   - Tickets table
   - Transactions table
   - Wallet balances table

3. **Build Payment API** (This Week)
   - Initialize payment endpoint
   - Verify payment endpoint
   - Webhook handler

4. **Test Payment Flow** (Next Week)
   - Test purchases
   - Test refunds
   - Test edge cases

5. **Deploy to Staging** (Week After)
   - Internal testing
   - Fix bugs
   - Prepare for production

---

## 📞 Support & Questions

For implementation questions:
- **Backend Team**: Implement APIs from this spec
- **Frontend Team**: Connect existing screens to APIs
- **Product Team**: Review and approve payment gateway choice
- **Finance Team**: Set up merchant accounts

**This is the complete ticket selling plan. Frontend is ready. Backend needs to implement these APIs to go live.** 🚀
