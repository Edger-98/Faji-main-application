// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_code_validation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromoCodeValidationImpl _$$PromoCodeValidationImplFromJson(Map json) =>
    $checkedCreate(r'_$PromoCodeValidationImpl', json, ($checkedConvert) {
      final val = _$PromoCodeValidationImpl(
        valid: $checkedConvert('valid', (v) => v as bool),
        code: $checkedConvert('code', (v) => v as String?),
        discountType: $checkedConvert('discountType', (v) => v as String?),
        discountValue: $checkedConvert(
          'discountValue',
          (v) => (v as num?)?.toDouble(),
        ),
        discountAmount: $checkedConvert(
          'discountAmount',
          (v) => (v as num?)?.toDouble(),
        ),
        expiresAt: $checkedConvert('expiresAt', (v) => v as String?),
        remainingUses: $checkedConvert(
          'remainingUses',
          (v) => (v as num?)?.toInt(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$PromoCodeValidationImplToJson(
  _$PromoCodeValidationImpl instance,
) => <String, dynamic>{
  'valid': instance.valid,
  if (instance.code case final value?) 'code': value,
  if (instance.discountType case final value?) 'discountType': value,
  if (instance.discountValue case final value?) 'discountValue': value,
  if (instance.discountAmount case final value?) 'discountAmount': value,
  if (instance.expiresAt case final value?) 'expiresAt': value,
  if (instance.remainingUses case final value?) 'remainingUses': value,
};
