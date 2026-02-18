import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/models/event_model.dart';
import 'package:fajimobileapp/features/organize_event/data/repositories/event_repository.dart';

// Events list provider with filters
final AutoDisposeFutureProviderFamily<List<EventModel>, EventFilters> eventsListProvider = FutureProvider.autoDispose.family<List<EventModel>, EventFilters>(
  (AutoDisposeFutureProviderRef<List<EventModel>> ref, EventFilters filters) async {
    final EventRepository repository = ref.read(eventRepositoryProvider);
    return repository.getEvents(
      status: filters.status,
      role: filters.role,
      bookmarked: filters.bookmarked,
    );
  },
);

// Event details provider
final AutoDisposeFutureProviderFamily<EventModel, String> eventDetailsProvider = FutureProvider.autoDispose.family<EventModel, String>(
  (AutoDisposeFutureProviderRef<EventModel> ref, String eventId) async {
    final EventRepository repository = ref.read(eventRepositoryProvider);
    return repository.getEventDetails(eventId);
  },
);

// Current tab filter state
final StateProvider<String> currentTabProvider = StateProvider<String>((StateProviderRef<String> ref) => 'upcoming');

// Current role filter state
final StateProvider<String> currentRoleFilterProvider = StateProvider<String>((StateProviderRef<String> ref) => 'all');

// Computed provider for current filters
final Provider<EventFilters> currentFiltersProvider = Provider<EventFilters>((ProviderRef<EventFilters> ref) {
  final String tab = ref.watch(currentTabProvider);
  final String role = ref.watch(currentRoleFilterProvider);
  
  return EventFilters(
    status: tab == 'bookmarked' ? null : tab,
    role: role == 'all' ? null : role,
    bookmarked: tab == 'bookmarked' ? true : null,
  );
});

// Events for current filters
final AutoDisposeFutureProvider<List<EventModel>> filteredEventsProvider = FutureProvider.autoDispose<List<EventModel>>((AutoDisposeFutureProviderRef<List<EventModel>> ref) async {
  final EventFilters filters = ref.watch(currentFiltersProvider);
  return ref.watch(eventsListProvider(filters).future);
});

class EventFilters {

  EventFilters({
    this.status,
    this.role,
    this.bookmarked,
  });
  final String? status;
  final String? role;
  final bool? bookmarked;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventFilters &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          role == other.role &&
          bookmarked == other.bookmarked;

  @override
  int get hashCode => status.hashCode ^ role.hashCode ^ bookmarked.hashCode;
}
