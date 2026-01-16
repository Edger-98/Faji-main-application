// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CounterOfferRequestImpl _$$CounterOfferRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$CounterOfferRequestImpl', json, ($checkedConvert) {
      final val = _$CounterOfferRequestImpl(
        counterPrice: $checkedConvert(
          'counterPrice',
          (v) => (v as num).toDouble(),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$CounterOfferRequestImplToJson(
  _$CounterOfferRequestImpl instance,
) => <String, dynamic>{
  'counterPrice': instance.counterPrice,
  if (instance.message case final value?) 'message': value,
};

_$CounterOfferResponseImpl _$$CounterOfferResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$CounterOfferResponseImpl', json, ($checkedConvert) {
      final val = _$CounterOfferResponseImpl(
        id: $checkedConvert('id', (v) => v as String),
        status: $checkedConvert('status', (v) => v as String),
        counterPrice: $checkedConvert(
          'counterPrice',
          (v) => (v as num).toDouble(),
        ),
        message: $checkedConvert('message', (v) => v as String?),
        updatedAt: $checkedConvert('updatedAt', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$CounterOfferResponseImplToJson(
  _$CounterOfferResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'counterPrice': instance.counterPrice,
  if (instance.message case final value?) 'message': value,
  'updatedAt': instance.updatedAt,
};
