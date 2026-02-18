import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/ticket_entity.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/get_ticket_by_id_usecase.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/ticket_providers.dart';

/// Ticket Detail ViewModel
class TicketDetailViewModel
    extends StateNotifier<BaseState<TicketEntity>> {

  TicketDetailViewModel(this._getTicketByIdUseCase)
      : super(const BaseState.initial());
  final GetTicketByIdUseCase _getTicketByIdUseCase;

  /// Load ticket details
  Future<void> loadTicketDetails(String ticketId) async {
    state = const BaseState.loading();

    final Either<Failure, TicketEntity> result = await _getTicketByIdUseCase(ticketId);

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (TicketEntity ticket) => state = BaseState.success(ticket),
    );
  }
}

/// Ticket Detail ViewModel Provider
final AutoDisposeStateNotifierProviderFamily<TicketDetailViewModel, BaseState<TicketEntity>, String> ticketDetailViewModelProvider = StateNotifierProvider.autoDispose
    .family<TicketDetailViewModel, BaseState<TicketEntity>, String>(
  (AutoDisposeStateNotifierProviderRef<TicketDetailViewModel, BaseState<TicketEntity>> ref, String ticketId) {
    final TicketDetailViewModel viewModel = TicketDetailViewModel(
      ref.watch(getTicketByIdUseCaseProvider),
    );
    viewModel.loadTicketDetails(ticketId);
    return viewModel;
  },
);
