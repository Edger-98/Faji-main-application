// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WithdrawRequestImpl _$$WithdrawRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$WithdrawRequestImpl', json, ($checkedConvert) {
      final val = _$WithdrawRequestImpl(
        amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
        bankAccount: $checkedConvert(
          'bankAccount',
          (v) => BankAccount.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$WithdrawRequestImplToJson(
  _$WithdrawRequestImpl instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'bankAccount': instance.bankAccount.toJson(),
};

_$BankAccountImpl _$$BankAccountImplFromJson(Map json) =>
    $checkedCreate(r'_$BankAccountImpl', json, ($checkedConvert) {
      final val = _$BankAccountImpl(
        accountNumber: $checkedConvert('accountNumber', (v) => v as String),
        bankCode: $checkedConvert('bankCode', (v) => v as String),
        accountName: $checkedConvert('accountName', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$BankAccountImplToJson(_$BankAccountImpl instance) =>
    <String, dynamic>{
      'accountNumber': instance.accountNumber,
      'bankCode': instance.bankCode,
      'accountName': instance.accountName,
    };

_$WithdrawResponseImpl _$$WithdrawResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$WithdrawResponseImpl', json, ($checkedConvert) {
      final val = _$WithdrawResponseImpl(
        withdrawalId: $checkedConvert('withdrawalId', (v) => v as String),
        amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
        currency: $checkedConvert('currency', (v) => v as String),
        status: $checkedConvert('status', (v) => v as String),
        estimatedArrival: $checkedConvert(
          'estimatedArrival',
          (v) => v as String,
        ),
      );
      return val;
    });

Map<String, dynamic> _$$WithdrawResponseImplToJson(
  _$WithdrawResponseImpl instance,
) => <String, dynamic>{
  'withdrawalId': instance.withdrawalId,
  'amount': instance.amount,
  'currency': instance.currency,
  'status': instance.status,
  'estimatedArrival': instance.estimatedArrival,
};
