import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/ticket_entity.dart';
import '../../domain/usecases/get_purchased_tickets_usecase.dart';
import '../providers/ticket_providers.dart';

/// Tickets ViewModel
class TicketsViewModel extends StateNotifier<BaseState<List<TicketEntity>>> {
  final GetPurchasedTicketsUseCase _getPurchasedTicketsUseCase;

  TicketsViewModel(this._getPurchasedTicketsUseCase)
      : super(const BaseState.initial());

  /// Load user's purchased tickets
  Future<void> loadPurchasedTickets(String userId) async {
    state = const BaseState.loading();

    final result = await _getPurchasedTicketsUseCase(userId);

    result.fold(
      (failure) => state = BaseState.error(failure),
      (tickets) => state = BaseState.success(tickets),
    );
  }

  /// Refresh tickets
  Future<void> refreshTickets(String userId) async {
    await loadPurchasedTickets(userId);
  }
}

/// Tickets ViewModel Provider
final ticketsViewModelProvider = StateNotifierProvider.autoDispose<
    TicketsViewModel, BaseState<List<TicketEntity>>>(
  (ref) => TicketsViewModel(
    ref.watch(getPurchasedTicketsUseCaseProvider),
  ),
);
