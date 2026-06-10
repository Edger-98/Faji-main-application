# Event Verification & Escrow Release — Mobile App Guide

**Base URL:** `https://faji-backend-52878caa6589.herokuapp.com/api/v1`
**Auth:** All endpoints require `Authorization: Bearer <accessToken>`

---

## Overview

The mobile app has two types of users — **Creators** (event hosts) and **Guests** (ticket buyers / attendees).

Each role has a completely different experience around event verification:

- **Guest** buys a ticket, shows up at the venue, taps "Check In" in the app. The app sends their GPS location. If they are at the right place at the right time, check-in succeeds.
- **Creator** watches their event dashboard. Once 30% of ticket holders have checked in, the backend automatically verifies the event and releases the escrow money into the creator's wallet. No action needed from the creator.

---

## The Verification Logic (How It Triggers)

Every time a guest checks in successfully, the backend:

1. Increments `event.stats.checkedInGuests`
2. Recalculates `checkInPercentage = (checkedInGuests / soldTickets) × 100`
3. If `checkInPercentage >= 30` and event is not yet verified → fires `verifyAndReleaseEvent()` automatically
4. That function marks the event verified, releases all escrow orders, and credits the creator's wallet

The creator does not need to do anything. The money arrives in their wallet automatically.

---

## Check-In Rules (What the Backend Validates)

Every check-in request must pass all of these or it is rejected:

| Rule | Detail |
|------|--------|
| Valid ticket | Ticket must exist, belong to this event, `status: "valid"`, `paymentStatus: "succeeded"`, not already checked in |
| Correct time | Current time must be between **2 hours before `startDate`** and `endDate` |
| Correct location | Guest must be within **200 metres** of the event's GPS coordinates |
| Not a duplicate | Each ticket can only be checked in once |

---

---

# GUEST — What to Build

---

## G1. View My Tickets

Show the guest all their purchased tickets. This is the entry point to the check-in flow.

```
GET /api/v1/tickets/my-tickets
Authorization: Bearer <guestToken>
```

**Query params:**

| Param | Values | Description |
|-------|--------|-------------|
| `status` | `all` `valid` `used` `cancelled` `refunded` | Filter by ticket status |
| `page` | number | Default: 1 |
| `limit` | number | Default: 20 |

**Response 200:**
```json
{
  "success": true,
  "data": {
    "tickets": [
      {
        "ticket": {
          "id": "64f1a2b3c4d5e6f7a8b9c0d1",
          "ticketNumber": "TKT-LX3K9A-AB12CD",
          "status": "valid",
          "price": 15,
          "currency": "USD",
          "purchaseDate": "2024-12-10T14:00:00.000Z",
          "qrCode": "data:image/png;base64,...",
          "isUsed": false,
          "usedAt": null
        },
        "event": {
          "id": "64f1a2b3c4d5e6f7a8b9c0d2",
          "name": "Afrobeats Night",
          "category": "Music",
          "emoji": "🎵",
          "startDate": "2024-12-25T20:00:00.000Z",
          "endDate": "2024-12-26T02:00:00.000Z",
          "location": {
            "address": "Eko Hotel, Victoria Island, Lagos",
            "latitude": 6.4281,
            "longitude": 3.4219
          },
          "imageUrl": "https://res.cloudinary.com/...",
          "status": "upcoming"
        }
      }
    ],
    "pagination": {
      "currentPage": 1,
      "totalPages": 1,
      "totalTickets": 2,
      "limit": 20
    }
  }
}
```

**UI notes:**
- `event.status` will be `upcoming`, `ongoing`, or `past` — use this to sort and label tickets
- Show the QR code on the ticket detail screen
- Only show the "Check In" button when `event.status === "ongoing"` or when the current time is within 2 hours of `startDate`

---

## G2. View Single Ticket Detail

```
GET /api/v1/tickets/:ticketId
Authorization: Bearer <guestToken>
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "ticket": {
      "id": "64f1a2b3c4d5e6f7a8b9c0d1",
      "ticketNumber": "TKT-LX3K9A-AB12CD",
      "status": "valid",
      "price": 15,
      "currency": "USD",
      "purchaseDate": "2024-12-10T14:00:00.000Z",
      "qrCode": "data:image/png;base64,...",
      "isUsed": false,
      "usedAt": null
    },
    "event": {
      "id": "64f1a2b3c4d5e6f7a8b9c0d2",
      "name": "Afrobeats Night",
      "description": "The biggest Afrobeats party of the year",
      "category": "Music",
      "startDate": "2024-12-25T20:00:00.000Z",
      "endDate": "2024-12-26T02:00:00.000Z",
      "location": {
        "address": "Eko Hotel, Victoria Island, Lagos",
        "latitude": 6.4281,
        "longitude": 3.4219
      },
      "host": {
        "id": "64f1a2b3c4d5e6f7a8b9c0d3",
        "name": "DJ Spinmaster"
      },
      "imageUrl": "https://res.cloudinary.com/..."
    },
    "order": {
      "orderNumber": "ORD-LX3K9A-AB12CD",
      "total": 16.50,
      "currency": "USD",
      "completedAt": "2024-12-10T14:00:00.000Z"
    }
  }
}
```

---

## G3. Check In at the Event

This is the core action. The guest taps "Check In" at the venue. The app gets their GPS and sends it.

```
POST /api/v1/tickets/check-in
Authorization: Bearer <guestToken>
Content-Type: application/json
```

**Request body:**
```json
{
  "ticketId": "64f1a2b3c4d5e6f7a8b9c0d1",
  "eventId": "64f1a2b3c4d5e6f7a8b9c0d2",
  "location": {
    "latitude": 6.4281,
    "longitude": 3.4219,
    "accuracy": 8
  }
}
```

| Field | Required | Description |
|-------|----------|-------------|
| `ticketId` | Yes | The ticket's `_id` |
| `eventId` | Yes | The event's `_id` |
| `location.latitude` | Yes | From device GPS |
| `location.longitude` | Yes | From device GPS |
| `location.accuracy` | No | GPS accuracy in metres — send if available |

**Success response 200:**
```json
{
  "success": true,
  "data": {
    "checkedIn": true,
    "checkedInAt": "2024-12-25T21:30:00.000Z",
    "ticket": {
      "id": "64f1a2b3c4d5e6f7a8b9c0d1",
      "ticketNumber": "TKT-LX3K9A-AB12CD",
      "status": "used"
    },
    "eventVerification": {
      "checkInPercentage": 34,
      "isVerified": true,
      "verifiedAt": "2024-12-25T21:30:00.000Z"
    }
  }
}
```

**What to do with the response:**
- `checkedIn: true` → show success screen, confetti, "You're in!"
- `ticket.status` will now be `"used"` — update the local ticket state
- If `eventVerification.isVerified === true` → the event just hit the threshold. Optionally show "🎉 Event verified!" to the guest

---

## G3 — All Error Cases

### Too early
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Check-in is not open yet. Opens 45 minutes before the event starts.",
    "details": {
      "opensAt": "2024-12-25T18:00:00.000Z",
      "eventStartDate": "2024-12-25T20:00:00.000Z"
    }
  }
}
```
**UI:** Show a countdown — "Check-in opens in X hours Y minutes"

---

### Event ended
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "This event has already ended. Check-in is closed.",
    "details": {
      "eventEndDate": "2024-12-26T02:00:00.000Z"
    }
  }
}
```
**UI:** Hide the check-in button entirely. Show "Event ended"

---

### Too far from venue
```json
{
  "success": false,
  "error": {
    "code": "LOCATION_VERIFICATION_FAILED",
    "message": "You are too far from the event venue. You are 450m away (max 200m allowed).",
    "details": {
      "yourDistance": 450,
      "allowedRadius": 200,
      "eventLocation": {
        "latitude": 6.4281,
        "longitude": 3.4219,
        "address": "Eko Hotel, Victoria Island, Lagos"
      }
    }
  }
}
```
**UI:** Show a small map with the venue pin and the user's dot. Show "You are 450m away — move closer to check in"

---

### Location permission not given / not sent
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Your current location is required to check in. Please enable location services."
  }
}
```
**UI:** Show a bottom sheet asking the user to enable location. Deep link to device settings.

---

### Already checked in
```json
{
  "success": false,
  "error": {
    "code": "TICKET_ALREADY_USED",
    "message": "Ticket already checked in",
    "details": {
      "checkedInAt": "2024-12-25T20:15:00.000Z"
    }
  }
}
```
**UI:** Show "You checked in at 8:15 PM" — do not show an error, this is informational

---

### Ticket cancelled or refunded
```json
{
  "success": false,
  "error": {
    "code": "INVALID_TICKET",
    "message": "Ticket is cancelled"
  }
}
```
**UI:** Show "This ticket is no longer valid"

---

### Payment not confirmed
```json
{
  "success": false,
  "error": {
    "code": "PAYMENT_FAILED",
    "message": "Payment not confirmed"
  }
}
```
**UI:** Show "Payment issue — contact support"

---

## G4. My Upcoming Events

Shows all events the guest has valid tickets for that haven't happened yet.

```
GET /api/v1/tickets/my-upcoming-events
Authorization: Bearer <guestToken>
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "events": [
      {
        "id": "64f1a2b3c4d5e6f7a8b9c0d2",
        "name": "Afrobeats Night",
        "category": "Music",
        "emoji": "🎵",
        "startDate": "2024-12-25T20:00:00.000Z",
        "endDate": "2024-12-26T02:00:00.000Z",
        "location": {
          "address": "Eko Hotel, Victoria Island, Lagos",
          "latitude": 6.4281,
          "longitude": 3.4219
        },
        "imageUrl": "https://res.cloudinary.com/...",
        "ticketing": {
          "price": 15,
          "currency": "USD"
        },
        "myTickets": {
          "count": 2,
          "tickets": [
            { "id": "...", "ticketNumber": "TKT-LX3K9A-AB12CD", "status": "valid" },
            { "id": "...", "ticketNumber": "TKT-LX3K9A-XY99ZZ", "status": "valid" }
          ]
        },
        "hasPurchased": true
      }
    ],
    "pagination": { "currentPage": 1, "totalPages": 1, "totalEvents": 1, "limit": 20 }
  }
}
```

---

## G5. My Past Events

Events the guest attended (already ended).

```
GET /api/v1/tickets/my-past-events
Authorization: Bearer <guestToken>
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "events": [
      {
        "id": "64f1a2b3c4d5e6f7a8b9c0d2",
        "name": "Afrobeats Night",
        "startDate": "2024-12-25T20:00:00.000Z",
        "endDate": "2024-12-26T02:00:00.000Z",
        "location": { "address": "Eko Hotel, Victoria Island, Lagos" },
        "imageUrl": "https://res.cloudinary.com/...",
        "myTickets": {
          "count": 2,
          "used": 1
        }
      }
    ],
    "pagination": { "currentPage": 1, "totalPages": 1, "totalEvents": 1, "limit": 20 }
  }
}
```

---

## G6. Check If Already Purchased Tickets for an Event

Useful before showing the "Buy Tickets" button — check if the user already has tickets.

```
GET /api/v1/tickets/check-purchase/:eventId
Authorization: Bearer <guestToken>
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "hasPurchased": true,
    "ticketCount": 2,
    "tickets": [
      { "id": "...", "ticketNumber": "TKT-LX3K9A-AB12CD", "status": "valid", "purchaseDate": "2024-12-10T14:00:00.000Z" }
    ]
  }
}
```

---

---

# CREATOR — What to Build

---

## C1. Event Dashboard (Live Stats)

The creator's main screen during the event. Shows check-in progress, revenue, and verification status in real time.

```
GET /api/v1/events/:eventId/dashboard
Authorization: Bearer <creatorToken>
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "event": {
      "id": "64f1a2b3c4d5e6f7a8b9c0d1",
      "name": "Afrobeats Night",
      "status": "ongoing",
      "startDate": "2024-12-25T20:00:00.000Z",
      "endDate": "2024-12-26T02:00:00.000Z",
      "imageUrl": "https://res.cloudinary.com/..."
    },
    "ticketing": {
      "totalTickets": 500,
      "soldTickets": 300,
      "availableTickets": 200,
      "revenue": 4500,
      "platformFee": 450,
      "netRevenue": 4050,
      "currency": "USD"
    },
    "guests": {
      "expected": 500,
      "confirmed": 300,
      "checkedIn": 95,
      "checkInRate": 32
    },
    "verification": {
      "isVerified": true,
      "checkInPercentage": 32,
      "verifiedAt": "2024-12-25T21:45:00.000Z",
      "paymentsReleased": true
    },
    "recentActivity": [
      { "type": "check_in", "description": "Guest checked in", "timestamp": "2024-12-25T21:44:00.000Z" },
      { "type": "ticket_sold", "description": "2 ticket(s) sold", "timestamp": "2024-12-25T20:10:00.000Z" }
    ]
  }
}
```

**UI notes:**
- Show a progress bar: `checkInPercentage / 30` — fills up as guests check in
- When `isVerified: true` → show "✅ Event Verified — Payment Released" banner
- When `paymentsReleased: true` → show the amount in the wallet section
- Poll this endpoint every 30 seconds during the event, or use it on pull-to-refresh

---

## C2. Verification Status (Detailed)

More detailed view of the verification progress including exact revenue breakdown.

```
GET /api/v1/events/:eventId/verification
Authorization: Bearer <creatorToken>
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "eventId": "64f1a2b3c4d5e6f7a8b9c0d1",
    "eventName": "Afrobeats Night",
    "verification": {
      "isVerified": false,
      "checkInThreshold": 30,
      "checkInPercentage": 18,
      "verifiedAt": null,
      "paymentsReleased": false
    },
    "stats": {
      "totalTickets": 300,
      "checkedInGuests": 54,
      "remainingToVerify": 36
    },
    "revenue": {
      "total": 4050,
      "platformFees": 450,
      "netRevenue": 4050,
      "currency": "USD",
      "escrowStatus": "held"
    }
  }
}
```

**UI notes:**
- `remainingToVerify: 36` → show "36 more check-ins needed to release payment"
- `escrowStatus: "held"` → show "Payment is held in escrow"
- `escrowStatus: "released"` → show "Payment has been released to your wallet"

---

## C3. Revenue Distribution

Shows the creator exactly how the money is split — platform fee, co-host shares, and what they receive.

```
GET /api/v1/events/:eventId/revenue
Authorization: Bearer <creatorToken>
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "totalRevenue": 4050,
    "platformFees": 450,
    "expenses": 0,
    "netRevenue": 4050,
    "host": {
      "userId": "64f1a2b3c4d5e6f7a8b9c0d3",
      "name": "DJ Spinmaster",
      "share": 4050,
      "percentage": 100
    },
    "coHosts": [],
    "currency": "USD"
  }
}
```

If there are co-hosts with revenue shares:
```json
{
  "host": { "share": 3240, "percentage": 80 },
  "coHosts": [
    { "name": "MC Hype", "share": 810, "percentage": 20 }
  ]
}
```

---

## C4. Creator's Wallet Balance (After Release)

Once the event is verified and escrow is released, the creator checks their wallet.

```
GET /api/v1/wallet/balance
Authorization: Bearer <creatorToken>
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "balance": 4050,
    "currency": "USD",
    "currencySymbol": "$",
    "pendingBalance": 0,
    "availableBalance": 4050,
    "escrowBalance": 0
  }
}
```

---

## C5. Creator's Transaction History

The escrow release shows up as a `ticket_sales` credit.

```
GET /api/v1/wallet/transactions?type=credit
Authorization: Bearer <creatorToken>
```

**Response 200:**
```json
{
  "success": true,
  "data": {
    "transactions": [
      {
        "id": "64f1a2b3c4d5e6f7a8b9c0d9",
        "type": "credit",
        "amount": 4050,
        "currency": "USD",
        "description": "Escrow released for event: Afrobeats Night",
        "status": "completed",
        "reference": "64f1a2b3c4d5e6f7a8b9c0d1",
        "createdAt": "2024-12-25T21:45:00.000Z"
      }
    ],
    "pagination": { "page": 1, "limit": 20, "total": 1, "pages": 1 }
  }
}
```

---

## C6. Cancel Event & Refund All Tickets

If the creator needs to cancel the event, this refunds all ticket buyers via Stripe.

```
POST /api/v1/events/:eventId/refund
Authorization: Bearer <creatorToken>
Content-Type: application/json
```

**Request body:**
```json
{
  "reason": "Venue flooded — event cancelled"
}
```

**Response 200:**
```json
{
  "success": true,
  "message": "Refunds processed successfully",
  "data": {
    "refundedAmount": 4500,
    "refundedCount": 300,
    "failedCount": 0,
    "reason": "Venue flooded — event cancelled"
  }
}
```

**Restrictions:**
- Cannot refund if `paymentsReleased: true` — money already left escrow
- Only the event host can call this

---

---

# Complete Endpoint Reference

## Guest Endpoints

| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/api/v1/tickets/my-tickets` | All my tickets |
| `GET` | `/api/v1/tickets/my-upcoming-events` | Events I have tickets for (upcoming) |
| `GET` | `/api/v1/tickets/my-past-events` | Events I attended (past) |
| `GET` | `/api/v1/tickets/check-purchase/:eventId` | Did I buy tickets for this event? |
| `GET` | `/api/v1/tickets/:ticketId` | Single ticket detail + QR code |
| `POST` | `/api/v1/tickets/check-in` | Check in at the venue |

## Creator Endpoints

| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/api/v1/events/:eventId/dashboard` | Live event stats — check-ins, revenue, verification |
| `GET` | `/api/v1/events/:eventId/verification` | Detailed verification progress |
| `GET` | `/api/v1/events/:eventId/revenue` | Revenue distribution breakdown |
| `GET` | `/api/v1/wallet/balance` | Wallet balance (after escrow release) |
| `GET` | `/api/v1/wallet/transactions` | Transaction history |
| `POST` | `/api/v1/events/:eventId/refund` | Cancel event and refund all tickets |

## Shared

| Method | Path | Description |
|--------|------|-------------|
| `GET` | `/api/v1/events/:eventId` | Full event detail |
| `POST` | `/api/v1/tickets/purchase` | Buy tickets for an event |
| `POST` | `/api/v1/tickets/validate-promo` | Validate a promo code before purchase |

---

# What Was Built / Changed

## New logic in `controllers/newTickets_controller.js`

`checkInGuest()` now has two hard gates that did not exist before:

**Date/time window check** — check-in is only accepted between 2 hours before `startDate` and `endDate`. If too early, the response includes `opensAt` so the frontend can show a countdown. If the event has ended, check-in is permanently closed.

**GPS required** — if the event has `location.latitude` and `location.longitude` set, the guest must send their coordinates. The allowed radius is 200 metres (generous enough for large venues and outdoor events). The response includes the exact distance so the frontend can show it on a map.

## New logic in `utils/escrowService.js`

`releaseEventEscrow()` now actually credits the creator's wallet. Before this change, escrow was marked as released in the database but the money never moved anywhere. Now after releasing all orders it:

- Finds the host by `event.host.id`
- Increments `balance` on both user models (`auth_model` and `user_model`)
- Creates a `Transaction` record with `source: "ticket_sales"` so it appears in the creator's wallet history

Everything else — the 30% threshold trigger, the `verifyAndReleaseEvent()` chain, the escrow service — was already built and working.

---

*Last updated: March 2026*
