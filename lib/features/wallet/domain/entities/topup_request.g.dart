// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopupRequestImpl _$$TopupRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$TopupRequestImpl', json, ($checkedConvert) {
      final val = _$TopupRequestImpl(
        amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
        paymentMethod: $checkedConvert('paymentMethod', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$TopupRequestImplToJson(_$TopupRequestImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'paymentMethod': instance.paymentMethod,
    };

_$TopupResponseImpl _$$TopupResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$TopupResponseImpl', json, ($checkedConvert) {
      final val = _$TopupResponseImpl(
        topupId: $checkedConvert('topupId', (v) => v as String),
        amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
        currency: $checkedConvert('currency', (v) => v as String),
        paymentUrl: $checkedConvert('paymentUrl', (v) => v as String),
        reference: $checkedConvert('reference', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$TopupResponseImplToJson(_$TopupResponseImpl instance) =>
    <String, dynamic>{
      'topupId': instance.topupId,
      'amount': instance.amount,
      'currency': instance.currency,
      'paymentUrl': instance.paymentUrl,
      'reference': instance.reference,
    };
