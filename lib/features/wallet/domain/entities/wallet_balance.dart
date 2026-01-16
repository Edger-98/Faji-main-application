import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_balance.freezed.dart';
part 'wallet_balance.g.dart';

/// Wallet Balance - matches API spec
@freezed
class WalletBalance with _$WalletBalance {
  const factory WalletBalance({
    required double balance,
    required String currency,
    required String currencySymbol,
    required double pendingBalance,
    required double availableBalance,
    required double escrowBalance,
  }) = _WalletBalance;

  factory WalletBalance.fromJson(Map<String, dynamic> json) =>
      _$WalletBalanceFromJson(json);
}
