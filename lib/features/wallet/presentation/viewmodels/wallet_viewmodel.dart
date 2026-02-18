import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/wallet_balance.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/wallet_transaction.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/earnings_breakdown.dart';
import 'package:fajimobileapp/features/wallet/domain/usecases/get_wallet_balance_usecase.dart';
import 'package:fajimobileapp/features/wallet/domain/usecases/get_wallet_transactions_usecase.dart';
import 'package:fajimobileapp/features/wallet/domain/usecases/get_earnings_breakdown_usecase.dart';

// State for wallet
class WalletState {

  WalletState({
    required this.balanceState,
    required this.transactionsState,
    required this.earningsState,
  });
  final BaseState<WalletBalance> balanceState;
  final BaseState<WalletTransactionsResponse> transactionsState;
  final BaseState<EarningsBreakdown> earningsState;

  WalletState copyWith({
    BaseState<WalletBalance>? balanceState,
    BaseState<WalletTransactionsResponse>? transactionsState,
    BaseState<EarningsBreakdown>? earningsState,
  }) => WalletState(
      balanceState: balanceState ?? this.balanceState,
      transactionsState: transactionsState ?? this.transactionsState,
      earningsState: earningsState ?? this.earningsState,
    );
}

class WalletViewModel extends StateNotifier<WalletState> {

  WalletViewModel(
    this._getWalletBalanceUseCase,
    this._getWalletTransactionsUseCase,
    this._getEarningsBreakdownUseCase,
  ) : super(WalletState(
          balanceState: const BaseState.initial(),
          transactionsState: const BaseState.initial(),
          earningsState: const BaseState.initial(),
        ));
  final GetWalletBalanceUseCase _getWalletBalanceUseCase;
  final GetWalletTransactionsUseCase _getWalletTransactionsUseCase;
  final GetEarningsBreakdownUseCase _getEarningsBreakdownUseCase;

  /// Get wallet balance
  Future<void> getWalletBalance() async {
    state = state.copyWith(
      balanceState: const BaseState.loading(),
    );

    final Either<Failure, WalletBalance> result = await _getWalletBalanceUseCase();

    result.fold(
      (Failure failure) => state = state.copyWith(
        balanceState: BaseState.error(failure),
      ),
      (WalletBalance balance) => state = state.copyWith(
        balanceState: BaseState.success(balance),
      ),
    );
  }

  /// Get wallet transactions
  Future<void> getWalletTransactions({
    String? type,
    int page = 1,
    int limit = 20,
  }) async {
    state = state.copyWith(
      transactionsState: const BaseState.loading(),
    );

    final Either<Failure, WalletTransactionsResponse> result = await _getWalletTransactionsUseCase(
      type: type,
      page: page,
      limit: limit,
    );

    result.fold(
      (Failure failure) => state = state.copyWith(
        transactionsState: BaseState.error(failure),
      ),
      (WalletTransactionsResponse transactions) => state = state.copyWith(
        transactionsState: BaseState.success(transactions),
      ),
    );
  }

  /// Get earnings breakdown
  Future<void> getEarningsBreakdown() async {
    state = state.copyWith(
      earningsState: const BaseState.loading(),
    );

    final Either<Failure, EarningsBreakdown> result = await _getEarningsBreakdownUseCase();

    result.fold(
      (Failure failure) => state = state.copyWith(
        earningsState: BaseState.error(failure),
      ),
      (EarningsBreakdown earnings) => state = state.copyWith(
        earningsState: BaseState.success(earnings),
      ),
    );
  }

  /// Filter transactions by type
  Future<void> filterTransactionsByType(String type) async {
    await getWalletTransactions(type: type);
  }

  /// Load more transactions (pagination)
  Future<void> loadMoreTransactions() async {
    final BaseState<WalletTransactionsResponse> currentState = state.transactionsState;
    if (currentState.isSuccess) {
      final WalletTransactionsResponse? data = currentState.dataOrNull;
      if (data != null) {
        final int currentPage = data.pagination.page;
        final int totalPages = data.pagination.pages;

        if (currentPage < totalPages) {
          await getWalletTransactions(page: currentPage + 1);
        }
      }
    }
  }

  /// Refresh all wallet data
  Future<void> refreshAll() async {
    await Future.wait(<Future<void>>[
      getWalletBalance(),
      getWalletTransactions(),
      getEarningsBreakdown(),
    ]);
  }
}
