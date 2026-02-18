import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_ticket_request.freezed.dart';
part 'purchase_ticket_request.g.dart';

/// Purchase Ticket Request - matches API spec
@freezed
class PurchaseTicketRequest with _$PurchaseTicketRequest {
  const factory PurchaseTicketRequest({
    required String eventId,
    required int quantity,
    String? promoCode,
    @Default('paystack') String paymentMethod,
  }) = _PurchaseTicketRequest;

  factory PurchaseTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$PurchaseTicketRequestFromJson(json);
}

extension PurchaseTicketRequestX on PurchaseTicketRequest {
  Map<String, dynamic> toJson() => <String, dynamic>{
        'eventId': eventId,
        'quantity': quantity,
        if (promoCode != null) 'promoCode': promoCode,
        'paymentMethod': paymentMethod,
      };
}
