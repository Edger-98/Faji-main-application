import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/promo_code_validation.dart';
import '../../domain/entities/purchase_ticket_request.dart';
import '../../domain/entities/purchase_ticket_response.dart';
import '../../domain/usecases/purchase_tickets_usecase.dart';
import '../../domain/usecases/validate_promo_code_usecase.dart';
import '../providers/ticket_providers.dart';

/// Purchase Ticket ViewModel - NEW API
class PurchaseTicketViewModelNew
    extends StateNotifier<BaseState<PurchaseTicketResponse>> {
  final PurchaseTicketsUseCase _purchaseTicketsUseCase;
  final ValidatePromoCodeUseCase _validatePromoCodeUseCase;

  PromoCodeValidation? _promoCodeValidation;
  PromoCodeValidation? get promoCodeValidation => _promoCodeValidation;

  PurchaseTicketViewModelNew(
    this._purchaseTicketsUseCase,
    this._validatePromoCodeUseCase,
  ) : super(const BaseState.initial());

  /// Purchase tickets
  Future<void> purchaseTickets({
    required String eventId,
    required int quantity,
    String? promoCode,
    String paymentMethod = 'paystack',
  }) async {
    state = const BaseState.loading();

    final request = PurchaseTicketRequest(
      eventId: eventId,
      quantity: quantity,
      promoCode: promoCode,
      paymentMethod: paymentMethod,
    );

    final result = await _purchaseTicketsUseCase(request);

    result.fold(
      (failure) => state = BaseState.error(failure),
      (response) => state = BaseState.success(response),
    );
  }

  /// Validate promo code
  Future<void> validatePromoCode({
    required String eventId,
    required String promoCode,
    required double amount,
  }) async {
    final result = await _validatePromoCodeUseCase(
      eventId: eventId,
      promoCode: promoCode,
      amount: amount,
    );

    result.fold(
      (failure) {
        _promoCodeValidation = null;
        state = BaseState.error(failure);
      },
      (validation) {
        _promoCodeValidation = validation;
        // Notify listeners without changing main state
        state = state;
      },
    );
  }

  /// Clear promo code
  void clearPromoCode() {
    _promoCodeValidation = null;
    state = state;
  }

  /// Reset state
  void resetState() {
    state = const BaseState.initial();
    _promoCodeValidation = null;
  }
}

/// Purchase Ticket ViewModel Provider - NEW API
final purchaseTicketViewModelNewProvider = StateNotifierProvider.autoDispose<
    PurchaseTicketViewModelNew, BaseState<PurchaseTicketResponse>>(
  (ref) => PurchaseTicketViewModelNew(
    ref.watch(purchaseTicketsUseCaseProvider),
    ref.watch(validatePromoCodeUseCaseProvider),
  ),
);
