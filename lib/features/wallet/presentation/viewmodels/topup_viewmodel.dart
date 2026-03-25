import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/core/services/stripe_service.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/topup_request.dart';
import 'package:fajimobileapp/features/wallet/domain/usecases/topup_wallet_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef TopupState = BaseState<TopupResponse>;

class TopupViewModel extends StateNotifier<TopupState> {
  TopupViewModel(this._topupWalletUseCase) : super(const BaseState.initial());

  final TopupWalletUseCase _topupWalletUseCase;
  final StripeService _stripeService = StripeService();

  /// Fund wallet: calls /wallet/fund, then presents Stripe payment sheet
  Future<bool> fundWallet({required double amount}) async {
    if (!mounted) return false;
    state = const BaseState.loading();

    final Either<Failure, TopupResponse> result = await _topupWalletUseCase(
      request: TopupRequest(amount: amount),
    );

    return result.fold(
      (Failure failure) {
        if (mounted) state = BaseState.error(failure);
        return false;
      },
      (TopupResponse response) async {
        try {
          final bool paid = await _stripeService.presentPaymentSheet(
            clientSecret: response.paymentIntentClientSecret,
            customerId: response.customerId,
            ephemeralKey: response.ephemeralKey,
          );
          if (mounted) {
            if (paid) {
              state = BaseState.success(response);
            } else {
              // User cancelled — reset so they can try again
              state = const BaseState.initial();
            }
          }
          return paid;
        } catch (e) {
          if (mounted) {
            state = BaseState.error(ServerFailure(message: e.toString()));
          }
          return false;
        }
      },
    );
  }

  void reset() => state = const BaseState.initial();
}
