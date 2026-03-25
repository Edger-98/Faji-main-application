// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopupRequestImpl _$$TopupRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$TopupRequestImpl', json, ($checkedConvert) {
      final val = _$TopupRequestImpl(
        amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$$TopupRequestImplToJson(_$TopupRequestImpl instance) =>
    <String, dynamic>{'amount': instance.amount};

_$TopupResponseImpl _$$TopupResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$TopupResponseImpl', json, ($checkedConvert) {
      final val = _$TopupResponseImpl(
        paymentIntentClientSecret: $checkedConvert(
          'paymentIntentClientSecret',
          (v) => v as String,
        ),
        ephemeralKey: $checkedConvert('ephemeralKey', (v) => v as String),
        customerId: $checkedConvert('customerId', (v) => v as String),
        publishableKey: $checkedConvert('publishableKey', (v) => v as String),
        amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
        currency: $checkedConvert('currency', (v) => v as String),
        transactionId: $checkedConvert('transactionId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$TopupResponseImplToJson(_$TopupResponseImpl instance) =>
    <String, dynamic>{
      'paymentIntentClientSecret': instance.paymentIntentClientSecret,
      'ephemeralKey': instance.ephemeralKey,
      'customerId': instance.customerId,
      'publishableKey': instance.publishableKey,
      'amount': instance.amount,
      'currency': instance.currency,
      'transactionId': instance.transactionId,
    };
