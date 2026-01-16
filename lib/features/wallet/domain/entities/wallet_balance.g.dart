// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletBalanceImpl _$$WalletBalanceImplFromJson(Map json) =>
    $checkedCreate(r'_$WalletBalanceImpl', json, ($checkedConvert) {
      final val = _$WalletBalanceImpl(
        balance: $checkedConvert('balance', (v) => (v as num).toDouble()),
        currency: $checkedConvert('currency', (v) => v as String),
        currencySymbol: $checkedConvert('currencySymbol', (v) => v as String),
        pendingBalance: $checkedConvert(
          'pendingBalance',
          (v) => (v as num).toDouble(),
        ),
        availableBalance: $checkedConvert(
          'availableBalance',
          (v) => (v as num).toDouble(),
        ),
        escrowBalance: $checkedConvert(
          'escrowBalance',
          (v) => (v as num).toDouble(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$WalletBalanceImplToJson(_$WalletBalanceImpl instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'currency': instance.currency,
      'currencySymbol': instance.currencySymbol,
      'pendingBalance': instance.pendingBalance,
      'availableBalance': instance.availableBalance,
      'escrowBalance': instance.escrowBalance,
    };
