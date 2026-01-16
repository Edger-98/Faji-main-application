import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/base/base_state.dart';
import '../../domain/entities/wallet_balance.dart';
import '../../domain/entities/wallet_transaction.dart';
import '../../domain/entities/earnings_breakdown.dart';
import '../../domain/usecases/get_wallet_balance_usecase.dart';
import '../../domain/usecases/get_wallet_transactions_usecase.dart';
import '../../domain/usecases/get_earnings_breakdown_usecase.dart';

// State for wallet
class WalletState {
  final BaseState<WalletBalance> balanceState;
  final BaseState<WalletTransactionsResponse> transactionsState;
  final BaseState<EarningsBreakdown> earningsState;

  WalletState({
    required this.balanceState,
    required this.transactionsState,
    required this.earningsState,
  });

  WalletState copyWith({
    BaseState<WalletBalance>? balanceState,
    BaseState<WalletTransactionsResponse>? transactionsState,
    BaseState<EarningsBreakdown>? earningsState,
  }) {
    return WalletState(
      balanceState: balanceState ?? this.balanceState,
      transactionsState: transactionsState ?? this.transactionsState,
      earningsState: earningsState ?? this.earningsState,
    );
  }
}

class WalletViewModel extends StateNotifier<WalletState> {
  final GetWalletBalanceUseCase _getWalletBalanceUseCase;
  final GetWalletTransactionsUseCase _getWalletTransactionsUseCase;
  final GetEarningsBreakdownUseCase _getEarningsBreakdownUseCase;

  WalletViewModel(
    this._getWalletBalanceUseCase,
    this._getWalletTransactionsUseCase,
    this._getEarningsBreakdownUseCase,
  ) : super(WalletState(
          balanceState: const BaseState.initial(),
          transactionsState: const BaseState.initial(),
          earningsState: const BaseState.initial(),
        ));

  /// Get wallet balance
  Future<void> getWalletBalance() async {
    state = state.copyWith(
      balanceState: const BaseState.loading(),
    );

    final result = await _getWalletBalanceUseCase();

    result.fold(
      (failure) => state = state.copyWith(
        balanceState: BaseState.error(failure),
      ),
      (balance) => state = state.copyWith(
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

    final result = await _getWalletTransactionsUseCase(
      type: type,
      page: page,
      limit: limit,
    );

    result.fold(
      (failure) => state = state.copyWith(
        transactionsState: BaseState.error(failure),
      ),
      (transactions) => state = state.copyWith(
        transactionsState: BaseState.success(transactions),
      ),
    );
  }

  /// Get earnings breakdown
  Future<void> getEarningsBreakdown() async {
    state = state.copyWith(
      earningsState: const BaseState.loading(),
    );

    final result = await _getEarningsBreakdownUseCase();

    result.fold(
      (failure) => state = state.copyWith(
        earningsState: BaseState.error(failure),
      ),
      (earnings) => state = state.copyWith(
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
    final currentState = state.transactionsState;
    if (currentState.isSuccess) {
      final data = currentState.dataOrNull;
      if (data != null) {
        final currentPage = data.pagination.page;
        final totalPages = data.pagination.pages;

        if (currentPage < totalPages) {
          await getWalletTransactions(page: currentPage + 1);
        }
      }
    }
  }

  /// Refresh all wallet data
  Future<void> refreshAll() async {
    await Future.wait([
      getWalletBalance(),
      getWalletTransactions(),
      getEarningsBreakdown(),
    ]);
  }
}
