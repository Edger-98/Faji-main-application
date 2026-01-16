import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_ticket_response.freezed.dart';
part 'purchase_ticket_response.g.dart';

/// Purchase Ticket Response - matches API spec
@freezed
class PurchaseTicketResponse with _$PurchaseTicketResponse {
  const factory PurchaseTicketResponse({
    required String orderId,
    required List<TicketData> tickets,
    required PaymentData payment,
  }) = _PurchaseTicketResponse;

  factory PurchaseTicketResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseTicketResponseFromJson(json);
}

@freezed
class TicketData with _$TicketData {
  const factory TicketData({
    required String id,
    required String eventId,
    required String qrCode,
    required String ticketNumber,
  }) = _TicketData;

  factory TicketData.fromJson(Map<String, dynamic> json) =>
      _$TicketDataFromJson(json);
}

@freezed
class PaymentData with _$PaymentData {
  const factory PaymentData({
    required double subtotal,
    required double discount,
    required double platformFee,
    required double total,
    required String currency,
    required String status,
    required String escrowStatus,
    String? paymentUrl,
    String? clientSecret,
  }) = _PaymentData;

  factory PaymentData.fromJson(Map<String, dynamic> json) =>
      _$PaymentDataFromJson(json);
}
