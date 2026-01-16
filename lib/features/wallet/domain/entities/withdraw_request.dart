import 'package:freezed_annotation/freezed_annotation.dart';

part 'withdraw_request.freezed.dart';
part 'withdraw_request.g.dart';

/// Withdraw Request - matches API spec
@freezed
class WithdrawRequest with _$WithdrawRequest {
  const factory WithdrawRequest({
    required double amount,
    required BankAccount bankAccount,
  }) = _WithdrawRequest;

  factory WithdrawRequest.fromJson(Map<String, dynamic> json) =>
      _$WithdrawRequestFromJson(json);
}

@freezed
class BankAccount with _$BankAccount {
  const factory BankAccount({
    required String accountNumber,
    required String bankCode,
    required String accountName,
  }) = _BankAccount;

  factory BankAccount.fromJson(Map<String, dynamic> json) =>
      _$BankAccountFromJson(json);
}

@freezed
class WithdrawResponse with _$WithdrawResponse {
  const factory WithdrawResponse({
    required String withdrawalId,
    required double amount,
    required String currency,
    required String status,
    required String estimatedArrival,
  }) = _WithdrawResponse;

  factory WithdrawResponse.fromJson(Map<String, dynamic> json) =>
      _$WithdrawResponseFromJson(json);
}
