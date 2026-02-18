import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/models/guest_model.dart';
import 'package:fajimobileapp/features/organize_event/data/repositories/guest_repository.dart';

// Guest list provider with filters
final AutoDisposeFutureProviderFamily<GuestListResponse, GuestFilters> guestListProvider = FutureProvider.autoDispose.family<GuestListResponse, GuestFilters>(
  (AutoDisposeFutureProviderRef<GuestListResponse> ref, GuestFilters filters) async {
    final GuestRepository repository = ref.read(guestRepositoryProvider);
    return repository.getGuests(
      filters.eventId,
      status: filters.status,
      search: filters.search,
    );
  },
);

// Current guest filter state
final AutoDisposeStateProvider<String> currentGuestStatusProvider = StateProvider.autoDispose<String>((AutoDisposeStateProviderRef<String> ref) => 'all');
final AutoDisposeStateProvider<String> currentGuestSearchProvider = StateProvider.autoDispose<String>((AutoDisposeStateProviderRef<String> ref) => '');

// Computed provider for current filters
final AutoDisposeProviderFamily<GuestFilters, String> currentGuestFiltersProvider = Provider.autoDispose.family<GuestFilters, String>((AutoDisposeProviderRef<GuestFilters> ref, String eventId) {
  final String status = ref.watch(currentGuestStatusProvider);
  final String search = ref.watch(currentGuestSearchProvider);
  
  return GuestFilters(
    eventId: eventId,
    status: status == 'all' ? null : status,
    search: search.isEmpty ? null : search,
  );
});

// Guest add notifier
final StateNotifierProvider<GuestAddNotifier, AsyncValue<void>> guestAddProvider = StateNotifierProvider<GuestAddNotifier, AsyncValue<void>>(
  GuestAddNotifier.new,
);

class GuestAddNotifier extends StateNotifier<AsyncValue<void>> {

  GuestAddNotifier(this.ref) : super(const AsyncValue.data(null));
  final Ref ref;

  Future<void> addGuest({
    required String eventId,
    required String name,
    String? phone,
    String? email,
  }) async {
    state = const AsyncValue.loading();
    try {
      final GuestRepository repository = ref.read(guestRepositoryProvider);
      await repository.addGuest(
        eventId,
        name: name,
        phone: phone,
        email: email,
      );
      
      // Refresh guest list
      ref.invalidate(guestListProvider);
      
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

class GuestFilters {

  GuestFilters({
    required this.eventId,
    this.status,
    this.search,
  });
  final String eventId;
  final String? status;
  final String? search;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuestFilters &&
          runtimeType == other.runtimeType &&
          eventId == other.eventId &&
          status == other.status &&
          search == other.search;

  @override
  int get hashCode => eventId.hashCode ^ status.hashCode ^ search.hashCode;
}
