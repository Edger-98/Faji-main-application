// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankDetailsRequestImpl _$$BankDetailsRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$BankDetailsRequestImpl', json, ($checkedConvert) {
      final val = _$BankDetailsRequestImpl(
        accountNumber: $checkedConvert('accountNumber', (v) => v as String),
        bankCode: $checkedConvert('bankCode', (v) => v as String),
        accountName: $checkedConvert('accountName', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$BankDetailsRequestImplToJson(
  _$BankDetailsRequestImpl instance,
) => <String, dynamic>{
  'accountNumber': instance.accountNumber,
  'bankCode': instance.bankCode,
  'accountName': instance.accountName,
};

_$BankDetailsResponseImpl _$$BankDetailsResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$BankDetailsResponseImpl', json, ($checkedConvert) {
      final val = _$BankDetailsResponseImpl(
        accountNumber: $checkedConvert('accountNumber', (v) => v as String),
        bankCode: $checkedConvert('bankCode', (v) => v as String),
        accountName: $checkedConvert('accountName', (v) => v as String),
        bankName: $checkedConvert('bankName', (v) => v as String),
        isVerified: $checkedConvert('isVerified', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$$BankDetailsResponseImplToJson(
  _$BankDetailsResponseImpl instance,
) => <String, dynamic>{
  'accountNumber': instance.accountNumber,
  'bankCode': instance.bankCode,
  'accountName': instance.accountName,
  'bankName': instance.bankName,
  'isVerified': instance.isVerified,
};
