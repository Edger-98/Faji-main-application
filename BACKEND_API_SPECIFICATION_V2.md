# Backend API Specification V2.0 - Complete System

**Document Version**: 2.1  
**Last Updated**: December 26, 2024  
**Purpose**: Complete API specification for mobile app after UI revamp  
**Status**: ✅ Mobile UI Complete | ⚠️ Backend Integration Required

---

## 🚨 CRITICAL ISSUES TO FIX

### 1. Mongoose Data Leak (URGENT)
**Problem**: API responses contain Mongoose internal data (`$__parent`, `$__`, `_doc`)  
**Impact**: Mobile app crashes with "Invalid events data format"  
**Solution**: Use `.lean()` or `.toObject()` before sending responses

**Affected Endpoints**:
- `GET /api/events`
- `GET /api/events/my-events`
- `GET /api/events/:id`

**Example Fix**:
```javascript
// ❌ BAD
const events = await Event.find();
res.json({ data: events });

// ✅ GOOD
const events = await Event.find().lean();
res.json({ data: events });
```

See `BACKEND_URGENT_FIX_MONGOOSE_DATA.md` for details.

### 2. Response Format Consistency
**Problem**: Inconsistent response formats across endpoints  
**Impact**: Mobile app needs to handle multiple formats

**Current Issues**:
- `/api/events` returns `{data: {events: [...]}}`
- `/api/events/:id` returns `{data: {...}}`
- Some endpoints return `{success: true, data: {...}}`
- Others return just `{data: {...}}`

**Required Standard Format**:
```javascript
// Success Response
{
  "success": true,
  "data": {...} or [...]
}

// Error Response
{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "Human readable message",
    "details": [...] // optional
  }
}
```

**List Responses with Pagination**:
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

### 3. Field Naming Convention
**Problem**: Inconsistent field names (camelCase vs snake_case)  
**Required**: Use camelCase for all JSON responses

**Examples**:
- ✅ `hostId`, `hostName`, `imageUrl`
- ❌ `host_id`, `host_name`, `image_url`

---

## Table of Contents
1. [Overview](#overview)
2. [Authentication](#authentication)
3. [Event Creation & Management](#event-creation--management)
4. [Ticketing System](#ticketing-system)
5. [Marketplace & Vendors](#marketplace--vendors)
6. [Co-Host System](#co-host-system)
7. [Wallet & Payments](#wallet--payments)
8. [Event Details & Discovery](#event-details--discovery)
9. [User Events & Dashboard](#user-events--dashboard)
10. [Vendor Dashboard](#vendor-dashboard)
11. [Data Models](#data-models)
12. [Error Handling](#error-handling)
13. [Business Logic](#business-logic)
14. [Integration Requirements](#integration-requirements)

---

## Overview

### Mobile App Status
- ✅ **UI/UX**: 100% Complete
- ✅ **Navigation**: 5-tab structure implemented
- ✅ **State Management**: Riverpod providers ready
- ✅ **Design System**: Fully compliant (Pink #FD99C9)
- ⚠️ **Backend Integration**: Waiting for API fixes

### Key Features Implemented (Mobile)
- ✅ Event creation with ticket pricing
- ✅ Buy ticket bottom sheet with promo codes
- ✅ Vendor marketplace and booking system
- ✅ Co-host invitation system
- ✅ Wallet and transaction history
- ✅ Event verification UI (30% check-in)
- ✅ Homepage with categories and filters
- ✅ Event details with sold-out status
- ✅ Vendor dashboard and management

### Backend Requirements
- ⚠️ Fix Mongoose data leak (use `.lean()`)
- ⚠️ Implement ticket purchase API
- ⚠️ Implement promo code validation
- ⚠️ Implement co-host invitation system
- ⚠️ Implement vendor booking system
- ⚠️ Implement event verification (30% check-in)
- ⚠️ Implement escrow payment system
- ⚠️ Implement wallet operations

---

## Authentication

All authenticated endpoints require Bearer token:
```
Authorization: Bearer {access_token}
```

**Token Storage**: Mobile app stores token in FlutterSecureStorage  
**Token Injection**: Automatically added to all API requests via Dio interceptor  
**Token Expiry**: 24 hours (implement refresh token flow)

---

## 1. Event Creation & Management

### 1.1 Create Event
**Endpoint**: `POST /api/events`  
**Auth**: Required

**Request Body**:
```json
{
  "name": "Birthday Bash 2024",
  "description": "Join us for an amazing celebration",
  "category": "Birthday",
  "emoji": "🎂",
  "startDate": "2024-12-31T18:00:00Z",
  "endDate": "2024-12-31T23:00:00Z",
  "location": {
    "address": "123 Main Street, Lagos",
    "latitude": 6.5244,
    "longitude": 3.3792
  },
  "imageUrl": "https://cloudinary.com/...",
  "settings": {
    "isPublic": true,
    "websiteLink": "faji.com/birthday-bash",
    "rsvpButtonText": "Celebrate With Us",
    "keepMemoriesPrivate": false,
    "disableGuestMemories": false,
    "acceptGuestContributions": true
  },
  "ticketing": {
    "enabled": true,
    "price": 5000,
    "currency": "NGN",
    "totalTickets": 100,
    "availableTickets": 100
  },
  "budget": {
    "total": 500000,
    "currency": "NGN"
  },
  "expectedGuests": 100,
  "features": {
    "enableWishlist": true,
    "enableBudgetTracking": true,
    "enableVendors": true
  }
}
```

**Response** (201 Created):
```json
{
  "success": true,
  "data": {
    "id": "evt_123456",
    "name": "Birthday Bash 2024",
    "description": "Join us for an amazing celebration",
    "category": "Birthday",
    "emoji": "🎂",
    "startDate": "2024-12-31T18:00:00Z",
    "endDate": "2024-12-31T23:00:00Z",
    "location": {
      "address": "123 Main Street, Lagos",
      "latitude": 6.5244,
      "longitude": 3.3792
    },
    "host": {
      "id": "usr_789",
      "name": "John Doe",
      "email": "john@example.com",
      "avatar": "https://..."
    },
    "imageUrl": "https://cloudinary.com/...",
    "ticketing": {
      "enabled": true,
      "price": 5000,
      "currency": "NGN",
      "currencySymbol": "₦",
      "totalTickets": 100,
      "availableTickets": 100,
      "soldTickets": 0
    },
    "stats": {
      "expectedGuests": 100,
      "confirmedGuests": 0,
      "checkedInGuests": 0,
      "revenue": 0,
      "potentialRevenue": 500000
    },
    "verification": {
      "isVerified": false,
      "checkInThreshold": 30,
      "checkInPercentage": 0
    },
    "createdAt": "2024-12-26T10:00:00Z",
    "updatedAt": "2024-12-26T10:00:00Z"
  }
}
```

### 1.2 Update Event
**Endpoint**: `PATCH /api/events/:eventId`  
**Auth**: Required (must be event host)

**Request Body**: Same as create, all fields optional

### 1.3 Delete Event
**Endpoint**: `DELETE /api/events/:eventId`  
**Auth**: Required (must be event host)

**Response** (200 OK):
```json
{
  "success": true,
  "message": "Event deleted successfully"
}
```

---

## 2. Ticketing System

### 2.1 Purchase Tickets
**Endpoint**: `POST /api/tickets/purchase`  
**Auth**: Required

**Request Body**:
```json
{
  "eventId": "evt_123456",
  "quantity": 2,
  "promoCode": "EARLY2024",
  "paymentMethod": "paystack"
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "orderId": "ord_789012",
    "tickets": [
      {
        "id": "tkt_001",
        "eventId": "evt_123456",
        "qrCode": "https://api.qrserver.com/...",
        "ticketNumber": "TKT-001-2024"
      },
      {
        "id": "tkt_002",
        "eventId": "evt_123456",
        "qrCode": "https://api.qrserver.com/...",
        "ticketNumber": "TKT-002-2024"
      }
    ],
    "payment": {
      "subtotal": 10000,
      "discount": 1000,
      "platformFee": 900,
      "total": 9900,
      "currency": "NGN",
      "status": "pending",
      "escrowStatus": "held",
      "paymentUrl": "https://paystack.com/pay/..."
    }
  }
}
```

### 2.2 Validate Promo Code
**Endpoint**: `POST /api/tickets/validate-promo`  
**Auth**: Required

**Request Body**:
```json
{
  "eventId": "evt_123456",
  "promoCode": "EARLY2024"
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "valid": true,
    "discountType": "percentage",
    "discountValue": 10,
    "discountAmount": 1000,
    "expiresAt": "2024-12-31T23:59:59Z"
  }
}
```

### 2.3 Get My Tickets
**Endpoint**: `GET /api/tickets/my-tickets`  
**Auth**: Required

**Query Parameters**:
- `status`: upcoming | past | cancelled
- `page`: 1
- `limit`: 20

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "tickets": [
      {
        "id": "tkt_001",
        "ticketNumber": "TKT-001-2024",
        "event": {
          "id": "evt_123456",
          "name": "Birthday Bash 2024",
          "startDate": "2024-12-31T18:00:00Z",
          "location": "123 Main Street, Lagos",
          "imageUrl": "https://..."
        },
        "qrCode": "https://api.qrserver.com/...",
        "status": "valid",
        "purchaseDate": "2024-12-26T10:00:00Z",
        "price": 5000,
        "checkedIn": false,
        "checkedInAt": null
      }
    ],
    "pagination": {
      "page": 1,
      "limit": 20,
      "total": 5,
      "pages": 1
    }
  }
}
```

### 2.4 Check-In Guest
**Endpoint**: `POST /api/tickets/check-in`  
**Auth**: Required

**Request Body**:
```json
{
  "ticketId": "tkt_001",
  "eventId": "evt_123456",
  "location": {
    "latitude": 6.5244,
    "longitude": 3.3792
  }
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "checkedIn": true,
    "checkedInAt": "2024-12-31T18:30:00Z",
    "eventVerification": {
      "checkInPercentage": 35,
      "isVerified": true,
      "verifiedAt": "2024-12-31T18:30:00Z"
    }
  }
}
```

---

## 4. Marketplace & Vendors

### 4.1 Get Vendor Categories
**Endpoint**: `GET /api/marketplace/categories`  
**Auth**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "data": [
    {
      "id": "cat_001",
      "name": "Catering",
      "icon": "🍽️",
      "description": "Food and beverage services",
      "vendorCount": 45
    },
    {
      "id": "cat_002",
      "name": "Photography",
      "icon": "📸",
      "description": "Professional photography services",
      "vendorCount": 32
    }
  ]
}
```

### 4.2 Get Vendors by Category
**Endpoint**: `GET /api/marketplace/vendors`  
**Auth**: Required

**Query Parameters**:
- `categoryId`: cat_001
- `eventId`: evt_123456 (optional)
- `page`: 1
- `limit`: 20

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "vendors": [
      {
        "id": "vnd_001",
        "name": "Delicious Catering Co.",
        "description": "Premium catering services",
        "avatar": "https://...",
        "rating": 4.8,
        "reviewCount": 124,
        "categoryId": "cat_001",
        "services": [
          {
            "id": "svc_001",
            "name": "Full Buffet Package",
            "price": 150000,
            "currency": "NGN",
            "description": "Complete buffet for 100 guests"
          }
        ],
        "availability": "available",
        "responseTime": "2 hours"
      }
    ],
    "pagination": {
      "page": 1,
      "limit": 20,
      "total": 45,
      "pages": 3
    }
  }
}
```


### 4.3 Book Vendor Service
**Endpoint**: `POST /api/marketplace/bookings`  
**Auth**: Required

**Request Body**:
```json
{
  "eventId": "evt_123456",
  "vendorId": "vnd_001",
  "serviceId": "svc_001",
  "quantity": 1,
  "notes": "Please arrive 2 hours early",
  "paymentMethod": "wallet"
}
```

**Response** (201 Created):
```json
{
  "success": true,
  "data": {
    "bookingId": "bkg_001",
    "eventId": "evt_123456",
    "vendor": {
      "id": "vnd_001",
      "name": "Delicious Catering Co."
    },
    "service": {
      "id": "svc_001",
      "name": "Full Buffet Package",
      "price": 150000
    },
    "status": "pending",
    "payment": {
      "amount": 150000,
      "currency": "NGN",
      "status": "pending",
      "escrowStatus": "held"
    },
    "createdAt": "2024-12-26T10:00:00Z"
  }
}
```

### 4.4 Get Event Bookings
**Endpoint**: `GET /api/marketplace/bookings/event/:eventId`  
**Auth**: Required (must be event host)

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "bookings": [
      {
        "id": "bkg_001",
        "vendor": {
          "id": "vnd_001",
          "name": "Delicious Catering Co.",
          "avatar": "https://..."
        },
        "service": {
          "name": "Full Buffet Package",
          "price": 150000
        },
        "status": "confirmed",
        "payment": {
          "amount": 150000,
          "status": "paid",
          "escrowStatus": "held"
        },
        "bookedAt": "2024-12-26T10:00:00Z"
      }
    ],
    "totalSpent": 150000,
    "currency": "NGN"
  }
}
```

---

## 5. Co-Host System

### 5.1 Invite Co-Host
**Endpoint**: `POST /api/events/:eventId/cohosts/invite`  
**Auth**: Required (must be event host)

**Request Body**:
```json
{
  "userId": "usr_456",
  "revenueShare": 25,
  "message": "Would love to have you as co-host!"
}
```

**Response** (201 Created):
```json
{
  "success": true,
  "data": {
    "invitationId": "inv_001",
    "eventId": "evt_123456",
    "eventName": "Birthday Bash 2024",
    "host": {
      "id": "usr_789",
      "name": "John Doe"
    },
    "invitee": {
      "id": "usr_456",
      "name": "Jane Smith",
      "email": "jane@example.com"
    },
    "revenueShare": 25,
    "status": "pending",
    "message": "Would love to have you as co-host!",
    "createdAt": "2024-12-26T10:00:00Z",
    "expiresAt": "2025-01-02T10:00:00Z"
  }
}
```

### 5.2 Get Co-Host Invitations
**Endpoint**: `GET /api/cohosts/invitations`  
**Auth**: Required

**Query Parameters**:
- `status`: pending | accepted | declined
- `page`: 1
- `limit`: 20

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "invitations": [
      {
        "id": "inv_001",
        "event": {
          "id": "evt_123456",
          "name": "Birthday Bash 2024",
          "startDate": "2024-12-31T18:00:00Z",
          "imageUrl": "https://..."
        },
        "host": {
          "id": "usr_789",
          "name": "John Doe",
          "avatar": "https://..."
        },
        "revenueShare": 25,
        "status": "pending",
        "message": "Would love to have you as co-host!",
        "createdAt": "2024-12-26T10:00:00Z",
        "expiresAt": "2025-01-02T10:00:00Z"
      }
    ],
    "pagination": {
      "page": 1,
      "limit": 20,
      "total": 3,
      "pages": 1
    }
  }
}
```

### 5.3 Accept Co-Host Invitation
**Endpoint**: `POST /api/cohosts/invitations/:invitationId/accept`  
**Auth**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "invitationId": "inv_001",
    "eventId": "evt_123456",
    "status": "accepted",
    "cohost": {
      "id": "usr_456",
      "name": "Jane Smith",
      "revenueShare": 25,
      "role": "cohost"
    },
    "acceptedAt": "2024-12-26T11:00:00Z"
  }
}
```

### 5.4 Decline Co-Host Invitation
**Endpoint**: `POST /api/cohosts/invitations/:invitationId/decline`  
**Auth**: Required

**Request Body**:
```json
{
  "reason": "Schedule conflict"
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "invitationId": "inv_001",
    "status": "declined",
    "declinedAt": "2024-12-26T11:00:00Z"
  }
}
```

### 5.5 Get Event Co-Hosts
**Endpoint**: `GET /api/events/:eventId/cohosts`  
**Auth**: Required (must be host or cohost)

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "cohosts": [
      {
        "id": "usr_456",
        "name": "Jane Smith",
        "email": "jane@example.com",
        "avatar": "https://...",
        "revenueShare": 25,
        "role": "cohost",
        "joinedAt": "2024-12-26T11:00:00Z",
        "earnings": 0,
        "permissions": {
          "canEditEvent": false,
          "canViewGuests": true,
          "canViewFinancials": true,
          "canInviteGuests": true
        }
      }
    ],
    "totalRevenueShared": 25
  }
}
```

### 5.6 Remove Co-Host
**Endpoint**: `DELETE /api/events/:eventId/cohosts/:cohostId`  
**Auth**: Required (must be event host)

**Response** (200 OK):
```json
{
  "success": true,
  "message": "Co-host removed successfully"
}
```

### 5.7 Get Co-Host Dashboard
**Endpoint**: `GET /api/cohosts/dashboard/:eventId`  
**Auth**: Required (must be cohost)

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "event": {
      "id": "evt_123456",
      "name": "Birthday Bash 2024",
      "startDate": "2024-12-31T18:00:00Z",
      "imageUrl": "https://..."
    },
    "role": {
      "title": "Co-Host",
      "revenueShare": 25,
      "permissions": {
        "canEditEvent": false,
        "canViewGuests": true,
        "canViewFinancials": true
      }
    },
    "earnings": {
      "total": 112500,
      "pending": 112500,
      "paid": 0,
      "currency": "NGN"
    },
    "stats": {
      "totalRevenue": 450000,
      "yourShare": 112500,
      "ticketsSold": 90,
      "guestsCheckedIn": 35
    }
  }
}
```

---

## 6. Wallet & Payments

### 6.1 Get Wallet Balance
**Endpoint**: `GET /api/wallet/balance`  
**Auth**: Required

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "balance": 250000,
    "currency": "NGN",
    "currencySymbol": "₦",
    "pendingBalance": 50000,
    "availableBalance": 200000,
    "escrowBalance": 100000
  }
}
```

### 6.2 Get Wallet Transactions
**Endpoint**: `GET /api/wallet/transactions`  
**Auth**: Required

**Query Parameters**:
- `type`: all | credit | debit
- `page`: 1
- `limit`: 20

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "transactions": [
      {
        "id": "txn_001",
        "type": "credit",
        "amount": 450000,
        "currency": "NGN",
        "description": "Ticket sales - Birthday Bash 2024",
        "status": "completed",
        "reference": "evt_123456",
        "createdAt": "2024-12-31T23:00:00Z"
      },
      {
        "id": "txn_002",
        "type": "debit",
        "amount": 150000,
        "currency": "NGN",
        "description": "Vendor payment - Delicious Catering Co.",
        "status": "completed",
        "reference": "bkg_001",
        "createdAt": "2024-12-26T10:00:00Z"
      }
    ],
    "pagination": {
      "page": 1,
      "limit": 20,
      "total": 15,
      "pages": 1
    }
  }
}
```

### 6.3 Withdraw Funds
**Endpoint**: `POST /api/wallet/withdraw`  
**Auth**: Required

**Request Body**:
```json
{
  "amount": 100000,
  "bankAccount": {
    "accountNumber": "0123456789",
    "bankCode": "058",
    "accountName": "John Doe"
  }
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "withdrawalId": "wth_001",
    "amount": 100000,
    "currency": "NGN",
    "status": "processing",
    "estimatedArrival": "2024-12-27T10:00:00Z"
  }
}
```

### 6.4 Add Funds (Top-up)
**Endpoint**: `POST /api/wallet/topup`  
**Auth**: Required

**Request Body**:
```json
{
  "amount": 50000,
  "paymentMethod": "paystack"
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "topupId": "top_001",
    "amount": 50000,
    "currency": "NGN",
    "paymentUrl": "https://paystack.com/pay/...",
    "reference": "top_001_ref"
  }
}
```

---

## 7. Event Details & Discovery

### 7.1 Get Event Details
**Endpoint**: `GET /api/events/:eventId`  
**Auth**: Optional

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "id": "evt_123456",
    "name": "Birthday Bash 2024",
    "description": "Join us for an amazing celebration",
    "category": "Birthday",
    "emoji": "🎂",
    "startDate": "2024-12-31T18:00:00Z",
    "endDate": "2024-12-31T23:00:00Z",
    "location": {
      "address": "123 Main Street, Lagos",
      "latitude": 6.5244,
      "longitude": 3.3792
    },
    "host": {
      "id": "usr_789",
      "name": "John Doe",
      "email": "john@example.com",
      "avatar": "https://..."
    },
    "imageUrl": "https://cloudinary.com/...",
    "ticketing": {
      "enabled": true,
      "price": 5000,
      "currency": "NGN",
      "currencySymbol": "₦",
      "totalTickets": 100,
      "availableTickets": 0,
      "soldTickets": 100,
      "isSoldOut": true
    },
    "stats": {
      "expectedGuests": 100,
      "confirmedGuests": 100,
      "checkedInGuests": 45,
      "revenue": 500000,
      "viewCount": 1250
    },
    "verification": {
      "isVerified": true,
      "checkInThreshold": 30,
      "checkInPercentage": 45,
      "verifiedAt": "2024-12-31T18:30:00Z"
    },
    "isFavorite": false,
    "userTicketCount": 0,
    "createdAt": "2024-12-26T10:00:00Z",
    "updatedAt": "2024-12-31T18:30:00Z"
  }
}
```

### 7.2 Get Events (Discovery)
**Endpoint**: `GET /api/events`  
**Auth**: Optional

**Query Parameters**:
- `category`: Birthday | Wedding | Party | etc.
- `featured`: true | false
- `trending`: true | false
- `search`: "birthday"
- `minPrice`: 0
- `maxPrice`: 10000
- `startDate`: 2024-12-31
- `endDate`: 2025-01-31
- `page`: 1
- `limit`: 20

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "events": [
      {
        "id": "evt_123456",
        "name": "Birthday Bash 2024",
        "category": "Birthday",
        "emoji": "🎂",
        "startDate": "2024-12-31T18:00:00Z",
        "location": "Lagos",
        "imageUrl": "https://...",
        "ticketing": {
          "price": 5000,
          "currency": "NGN",
          "isSoldOut": true
        },
        "host": {
          "name": "John Doe",
          "avatar": "https://..."
        },
        "isFeatured": true,
        "isTrending": true
      }
    ],
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

## 8. User Events & Dashboard

### 8.1 Get My Events (Organized)
**Endpoint**: `GET /api/events/my-events`  
**Auth**: Required

**Query Parameters**:
- `status`: upcoming | past | cancelled
- `page`: 1
- `limit`: 20

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "events": [
      {
        "id": "evt_123456",
        "name": "Birthday Bash 2024",
        "startDate": "2024-12-31T18:00:00Z",
        "endDate": "2024-12-31T23:00:00Z",
        "imageUrl": "https://...",
        "ticketing": {
          "enabled": true,
          "price": 5000,
          "totalTickets": 100,
          "soldTickets": 100,
          "availableTickets": 0,
          "isSoldOut": true,
          "revenue": 500000
        },
        "stats": {
          "confirmedGuests": 100,
          "checkedInGuests": 45,
          "revenue": 500000,
          "expenses": 150000,
          "profit": 350000
        },
        "verification": {
          "isVerified": true,
          "checkInPercentage": 45
        },
        "status": "completed"
      }
    ],
    "summary": {
      "totalEvents": 5,
      "upcomingEvents": 2,
      "pastEvents": 3,
      "totalRevenue": 1500000,
      "totalProfit": 950000
    },
    "pagination": {
      "page": 1,
      "limit": 20,
      "total": 5,
      "pages": 1
    }
  }
}
```

### 8.2 Get Event Dashboard
**Endpoint**: `GET /api/events/:eventId/dashboard`  
**Auth**: Required (must be event host)

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "event": {
      "id": "evt_123456",
      "name": "Birthday Bash 2024",
      "status": "completed"
    },
    "ticketing": {
      "totalTickets": 100,
      "soldTickets": 100,
      "availableTickets": 0,
      "revenue": 500000,
      "platformFee": 50000,
      "netRevenue": 450000
    },
    "guests": {
      "expected": 100,
      "confirmed": 100,
      "checkedIn": 45,
      "checkInRate": 45
    },
    "vendors": {
      "totalBookings": 3,
      "totalSpent": 250000,
      "pendingPayments": 0
    },
    "budget": {
      "total": 500000,
      "spent": 250000,
      "remaining": 250000
    },
    "verification": {
      "isVerified": true,
      "checkInPercentage": 45,
      "verifiedAt": "2024-12-31T18:30:00Z",
      "paymentsReleased": true
    },
    "recentActivity": [
      {
        "type": "check_in",
        "description": "Guest checked in",
        "timestamp": "2024-12-31T18:30:00Z"
      },
      {
        "type": "ticket_sold",
        "description": "2 tickets sold",
        "timestamp": "2024-12-30T14:20:00Z"
      }
    ]
  }
}
```

---

## 9. Vendor Dashboard

### 9.1 Get Vendor Profile
**Endpoint**: `GET /api/vendors/profile`  
**Auth**: Required (vendor account)

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "id": "vnd_001",
    "name": "Delicious Catering Co.",
    "description": "Premium catering services for all occasions",
    "avatar": "https://...",
    "coverImage": "https://...",
    "category": {
      "id": "cat_001",
      "name": "Catering"
    },
    "rating": 4.8,
    "reviewCount": 124,
    "completedJobs": 156,
    "responseTime": "2 hours",
    "availability": "available",
    "services": [
      {
        "id": "svc_001",
        "name": "Full Buffet Package",
        "description": "Complete buffet for 100 guests",
        "price": 150000,
        "currency": "NGN",
        "isActive": true
      }
    ],
    "stats": {
      "totalEarnings": 5000000,
      "pendingEarnings": 300000,
      "activeBookings": 5,
      "completedBookings": 156
    },
    "bankAccount": {
      "accountNumber": "0123456789",
      "bankCode": "058",
      "accountName": "Delicious Catering Co."
    }
  }
}
```

### 9.2 Get Vendor Bookings
**Endpoint**: `GET /api/vendors/bookings`  
**Auth**: Required (vendor account)

**Query Parameters**:
- `status`: pending | confirmed | completed | cancelled
- `page`: 1
- `limit`: 20

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "bookings": [
      {
        "id": "bkg_001",
        "event": {
          "id": "evt_123456",
          "name": "Birthday Bash 2024",
          "date": "2024-12-31T18:00:00Z",
          "location": "123 Main Street, Lagos",
          "host": {
            "name": "John Doe",
            "phone": "+234..."
          }
        },
        "service": {
          "id": "svc_001",
          "name": "Full Buffet Package",
          "price": 150000
        },
        "status": "confirmed",
        "payment": {
          "amount": 150000,
          "status": "paid",
          "escrowStatus": "held",
          "releaseDate": "2025-01-01T00:00:00Z"
        },
        "notes": "Please arrive 2 hours early",
        "bookedAt": "2024-12-26T10:00:00Z"
      }
    ],
    "summary": {
      "pending": 2,
      "confirmed": 5,
      "completed": 156,
      "totalEarnings": 5000000
    },
    "pagination": {
      "page": 1,
      "limit": 20,
      "total": 163,
      "pages": 9
    }
  }
}
```

### 9.3 Update Booking Status
**Endpoint**: `PATCH /api/vendors/bookings/:bookingId`  
**Auth**: Required (vendor account)

**Request Body**:
```json
{
  "status": "confirmed",
  "notes": "Confirmed. Will arrive at 4 PM"
}
```

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "bookingId": "bkg_001",
    "status": "confirmed",
    "updatedAt": "2024-12-26T11:00:00Z"
  }
}
```

### 9.4 Get Vendor Earnings
**Endpoint**: `GET /api/vendors/earnings`  
**Auth**: Required (vendor account)

**Query Parameters**:
- `startDate`: 2024-01-01
- `endDate`: 2024-12-31

**Response** (200 OK):
```json
{
  "success": true,
  "data": {
    "totalEarnings": 5000000,
    "availableBalance": 4500000,
    "pendingBalance": 300000,
    "escrowBalance": 200000,
    "currency": "NGN",
    "breakdown": {
      "completedJobs": 156,
      "averageJobValue": 32051,
      "topService": {
        "name": "Full Buffet Package",
        "earnings": 2340000
      }
    },
    "monthlyEarnings": [
      {
        "month": "2024-12",
        "earnings": 450000,
        "jobs": 15
      }
    ]
  }
}
```

---

## 10. Data Models

### Event Model
```typescript
interface Event {
  id: string;
  name: string;
  description: string;
  category: string;
  emoji: string;
  startDate: string; // ISO 8601
  endDate: string; // ISO 8601
  location: {
    address: string;
    latitude: number;
    longitude: number;
  };
  host: {
    id: string;
    name: string;
    email: string;
    avatar: string;
  };
  imageUrl: string;
  ticketing: {
    enabled: boolean;
    price: number;
    currency: string;
    currencySymbol: string;
    totalTickets: number;
    availableTickets: number;
    soldTickets: number;
    isSoldOut: boolean;
  };
  stats: {
    expectedGuests: number;
    confirmedGuests: number;
    checkedInGuests: number;
    revenue: number;
    expenses: number;
    profit: number;
  };
  verification: {
    isVerified: boolean;
    checkInThreshold: number; // 30%
    checkInPercentage: number;
    verifiedAt?: string;
  };
  settings: {
    isPublic: boolean;
    websiteLink: string;
    rsvpButtonText: string;
  };
  status: 'draft' | 'published' | 'ongoing' | 'completed' | 'cancelled';
  createdAt: string;
  updatedAt: string;
}
```


### Ticket Model
```typescript
interface Ticket {
  id: string;
  ticketNumber: string;
  eventId: string;
  userId: string;
  qrCode: string;
  status: 'valid' | 'used' | 'cancelled' | 'refunded';
  price: number;
  currency: string;
  purchaseDate: string;
  checkedIn: boolean;
  checkedInAt?: string;
  orderId: string;
}
```

### Vendor Model
```typescript
interface Vendor {
  id: string;
  name: string;
  description: string;
  avatar: string;
  coverImage: string;
  categoryId: string;
  rating: number;
  reviewCount: number;
  completedJobs: number;
  responseTime: string;
  availability: 'available' | 'busy' | 'unavailable';
  services: Service[];
  stats: {
    totalEarnings: number;
    pendingEarnings: number;
    activeBookings: number;
    completedBookings: number;
  };
}
```

### Booking Model
```typescript
interface Booking {
  id: string;
  eventId: string;
  vendorId: string;
  serviceId: string;
  status: 'pending' | 'confirmed' | 'completed' | 'cancelled';
  payment: {
    amount: number;
    currency: string;
    status: 'pending' | 'paid' | 'refunded';
    escrowStatus: 'held' | 'released';
    releaseDate?: string;
  };
  notes?: string;
  bookedAt: string;
  completedAt?: string;
}
```

### CoHost Model
```typescript
interface CoHost {
  id: string;
  eventId: string;
  userId: string;
  name: string;
  email: string;
  avatar: string;
  revenueShare: number; // percentage (0-100)
  role: 'cohost';
  status: 'pending' | 'accepted' | 'declined';
  earnings: {
    total: number;
    pending: number;
    paid: number;
    currency: string;
  };
  permissions: {
    canEditEvent: boolean;
    canViewGuests: boolean;
    canViewFinancials: boolean;
    canInviteGuests: boolean;
  };
  joinedAt: string;
}
```

### CoHostInvitation Model
```typescript
interface CoHostInvitation {
  id: string;
  eventId: string;
  eventName: string;
  eventStartDate: string;
  eventImageUrl: string;
  host: {
    id: string;
    name: string;
    avatar: string;
  };
  invitee: {
    id: string;
    name: string;
    email: string;
  };
  revenueShare: number;
  message?: string;
  status: 'pending' | 'accepted' | 'declined' | 'expired';
  createdAt: string;
  expiresAt: string;
  respondedAt?: string;
}
```

### Wallet Model
```typescript
interface Wallet {
  userId: string;
  balance: number;
  currency: string;
  pendingBalance: number;
  availableBalance: number;
  escrowBalance: number;
  transactions: Transaction[];
}
```

### Transaction Model
```typescript
interface Transaction {
  id: string;
  userId: string;
  type: 'credit' | 'debit';
  amount: number;
  currency: string;
  source: 'ticket_sales' | 'cohost_earnings' | 'vendor_earnings' | 'withdrawal' | 'topup' | 'refund';
  description: string;
  status: 'pending' | 'completed' | 'failed';
  reference: string; // eventId, bookingId, etc.
  referenceType: 'event' | 'booking' | 'ticket' | 'withdrawal';
  metadata?: {
    eventName?: string;
    vendorName?: string;
    ticketCount?: number;
  };
  createdAt: string;
}
```

---

## 11. Error Handling

### Standard Error Response
```json
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

### Error Codes
- `VALIDATION_ERROR` (400) - Invalid request data
- `UNAUTHORIZED` (401) - Authentication required
- `FORBIDDEN` (403) - Insufficient permissions
- `NOT_FOUND` (404) - Resource not found
- `CONFLICT` (409) - Resource conflict (e.g., sold out)
- `PAYMENT_FAILED` (402) - Payment processing failed
- `ESCROW_ERROR` (500) - Escrow system error
- `SERVER_ERROR` (500) - Internal server error

---

## 12. Business Logic Requirements

### 12.1 Ticket Sales & Escrow
1. When tickets are purchased:
   - Deduct from `availableTickets`
   - Add to `soldTickets`
   - Set `isSoldOut = true` when `availableTickets = 0`
   - Hold payment in escrow
   - Generate QR codes for tickets

2. Platform fee calculation:
   - Platform fee = 10% of ticket price
   - Net revenue = (ticket price × quantity) - platform fee

### 12.2 Event Verification
1. Guest check-in requirements:
   - Verify GPS location within 100m radius of event location
   - Validate ticket QR code
   - Mark ticket as used
   - Increment `checkedInGuests` counter

2. Event verification trigger:
   - Calculate: `checkInPercentage = (checkedInGuests / confirmedGuests) × 100`
   - If `checkInPercentage >= 30%`:
     - Set `isVerified = true`
     - Release all escrow payments
     - Distribute revenue to host/co-hosts
     - Release vendor payments

3. If verification fails (< 30% check-in):
   - Automatic refunds to all ticket holders
   - Cancel vendor bookings
   - Return vendor payments

### 12.3 Revenue Distribution
When event is verified:
1. Calculate platform fee (10%)
2. Deduct vendor expenses
3. Remaining amount distributed:
   - Host: 70% (if no co-hosts)
   - Co-hosts: Split remaining 30%

### 12.4 Vendor Payments
1. Vendor booking payment held in escrow
2. Released when:
   - Event is verified (30% check-in)
   - Vendor marks job as completed
   - Host confirms completion
3. Payment timeline:
   - Released 24 hours after event end
   - Available for withdrawal immediately

### 12.5 Wallet Operations
1. Top-up:
   - Integrate with Paystack
   - Instant credit to wallet

2. Withdrawal:
   - Minimum: ₦1,000
   - Maximum: ₦5,000,000 per transaction
   - Processing time: 24-48 hours
   - Verify bank account before first withdrawal

3. Escrow:
   - Separate escrow balance tracking
   - Cannot be withdrawn until released
   - Auto-release based on event verification

### 12.6 Co-Host Revenue Sharing
When event is verified and revenue is distributed:
1. Calculate total net revenue (after platform fee and vendor expenses)
2. Distribute based on revenue share percentages:
   - Host: Remaining percentage after co-host shares
   - Co-hosts: Each gets their specified percentage
3. Example:
   - Total revenue: ₦500,000
   - Platform fee (10%): ₦50,000
   - Vendor expenses: ₦150,000
   - Net revenue: ₦300,000
   - Host (75%): ₦225,000
   - Co-host 1 (15%): ₦45,000
   - Co-host 2 (10%): ₦30,000

---

## 13. Integration Requirements

### 13.1 Payment Gateway (Paystack)
- Ticket purchases
- Wallet top-ups
- Vendor payments
- Withdrawals

### 13.2 Image Storage (Cloudinary)
- Event images
- User avatars
- Vendor images
- Automatic optimization

### 13.3 QR Code Generation
- Unique QR codes for each ticket
- Include ticket ID and event ID
- Scannable for check-in

### 13.4 Geolocation Services
- Verify guest location during check-in
- Calculate distance from event venue
- Prevent GPS spoofing

### 13.5 Notifications
- Email: Ticket confirmation, event reminders
- SMS: Check-in codes, payment confirmations
- Push: Real-time updates, booking confirmations

---

## 14. Security Requirements

### 14.1 Authentication
- JWT tokens with 24-hour expiry
- Refresh tokens for extended sessions
- Role-based access control (host, guest, vendor)

### 14.2 Payment Security
- PCI DSS compliance
- Encrypted payment data
- Secure escrow system
- Fraud detection

### 14.3 Data Protection
- HTTPS only
- Encrypted sensitive data
- GDPR compliance
- Data retention policies

---

## 15. Performance Requirements

### 15.1 Response Times
- Event listing: < 500ms
- Event details: < 300ms
- Ticket purchase: < 2s
- Check-in: < 1s

### 15.2 Scalability
- Support 10,000+ concurrent users
- Handle 1,000+ events simultaneously
- Process 100+ ticket purchases per minute

### 15.3 Availability
- 99.9% uptime
- Automatic failover
- Database replication
- CDN for static assets

---

## 16. Testing Requirements

### 16.1 Test Scenarios
1. **Event Creation**
   - Create free event
   - Create paid event with tickets
   - Create event with sold-out status

2. **Ticket Purchase**
   - Buy single ticket
   - Buy multiple tickets
   - Apply promo code
   - Handle sold-out events

3. **Event Verification**
   - Check-in guests
   - Trigger 30% threshold
   - Release escrow payments
   - Handle failed verification

4. **Marketplace**
   - Browse vendors
   - Book vendor service
   - Confirm booking
   - Complete job

5. **Wallet**
   - Top-up wallet
   - Make payment from wallet
   - Withdraw funds
   - Track escrow balance

### 16.2 Test Data
Provide test accounts:
- Host account with events
- Guest account with tickets
- Vendor account with services
- Test payment cards (Paystack test mode)

---

## 17. Migration Notes

### 17.1 Database Changes
- Add `ticketing` object to events table
- Add `verification` object to events table
- Add `escrowBalance` to wallet table
- Add `isSoldOut` computed field
- Add `checkInPercentage` computed field

### 17.2 Backward Compatibility
- Existing events without ticketing: `ticketing.enabled = false`
- Default `availableTickets = null` (unlimited)
- Default `isSoldOut = false`

---

## Appendix A: Complete API Endpoint List

### Authentication & User Management
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/refresh` - Refresh access token
- `GET /api/users/profile` - Get user profile
- `PATCH /api/users/profile` - Update user profile

### Event Management (17 endpoints)
- `POST /api/events` - Create event
- `GET /api/events` - Get all events (discovery)
- `GET /api/events/:id` - Get event details
- `PATCH /api/events/:id` - Update event
- `DELETE /api/events/:id` - Delete event
- `GET /api/events/my-events` - Get user's organized events
- `GET /api/events/:id/dashboard` - Get event dashboard
- `POST /api/events/:id/cohosts/invite` - Invite co-host
- `GET /api/events/:id/cohosts` - Get event co-hosts
- `DELETE /api/events/:id/cohosts/:cohostId` - Remove co-host
- `POST /api/events/:id/favorite` - Add to favorites
- `DELETE /api/events/:id/favorite` - Remove from favorites
- `GET /api/events/favorites` - Get favorite events
- `GET /api/events/trending` - Get trending events
- `GET /api/events/featured` - Get featured events
- `GET /api/events/categories` - Get event categories
- `GET /api/events/search` - Search events

### Ticketing System (5 endpoints)
- `POST /api/tickets/purchase` - Purchase tickets
- `POST /api/tickets/validate-promo` - Validate promo code
- `GET /api/tickets/my-tickets` - Get user's tickets
- `POST /api/tickets/check-in` - Check-in guest
- `GET /api/tickets/:id` - Get ticket details

### Co-Host System (5 endpoints)
- `POST /api/events/:eventId/cohosts/invite` - Invite co-host
- `GET /api/cohosts/invitations` - Get co-host invitations
- `POST /api/cohosts/invitations/:id/accept` - Accept invitation
- `POST /api/cohosts/invitations/:id/decline` - Decline invitation
- `GET /api/cohosts/dashboard/:eventId` - Get co-host dashboard

### Marketplace & Vendors (14 endpoints)
- `GET /api/marketplace/categories` - Get vendor categories
- `GET /api/marketplace/vendors` - Get vendors by category
- `GET /api/marketplace/vendors/:id` - Get vendor details
- `POST /api/marketplace/bookings` - Book vendor service
- `GET /api/marketplace/bookings/event/:eventId` - Get event bookings
- `GET /api/marketplace/bookings/:id` - Get booking details
- `POST /api/marketplace/bookings/:id/accept` - Accept booking (vendor)
- `POST /api/marketplace/bookings/:id/decline` - Decline booking (vendor)
- `POST /api/marketplace/bookings/:id/counter-offer` - Counter offer (vendor)
- `POST /api/marketplace/bookings/:id/complete` - Mark booking complete
- `POST /api/marketplace/bookings/:id/cancel` - Cancel booking
- `GET /api/marketplace/bookings/requests` - Get vendor booking requests
- `GET /api/marketplace/vendors/me/resources` - Get vendor services
- `POST /api/marketplace/vendors/me/resources` - Add vendor service

### Vendor Registration & Management (10 endpoints)
- `POST /api/vendor-registration/register` - Register as vendor
- `POST /api/vendor-registration/documents` - Upload documents
- `POST /api/vendor-registration/portfolio` - Upload portfolio
- `POST /api/vendor-registration/bank-details` - Add bank details
- `GET /api/vendor-registration/profile` - Get vendor profile
- `PATCH /api/vendor-registration/profile` - Update vendor profile
- `DELETE /api/vendor-registration/portfolio/:id` - Delete portfolio image
- `GET /api/marketplace/vendors/me` - Get complete vendor profile
- `GET /api/marketplace/vendors/me/stats` - Get vendor statistics
- `PATCH /api/marketplace/vendors/me/resources/:id` - Update service

### Wallet & Payments (6 endpoints)
- `GET /api/wallet/balance` - Get wallet balance
- `GET /api/wallet/transactions` - Get transaction history
- `POST /api/wallet/withdraw` - Withdraw funds
- `POST /api/wallet/topup` - Add funds to wallet
- `GET /api/wallet/earnings` - Get earnings breakdown
- `POST /api/wallet/transfer` - Transfer funds

### Notifications (4 endpoints)
- `GET /api/notifications` - Get notifications
- `PATCH /api/notifications/:id/read` - Mark as read
- `PATCH /api/notifications/read-all` - Mark all as read
- `DELETE /api/notifications/:id` - Delete notification

### Total: 78+ API Endpoints

---

## Appendix B: Example Flows

### Flow 1: Complete Event Creation with Tickets
```
1. POST /api/events (create event with ticketing)
2. GET /api/events/:eventId (verify creation)
3. Event appears in GET /api/events/my-events
```

### Flow 2: Guest Purchases Ticket
```
1. GET /api/events/:eventId (view event)
2. POST /api/tickets/validate-promo (optional)
3. POST /api/tickets/purchase (buy ticket)
4. Payment redirect to Paystack
5. Webhook: Payment confirmed
6. GET /api/tickets/my-tickets (view ticket)
```

### Flow 3: Event Verification
```
1. Guest arrives at event
2. POST /api/tickets/check-in (with GPS location)
3. System checks: location valid, ticket valid
4. Increment checkedInGuests
5. If checkInPercentage >= 30%:
   - Set isVerified = true
   - Release escrow payments
   - Notify host
```

### Flow 4: Host Invites Co-Host
```
1. POST /api/events/:eventId/cohosts/invite (send invitation)
2. Co-host receives notification
3. GET /api/cohosts/invitations (co-host views invitations)
4. POST /api/cohosts/invitations/:id/accept (co-host accepts)
5. GET /api/events/:eventId/cohosts (verify co-host added)
6. After event: GET /api/cohosts/dashboard/:eventId (view earnings)
```

### Flow 5: Vendor Booking
```
1. GET /api/marketplace/categories
2. GET /api/marketplace/vendors?categoryId=cat_001
3. POST /api/marketplace/bookings (book service)
4. Payment from wallet or Paystack
5. Vendor receives notification
6. POST /api/marketplace/bookings/:id/accept (vendor confirms)
7. After event: Payment released from escrow
```

### Flow 6: Vendor Counter Offer
```
1. GET /api/marketplace/bookings/requests (vendor views requests)
2. POST /api/marketplace/bookings/:id/counter-offer (send counter)
3. Host receives notification
4. Host accepts counter offer
5. POST /api/marketplace/bookings/:id/accept (finalize booking)
```

---

## Appendix C: Mobile App Integration Status

### ✅ Fully Implemented (Mobile UI)
1. **Event Management**
   - Event creation with ticket pricing
   - Event details with sold-out status
   - My Events screen with filters
   - Event dashboard
   - Delete event functionality

2. **Ticketing**
   - Buy ticket bottom sheet
   - Ticket quantity selector
   - Promo code input
   - Price breakdown display
   - Escrow payment notice

3. **Co-Host System**
   - Invite co-host screen
   - Co-host invitations list
   - Accept/decline invitations
   - Co-host dashboard
   - Revenue share display

4. **Vendor Marketplace**
   - Vendor registration (59% API integrated)
   - Vendor marketplace browsing
   - Service management (list, add, delete)
   - Booking requests (pending/accepted/completed)
   - Counter offer bottom sheet
   - Vendor dashboard with stats

5. **Wallet**
   - Wallet balance display
   - Transaction history
   - Earnings breakdown by source
   - Withdraw funds UI

6. **Homepage**
   - Hero banner
   - Category filters with icons
   - Trending events
   - Upcoming events
   - Flash deals
   - Your events section
   - Enhanced empty states

### ⚠️ Waiting for Backend APIs
1. **Ticketing**
   - Ticket purchase processing
   - Promo code validation
   - QR code generation
   - Guest check-in verification

2. **Co-Host System**
   - All 5 co-host endpoints
   - Revenue distribution
   - Co-host permissions

3. **Event Verification**
   - 30% check-in threshold
   - Escrow release trigger
   - Automatic refunds

4. **Vendor System**
   - 7 advanced endpoints (documents, portfolio, bank details)
   - Booking acceptance flow
   - Counter offer processing
   - Payment release

5. **Wallet**
   - Withdrawal processing
   - Top-up integration
   - Transaction recording
   - Earnings calculation

---

## Appendix D: Critical Backend Tasks

### Priority 1: URGENT (Blocking Mobile Testing)
1. **Fix Mongoose Data Leak**
   - Use `.lean()` on all queries
   - Remove `$__`, `$__parent`, `_doc` from responses
   - Test all event endpoints

2. **Implement Ticket Purchase API**
   - `POST /api/tickets/purchase`
   - Paystack integration
   - QR code generation
   - Escrow payment hold

3. **Implement Promo Code Validation**
   - `POST /api/tickets/validate-promo`
   - Discount calculation
   - Expiry checking

### Priority 2: HIGH (Core Features)
4. **Implement Co-Host System**
   - All 5 co-host endpoints
   - Revenue share calculation
   - Invitation expiry (7 days)

5. **Implement Event Verification**
   - Check-in tracking
   - 30% threshold detection
   - Escrow release automation
   - Refund processing

6. **Implement Vendor Booking Flow**
   - Accept/decline bookings
   - Counter offer system
   - Payment escrow
   - Completion tracking

### Priority 3: MEDIUM (Enhanced Features)
7. **Implement Wallet Operations**
   - Balance tracking
   - Transaction history
   - Withdrawal processing
   - Top-up integration

8. **Implement Notifications**
   - Email notifications
   - Push notifications
   - In-app notifications
   - SMS for critical events

### Priority 4: LOW (Nice to Have)
9. **Advanced Vendor Features**
   - Document upload
   - Portfolio management
   - Bank details verification

10. **Analytics & Reporting**
    - Event analytics
    - Revenue reports
    - User behavior tracking

---

## Appendix E: Database Schema Updates Required

### New Tables Needed

#### 1. cohosts
```sql
CREATE TABLE cohosts (
  id VARCHAR(255) PRIMARY KEY,
  event_id VARCHAR(255) REFERENCES events(id),
  user_id VARCHAR(255) REFERENCES users(id),
  revenue_share DECIMAL(5,2),
  status ENUM('pending', 'accepted', 'declined'),
  invited_at TIMESTAMP,
  accepted_at TIMESTAMP,
  earnings DECIMAL(10,2) DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### 2. cohost_invitations
```sql
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
```

#### 3. vendor_bookings
```sql
CREATE TABLE vendor_bookings (
  id VARCHAR(255) PRIMARY KEY,
  event_id VARCHAR(255) REFERENCES events(id),
  vendor_id VARCHAR(255) REFERENCES vendors(id),
  service_id VARCHAR(255) REFERENCES vendor_services(id),
  host_id VARCHAR(255) REFERENCES users(id),
  status ENUM('pending', 'accepted', 'declined', 'completed', 'cancelled'),
  original_price DECIMAL(10,2),
  final_price DECIMAL(10,2),
  counter_offer_price DECIMAL(10,2),
  counter_offer_message TEXT,
  payment_status ENUM('pending', 'paid', 'released', 'refunded'),
  escrow_status ENUM('held', 'released'),
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### 4. wallet_transactions
```sql
CREATE TABLE wallet_transactions (
  id VARCHAR(255) PRIMARY KEY,
  user_id VARCHAR(255) REFERENCES users(id),
  type ENUM('credit', 'debit'),
  amount DECIMAL(10,2),
  source ENUM('ticket_sales', 'cohost_earnings', 'vendor_earnings', 'withdrawal', 'topup'),
  reference_id VARCHAR(255),
  reference_type ENUM('event', 'booking', 'ticket', 'withdrawal'),
  description TEXT,
  status ENUM('pending', 'completed', 'failed'),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Columns to Update

#### events table
```sql
ALTER TABLE events 
  CHANGE COLUMN organizer_id host_id VARCHAR(255),
  CHANGE COLUMN organizer_name host_name VARCHAR(255),
  CHANGE COLUMN organizer_image host_image VARCHAR(255),
  ADD COLUMN ticketing_enabled BOOLEAN DEFAULT FALSE,
  ADD COLUMN ticket_price DECIMAL(10,2),
  ADD COLUMN total_tickets INT,
  ADD COLUMN available_tickets INT,
  ADD COLUMN sold_tickets INT DEFAULT 0,
  ADD COLUMN is_sold_out BOOLEAN DEFAULT FALSE,
  ADD COLUMN checked_in_guests INT DEFAULT 0,
  ADD COLUMN is_verified BOOLEAN DEFAULT FALSE,
  ADD COLUMN verified_at TIMESTAMP;
```

---

## Appendix F: Environment Configuration

### Development
```env
API_BASE_URL=http://localhost:5001/api/v1
PAYSTACK_PUBLIC_KEY=pk_test_xxxxx
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_UPLOAD_PRESET=your_preset
```

### Staging
```env
API_BASE_URL=https://staging-api.faji.com/api/v1
PAYSTACK_PUBLIC_KEY=pk_test_xxxxx
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_UPLOAD_PRESET=your_preset
```

### Production
```env
API_BASE_URL=https://api.faji.com/api/v1
PAYSTACK_PUBLIC_KEY=pk_live_xxxxx
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_UPLOAD_PRESET=your_preset
```

---

**End of Specification**

For questions or clarifications:
- **Mobile Team**: See `FINAL_USER_FLOWS_AND_FIXES_SUMMARY.md`
- **Backend Team**: See `BACKEND_URGENT_FIX_MONGOOSE_DATA.md`
- **Integration**: See `INTEGRATION_COMPLETE_SUMMARY.md`
- **Vendor System**: See `VENDOR_SYSTEM_FINAL_COMPLETE.md`
