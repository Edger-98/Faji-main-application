import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/event_repository.dart';
import 'event_providers.dart';

/// Event update notifier
final eventUpdateProvider =
    StateNotifierProvider<EventUpdateNotifier, AsyncValue<void>>(
  (ref) => EventUpdateNotifier(ref),
);

class EventUpdateNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  EventUpdateNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<void> updateEvent({
    required String eventId,
    required Map<String, dynamic> updates,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(eventRepositoryProvider);
      await repository.updateEvent(eventId, updates);

      // Refresh event details to get updated data
      ref.invalidate(eventDetailsProvider(eventId));

      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }
}
