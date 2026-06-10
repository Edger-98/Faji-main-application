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

_$WithdrawResponseImpl _$$WithdrawResponseImplFromJson(Map json) {
  // API returns transactionId/payoutId — fall back to withdrawalId for compatibility
  final String withdrawalId =
      (json['transactionId'] ?? json['payoutId'] ?? json['withdrawalId'] ?? '')
          as String;
  return _$WithdrawResponseImpl(
    withdrawalId: withdrawalId,
    amount: (json['amount'] as num?)?.toDouble() ?? 0,
    currency: (json['currency'] as String?) ?? 'USD',
    status: (json['status'] as String?) ?? 'pending',
    estimatedArrival: (json['estimatedArrival'] as String?) ?? '',
  );
}

Map<String, dynamic> _$$WithdrawResponseImplToJson(
  _$WithdrawResponseImpl instance,
) => <String, dynamic>{
  'withdrawalId': instance.withdrawalId,
  'amount': instance.amount,
  'currency': instance.currency,
  'status': instance.status,
  'estimatedArrival': instance.estimatedArrival,
};
