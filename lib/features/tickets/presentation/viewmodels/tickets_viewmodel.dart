import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/ticket_entity.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/get_purchased_tickets_usecase.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/ticket_providers.dart';

/// Tickets ViewModel
class TicketsViewModel extends StateNotifier<BaseState<List<TicketEntity>>> {

  TicketsViewModel(this._getPurchasedTicketsUseCase)
      : super(const BaseState.initial());
  final GetPurchasedTicketsUseCase _getPurchasedTicketsUseCase;

  /// Load user's purchased tickets
  Future<void> loadPurchasedTickets(String userId) async {
    state = const BaseState.loading();

    final Either<Failure, List<TicketEntity>> result = await _getPurchasedTicketsUseCase(userId);

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (List<TicketEntity> tickets) => state = BaseState.success(tickets),
    );
  }

  /// Refresh tickets
  Future<void> refreshTickets(String userId) async {
    await loadPurchasedTickets(userId);
  }
}

/// Tickets ViewModel Provider
final AutoDisposeStateNotifierProvider<TicketsViewModel, BaseState<List<TicketEntity>>> ticketsViewModelProvider = StateNotifierProvider.autoDispose<
    TicketsViewModel, BaseState<List<TicketEntity>>>(
  (AutoDisposeStateNotifierProviderRef<TicketsViewModel, BaseState<List<TicketEntity>>> ref) => TicketsViewModel(
    ref.watch(getPurchasedTicketsUseCaseProvider),
  ),
);
