import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/ticket_entity.dart';
import '../../domain/usecases/get_ticket_by_id_usecase.dart';
import '../providers/ticket_providers.dart';

/// Ticket Detail ViewModel
class TicketDetailViewModel
    extends StateNotifier<BaseState<TicketEntity>> {
  final GetTicketByIdUseCase _getTicketByIdUseCase;

  TicketDetailViewModel(this._getTicketByIdUseCase)
      : super(const BaseState.initial());

  /// Load ticket details
  Future<void> loadTicketDetails(String ticketId) async {
    state = const BaseState.loading();

    final result = await _getTicketByIdUseCase(ticketId);

    result.fold(
      (failure) => state = BaseState.error(failure),
      (ticket) => state = BaseState.success(ticket),
    );
  }
}

/// Ticket Detail ViewModel Provider
final ticketDetailViewModelProvider = StateNotifierProvider.autoDispose
    .family<TicketDetailViewModel, BaseState<TicketEntity>, String>(
  (ref, ticketId) {
    final viewModel = TicketDetailViewModel(
      ref.watch(getTicketByIdUseCaseProvider),
    );
    viewModel.loadTicketDetails(ticketId);
    return viewModel;
  },
);
