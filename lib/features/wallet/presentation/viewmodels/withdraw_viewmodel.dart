import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/base/base_state.dart';
import '../../domain/entities/withdraw_request.dart';
import '../../domain/usecases/withdraw_funds_usecase.dart';

// State for withdraw
typedef WithdrawState = BaseState<WithdrawResponse>;

class WithdrawViewModel extends StateNotifier<WithdrawState> {
  final WithdrawFundsUseCase _withdrawFundsUseCase;

  WithdrawViewModel(
    this._withdrawFundsUseCase,
  ) : super(const BaseState.initial());

  /// Withdraw funds from wallet
  Future<void> withdrawFunds({
    required double amount,
    required String accountNumber,
    required String bankCode,
    required String accountName,
  }) async {
    state = const BaseState.loading();

    final request = WithdrawRequest(
      amount: amount,
      bankAccount: BankAccount(
        accountNumber: accountNumber,
        bankCode: bankCode,
        accountName: accountName,
      ),
    );

    final result = await _withdrawFundsUseCase(request: request);

    result.fold(
      (failure) => state = BaseState.error(failure),
      (response) => state = BaseState.success(response),
    );
  }

  /// Reset state
  void reset() {
    state = const BaseState.initial();
  }
}
