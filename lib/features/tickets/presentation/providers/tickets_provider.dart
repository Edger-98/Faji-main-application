import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/network/api_client.dart';
import 'package:fajimobileapp/features/tickets/data/datasources/tickets_remote_datasource.dart';
import 'package:fajimobileapp/features/tickets/data/repositories/tickets_repository_impl.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/tickets_repository.dart';
import 'package:fajimobileapp/features/tickets/data/models/my_tickets_response_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/purchase_status_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/ticket_details_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/upcoming_events_model.dart';

/// Tickets data source provider
final ticketsRemoteDataSourceProvider = Provider<TicketsRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return TicketsRemoteDataSourceImpl(dio);
});

/// Tickets repository provider
final ticketsRepositoryProvider = Provider<TicketsRepository>((ref) {
  final dataSource = ref.watch(ticketsRemoteDataSourceProvider);
  return TicketsRepositoryImpl(dataSource);
});

/// My Tickets State
class MyTicketsState {
  const MyTicketsState({
    this.isLoading = false,
    this.error,
    this.tickets,
    this.currentPage = 1,
    this.hasMore = true,
  });

  final bool isLoading;
  final String? error;
  final MyTicketsResponseModel? tickets;
  final int currentPage;
  final bool hasMore;

  MyTicketsState copyWith({
    bool? isLoading,
    String? error,
    MyTicketsResponseModel? tickets,
    int? currentPage,
    bool? hasMore,
  }) =>
      MyTicketsState(
        isLoading: isLoading ?? this.isLoading,
        error: error,
        tickets: tickets ?? this.tickets,
        currentPage: currentPage ?? this.currentPage,
        hasMore: hasMore ?? this.hasMore,
      );
}

/// My Tickets Notifier
class MyTicketsNotifier extends StateNotifier<MyTicketsState> {
  MyTicketsNotifier(this._repository) : super(const MyTicketsState());

  final TicketsRepository _repository;
  String _currentStatus = 'all';

  Future<void> loadTickets({
    String status = 'all',
    bool refresh = false,
  }) async {
    if (state.isLoading) return;

    if (refresh) {
      _currentStatus = status;
      state = const MyTicketsState(isLoading: true);
    } else {
      state = state.copyWith(isLoading: true, error: null);
    }

    final result = await _repository.getMyTickets(
      status: status,
      page: refresh ? 1 : state.currentPage,
      limit: 20,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
      },
      (response) {
        final hasMore = response.pagination.currentPage < response.pagination.totalPages;
        
        if (refresh) {
          state = MyTicketsState(
            isLoading: false,
            tickets: response,
            currentPage: 1,
            hasMore: hasMore,
          );
        } else {
          // Append tickets for pagination
          final existingTickets = state.tickets?.tickets ?? [];
          final newTickets = [...existingTickets, ...response.tickets];
          final updatedResponse = MyTicketsResponseModel(
            tickets: newTickets,
            pagination: response.pagination,
          );
          
          state = MyTicketsState(
            isLoading: false,
            tickets: updatedResponse,
            currentPage: response.pagination.currentPage,
            hasMore: hasMore,
          );
        }
      },
    );
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoading) return;
    
    state = state.copyWith(currentPage: state.currentPage + 1);
    await loadTickets(status: _currentStatus);
  }

  void reset() {
    state = const MyTicketsState();
  }
}

/// My Tickets Provider
final myTicketsProvider = StateNotifierProvider<MyTicketsNotifier, MyTicketsState>((ref) {
  final repository = ref.watch(ticketsRepositoryProvider);
  return MyTicketsNotifier(repository);
});

/// Purchase Status State
class PurchaseStatusState {
  const PurchaseStatusState({
    this.isLoading = false,
    this.error,
    this.status,
  });

  final bool isLoading;
  final String? error;
  final PurchaseStatusModel? status;

  PurchaseStatusState copyWith({
    bool? isLoading,
    String? error,
    PurchaseStatusModel? status,
  }) =>
      PurchaseStatusState(
        isLoading: isLoading ?? this.isLoading,
        error: error,
        status: status ?? this.status,
      );
}

/// Purchase Status Notifier
class PurchaseStatusNotifier extends StateNotifier<PurchaseStatusState> {
  PurchaseStatusNotifier(this._repository) : super(const PurchaseStatusState());

  final TicketsRepository _repository;

  Future<void> checkStatus(String eventId) async {
    state = const PurchaseStatusState(isLoading: true);

    final result = await _repository.checkPurchaseStatus(eventId);

    result.fold(
      (failure) {
        state = PurchaseStatusState(
          isLoading: false,
          error: failure.message,
        );
      },
      (status) {
        state = PurchaseStatusState(
          isLoading: false,
          status: status,
        );
      },
    );
  }

  void reset() {
    state = const PurchaseStatusState();
  }
}

/// Purchase Status Provider (family for caching per event)
final purchaseStatusProvider = StateNotifierProvider.family<PurchaseStatusNotifier, PurchaseStatusState, String>(
  (ref, eventId) {
    final repository = ref.watch(ticketsRepositoryProvider);
    final notifier = PurchaseStatusNotifier(repository);
    notifier.checkStatus(eventId);
    return notifier;
  },
);

/// Ticket Details State
class TicketDetailsState {
  const TicketDetailsState({
    this.isLoading = false,
    this.error,
    this.details,
  });

  final bool isLoading;
  final String? error;
  final TicketDetailsModel? details;

  TicketDetailsState copyWith({
    bool? isLoading,
    String? error,
    TicketDetailsModel? details,
  }) =>
      TicketDetailsState(
        isLoading: isLoading ?? this.isLoading,
        error: error,
        details: details ?? this.details,
      );
}

/// Ticket Details Notifier
class TicketDetailsNotifier extends StateNotifier<TicketDetailsState> {
  TicketDetailsNotifier(this._repository) : super(const TicketDetailsState());

  final TicketsRepository _repository;

  Future<void> loadDetails(String ticketId) async {
    state = const TicketDetailsState(isLoading: true);

    final result = await _repository.getTicketDetails(ticketId);

    result.fold(
      (failure) {
        state = TicketDetailsState(
          isLoading: false,
          error: failure.message,
        );
      },
      (details) {
        state = TicketDetailsState(
          isLoading: false,
          details: details,
        );
      },
    );
  }

  void reset() {
    state = const TicketDetailsState();
  }
}

/// Ticket Details Provider
final ticketDetailsProvider = StateNotifierProvider<TicketDetailsNotifier, TicketDetailsState>((ref) {
  final repository = ref.watch(ticketsRepositoryProvider);
  return TicketDetailsNotifier(repository);
});

/// Upcoming Events State
class UpcomingEventsState {
  const UpcomingEventsState({
    this.isLoading = false,
    this.error,
    this.events,
  });

  final bool isLoading;
  final String? error;
  final UpcomingEventsResponseModel? events;

  UpcomingEventsState copyWith({
    bool? isLoading,
    String? error,
    UpcomingEventsResponseModel? events,
  }) =>
      UpcomingEventsState(
        isLoading: isLoading ?? this.isLoading,
        error: error,
        events: events ?? this.events,
      );
}

/// Upcoming Events Notifier
class UpcomingEventsNotifier extends StateNotifier<UpcomingEventsState> {
  UpcomingEventsNotifier(this._repository) : super(const UpcomingEventsState());

  final TicketsRepository _repository;

  Future<void> loadEvents() async {
    state = const UpcomingEventsState(isLoading: true);

    final result = await _repository.getUpcomingEvents();

    result.fold(
      (failure) {
        state = UpcomingEventsState(
          isLoading: false,
          error: failure.message,
        );
      },
      (events) {
        state = UpcomingEventsState(
          isLoading: false,
          events: events,
        );
      },
    );
  }

  void reset() {
    state = const UpcomingEventsState();
  }
}

/// Upcoming Events Provider
final upcomingEventsProvider = StateNotifierProvider<UpcomingEventsNotifier, UpcomingEventsState>((ref) {
  final repository = ref.watch(ticketsRepositoryProvider);
  return UpcomingEventsNotifier(repository);
});
