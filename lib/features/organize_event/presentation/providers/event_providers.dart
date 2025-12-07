import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/event_model.dart';
import '../../data/repositories/event_repository.dart';

// Events list provider with filters
final eventsListProvider = FutureProvider.autoDispose.family<List<EventModel>, EventFilters>(
  (ref, filters) async {
    final repository = ref.read(eventRepositoryProvider);
    return repository.getEvents(
      status: filters.status,
      role: filters.role,
      bookmarked: filters.bookmarked,
    );
  },
);

// Event details provider
final eventDetailsProvider = FutureProvider.autoDispose.family<EventModel, String>(
  (ref, eventId) async {
    final repository = ref.read(eventRepositoryProvider);
    return repository.getEventDetails(eventId);
  },
);

// Current tab filter state
final currentTabProvider = StateProvider<String>((ref) => 'upcoming');

// Current role filter state
final currentRoleFilterProvider = StateProvider<String>((ref) => 'all');

// Computed provider for current filters
final currentFiltersProvider = Provider<EventFilters>((ref) {
  final tab = ref.watch(currentTabProvider);
  final role = ref.watch(currentRoleFilterProvider);
  
  return EventFilters(
    status: tab == 'bookmarked' ? null : tab,
    role: role == 'all' ? null : role,
    bookmarked: tab == 'bookmarked' ? true : null,
  );
});

// Events for current filters
final filteredEventsProvider = FutureProvider.autoDispose<List<EventModel>>((ref) async {
  final filters = ref.watch(currentFiltersProvider);
  return ref.watch(eventsListProvider(filters).future);
});

class EventFilters {
  final String? status;
  final String? role;
  final bool? bookmarked;

  EventFilters({
    this.status,
    this.role,
    this.bookmarked,
  });

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
