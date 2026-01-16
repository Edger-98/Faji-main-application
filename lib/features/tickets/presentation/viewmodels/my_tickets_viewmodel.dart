import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/my_ticket.dart';
import '../../domain/usecases/get_my_tickets_usecase.dart';
import '../providers/ticket_providers.dart';

/// My Tickets ViewModel
class MyTicketsViewModel extends StateNotifier<BaseState<MyTicketsResponse>> {
  final GetMyTicketsUseCase _getMyTicketsUseCase;

  String? _currentStatus;
  int _currentPage = 1;
  bool _hasMore = true;

  MyTicketsViewModel(this._getMyTicketsUseCase)
      : super(const BaseState.initial());

  /// Load my tickets
  Future<void> loadMyTickets({
    String? status,
    int page = 1,
    bool loadMore = false,
  }) async {
    if (loadMore && !_hasMore) return;

    if (!loadMore) {
      state = const BaseState.loading();
      _currentPage = 1;
      _hasMore = true;
    }

    _currentStatus = status;
    _currentPage = page;

    final result = await _getMyTicketsUseCase(
      status: status,
      page: page,
      limit: 20,
    );

    result.fold(
      (failure) => state = BaseState.error(failure),
      (response) {
        _hasMore = response.pagination.page < response.pagination.pages;

        if (loadMore && state.isSuccess) {
          // Append to existing tickets
          final currentData = state.dataOrNull;
          if (currentData != null) {
            final updatedTickets = <MyTicket>[
              ...currentData.tickets,
              ...response.tickets,
            ];
            final updatedResponse = MyTicketsResponse(
              tickets: updatedTickets,
              pagination: response.pagination,
            );
            state = BaseState.success(updatedResponse);
          } else {
            state = BaseState.success(response);
          }
        } else {
          state = BaseState.success(response);
        }
      },
    );
  }

  /// Load more tickets (pagination)
  Future<void> loadMore() async {
    if (_hasMore && state.isSuccess) {
      await loadMyTickets(
        status: _currentStatus,
        page: _currentPage + 1,
        loadMore: true,
      );
    }
  }

  /// Filter by status
  Future<void> filterByStatus(String? status) async {
    await loadMyTickets(status: status);
  }

  /// Refresh tickets
  Future<void> refresh() async {
    await loadMyTickets(status: _currentStatus);
  }

  /// Fetch tickets (alias for loadMyTickets for compatibility)
  Future<void> fetchTickets({String? status}) async {
    await loadMyTickets(status: status);
  }

  /// Reset state
  void resetState() {
    state = const BaseState.initial();
    _currentStatus = null;
    _currentPage = 1;
    _hasMore = true;
  }
}

/// My Tickets ViewModel Provider
final myTicketsViewModelProvider = StateNotifierProvider.autoDispose<
    MyTicketsViewModel, BaseState<MyTicketsResponse>>(
  (ref) => MyTicketsViewModel(
    ref.watch(getMyTicketsUseCaseProvider),
  ),
);
