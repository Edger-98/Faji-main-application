import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/promo_code_validation.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/purchase_ticket_request.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/purchase_ticket_response.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/purchase_tickets_usecase.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/validate_promo_code_usecase.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/ticket_providers.dart';

/// Purchase Ticket ViewModel - NEW API
class PurchaseTicketViewModelNew
    extends StateNotifier<BaseState<PurchaseTicketResponse>> {

  PurchaseTicketViewModelNew(
    this._purchaseTicketsUseCase,
    this._validatePromoCodeUseCase,
  ) : super(const BaseState.initial());
  final PurchaseTicketsUseCase _purchaseTicketsUseCase;
  final ValidatePromoCodeUseCase _validatePromoCodeUseCase;

  PromoCodeValidation? _promoCodeValidation;
  PromoCodeValidation? get promoCodeValidation => _promoCodeValidation;

  /// Purchase tickets
  Future<void> purchaseTickets({
    required String eventId,
    required int quantity,
    String? promoCode,
    String paymentMethod = 'paystack',
  }) async {
    state = const BaseState.loading();

    final PurchaseTicketRequest request = PurchaseTicketRequest(
      eventId: eventId,
      quantity: quantity,
      promoCode: promoCode,
      paymentMethod: paymentMethod,
    );

    final Either<Failure, PurchaseTicketResponse> result = await _purchaseTicketsUseCase(request);

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (PurchaseTicketResponse response) => state = BaseState.success(response),
    );
  }

  /// Validate promo code
  Future<void> validatePromoCode({
    required String eventId,
    required String promoCode,
    required double amount,
  }) async {
    final Either<Failure, PromoCodeValidation> result = await _validatePromoCodeUseCase(
      eventId: eventId,
      promoCode: promoCode,
      amount: amount,
    );

    result.fold(
      (Failure failure) {
        _promoCodeValidation = null;
        state = BaseState.error(failure);
      },
      (PromoCodeValidation validation) {
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
final AutoDisposeStateNotifierProvider<PurchaseTicketViewModelNew, BaseState<PurchaseTicketResponse>> purchaseTicketViewModelNewProvider = StateNotifierProvider.autoDispose<
    PurchaseTicketViewModelNew, BaseState<PurchaseTicketResponse>>(
  (AutoDisposeStateNotifierProviderRef<PurchaseTicketViewModelNew, BaseState<PurchaseTicketResponse>> ref) => PurchaseTicketViewModelNew(
    ref.watch(purchaseTicketsUseCaseProvider),
    ref.watch(validatePromoCodeUseCaseProvider),
  ),
);
