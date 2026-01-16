import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_transaction.freezed.dart';
part 'wallet_transaction.g.dart';

/// Wallet Transaction - matches API spec
@freezed
class WalletTransaction with _$WalletTransaction {
  const factory WalletTransaction({
    required String id,
    required String type,
    required double amount,
    required String currency,
    required String description,
    required String status,
    required String reference,
    required String createdAt,
  }) = _WalletTransaction;

  factory WalletTransaction.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionFromJson(json);
}

@freezed
class WalletTransactionsResponse with _$WalletTransactionsResponse {
  const factory WalletTransactionsResponse({
    required List<WalletTransaction> transactions,
    required TransactionPagination pagination,
  }) = _WalletTransactionsResponse;

  factory WalletTransactionsResponse.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionsResponseFromJson(json);
}

@freezed
class TransactionPagination with _$TransactionPagination {
  const factory TransactionPagination({
    required int page,
    required int limit,
    required int total,
    required int pages,
  }) = _TransactionPagination;

  factory TransactionPagination.fromJson(Map<String, dynamic> json) =>
      _$TransactionPaginationFromJson(json);
}
