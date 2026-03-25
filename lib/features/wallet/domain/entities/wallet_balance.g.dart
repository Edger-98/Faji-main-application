// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletBalanceImpl _$$WalletBalanceImplFromJson(Map json) =>
    _$WalletBalanceImpl(
      balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] as String? ?? 'USD',
      currencySymbol: json['currencySymbol'] as String? ?? '\$',
      pendingBalance: (json['pendingBalance'] as num?)?.toDouble() ?? 0.0,
      availableBalance: (json['availableBalance'] as num?)?.toDouble() ?? 0.0,
      escrowBalance: (json['escrowBalance'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$WalletBalanceImplToJson(_$WalletBalanceImpl instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'currency': instance.currency,
      'currencySymbol': instance.currencySymbol,
      'pendingBalance': instance.pendingBalance,
      'availableBalance': instance.availableBalance,
      'escrowBalance': instance.escrowBalance,
    };
