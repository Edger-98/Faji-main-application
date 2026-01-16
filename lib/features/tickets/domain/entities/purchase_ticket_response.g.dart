// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_ticket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseTicketResponseImpl _$$PurchaseTicketResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$PurchaseTicketResponseImpl', json, ($checkedConvert) {
      final val = _$PurchaseTicketResponseImpl(
        orderId: $checkedConvert('orderId', (v) => v as String),
        tickets: $checkedConvert(
          'tickets',
          (v) => (v as List<dynamic>)
              .map(
                (e) => TicketData.fromJson(Map<String, dynamic>.from(e as Map)),
              )
              .toList(),
        ),
        payment: $checkedConvert(
          'payment',
          (v) => PaymentData.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$PurchaseTicketResponseImplToJson(
  _$PurchaseTicketResponseImpl instance,
) => <String, dynamic>{
  'orderId': instance.orderId,
  'tickets': instance.tickets.map((e) => e.toJson()).toList(),
  'payment': instance.payment.toJson(),
};

_$TicketDataImpl _$$TicketDataImplFromJson(Map json) =>
    $checkedCreate(r'_$TicketDataImpl', json, ($checkedConvert) {
      final val = _$TicketDataImpl(
        id: $checkedConvert('id', (v) => v as String),
        eventId: $checkedConvert('eventId', (v) => v as String),
        qrCode: $checkedConvert('qrCode', (v) => v as String),
        ticketNumber: $checkedConvert('ticketNumber', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$TicketDataImplToJson(_$TicketDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      'qrCode': instance.qrCode,
      'ticketNumber': instance.ticketNumber,
    };

_$PaymentDataImpl _$$PaymentDataImplFromJson(Map json) => $checkedCreate(
  r'_$PaymentDataImpl',
  json,
  ($checkedConvert) {
    final val = _$PaymentDataImpl(
      subtotal: $checkedConvert('subtotal', (v) => (v as num).toDouble()),
      discount: $checkedConvert('discount', (v) => (v as num).toDouble()),
      platformFee: $checkedConvert('platformFee', (v) => (v as num).toDouble()),
      total: $checkedConvert('total', (v) => (v as num).toDouble()),
      currency: $checkedConvert('currency', (v) => v as String),
      status: $checkedConvert('status', (v) => v as String),
      escrowStatus: $checkedConvert('escrowStatus', (v) => v as String),
      paymentUrl: $checkedConvert('paymentUrl', (v) => v as String?),
      clientSecret: $checkedConvert('clientSecret', (v) => v as String?),
    );
    return val;
  },
);

Map<String, dynamic> _$$PaymentDataImplToJson(_$PaymentDataImpl instance) =>
    <String, dynamic>{
      'subtotal': instance.subtotal,
      'discount': instance.discount,
      'platformFee': instance.platformFee,
      'total': instance.total,
      'currency': instance.currency,
      'status': instance.status,
      'escrowStatus': instance.escrowStatus,
      if (instance.paymentUrl case final value?) 'paymentUrl': value,
      if (instance.clientSecret case final value?) 'clientSecret': value,
    };
