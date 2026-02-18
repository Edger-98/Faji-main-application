import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/topup_request.dart';
import 'package:fajimobileapp/features/wallet/domain/usecases/topup_wallet_usecase.dart';

// State for top-up
typedef TopupState = BaseState<TopupResponse>;

class TopupViewModel extends StateNotifier<TopupState> {

  TopupViewModel(
    this._topupWalletUseCase,
  ) : super(const BaseState.initial());
  final TopupWalletUseCase _topupWalletUseCase;

  /// Top-up wallet
  Future<void> topupWallet({
    required double amount,
    String paymentMethod = 'paystack',
  }) async {
    state = const BaseState.loading();

    final TopupRequest request = TopupRequest(
      amount: amount,
      paymentMethod: paymentMethod,
    );

    final Either<Failure, TopupResponse> result = await _topupWalletUseCase(request: request);

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (TopupResponse response) => state = BaseState.success(response),
    );
  }

  /// Reset state
  void reset() {
    state = const BaseState.initial();
  }
}
