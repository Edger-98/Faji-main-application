# Stripe Payments — Frontend API Reference

Base URL: `https://faji-backend-52878caa6589.herokuapp.com/api/v1`

All endpoints require `Authorization: Bearer <token>` unless marked **Public**.

---

## How Money Flows (Read This First)

```
Customer pays for ticket
        ↓
Faji platform receives the money (held in escrow)
        ↓
Event is verified (30%+ check-ins) OR admin manually pays vendor
        ↓
Stripe transfers money → vendor/host's connected Stripe account
        ↓
Their in-app wallet balance updates immediately
        ↓
Stripe auto-pays to their bank in 2 days
        OR
They manually trigger payout via the app
```

**Does the vendor see the money in their wallet?**
Yes — as soon as admin pays them or escrow releases, their wallet balance updates in the app AND the money is sent to their Stripe connected account simultaneously.

---

## Part 1 — Stripe Connect (Bank Account Setup)

Vendors and event owners must complete this once before they can receive real payouts.

---

### 1.1 Start Onboarding

Creates a Stripe connected account and returns a URL for the user to complete KYC + add their bank.

```
POST /stripe/connect/onboard
```

**Body**
```json
{
  "country": "US",
  "businessType": "individual"
}
```

`businessType` can be `"individual"` or `"company"`

**Response**
```json
{
  "success": true,
  "data": {
    "onboardingUrl": "https://connect.stripe.com/setup/e/acct_.../...",
    "expiresAt": 1780764664,
    "accountId": "acct_1TfNMDIBkOISODdN",
    "message": "Complete the Stripe onboarding to receive payouts to your bank account."
  }
}
```

**What to do with this:**
- Open `onboardingUrl` in an in-app browser or external browser
- The link expires in ~10 minutes
- After the user finishes, Stripe redirects to `https://faji.app/stripe/connect/return?userId=<id>`
- If the link expires before they finish, call `GET /stripe/connect/refresh` to get a new one

---

### 1.2 Check Account Status

Call this after the user returns from the onboarding URL to confirm setup is complete.

```
GET /stripe/connect/status
```

**Response — Not yet connected**
```json
{
  "success": true,
  "data": {
    "connected": false,
    "isReady": false,
    "message": "No Stripe account linked. Call POST /stripe/connect/onboard to set one up."
  }
}
```

**Response — Connected and ready**
```json
{
  "success": true,
  "data": {
    "connected": true,
    "accountId": "acct_1TfNMDIBkOISODdN",
    "isReady": true,
    "chargesEnabled": true,
    "payoutsEnabled": true,
    "detailsSubmitted": true,
    "requirementsOutstanding": [],
    "message": "Account is fully set up. You can receive payouts."
  }
}
```

**Response — Connected but incomplete**
```json
{
  "success": true,
  "data": {
    "connected": true,
    "isReady": false,
    "chargesEnabled": false,
    "payoutsEnabled": false,
    "requirementsOutstanding": ["individual.dob", "individual.ssn_last_4"],
    "message": "Account setup incomplete. Please finish Stripe onboarding."
  }
}
```

**UI logic:**
- `isReady: false` + `connected: false` → show "Connect Bank Account" button
- `isReady: false` + `connected: true` → show "Finish Setup" button (call refresh to get new link)
- `isReady: true` → show payout options, hide connect button

---

### 1.3 Refresh Expired Onboarding Link

If the onboarding link expired before the user finished.

```
GET /stripe/connect/refresh
```

**Response**
```json
{
  "success": true,
  "data": {
    "onboardingUrl": "https://connect.stripe.com/setup/e/acct_.../...",
    "expiresAt": 1780764664
  }
}
```

---

### 1.4 Open Stripe Express Dashboard

Gives the user a one-time link to their Stripe Express dashboard where they can see their payout history, bank accounts, and settings. Only works after onboarding is complete.

```
GET /stripe/connect/dashboard
```

**Response**
```json
{
  "success": true,
  "data": {
    "dashboardUrl": "https://connect.stripe.com/express/acct_.../..."
  }
}
```

**What to do:** Open `dashboardUrl` in browser. Link is single-use and expires quickly — always fetch a fresh one, never cache it.

---

### 1.5 View Transfer History

List of Stripe transfers received by the user's connected account.

```
GET /stripe/connect/transfers?limit=20
```

**Response**
```json
{
  "success": true,
  "data": {
    "transfers": [
      {
        "transferId": "tr_3abc...",
        "amount": 500.00,
        "currency": "usd",
        "created": "2026-06-06T14:00:00.000Z",
        "metadata": {
          "eventName": "Summer Gala",
          "type": "escrow_release"
        }
      }
    ]
  }
}
```

---

### 1.6 Request On-Demand Payout (Manual)

Triggers an immediate payout from the user's connected Stripe account to their linked bank. Stripe normally auto-pays on a rolling schedule — this is for when they want it now.

```
POST /stripe/connect/payout
```

**Body**
```json
{
  "amount": 200.00
}
```

Omit `amount` to pay out the full available balance.

**Response**
```json
{
  "success": true,
  "message": "Payout initiated",
  "data": {
    "payoutId": "po_3abc...",
    "amount": 200.00,
    "currency": "usd",
    "status": "pending",
    "estimatedArrival": "2026-06-08T00:00:00.000Z"
  }
}
```

**Errors**
```json
{ "error": { "code": "NO_STRIPE_ACCOUNT", "message": "..." } }
{ "error": { "code": "STRIPE_ONBOARDING_INCOMPLETE", "message": "..." } }
```

---

## Part 2 — Wallet

---

### 2.1 Get Wallet Balance

```
GET /wallet/balance
```

**Response**
```json
{
  "success": true,
  "data": {
    "balance": 750.00,
    "currency": "USD",
    "currencySymbol": "$",
    "pendingBalance": 0,
    "availableBalance": 750.00,
    "escrowBalance": 0
  }
}
```

**When does balance go up?**
- Admin pays the vendor → immediately
- Event escrow releases (30%+ check-ins) → immediately
- User funds their wallet manually → after Stripe payment confirms

---

### 2.2 Get Transaction History

```
GET /wallet/transactions?type=all&page=1&limit=20
```

`type` can be `all`, `credit`, or `debit`

**Response**
```json
{
  "success": true,
  "data": {
    "transactions": [
      {
        "id": "664abc...",
        "type": "credit",
        "amount": 500.00,
        "currency": "USD",
        "description": "DJ set - Summer Gala",
        "status": "completed",
        "reference": "tr_3abc...",
        "createdAt": "2026-06-06T14:00:00.000Z"
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

---

### 2.3 Withdraw Wallet Balance to Bank

Moves the user's in-app wallet balance to their linked bank account via Stripe. Requires Stripe onboarding to be complete.

```
POST /wallet/withdraw
```

**Body**
```json
{
  "amount": 200.00
}
```

**Response — Success**
```json
{
  "success": true,
  "message": "Withdrawal initiated successfully",
  "data": {
    "transactionId": "664abc...",
    "payoutId": "po_3abc...",
    "amount": 200.00,
    "currency": "USD",
    "status": "pending",
    "estimatedArrival": "2026-06-08T00:00:00.000Z"
  }
}
```

**Response — No Stripe account**
```json
{
  "success": false,
  "error": {
    "code": "NO_STRIPE_ACCOUNT",
    "message": "You must connect a bank account via Stripe before withdrawing. Visit /stripe/connect/onboard to set it up."
  }
}
```

**Response — Insufficient balance**
```json
{
  "success": false,
  "error": {
    "code": "INSUFFICIENT_BALANCE",
    "message": "Insufficient balance. Available: $50.00"
  }
}
```

---

### 2.4 Fund Wallet (Top Up)

User adds money to their in-app wallet using a card via Stripe Payment Sheet.

```
POST /wallet/fund
```

**Body**
```json
{
  "amount": 100.00
}
```

**Response**
```json
{
  "success": true,
  "data": {
    "paymentIntentClientSecret": "pi_3abc..._secret_...",
    "ephemeralKey": "ek_test_...",
    "customerId": "cus_...",
    "publishableKey": "pk_test_...",
    "amount": 100.00,
    "currency": "USD",
    "transactionId": "664abc..."
  }
}
```

Use `paymentIntentClientSecret`, `ephemeralKey`, and `customerId` with Stripe's Payment Sheet SDK on mobile.

---

### 2.5 Get Earnings Breakdown

```
GET /wallet/earnings
```

**Response**
```json
{
  "success": true,
  "data": {
    "totalEarnings": 1200.00,
    "availableBalance": 750.00,
    "pendingBalance": 0,
    "escrowBalance": 0,
    "currency": "USD",
    "breakdown": {
      "ticket_sales": { "total": 800.00, "count": 3 },
      "vendor_payment": { "total": 400.00, "count": 2 },
      "wallet_funded": { "total": 100.00, "count": 1 }
    }
  }
}
```

---

## Part 3 — Admin: Pay a Vendor

Admin-only endpoint. Transfers funds from the platform directly to a vendor's connected Stripe account.

```
POST /stripe/connect/vendor-payout
Authorization: Bearer <admin_token>
```

**Body**
```json
{
  "vendorId": "664abc...",
  "amount": 500.00,
  "currency": "usd",
  "description": "DJ set - Summer Gala 2026"
}
```

**Response — Success**
```json
{
  "success": true,
  "message": "$500 transferred to vendor successfully",
  "data": {
    "transferId": "tr_3abc...",
    "amount": 500.00,
    "currency": "usd",
    "vendorName": "Habib Lekanaa",
    "stripeAccount": "acct_1TfNMDIBkOISODdN"
  }
}
```

**Response — Vendor not onboarded**
```json
{
  "success": false,
  "error": "Vendor has not completed Stripe Connect onboarding. Ask them to visit /stripe/connect/onboard."
}
```

---

## Part 4 — Frontend Screen Guide

### Wallet / Earnings Screen

```
┌─────────────────────────────┐
│  Available Balance           │
│  $750.00                     │
│                              │
│  [Withdraw to Bank]          │  → POST /wallet/withdraw
│  [Fund Wallet]               │  → POST /wallet/fund
│  [View Stripe Dashboard]     │  → GET /stripe/connect/dashboard
│                              │
│  Recent Transactions         │  → GET /wallet/transactions
│  ─────────────────────────── │
│  + $500  DJ Set - Gala  ✓   │
│  + $250  Escrow Release  ✓  │
└─────────────────────────────┘
```

---

### Bank Account Setup Screen (show if isReady: false)

```
┌─────────────────────────────┐
│  💳 Connect Your Bank        │
│                              │
│  Link your bank account to   │
│  receive payouts from Faji.  │
│                              │
│  [Connect Bank Account]      │  → POST /stripe/connect/onboard
│                              │   → open onboardingUrl in browser
└─────────────────────────────┘
```

**After they return from Stripe:**
- Call `GET /stripe/connect/status`
- If `isReady: true` → show "Bank connected ✓", reveal withdraw button
- If `isReady: false` → show "Setup incomplete", show "Finish Setup" button → call `GET /stripe/connect/refresh`

---

### Withdraw Flow

1. User taps **Withdraw to Bank**
2. Check `GET /stripe/connect/status` first
   - Not ready → redirect to bank setup screen
   - Ready → show withdraw amount input
3. User enters amount → `POST /wallet/withdraw`
4. Show success screen with `estimatedArrival`

---

## Part 5 — Error Codes Reference

| Code | Meaning | What to show |
|---|---|---|
| `NO_STRIPE_ACCOUNT` | User hasn't connected a bank | Redirect to bank setup screen |
| `STRIPE_ONBOARDING_INCOMPLETE` | Started but didn't finish | Show "Finish Setup" button |
| `INSUFFICIENT_BALANCE` | Withdraw amount > balance | Show available balance, ask for lower amount |
| `PAYOUT_FAILED` | Stripe rejected the payout | Show error, balance is auto-restored |
| `USER_NOT_FOUND` | Auth issue | Force logout and re-login |

---

## Part 6 — Return URL Handler

After Stripe onboarding, the user is redirected to:
```
https://faji.app/stripe/connect/return?userId=<userId>
```

This page just needs to:
1. Show "Bank account connected successfully!"
2. Call `GET /stripe/connect/status` to confirm `isReady: true`
3. Navigate the user back to their wallet screen

No backend call needed on this page itself — Stripe's webhook (`account.updated`) already updates the DB automatically.
