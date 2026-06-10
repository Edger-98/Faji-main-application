import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/features/tickets/data/models/event_dashboard_model.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/tickets_provider.dart';

class EventDashboardState {
  const EventDashboardState({
    this.isLoading = false,
    this.dashboard,
    this.error,
  });

  final bool isLoading;
  final EventDashboardModel? dashboard;
  final String? error;

  EventDashboardState copyWith({
    bool? isLoading,
    EventDashboardModel? dashboard,
    String? error,
  }) =>
      EventDashboardState(
        isLoading: isLoading ?? this.isLoading,
        dashboard: dashboard ?? this.dashboard,
        error: error,
      );
}

class EventDashboardNotifier extends StateNotifier<EventDashboardState> {
  EventDashboardNotifier(this._dataSource) : super(const EventDashboardState());

  final dynamic _dataSource;

  Future<void> load(String eventId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final EventDashboardModel dashboard = await _dataSource.getEventDashboard(eventId) as EventDashboardModel;
      state = EventDashboardState(dashboard: dashboard);
    } catch (e) {
      state = EventDashboardState(error: e.toString());
    }
  }
}

final eventDashboardProvider =
    StateNotifierProvider.autoDispose<EventDashboardNotifier, EventDashboardState>(
  (ref) => EventDashboardNotifier(ref.watch(ticketsRemoteDataSourceProvider)),
);
