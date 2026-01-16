# Phase 1: Flutter Ticketing System Implementation

**Date**: December 26, 2024  
**Status**: Ready to Implement  
**Architecture**: Clean Architecture (Data → Domain → Presentation)

---

## Overview

Implementing the ticketing system in the Flutter mobile app to consume the backend APIs from the Postman collection.

### API Endpoints to Implement (from Postman Section 3)

1. ✅ `POST /api/v1/tickets/purchase` - Purchase tickets
2. ✅ `POST /api/v1/tickets/validate-promo` - Validate promo code
3. ✅ `GET /api/v1/tickets/my-tickets` - Get user's tickets
4. ✅ `POST /api/v1/tickets/check-in` - Check-in guest

---

## Implementation Plan

### Step 1: Domain Layer (Entities)

Create new entities matching the API spec:

#### ✅ Created Files:
1. `purchase_ticket_request.dart` - Request for purchasing tickets
2. `purchase_ticket_response.dart` - Response with tickets and payment data
3. `promo_code_validation.dart` - Promo code validation response
4. `my_ticket.dart` - User's ticket list with pagination
5. `check_in_request.dart` - Check-in request and response

### Step 2: Domain Layer (Use Cases)

Create new use cases:

1. `purchase_tickets_usecase.dart`
2. `validate_promo_code_usecase.dart`
3. `get_my_tickets_usecase.dart`
4. `check_in_guest_usecase.dart`

### Step 3: Data Layer (Remote Data Source)

Update `ticket_remote_datasource.dart` with new API calls:

```dart
@RestApi(baseUrl: '/tickets')
abstract class TicketRemoteDataSource {
  factory TicketRemoteDataSource(Dio dio) = _TicketRemoteDataSource;

  @POST('/purchase')
  Future<ApiResponse<PurchaseTicketResponse>> purchaseTickets(
    @Body() PurchaseTicketRequest request,
  );

  @POST('/validate-promo')
  Future<ApiResponse<PromoCodeValidation>> validatePromoCode(
    @Body() Map<String, dynamic> body,
  );

  @GET('/my-tickets')
  Future<ApiResponse<MyTicketsResponse>> getMyTickets(
    @Query('status') String? status,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @POST('/check-in')
  Future<ApiResponse<CheckInResponse>> checkInGuest(
    @Body() CheckInRequest request,
  );
}
```

### Step 4: Data Layer (Repository Implementation)

Update `ticket_repository_impl.dart`:

```dart
@override
Future<Either<Failure, PurchaseTicketResponse>> purchaseTickets(
  PurchaseTicketRequest request,
) async {
  if (!await networkInfo.isConnected) {
    return Left(NetworkFailure());
  }

  try {
    final response = await remoteDataSource.purchaseTickets(request);
    return Right(response.data);
  } on DioException catch (e) {
    return Left(ServerFailure(e.message ?? 'Purchase failed'));
  }
}
```

### Step 5: Presentation Layer (ViewModels)

Create new ViewModels:

1. **PurchaseTicketViewModel** - Handle ticket purchase flow
2. **PromoCodeViewModel** - Handle promo code validation
3. **MyTicketsViewModel** - Display user's tickets
4. **CheckInViewModel** - Handle check-in process

### Step 6: Presentation Layer (UI Updates)

Update existing screens:

1. **buy_ticket_screen.dart** - Connect to purchase API
2. **my_tickets_screen.dart** - Display tickets from API
3. Add check-in screen for hosts

---

## Detailed Implementation

### 1. Purchase Tickets Flow

**UI Flow**:
```
1. User taps "Buy Ticket" on event details
2. Bottom sheet shows ticket quantity selector
3. User enters promo code (optional)
4. System validates promo code
5. Shows price breakdown (subtotal, discount, platform fee)
6. User confirms purchase
7. Redirects to payment gateway (Paystack)
8. Returns with tickets and QR codes
```

**ViewModel**:
```dart
class PurchaseTicketViewModel extends StateNotifier<BaseState<PurchaseTicketResponse>> {
  final PurchaseTicketsUseCase _purchaseTicketsUseCase;
  final ValidatePromoCodeUseCase _validatePromoCodeUseCase;

  Future<void> purchaseTickets({
    required String eventId,
    required int quantity,
    String? promoCode,
  }) async {
    state = const BaseState.loading();

    final request = PurchaseTicketRequest(
      eventId: eventId,
      quantity: quantity,
      promoCode: promoCode,
      paymentMethod: 'paystack',
    );

    final result = await _purchaseTicketsUseCase(request);

    result.fold(
      (failure) => state = BaseState.error(failure),
      (response) {
        state = BaseState.success(response);
        // Open payment URL if provided
        if (response.payment.paymentUrl != null) {
          _openPaymentUrl(response.payment.paymentUrl!);
        }
      },
    );
  }

  Future<void> validatePromoCode({
    required String eventId,
    required String promoCode,
    required double amount,
  }) async {
    final result = await _validatePromoCodeUseCase(
      eventId: eventId,
      promoCode: promoCode,
      amount: amount,
    );

    result.fold(
      (failure) => _promoCodeState = PromoCodeState.invalid(failure.message),
      (validation) {
        if (validation.valid) {
          _promoCodeState = PromoCodeState.valid(validation);
        } else {
          _promoCodeState = PromoCodeState.invalid('Invalid promo code');
        }
      },
    );
  }
}
```

### 2. My Tickets Flow

**UI Flow**:
```
1. User navigates to "My Tickets" tab
2. Shows list of purchased tickets
3. Filter by status (upcoming, past, cancelled)
4. Tap ticket to view QR code
5. Show event details
```

**ViewModel**:
```dart
class MyTicketsViewModel extends StateNotifier<BaseState<MyTicketsResponse>> {
  final GetMyTicketsUseCase _getMyTicketsUseCase;

  Future<void> loadMyTickets({
    String? status,
    int page = 1,
  }) async {
    if (page == 1) {
      state = const BaseState.loading();
    }

    final result = await _getMyTicketsUseCase(
      status: status,
      page: page,
      limit: 20,
    );

    result.fold(
      (failure) => state = BaseState.error(failure),
      (response) => state = BaseState.success(response),
    );
  }

  void filterByStatus(String status) {
    loadMyTickets(status: status);
  }
}
```

### 3. Check-In Flow

**UI Flow**:
```
1. Host scans guest QR code
2. System gets GPS location
3. Validates location (within 100m of event)
4. Marks ticket as used
5. Shows check-in success
6. Displays event verification status (30% threshold)
```

**ViewModel**:
```dart
class CheckInViewModel extends StateNotifier<BaseState<CheckInResponse>> {
  final CheckInGuestUseCase _checkInGuestUseCase;

  Future<void> checkInGuest({
    required String ticketId,
    required String eventId,
    required double latitude,
    required double longitude,
  }) async {
    state = const BaseState.loading();

    final request = CheckInRequest(
      ticketId: ticketId,
      eventId: eventId,
      location: LocationData(
        latitude: latitude,
        longitude: longitude,
      ),
    );

    final result = await _checkInGuestUseCase(request);

    result.fold(
      (failure) => state = BaseState.error(failure),
      (response) {
        state = BaseState.success(response);
        
        // Show verification alert if event is verified
        if (response.eventVerification.isVerified) {
          _showVerificationAlert(response.eventVerification);
        }
      },
    );
  }
}
```

---

## File Structure

```
lib/features/tickets/
├── data/
│   ├── datasources/
│   │   └── ticket_remote_datasource.dart (UPDATE)
│   ├── models/
│   │   ├── purchase_ticket_request_model.dart (NEW)
│   │   ├── purchase_ticket_response_model.dart (NEW)
│   │   ├── promo_code_validation_model.dart (NEW)
│   │   ├── my_ticket_model.dart (NEW)
│   │   └── check_in_request_model.dart (NEW)
│   └── repositories/
│       └── ticket_repository_impl.dart (UPDATE)
├── domain/
│   ├── entities/
│   │   ├── purchase_ticket_request.dart (✅ CREATED)
│   │   ├── purchase_ticket_response.dart (✅ CREATED)
│   │   ├── promo_code_validation.dart (✅ CREATED)
│   │   ├── my_ticket.dart (✅ CREATED)
│   │   └── check_in_request.dart (✅ CREATED)
│   ├── repositories/
│   │   └── ticket_repository.dart (UPDATE)
│   └── usecases/
│       ├── purchase_tickets_usecase.dart (NEW)
│       ├── validate_promo_code_usecase.dart (NEW)
│       ├── get_my_tickets_usecase.dart (NEW)
│       └── check_in_guest_usecase.dart (NEW)
└── presentation/
    ├── providers/
    │   └── ticket_providers.dart (UPDATE)
    ├── viewmodels/
    │   ├── purchase_ticket_viewmodel.dart (UPDATE)
    │   ├── promo_code_viewmodel.dart (NEW)
    │   ├── my_tickets_viewmodel.dart (NEW)
    │   └── check_in_viewmodel.dart (NEW)
    └── screens/
        ├── buy_ticket_screen.dart (UPDATE)
        ├── my_tickets_screen.dart (UPDATE)
        └── check_in_screen.dart (NEW)
```

---

## Next Steps

1. Run `flutter pub run build_runner build` to generate freezed files
2. Implement use cases
3. Update remote data source
4. Update repository implementation
5. Create/update ViewModels
6. Update UI screens
7. Test with backend API

---

## Testing Checklist

### Unit Tests
- [ ] Purchase tickets use case
- [ ] Validate promo code use case
- [ ] Get my tickets use case
- [ ] Check-in guest use case

### Integration Tests
- [ ] Purchase flow end-to-end
- [ ] Promo code validation
- [ ] Ticket list with pagination
- [ ] Check-in with GPS

### UI Tests
- [ ] Buy ticket bottom sheet
- [ ] Promo code input
- [ ] My tickets list
- [ ] QR code display
- [ ] Check-in screen

---

## API Response Examples

### Purchase Tickets Success
```json
{
  "success": true,
  "data": {
    "orderId": "ord_1234567890_abc123",
    "tickets": [
      {
        "id": "tkt_001",
        "eventId": "evt_123",
        "qrCode": "data:image/png;base64,...",
        "ticketNumber": "TKT-001-1234567890"
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

### Promo Code Validation Success
```json
{
  "success": true,
  "data": {
    "valid": true,
    "code": "EARLY2024",
    "discountType": "percentage",
    "discountValue": 10,
    "discountAmount": 1000,
    "expiresAt": "2024-12-31T23:59:59Z",
    "remainingUses": 50
  }
}
```

---

**Status**: Entities created ✅  
**Next**: Implement use cases and update data layer

