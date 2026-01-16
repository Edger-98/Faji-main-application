# Postman Collection to API Spec Mapping

**Quick Reference**: Maps Postman endpoints to specification sections

---

## Phase 2: Events (7 endpoints)

| Postman Request | Endpoint | Spec Section | Priority |
|----------------|----------|--------------|----------|
| Create Event | `POST /events` | 1.1 | 🔴 Critical |
| Get All Events | `GET /events` | 7.2 | 🔴 Critical |
| Get My Events | `GET /events/my-events` | 8.1 | 🔴 Critical |
| Get Event Details | `GET /events/:id` | 7.1 | 🔴 Critical |
| Update Event | `PATCH /events/:id` | 1.2 | 🔴 Critical |
| Delete Event | `DELETE /events/:id` | 1.3 | 🔴 Critical |
| Get Event Dashboard | `GET /events/:id/dashboard` | 8.2 | 🔴 Critical |

---

## Phase 3: Tickets (5 endpoints)

| Postman Request | Endpoint | Spec Section | Priority |
|----------------|----------|--------------|----------|
| Purchase Tickets | `POST /tickets/purchase` | 2.1 | 🔴 Critical |
| Validate Promo Code | `POST /tickets/validate-promo` | 2.2 | 🔴 Critical |
| Get My Tickets | `GET /tickets/my-tickets` | 2.3 | 🔴 Critical |
| Check-In Guest | `POST /tickets/check-in` | 2.4 | 🔴 Critical |
| Get Ticket Details | `GET /tickets/:id` | 2.3 | 🟡 High |

---

## Phase 4: Event Verification (5 endpoints)

| Postman Request | Endpoint | Spec Section | Priority |
|----------------|----------|--------------|----------|
| Get Verification Status | `GET /events/:id/verification` | 12.2 | 🟡 High |
| Manually Verify Event | `POST /events/:id/verify` | 12.2 | 🟡 High |
| Get Revenue Distribution | `GET /events/:id/revenue` | 12.3 | 🟡 High |
| Process Event Refunds | `POST /events/:id/refund` | 12.2 | 🟡 High |
| Release Escrow Manually | `POST /events/:id/release-escrow` | 12.2 | 🟡 High |

---

## Phase 5: Co-Host System (7 endpoints)

| Postman Request | Endpoint | Spec Section | Priority |
|----------------|----------|--------------|----------|
| Invite Co-Host | `POST /events/:id/cohosts/invite` | 5.1 | 🟡 High |
| Get Co-Host Invitations | `GET /cohosts/invitations` | 5.2 | 🟡 High |
| Accept Co-Host Invitation | `POST /cohosts/invitations/:id/accept` | 5.3 | 🟡 High |
| Decline Co-Host Invitation | `POST /cohosts/invitations/:id/decline` | 5.4 | 🟡 High |
| Get Event Co-Hosts | `GET /events/:id/cohosts` | 5.5 | 🟡 High |
| Remove Co-Host | `DELETE /events/:id/cohosts/:id` | 5.6 | 🟡 High |
| Get Co-Host Dashboard | `GET /cohosts/dashboard/:eventId` | 5.7 | 🟡 High |

---

## Phase 6: Wallet & Payments (5 endpoints)

| Postman Request | Endpoint | Spec Section | Priority |
|----------------|----------|--------------|----------|
| Get Wallet Balance | `GET /wallet/balance` | 6.1 | 🟢 Medium |
| Get Wallet Transactions | `GET /wallet/transactions` | 6.2 | 🟢 Medium |
| Withdraw Funds | `POST /wallet/withdraw` | 6.3 | 🟢 Medium |
| Top-up Wallet | `POST /wallet/topup` | 6.4 | 🟢 Medium |
| Get Earnings Breakdown | `GET /wallet/earnings` | 6.2 | 🟢 Medium |

---

## Phase 7: Marketplace & Vendors (16 endpoints)

| Postman Request | Endpoint | Spec Section | Priority |
|----------------|----------|--------------|----------|
| Get Resources by Category | `GET /marketplace/resources` | 4.2 | 🟢 Medium |
| Get Vendor Profile | `GET /marketplace/vendors/:id` | 4.2 | 🟢 Medium |
| Create Booking Request | `POST /marketplace/bookings` | 4.3 | 🟢 Medium |
| Get My Bookings (Host) | `GET /marketplace/bookings/my-requests` | 4.4 | 🟢 Medium |
| Get Booking Requests (Vendor) | `GET /marketplace/bookings/requests` | 9.2 | 🟢 Medium |
| Accept Booking (Vendor) | `POST /marketplace/bookings/:id/accept` | 9.3 | 🟢 Medium |
| Decline Booking (Vendor) | `POST /marketplace/bookings/:id/decline` | 9.3 | 🟢 Medium |
| Send Counter Offer (Vendor) | `POST /marketplace/bookings/:id/counter-offer` | 9.3 | 🟢 Medium |
| Update Booking Status | `PATCH /marketplace/bookings/:id` | 9.3 | 🟢 Medium |
| Get My Vendor Profile | `GET /marketplace/vendors/me` | 9.1 | 🟢 Medium |
| Get Vendor Statistics | `GET /marketplace/vendors/me/stats` | 9.4 | 🟢 Medium |
| Add Resource/Service | `POST /marketplace/vendors/me/resources` | Appendix A | 🟢 Medium |
| Get My Resources | `GET /marketplace/vendors/me/resources` | Appendix A | 🟢 Medium |
| Update Resource | `PATCH /marketplace/vendors/me/resources/:id` | Appendix A | 🟢 Medium |
| Delete Resource | `DELETE /marketplace/vendors/me/resources/:id` | Appendix A | 🟢 Medium |
| Get Vendor Dashboard | `GET /marketplace/vendors/me/dashboard` | 9.1 | 🟢 Medium |

---

## Phase 8: Vendor Registration (8 endpoints)

| Postman Request | Endpoint | Spec Section | Priority |
|----------------|----------|--------------|----------|
| Register as Vendor | `POST /vendor-registration/register` | Appendix A | 🟢 Medium |
| Upload Verification Documents | `POST /vendor-registration/documents` | Appendix A | 🟢 Medium |
| Upload Portfolio Images | `POST /vendor-registration/portfolio` | Appendix A | 🟢 Medium |
| Add Bank Details | `POST /vendor-registration/bank-details` | Appendix A | 🟢 Medium |
| Check Vendor Status | `GET /vendor-registration/check-status` | Appendix A | 🟢 Medium |
| Get My Vendor Profile | `GET /vendor-registration/profile` | Appendix A | 🟢 Medium |
| Update Vendor Profile | `PATCH /vendor-registration/profile` | Appendix A | 🟢 Medium |
| Delete Portfolio Image | `DELETE /vendor-registration/portfolio/:id` | Appendix A | 🟢 Medium |

---

## Phase 9: Webhooks (1 endpoint)

| Postman Request | Endpoint | Spec Section | Priority |
|----------------|----------|--------------|----------|
| Stripe Webhook | `POST /webhooks/stripe` | 13.1 | ⚪ Low |

---

## Quick Stats

- **Total Endpoints**: 56
- **Critical (🔴)**: 13 endpoints (Phases 2-3)
- **High (🟡)**: 12 endpoints (Phases 4-5)
- **Medium (🟢)**: 30 endpoints (Phases 6-8)
- **Low (⚪)**: 1 endpoint (Phase 9)

---

## Implementation Order

1. **Week 1**: Phases 2-3 (18 endpoints) - Events & Tickets
2. **Week 2**: Phases 4-5 (12 endpoints) - Verification & Co-Host
3. **Week 3**: Phases 6-7 (21 endpoints) - Wallet & Marketplace
4. **Week 4**: Phases 8-9 (9 endpoints) - Vendor Registration & Webhooks

---

## Postman Variables Used

| Variable | Set By | Used In |
|----------|--------|---------|
| `access_token` | Login User | All authenticated endpoints |
| `event_id` | Create Event | Event operations, tickets, co-hosts |
| `ticket_id` | Purchase Tickets | Check-in, ticket details |
| `order_id` | Purchase Tickets | Order tracking |
| `invitation_id` | Invite Co-Host | Accept/decline invitation |

---

## Testing Flow

### 1. Authentication
```
POST /auth/register → POST /auth/login → Sets access_token
```

### 2. Event Creation
```
POST /events → Sets event_id → GET /events/:id
```

### 3. Ticket Purchase
```
POST /tickets/purchase → Sets ticket_id, order_id → GET /tickets/my-tickets
```

### 4. Check-In & Verification
```
POST /tickets/check-in → Triggers verification if >= 30%
```

### 5. Co-Host Flow
```
POST /events/:id/cohosts/invite → Sets invitation_id
→ POST /cohosts/invitations/:id/accept
→ GET /cohosts/dashboard/:eventId
```

### 6. Vendor Flow
```
POST /vendor-registration/register
→ POST /marketplace/vendors/me/resources
→ GET /marketplace/bookings/requests
→ POST /marketplace/bookings/:id/accept
```

---

**Reference**: See `BACKEND_API_SPECIFICATION_V2.md` for complete details
