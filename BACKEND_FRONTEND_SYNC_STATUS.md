# Backend-Frontend Sync Status - January 6, 2026

## ✅ What Backend Has Implemented

Based on the Postman v2.0 docs:

### 1. Ticketing Information in Events
```json
"ticketing": {
  "enabled": true,
  "price": 5000,
  "currency": "NGN",
  "currencySymbol": "₦",
  "totalTickets": 100,
  "availableTickets": 75,
  "soldTickets": 25,
  "isSoldOut": false,
  "isFree": false
}
```

### 2. Ticket Purchase Endpoint
- **POST** `/tickets/purchase`
- Body:
```json
{
  "eventId": "event_id",
  "quantity": 2,
  "promoCode": "NEWYEAR2026",
  "paymentMethod": "stripe"
}
```

### 3. Get My Tickets Endpoint
- **GET** `/tickets/my-tickets?page=1&limit=20`

## ✅ What Frontend Has Implemented

### 1. Ticketing Model ✅
- Created `lib/core/models/ticketing_model.dart`
- Parses all ticketing fields from backend
- Helper methods: `ticketsRemaining`, `hasTickets`, `formattedPrice`

### 2. Event Model Updated ✅
- Added `ticketing` field to `EventModel`
- Parses ticketing from event JSON
- Backward compatible (ticketing is optional)

### 3. Buy Ticket Bottom Sheet ✅
- Already implemented in `lib/features/tickets/presentation/widgets/buy_ticket_bottom_sheet.dart`
- Calls `/tickets/purchase` endpoint
- Handles Stripe payment URLs
- Shows success/error messages

### 4. Ticket Purchase Use Case ✅
- Already exists in `lib/features/tickets/domain/usecases/purchase_tickets_usecase.dart`
- Integrates with repository

## 🔄 What Frontend Needs to Update

### 1. Display Ticketing Info in Event Cards
**Files to update:**
- `lib/features/events/presentation/widgets/event_card.dart`
- `lib/features/home/presentation/widgets/event_card.dart`

**Changes needed:**
```dart
// Show price from ticketing if available
final price = event.ticketing?.formattedPrice ?? '\$${event.price}';
final isFree = event.ticketing?.isFree ?? (event.price == 0);
final isSoldOut = event.ticketing?.isSoldOut ?? false;

// Display
if (isFree) {
  Text('FREE');
} else if (isSoldOut) {
  Text('SOLD OUT');
} else {
  Text(price);
}
```

### 2. Update Event Details Screen
**File:** `lib/features/events/presentation/screens/event_details_screen.dart`

**Changes needed:**
```dart
// Use ticketing info if available
if (event.ticketing != null) {
  final ticketing = event.ticketing!;
  
  // Show availability
  Text('${ticketing.availableTickets} / ${ticketing.totalTickets} tickets available');
  
  // Show sold out badge
  if (ticketing.isSoldOut) {
    Container(
      child: Text('SOLD OUT'),
    );
  }
  
  // Disable buy button if sold out
  ElevatedButton(
    onPressed: ticketing.isSoldOut ? null : () => _buyTickets(),
    child: Text(ticketing.isFree ? 'RSVP' : 'Buy Tickets'),
  );
}
```

### 3. Update Buy Ticket Bottom Sheet
**File:** `lib/features/tickets/presentation/widgets/buy_ticket_bottom_sheet.dart`

**Changes needed:**
```dart
// Use ticketing info from event
final ticketing = widget.event.ticketing;

if (ticketing != null) {
  // Use ticketing price
  final price = ticketing.price;
  final currency = ticketing.currencySymbol;
  
  // Check availability
  if (ticketing.isSoldOut) {
    return _buildSoldOutMessage();
  }
  
  // Limit quantity to available tickets
  final maxQuantity = min(10, ticketing.availableTickets);
}
```

### 4. My Tickets Screen
**File:** `lib/features/tickets/presentation/screens/my_tickets_screen.dart`

**Status:** Already implemented, just needs to call the endpoint

**Changes needed:**
```dart
// Update provider to call /tickets/my-tickets
final myTicketsProvider = FutureProvider<List<TicketEntity>>((ref) async {
  final repository = ref.read(ticketRepositoryProvider);
  return repository.getMyTickets();
});
```

## ⚠️ What Frontend is Expecting from Backend

### 1. Stripe Payment Intent Response
When calling `/tickets/purchase`, backend should return:
```json
{
  "success": true,
  "data": {
    "orderId": "order_123",
    "tickets": [...],
    "payment": {
      "clientSecret": "pi_xxx_secret_xxx",  // For Stripe
      "paymentIntentId": "pi_xxx",
      "paymentUrl": "https://checkout.stripe.com/...",  // Alternative
      "total": 10000,
      "currency": "NGN",
      "customerId": "cus_xxx",  // Optional
      "ephemeralKey": "ek_xxx"  // Optional
    }
  }
}
```

**Frontend will:**
- If `clientSecret` is provided → Use Stripe SDK to show payment sheet
- If `paymentUrl` is provided → Open URL in browser
- If neither → Assume free ticket or payment already processed

### 2. Ticket Entity Structure
Frontend expects tickets to have:
```json
{
  "id": "ticket_123",
  "eventId": "event_123",
  "userId": "user_123",
  "ticketNumber": "FAJI-2026-001",
  "qrCode": "base64_or_url",
  "status": "active",  // active, used, cancelled
  "purchaseDate": "2026-01-06T10:00:00Z",
  "price": 5000,
  "currency": "NGN"
}
```

### 3. Event List Endpoints Should Include Ticketing
All event list endpoints should include ticketing info:
- `/events` (Get User Events)
- `/events/trending`
- `/events/upcoming`
- `/events/my-events`
- `/events/favorites`

**Response format:**
```json
{
  "success": true,
  "data": [
    {
      "id": "event_123",
      "name": "Event Name",
      "ticketing": {
        "enabled": true,
        "price": 5000,
        "currency": "NGN",
        "currencySymbol": "₦",
        "isFree": false,
        "isSoldOut": false
      },
      // ... other event fields
    }
  ]
}
```

## 📋 Implementation Checklist

### Frontend Tasks
- [ ] Update event cards to show ticketing info
- [ ] Update event details to show availability
- [ ] Update buy ticket sheet to use ticketing model
- [ ] Test ticket purchase flow
- [ ] Test my tickets screen
- [ ] Handle sold out events
- [ ] Handle free events

### Backend Tasks (Expected)
- [x] Add ticketing to event model
- [x] Implement ticket purchase endpoint
- [x] Implement get my tickets endpoint
- [ ] Return Stripe clientSecret in purchase response
- [ ] Include ticketing in all event list endpoints
- [ ] Handle sold out logic
- [ ] Handle promo codes

## 🎯 Priority Order

1. **High Priority:**
   - Update event cards to show correct pricing
   - Handle sold out events
   - Test ticket purchase with Stripe

2. **Medium Priority:**
   - Update my tickets screen
   - Add availability indicators
   - Handle free events properly

3. **Low Priority:**
   - Promo code validation
   - Ticket transfer functionality
   - Refund handling

## 🔗 Integration Points

### Stripe Integration
Frontend has `StripeService` ready at `lib/core/services/stripe_service.dart`

**Usage:**
```dart
final success = await StripeService.presentPaymentSheet(
  clientSecret: response.payment.clientSecret,
  customerId: response.payment.customerId,
  ephemeralKey: response.payment.ephemeralKey,
);
```

### Payment Flow
1. User selects quantity in bottom sheet
2. Frontend calls `/tickets/purchase`
3. Backend creates Stripe payment intent
4. Backend returns `clientSecret`
5. Frontend shows Stripe payment sheet
6. User completes payment
7. Stripe confirms payment
8. Backend updates ticket status
9. Frontend shows success message

## ✅ Summary

**Frontend is ready for:**
- Parsing ticketing information
- Displaying ticket prices
- Handling ticket purchases
- Stripe payment integration

**Frontend needs:**
- Backend to include ticketing in all event responses
- Backend to return Stripe clientSecret in purchase response
- Backend to handle sold out logic

**Next steps:**
1. Update UI components to use ticketing model
2. Test with backend API
3. Handle edge cases (sold out, free events)
4. Add error handling for payment failures
