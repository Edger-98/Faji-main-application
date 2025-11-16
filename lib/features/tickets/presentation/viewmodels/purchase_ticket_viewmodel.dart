import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/ticket_entity.dart';
import '../../domain/usecases/create_ticket_usecase.dart';
import '../providers/ticket_providers.dart';

/// Purchase Ticket ViewModel
class PurchaseTicketViewModel
    extends StateNotifier<BaseState<TicketEntity>> {
  final CreateTicketUseCase _createTicketUseCase;

  PurchaseTicketViewModel(this._createTicketUseCase)
      : super(const BaseState.initial());

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

    final result = await _createTicketUseCase(
      userId: userId,
      eventId: eventId,
      ticketId: ticketId,
      purchasedDate: DateTime.now(),
      promoCode: promoCode,
      quantity: quantity,
      transactionId: transactionId,
    );

    result.fold(
      (failure) => state = BaseState.error(failure),
      (ticket) => state = BaseState.success(ticket),
    );
  }

  /// Reset state
  void resetState() {
    state = const BaseState.initial();
  }
}

/// Purchase Ticket ViewModel Provider
final purchaseTicketViewModelProvider = StateNotifierProvider.autoDispose<
    PurchaseTicketViewModel, BaseState<TicketEntity>>(
  (ref) => PurchaseTicketViewModel(
    ref.watch(createTicketUseCaseProvider),
  ),
);
