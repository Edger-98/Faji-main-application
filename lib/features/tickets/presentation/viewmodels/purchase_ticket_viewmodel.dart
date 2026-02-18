import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/ticket_entity.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/create_ticket_usecase.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/ticket_providers.dart';

/// Purchase Ticket ViewModel
class PurchaseTicketViewModel
    extends StateNotifier<BaseState<TicketEntity>> {

  PurchaseTicketViewModel(this._createTicketUseCase)
      : super(const BaseState.initial());
  final CreateTicketUseCase _createTicketUseCase;

  /// Purchase ticket
  Future<void> purchaseTicket({
    required String userId,
    required String eventId,
    required int ticketId,
    required int quantity,
    required String transactionId,
    String? promoCode,
  }) async {
    state = const BaseState.loading();

    final Either<Failure, TicketEntity> result = await _createTicketUseCase(
      userId: userId,
      eventId: eventId,
      ticketId: ticketId,
      purchasedDate: DateTime.now(),
      promoCode: promoCode,
      quantity: quantity,
      transactionId: transactionId,
    );

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (TicketEntity ticket) => state = BaseState.success(ticket),
    );
  }

  /// Reset state
  void resetState() {
    state = const BaseState.initial();
  }
}

/// Purchase Ticket ViewModel Provider
final AutoDisposeStateNotifierProvider<PurchaseTicketViewModel, BaseState<TicketEntity>> purchaseTicketViewModelProvider = StateNotifierProvider.autoDispose<
    PurchaseTicketViewModel, BaseState<TicketEntity>>(
  (AutoDisposeStateNotifierProviderRef<PurchaseTicketViewModel, BaseState<TicketEntity>> ref) => PurchaseTicketViewModel(
    ref.watch(createTicketUseCaseProvider),
  ),
);
