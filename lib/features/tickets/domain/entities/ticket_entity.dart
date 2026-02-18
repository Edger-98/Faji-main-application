import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_entity.freezed.dart';

/// Ticket entity - domain layer
@freezed
class TicketEntity with _$TicketEntity {
  const factory TicketEntity({
    required String id,
    required String userId,
    required String eventId,
    required int ticketId,
    required DateTime purchasedDate,
    required int quantity, required String transactionId, String? promoCode,
    DateTime? createdAt,
  }) = _TicketEntity;

  const TicketEntity._();

  /// Check if ticket is valid (not expired)
  bool get isValid => true; // Add validation logic if needed
}
