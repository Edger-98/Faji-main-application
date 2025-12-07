import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/guest_model.dart';
import '../../data/repositories/guest_repository.dart';

// Guest list provider with filters
final guestListProvider = FutureProvider.autoDispose.family<GuestListResponse, GuestFilters>(
  (ref, filters) async {
    final repository = ref.read(guestRepositoryProvider);
    return repository.getGuests(
      filters.eventId,
      status: filters.status,
      search: filters.search,
    );
  },
);

// Current guest filter state
final currentGuestStatusProvider = StateProvider.autoDispose<String>((ref) => 'all');
final currentGuestSearchProvider = StateProvider.autoDispose<String>((ref) => '');

// Computed provider for current filters
final currentGuestFiltersProvider = Provider.autoDispose.family<GuestFilters, String>((ref, eventId) {
  final status = ref.watch(currentGuestStatusProvider);
  final search = ref.watch(currentGuestSearchProvider);
  
  return GuestFilters(
    eventId: eventId,
    status: status == 'all' ? null : status,
    search: search.isEmpty ? null : search,
  );
});

// Guest add notifier
final guestAddProvider = StateNotifierProvider<GuestAddNotifier, AsyncValue<void>>(
  (ref) => GuestAddNotifier(ref),
);

class GuestAddNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  GuestAddNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<void> addGuest({
    required String eventId,
    required String name,
    String? phone,
    String? email,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(guestRepositoryProvider);
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
  final String eventId;
  final String? status;
  final String? search;

  GuestFilters({
    required this.eventId,
    this.status,
    this.search,
  });

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
