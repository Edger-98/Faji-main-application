import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/my_ticket.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/get_my_tickets_usecase.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/ticket_providers.dart';

/// My Tickets ViewModel
class MyTicketsViewModel extends StateNotifier<BaseState<MyTicketsResponse>> {

  MyTicketsViewModel(this._getMyTicketsUseCase)
      : super(const BaseState.initial());
  final GetMyTicketsUseCase _getMyTicketsUseCase;

  String? _currentStatus;
  int _currentPage = 1;
  bool _hasMore = true;

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

    final Either<Failure, MyTicketsResponse> result = await _getMyTicketsUseCase(
      status: status,
      page: page,
    );

    result.fold(
      (Failure failure) {
        if (mounted) {
          state = BaseState.error(failure);
        }
      },
      (MyTicketsResponse response) {
        if (!mounted) return;
        
        _hasMore = response.pagination.page < response.pagination.pages;

        if (loadMore && state.isSuccess) {
          // Append to existing tickets
          final MyTicketsResponse? currentData = state.dataOrNull;
          if (currentData != null) {
            final List<MyTicket> updatedTickets = <MyTicket>[
              ...currentData.tickets,
              ...response.tickets,
            ];
            final MyTicketsResponse updatedResponse = MyTicketsResponse(
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
final AutoDisposeStateNotifierProvider<MyTicketsViewModel, BaseState<MyTicketsResponse>> myTicketsViewModelProvider = StateNotifierProvider.autoDispose<
    MyTicketsViewModel, BaseState<MyTicketsResponse>>(
  (AutoDisposeStateNotifierProviderRef<MyTicketsViewModel, BaseState<MyTicketsResponse>> ref) => MyTicketsViewModel(
    ref.watch(getMyTicketsUseCaseProvider),
  ),
);
