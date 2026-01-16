import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/base/base_state.dart';
import '../../domain/entities/topup_request.dart';
import '../../domain/usecases/topup_wallet_usecase.dart';

// State for top-up
typedef TopupState = BaseState<TopupResponse>;

class TopupViewModel extends StateNotifier<TopupState> {
  final TopupWalletUseCase _topupWalletUseCase;

  TopupViewModel(
    this._topupWalletUseCase,
  ) : super(const BaseState.initial());

  /// Top-up wallet
  Future<void> topupWallet({
    required double amount,
    String paymentMethod = 'paystack',
  }) async {
    state = const BaseState.loading();

    final request = TopupRequest(
      amount: amount,
      paymentMethod: paymentMethod,
    );

    final result = await _topupWalletUseCase(request: request);

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
