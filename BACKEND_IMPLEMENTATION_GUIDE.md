# Backend Implementation Guide - Faji MVP

## 🎯 Overview

This document contains ALL backend requirements for the Faji MVP. The frontend is 100% complete and waiting for these APIs.

**Core Principle**: Discovery is public. Management is private. Money flows only through Wallet.

---

## 🚨 CRITICAL BUSINESS RULES

### 1. Co-Hosts Are NOT Vendors
- Co-hosts are invited collaborators who share revenue
- Co-hosts have READ-ONLY permissions (cannot edit core event details)
- Co-hosts are managed in event creation flow, NOT marketplace

### 2. Revenue Processing Order (STRICT)
```
1. Deduct platform fee (10%)
2. Pay vendor flat-rate fees
3. Split remaining revenue between Host and Co-Host(s)
4. Credit all to Wallet with source tags
```

### 3. Vendor Passive Participation
- Vendors CANNOT apply to events
- Vendors CANNOT browse events
- Only hosts can initiate vendor bookings

### 4. Wallet Source Tagging (REQUIRED)
All transactions MUST be tagged: `"hosting"`, `"co-hosting"`, or `"vendor"`

---

## 📊 DATABASE SCHEMAS

### 1. Co-Host Invitations
```sql
CREATE TABLE cohost_invitations (
  id VARCHAR(255) PRIMARY KEY,
  event_id VARCHAR(255) NOT NULL,
  user_id VARCHAR(255) NOT NULL,
  invited_by VARCHAR(255) NOT NULL,
  revenue_share DECIMAL(5,2) NOT NULL DEFAULT 50.00,
  status ENUM('pending', 'accepted', 'declined') NOT NULL DEFAULT 'pending',
  message TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (event_id) REFERENCES events(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (invited_by) REFERENCES users(id)
);
```

### 2. Event Co-Hosts
```sql
CREATE TABLE event_cohosts (
  id VARCHAR(255) PRIMARY KEY,
  event_id VARCHAR(255) NOT NULL,
  user_id VARCHAR(255) NOT NULL,
  revenue_share DECIMAL(5,2) NOT NULL,
  permissions JSON,
  joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (event_id) REFERENCES events(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  UNIQUE KEY unique_event_cohost (event_id, user_id)
);
```

### 3. Revenue Transactions
```sql
CREATE TABLE revenue_transactions (
  id VARCHAR(255) PRIMARY KEY,
  event_id VARCHAR(255) NOT NULL,
  total_revenue DECIMAL(10,2) NOT NULL,
  platform_fee DECIMAL(10,2) NOT NULL,
  vendor_fees DECIMAL(10,2) NOT NULL,
  revenue_pool DECIMAL(10,2) NOT NULL,
  status ENUM('pending', 'processed', 'failed') NOT NULL DEFAULT 'pending',
  processed_at TIMESTAMP NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (event_id) REFERENCES events(id)
);
```

### 4. Wallet Transactions
```sql
CREATE TABLE wallet_transactions (
  id VARCHAR(255) PRIMARY KEY,
  user_id VARCHAR(255) NOT NULL,
  type ENUM('credit', 'debit') NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  source ENUM('hosting', 'co-hosting', 'vendor') NOT NULL,
  event_id VARCHAR(255),
  service_id VARCHAR(255),
  status ENUM('pending', 'completed', 'failed') NOT NULL DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (event_id) REFERENCES events(id)
);
```

### 5. Wallet Balances
```sql
CREATE TABLE wallet_balances (
  user_id VARCHAR(255) PRIMARY KEY,
  available_balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  pending_balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  hosting_balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  cohosting_balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  vendor_balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### 6. Vendor Bookings
```sql
CREATE TABLE vendor_bookings (
  id VARCHAR(255) PRIMARY KEY,
  vendor_id VARCHAR(255) NOT NULL,
  service_id VARCHAR(255) NOT NULL,
  event_id VARCHAR(255) NOT NULL,
  host_id VARCHAR(255) NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  status ENUM('pending', 'accepted', 'declined', 'completed', 'cancelled') NOT NULL DEFAULT 'pending',
  message TEXT,
  decline_reason TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  accepted_at TIMESTAMP NULL,
  declined_at TIMESTAMP NULL,
  completed_at TIMESTAMP NULL,
  FOREIGN KEY (vendor_id) REFERENCES users(id),
  FOREIGN KEY (service_id) REFERENCES vendor_services(id),
  FOREIGN KEY (event_id) REFERENCES events(id),
  FOREIGN KEY (host_id) REFERENCES users(id)
);
```

### 7. Vendor Services (Update Existing)
```sql
ALTER TABLE vendor_services ADD COLUMN pricing_model ENUM('flat_rate', 'revenue_split') NOT NULL DEFAULT 'flat_rate';
ALTER TABLE vendor_services ADD COLUMN revenue_split_eligible BOOLEAN DEFAULT FALSE;
ALTER TABLE vendor_services ADD COLUMN availability JSON;
```

---

## 🔌 API ENDPOINTS

## PHASE 1: CO-HOST SYSTEM

### 1.1 Invite Co-Hosts
```
POST /api/events/{eventId}/co-hosts
Authorization: Bearer {token}

Request:
{
  "userIds": ["user_123", "user_456"],
  "revenueShare": 50,
  "message": "Would you like to co-host this event?"
}

Response (201):
{
  "success": true,
  "invitations": [{
    "id": "inv_123",
    "eventId": "event_789",
    "userId": "user_123",
    "status": "pending",
    "revenueShare": 50,
    "createdAt": "2025-12-24T10:00:00Z"
  }]
}

Rules:
- Only event host can invite
- Default revenue share is 50/50
- Send notification to invited users
```

### 1.2 Get Co-Host Invitations
```
GET /api/co-host/invitations
Authorization: Bearer {token}

Response (200):
{
  "invitations": [{
    "id": "inv_123",
    "eventId": "event_789",
    "eventName": "Summer Music Festival 2025",
    "eventDate": "2025-07-15T18:00:00Z",
    "hostId": "user_001",
    "hostName": "John Doe",
    "revenueShare": 50,
    "status": "pending",
    "invitedAt": "2025-12-22T10:00:00Z"
  }]
}
```

### 1.3 Accept Co-Host Invitation
```
POST /api/co-host/invitations/{invitationId}/accept
Authorization: Bearer {token}

Response (200):
{
  "success": true,
  "message": "You are now a co-host",
  "coHostRole": {
    "eventId": "event_789",
    "userId": "user_123",
    "revenueShare": 50,
    "permissions": ["view_details", "view_attendees", "view_revenue"],
    "canEdit": false
  }
}

Rules:
- User becomes co-host immediately
- Co-host CANNOT edit core event details
- Send notification to host
```

### 1.4 Decline Co-Host Invitation
```
POST /api/co-host/invitations/{invitationId}/decline
Authorization: Bearer {token}

Response (200):
{
  "success": true,
  "message": "Invitation declined"
}
```

### 1.5 Get Co-Host Dashboard
```
GET /api/co-host/events/{eventId}/dashboard
Authorization: Bearer {token}

Response (200):
{
  "event": {
    "id": "event_789",
    "name": "Summer Music Festival 2025",
    "date": "2025-07-15T18:00:00Z",
    "status": "active"
  },
  "earnings": {
    "total": 1250.00,
    "revenueShare": 50,
    "status": "pending"
  },
  "permissions": {
    "canViewDetails": true,
    "canViewAttendees": true,
    "canViewRevenue": true,
    "canEditEvent": false,
    "canDeleteEvent": false
  },
  "host": {
    "id": "user_001",
    "name": "John Doe"
  }
}
```

---

## PHASE 2: REVENUE PROCESSING & WALLET

### 2.1 Process Event Revenue
```
POST /api/revenue/process
Authorization: Bearer {token}

Request:
{
  "eventId": "event_789",
  "totalRevenue": 5000.00
}

Response (200):
{
  "success": true,
  "breakdown": {
    "totalRevenue": 5000.00,
    "platformFee": 500.00,
    "platformFeePercentage": 10,
    "remainingAfterPlatform": 4500.00,
    "vendorPayments": [{
      "vendorId": "vendor_001",
      "vendorName": "Elite Photography Studio",
      "amount": 500.00,
      "pricingModel": "flat_rate"
    }],
    "totalVendorFees": 1000.00,
    "revenuePool": 3500.00,
    "hostPayment": {
      "userId": "user_001",
      "amount": 1750.00,
      "percentage": 50,
      "source": "hosting"
    },
    "coHostPayments": [{
      "userId": "user_123",
      "amount": 1750.00,
      "percentage": 50,
      "source": "co-hosting"
    }]
  }
}

Processing Logic:
1. platformFee = totalRevenue * 0.10
2. remainingAfterPlatform = totalRevenue - platformFee
3. vendorFees = sum(all vendor flat rates)
4. revenuePool = remainingAfterPlatform - vendorFees
5. hostShare = revenuePool * 0.50
6. coHostShare = revenuePool * 0.50
7. Credit all to Wallet with source tags
```

### 2.2 Get Revenue Breakdown
```
GET /api/revenue/breakdown/{eventId}
Authorization: Bearer {token}

Response (200):
{
  "eventId": "event_789",
  "eventName": "Summer Music Festival 2025",
  "totalRevenue": 5000.00,
  "breakdown": {
    "grossRevenue": 5000.00,
    "platformFee": -500.00,
    "vendorFees": -1000.00,
    "revenuePool": 3500.00,
    "hostShare": 1750.00,
    "coHostShares": [{
      "userId": "user_123",
      "userName": "Jane Smith",
      "amount": 1750.00
    }]
  },
  "status": "processed",
  "processedAt": "2025-07-16T10:00:00Z"
}
```

### 2.3 Get Wallet Balance
```
GET /api/wallet/balance
Authorization: Bearer {token}

Response (200):
{
  "userId": "user_001",
  "balance": {
    "available": 5000.00,
    "pending": 1500.00,
    "total": 6500.00
  },
  "bySource": {
    "hosting": 3000.00,
    "coHosting": 1500.00,
    "vendor": 2000.00
  }
}
```

### 2.4 Get Transaction History
```
GET /api/wallet/transactions?source={source}&limit={limit}&offset={offset}
Authorization: Bearer {token}

Query Parameters:
- source (optional): hosting, co-hosting, vendor
- status (optional): completed, pending
- limit (optional): default 50
- offset (optional): default 0

Response (200):
{
  "transactions": [{
    "id": "txn_001",
    "type": "credit",
    "amount": 1750.00,
    "source": "hosting",
    "eventId": "event_789",
    "eventName": "Summer Music Festival 2025",
    "status": "completed",
    "date": "2025-07-16T10:00:00Z"
  }],
  "pagination": {
    "total": 25,
    "limit": 50,
    "offset": 0
  }
}
```

### 2.5 Initiate Withdrawal
```
POST /api/wallet/withdraw
Authorization: Bearer {token}

Request:
{
  "amount": 1000.00,
  "method": "bank_transfer",
  "bankDetails": {
    "accountNumber": "1234567890",
    "bankName": "Example Bank",
    "accountName": "John Doe"
  }
}

Response (200):
{
  "success": true,
  "withdrawal": {
    "id": "withdrawal_001",
    "amount": 1000.00,
    "method": "bank_transfer",
    "status": "pending",
    "estimatedArrival": "2025-12-27T00:00:00Z",
    "createdAt": "2025-12-24T10:00:00Z"
  }
}
```

---

## PHASE 3: VENDOR BOOKING SYSTEM

### 3.1 Send Booking Request (Host-Initiated)
```
POST /api/bookings/request
Authorization: Bearer {token}

Request:
{
  "vendorId": "vendor_001",
  "serviceId": "service_123",
  "eventId": "event_789",
  "message": "We would love your photography services!"
}

Response (201):
{
  "success": true,
  "booking": {
    "id": "booking_001",
    "vendorId": "vendor_001",
    "vendorName": "Elite Photography Studio",
    "serviceId": "service_123",
    "serviceName": "Event Photography",
    "eventId": "event_789",
    "eventName": "Summer Music Festival 2025",
    "hostId": "user_001",
    "hostName": "John Doe",
    "amount": 500.00,
    "status": "pending",
    "createdAt": "2025-12-24T10:00:00Z"
  }
}

Rules:
- Only event host can send booking requests
- Vendor receives notification
- Booking starts in "pending" status
```

### 3.2 Get Vendor Bookings
```
GET /api/bookings/vendor/{vendorId}
Authorization: Bearer {token}

Response (200):
{
  "vendorId": "vendor_001",
  "bookings": {
    "pending": [{
      "id": "booking_001",
      "eventId": "event_789",
      "eventName": "Summer Music Festival 2025",
      "eventDate": "2025-07-15T18:00:00Z",
      "serviceId": "service_123",
      "serviceName": "Event Photography",
      "hostId": "user_001",
      "hostName": "John Doe",
      "amount": 500.00,
      "message": "We would love your services!",
      "requestDate": "2025-12-24T10:00:00Z"
    }],
    "accepted": [{
      "id": "booking_002",
      "eventId": "event_456",
      "eventName": "Tech Conference 2025",
      "eventDate": "2025-08-20T09:00:00Z",
      "serviceId": "service_123",
      "serviceName": "Event Photography",
      "hostId": "user_002",
      "hostName": "Jane Doe",
      "amount": 500.00,
      "acceptedDate": "2025-12-20T10:00:00Z"
    }],
    "completed": [{
      "id": "booking_003",
      "eventReference": "EVT-2025-001",
      "eventName": "Charity Fundraiser",
      "serviceId": "service_123",
      "serviceName": "Event Photography",
      "amountEarned": 500.00,
      "status": "completed",
      "completedDate": "2025-12-10T10:00:00Z"
    }]
  }
}
```

### 3.3 Accept Booking Request
```
POST /api/bookings/{bookingId}/accept
Authorization: Bearer {token}

Response (200):
{
  "success": true,
  "message": "Booking accepted successfully",
  "booking": {
    "id": "booking_001",
    "status": "accepted",
    "acceptedAt": "2025-12-24T10:00:00Z"
  }
}

Rules:
- Only vendor can accept their own bookings
- Status changes from "pending" to "accepted"
- Send notification to host
```

### 3.4 Decline Booking Request
```
POST /api/bookings/{bookingId}/decline
Authorization: Bearer {token}

Request:
{
  "reason": "Already booked for that date"
}

Response (200):
{
  "success": true,
  "message": "Booking declined",
  "booking": {
    "id": "booking_001",
    "status": "declined",
    "declinedAt": "2025-12-24T10:00:00Z",
    "reason": "Already booked for that date"
  }
}

Rules:
- Only vendor can decline their own bookings
- Send notification to host with reason
```

### 3.5 Mark Booking as Completed
```
POST /api/bookings/{bookingId}/complete
Authorization: Bearer {token}

Response (200):
{
  "success": true,
  "message": "Booking marked as completed",
  "booking": {
    "id": "booking_001",
    "status": "completed",
    "completedAt": "2025-07-16T10:00:00Z"
  },
  "payment": {
    "vendorId": "vendor_001",
    "amount": 500.00,
    "source": "vendor",
    "transactionId": "txn_001",
    "status": "completed"
  }
}

Rules:
- Can only be marked complete after event date
- Triggers automatic payment to vendor
- Payment credited to vendor's wallet
- Tagged as "vendor" source
```

### 3.6 Get Host's Vendor Bookings
```
GET /api/bookings/host/{eventId}
Authorization: Bearer {token}

Response (200):
{
  "eventId": "event_789",
  "eventName": "Summer Music Festival 2025",
  "bookings": [{
    "id": "booking_001",
    "vendorId": "vendor_001",
    "vendorName": "Elite Photography Studio",
    "serviceId": "service_123",
    "serviceName": "Event Photography",
    "amount": 500.00,
    "status": "accepted"
  }]
}
```

### 3.7 Create Vendor Service
```
POST /api/vendor/services
Authorization: Bearer {token}

Request:
{
  "name": "Event Photography Package",
  "description": "Professional event photography with 500+ edited photos",
  "category": "photography",
  "pricingModel": {
    "type": "flat_rate",
    "amount": 500.00,
    "revenueSplitEligible": false
  },
  "availability": {
    "days": ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"],
    "hours": {
      "start": "09:00",
      "end": "23:00"
    }
  },
  "images": ["url1", "url2"]
}

Response (201):
{
  "success": true,
  "service": {
    "id": "service_123",
    "vendorId": "vendor_001",
    "name": "Event Photography Package",
    "category": "photography",
    "pricingModel": {
      "type": "flat_rate",
      "amount": 500.00,
      "revenueSplitEligible": false
    },
    "status": "active",
    "createdAt": "2025-12-24T10:00:00Z"
  }
}
```

---

## ✅ IMPLEMENTATION CHECKLIST

### Phase 1: Co-Host System (Week 1)
- [ ] Create `cohost_invitations` table
- [ ] Create `event_cohosts` table
- [ ] Implement invite co-hosts endpoint
- [ ] Implement get invitations endpoint
- [ ] Implement accept invitation endpoint
- [ ] Implement decline invitation endpoint
- [ ] Implement co-host dashboard endpoint
- [ ] Set up notification system for invitations
- [ ] Validate only hosts can invite
- [ ] Enforce co-host read-only permissions

### Phase 2: Revenue & Wallet (Week 2)
- [ ] Create `revenue_transactions` table
- [ ] Create `wallet_transactions` table
- [ ] Create `wallet_balances` table
- [ ] Implement revenue processing endpoint (strict order)
- [ ] Implement revenue breakdown endpoint
- [ ] Implement wallet balance endpoint
- [ ] Implement transaction history endpoint
- [ ] Implement withdrawal endpoint
- [ ] Set up transaction source tagging
- [ ] Implement balance tracking by source

### Phase 3: Vendor Booking (Week 3)
- [ ] Create `vendor_bookings` table
- [ ] Update `vendor_services` table
- [ ] Implement booking request endpoint (host-initiated)
- [ ] Implement get vendor bookings endpoint
- [ ] Implement accept booking endpoint
- [ ] Implement decline booking endpoint
- [ ] Implement complete booking endpoint (triggers payment)
- [ ] Implement get host bookings endpoint
- [ ] Implement create service endpoint
- [ ] Ensure vendors CANNOT apply to events

---

## 🧪 TESTING SCENARIOS

### Co-Host System
1. Host invites co-host → Verify invitation created and notification sent
2. User accepts invitation → Verify user becomes co-host with correct permissions
3. User declines invitation → Verify invitation marked as declined
4. Co-host views dashboard → Verify earnings displayed, cannot edit event
5. Co-host tries to edit event → Verify permission denied

### Revenue Processing
1. Process event revenue → Verify platform fee deducted first
2. Verify vendor fees paid second
3. Verify remaining revenue split correctly
4. Verify all transactions created with correct source tags
5. Verify wallet balances updated by source

### Vendor Booking
1. Host sends booking request → Verify vendor receives notification
2. Vendor accepts booking → Verify status changes, host notified
3. Vendor declines booking → Verify status changes, host notified with reason
4. Mark booking complete → Verify payment triggered, wallet credited
5. Vendor tries to apply to event → Verify action blocked

---

## 🚀 FRONTEND INTEGRATION

### UI Screens Ready and Waiting:
✅ Invite Co-Host Screen
✅ Co-Host Invitations Screen
✅ Co-Host Dashboard Screen
✅ Host Dashboard Screen (with revenue breakdown)
✅ Vendor Booking Request Screen
✅ Wallet Screen (with filtering)
✅ Transaction History Screen
✅ Vendor Bookings List Screen

**All screens are complete and will work immediately once these APIs are implemented!**

---

## 📞 QUESTIONS?

If anything is unclear, refer to the frontend code:
- `lib/features/events/presentation/screens/invite_cohost_screen.dart`
- `lib/features/events/presentation/screens/cohost_invitations_screen.dart`
- `lib/features/events/presentation/screens/cohost_dashboard_screen.dart`
- `lib/features/events/presentation/screens/host_dashboard_screen.dart`
- `lib/features/vendor/presentation/screens/vendor_booking_request_screen.dart`

The frontend shows exactly how the data should flow!
