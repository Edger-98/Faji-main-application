# MVP Workflow Compliance Analysis

## Current Implementation vs. Spec Requirements

### ✅ CORRECT: Navigation Structure
- **Home | Vendors | My Events | Wallet | Profile** - Implemented correctly
- Discovery is public (Home, Vendors) ✅
- Management is private (My Events, Profile) ✅
- Money flows through Wallet only ✅

---

## 7 Core Workflows Analysis

### 1. ✅ Event Creation & Hosting Flow
**Status**: PARTIALLY IMPLEMENTED

**What's Working:**
- Event creation flow exists
- Events are published and visible in Home
- Host dashboard concept exists

**What Needs Backend Support:**
- [ ] Co-host invitation system
- [ ] Revenue split configuration (default 50/50)
- [ ] Co-host list and splits display
- [ ] Attached vendors display on host dashboard

**Backend Requirements:**
```
POST /api/events - Create event
POST /api/events/{id}/co-hosts - Invite co-hosts
PUT /api/events/{id}/revenue-split - Configure splits
GET /api/events/{id}/dashboard - Get host dashboard data
  Response: {
    ticketSales: number,
    revenueSummary: { total, pending, paid },
    coHosts: [{ id, name, split, status }],
    attachedVendors: [{ id, name, service, status }]
  }
```

---

### 2. ❌ Co-Host Flow
**Status**: NOT IMPLEMENTED

**What's Missing:**
- [ ] Co-host invitation acceptance
- [ ] Co-host limited dashboard
- [ ] Permission system for co-hosts
- [ ] Earnings tracking by co-host

**Backend Requirements:**
```
GET /api/co-host/invitations - Get pending invitations
POST /api/co-host/invitations/{id}/accept - Accept invitation
POST /api/co-host/invitations/{id}/decline - Decline invitation
GET /api/co-host/events/{id}/dashboard - Get co-host view
  Response: {
    eventStatus: string,
    revenueEarned: number,
    permissions: [string],
    canEdit: false  // Co-hosts cannot modify core details
  }
```

**Frontend Requirements:**
- Add "Co-Host Invitations" section in My Events
- Create Co-Host dashboard view (limited permissions)
- Show co-host earnings in Wallet (tagged as "Co-hosting")

---

### 3. ✅ Vendor Onboarding & Service Creation
**Status**: IMPLEMENTED

**What's Working:**
- Vendor onboarding flow exists
- Vendor profile creation
- Service creation with categories
- Services visible in Vendors tab
- Vendor Dashboard accessible via Profile

**What Needs Verification:**
- [ ] Pricing model flags (flat rate vs revenue-split eligible)
- [ ] Availability management

**Backend Requirements:**
```
POST /api/vendor/onboard - Complete vendor onboarding
POST /api/vendor/profile - Create vendor profile
POST /api/vendor/services - Create service
  Body: {
    category: string,
    pricingModel: {
      type: "flat_rate" | "revenue_split",
      amount: number,
      revenueSplitEligible: boolean
    },
    availability: { days, hours }
  }
```

---

### 4. ⚠️ Vendor Booking Flow (Host-Initiated Only)
**Status**: PARTIALLY IMPLEMENTED

**What's Working:**
- Vendors tab shows marketplace
- Vendor detail screens exist
- Booking request concept exists

**What Needs Clarification:**
- [ ] Ensure vendors CANNOT apply to events (passive only)
- [ ] Host-initiated booking flow
- [ ] Booking status tracking (Pending → Accepted → Active → Completed)
- [ ] Automatic earnings credit to Wallet on completion

**Backend Requirements:**
```
POST /api/bookings/request - Host sends booking request
  Body: {
    vendorId: string,
    serviceId: string,
    eventId: string,
    message: string
  }

GET /api/bookings/vendor/{vendorId} - Get vendor's bookings
  Response: {
    pending: [Booking],
    accepted: [Booking],
    completed: [Booking]
  }

POST /api/bookings/{id}/accept - Vendor accepts
POST /api/bookings/{id}/decline - Vendor declines
POST /api/bookings/{id}/complete - Mark completed (triggers payment)
```

**Critical Rule:**
- Vendors are PASSIVE participants
- Vendors CANNOT proactively apply to events
- Only hosts can initiate bookings

---

### 5. ✅ Booking Requests (Vendor Management)
**Status**: IMPLEMENTED

**What's Working:**
- Vendor Dashboard accessible via Profile
- Booking requests screen exists with tabs (Pending, Accepted, Completed)

**What Needs Backend Support:**
- [ ] Completed bookings must show:
  - Event reference
  - Service name
  - Amount earned
  - Status

**Backend Requirements:**
```
GET /api/vendor/bookings - Get all bookings
  Response: {
    pending: [{ id, event, service, host, requestDate }],
    accepted: [{ id, event, service, host, eventDate }],
    completed: [{
      id,
      eventReference: string,
      serviceName: string,
      amountEarned: number,
      status: "completed",
      completedDate: string
    }]
  }
```

---

### 6. ❌ Revenue Flow (Critical Logic)
**Status**: NOT IMPLEMENTED

**Critical Order:**
1. Platform fee deducted
2. Vendor flat-rate fees paid
3. Remaining revenue split between Host and Co-Host(s)

**Backend Requirements:**
```
POST /api/revenue/process - Process event revenue
  Body: {
    eventId: string,
    totalRevenue: number
  }
  
  Logic:
  1. platformFee = totalRevenue * platformFeePercentage
  2. remainingAfterPlatform = totalRevenue - platformFee
  3. vendorFees = sum(all vendor flat rates)
  4. remainingForSplit = remainingAfterPlatform - vendorFees
  5. hostShare = remainingForSplit * hostSplitPercentage
  6. coHostShares = remainingForSplit * (1 - hostSplitPercentage) / numberOfCoHosts
  
  Response: {
    platformFee: number,
    vendorPayments: [{ vendorId, amount, source: "hosting" }],
    hostPayment: { userId, amount, source: "hosting" },
    coHostPayments: [{ userId, amount, source: "co-hosting" }]
  }
```

**Wallet Integration:**
- All earnings must be tagged by source: "Hosting", "Co-hosting", "Vendor services"
- No earnings settled outside Wallet
- Transaction history must show source

---

### 7. ✅ Wallet Flow
**Status**: IMPLEMENTED

**What's Working:**
- Wallet tab exists
- Available balance display
- Transaction history
- Filtering by source (All, Hosting, Co-hosting, Vendor)
- Withdrawal actions

**What Needs Backend Support:**
- [ ] Pending payouts tracking
- [ ] Transaction grouping by role and source
- [ ] Withdrawal processing

**Backend Requirements:**
```
GET /api/wallet/balance - Get current balance
  Response: {
    available: number,
    pending: number,
    bySource: {
      hosting: number,
      coHosting: number,
      vendorServices: number
    }
  }

GET /api/wallet/transactions - Get transaction history
  Query: ?source=hosting|co-hosting|vendor
  Response: [{
    id: string,
    type: "credit" | "debit",
    amount: number,
    source: "hosting" | "co-hosting" | "vendor",
    eventReference: string,
    date: string,
    status: "completed" | "pending"
  }]

POST /api/wallet/withdraw - Initiate withdrawal
  Body: {
    amount: number,
    method: string
  }
```

---

## 🚨 CRITICAL ISSUES TO FIX

### 1. Co-Host Marketplace Feature (MISALIGNED)
**Problem:** There's a `cohost_marketplace` feature that treats co-hosts as resources/services to book.

**This is WRONG per your spec:**
- Co-hosts are NOT vendors
- Co-hosts are NOT services to be booked
- Co-hosts are invited collaborators on events
- Co-hosts share revenue, not charge fees

**Action Required:**
- [ ] Remove or repurpose `cohost_marketplace` feature
- [ ] Implement proper co-host invitation system
- [ ] Co-hosts should be managed in event creation flow, not marketplace

### 2. Terminology Inconsistency
**Need to rename everywhere:**
- [ ] "Organizer" → "Host"
- [ ] "Creator" → "Host"
- [ ] "Co-Planner" → "Co-Host"

### 3. Vendor Passive Participation
**Ensure:**
- [ ] Vendors CANNOT apply to events
- [ ] Vendors CANNOT browse events
- [ ] Only hosts can initiate vendor bookings
- [ ] Remove any "Apply to Event" buttons from vendor views

---

## Backend API Endpoints Summary

### Required New Endpoints:
1. **Co-Host Management**
   - `POST /api/events/{id}/co-hosts` - Invite co-host
   - `GET /api/co-host/invitations` - Get invitations
   - `POST /api/co-host/invitations/{id}/accept` - Accept
   - `GET /api/co-host/events/{id}/dashboard` - Co-host view

2. **Revenue Processing**
   - `POST /api/revenue/process` - Process event revenue
   - `GET /api/revenue/breakdown/{eventId}` - Get revenue breakdown

3. **Vendor Bookings**
   - `POST /api/bookings/request` - Host initiates booking
   - `POST /api/bookings/{id}/accept` - Vendor accepts
   - `POST /api/bookings/{id}/complete` - Mark completed
   - `GET /api/bookings/vendor/{vendorId}` - Get vendor bookings

4. **Wallet**
   - `GET /api/wallet/balance` - Get balance with source breakdown
   - `GET /api/wallet/transactions` - Get transaction history
   - `POST /api/wallet/withdraw` - Initiate withdrawal

### Required Endpoint Updates:
1. **Event Creation**
   - Add co-host invitation support
   - Add revenue split configuration
   - Add vendor attachment

2. **Vendor Services**
   - Add pricing model flags (flat_rate vs revenue_split)
   - Add availability management

---

## Frontend Implementation Checklist

### High Priority:
- [ ] Remove/repurpose cohost_marketplace feature
- [ ] Implement co-host invitation flow in event creation
- [ ] Add co-host invitation acceptance in My Events
- [ ] Create co-host limited dashboard view
- [ ] Ensure vendor booking is host-initiated only
- [ ] Add revenue breakdown display for hosts
- [ ] Tag all wallet transactions by source

### Medium Priority:
- [ ] Update all "Organizer" references to "Host"
- [ ] Add co-host management UI in event details
- [ ] Add vendor booking status tracking
- [ ] Implement withdrawal flow in Wallet

### Low Priority:
- [ ] Add revenue split configuration UI
- [ ] Add pending payouts display
- [ ] Add transaction filtering and search

---

## Conclusion

**Overall Compliance: 60%**

**What's Correct:**
✅ Navigation structure
✅ Vendor marketplace (discovery)
✅ Vendor dashboard (management)
✅ Wallet as single source of truth
✅ Profile as management hub

**What Needs Work:**
❌ Co-host system (completely missing)
❌ Revenue processing logic (not implemented)
❌ Co-host marketplace (misaligned concept)
⚠️ Vendor booking flow (needs passive enforcement)
⚠️ Terminology (needs consistent renaming)

**Next Steps:**
1. Remove cohost_marketplace feature
2. Implement co-host invitation system
3. Implement revenue processing logic
4. Ensure vendor passive participation
5. Update terminology consistently
