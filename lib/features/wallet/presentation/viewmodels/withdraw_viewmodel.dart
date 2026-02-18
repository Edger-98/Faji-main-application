import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/withdraw_request.dart';
import 'package:fajimobileapp/features/wallet/domain/usecases/withdraw_funds_usecase.dart';

// State for withdraw
typedef WithdrawState = BaseState<WithdrawResponse>;

class WithdrawViewModel extends StateNotifier<WithdrawState> {

  WithdrawViewModel(
    this._withdrawFundsUseCase,
  ) : super(const BaseState.initial());
  final WithdrawFundsUseCase _withdrawFundsUseCase;

  /// Withdraw funds from wallet
  Future<void> withdrawFunds({
    required double amount,
    required String accountNumber,
    required String bankCode,
    required String accountName,
  }) async {
    state = const BaseState.loading();

    final WithdrawRequest request = WithdrawRequest(
      amount: amount,
      bankAccount: BankAccount(
        accountNumber: accountNumber,
        bankCode: bankCode,
        accountName: accountName,
      ),
    );

    final Either<Failure, WithdrawResponse> result = await _withdrawFundsUseCase(request: request);

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (WithdrawResponse response) => state = BaseState.success(response),
    );
  }

  /// Reset state
  void reset() {
    state = const BaseState.initial();
  }
}
