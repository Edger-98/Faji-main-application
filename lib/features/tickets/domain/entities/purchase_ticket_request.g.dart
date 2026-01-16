// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_ticket_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseTicketRequestImpl _$$PurchaseTicketRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$PurchaseTicketRequestImpl', json, ($checkedConvert) {
      final val = _$PurchaseTicketRequestImpl(
        eventId: $checkedConvert('eventId', (v) => v as String),
        quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
        promoCode: $checkedConvert('promoCode', (v) => v as String?),
        paymentMethod: $checkedConvert(
          'paymentMethod',
          (v) => v as String? ?? 'paystack',
        ),
      );
      return val;
    });

Map<String, dynamic> _$$PurchaseTicketRequestImplToJson(
  _$PurchaseTicketRequestImpl instance,
) => <String, dynamic>{
  'eventId': instance.eventId,
  'quantity': instance.quantity,
  if (instance.promoCode case final value?) 'promoCode': value,
  'paymentMethod': instance.paymentMethod,
};
