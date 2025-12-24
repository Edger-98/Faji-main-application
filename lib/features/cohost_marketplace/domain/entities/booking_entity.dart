import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_entity.freezed.dart';

/// Payment option for booking
enum PaymentOption {
  ticketSalesSplit, // Pay from ticket sales (% split)
  upfrontPayment,   // Pay upfront (fixed amount)
}

/// Booking status
enum BookingStatus {
  pending,      // Request sent, awaiting response
  accepted,     // Co-host accepted
  declined,     // Co-host declined
  negotiating,  // In negotiation
  confirmed,    // Terms agreed, payment pending
  paid,         // Payment completed
  completed,    // Event completed
  cancelled,    // Booking cancelled
}

/// Escrow status
enum EscrowStatus {
  pending,      // Awaiting payment
  held,         // Funds held in escrow
  released,     // Funds released to co-host
  refunded,     // Funds refunded to host
}

/// Entity representing a booking/request to a co-host
@freezed
class BookingEntity with _$BookingEntity {
  const factory BookingEntity({
    required String id,
    required String eventId,
    required String hostId,
    required String cohostId,
    required String resourceId,
    required BookingStatus status,
    required PaymentOption paymentOption,
    required double offeredPrice,
    double? agreedPrice,
    double? percentageSplit,
    String? message,
    DateTime? eventDate,
    EscrowStatus? escrowStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BookingEntity;
}
