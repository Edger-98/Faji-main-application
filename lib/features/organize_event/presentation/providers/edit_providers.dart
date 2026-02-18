import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/features/organize_event/data/repositories/event_repository.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_providers.dart';

/// Event update notifier
final StateNotifierProvider<EventUpdateNotifier, AsyncValue<void>> eventUpdateProvider =
    StateNotifierProvider<EventUpdateNotifier, AsyncValue<void>>(
  EventUpdateNotifier.new,
);

class EventUpdateNotifier extends StateNotifier<AsyncValue<void>> {

  EventUpdateNotifier(this.ref) : super(const AsyncValue.data(null));
  final Ref ref;

  Future<void> updateEvent({
    required String eventId,
    required Map<String, dynamic> updates,
  }) async {
    state = const AsyncValue.loading();
    try {
      final EventRepository repository = ref.read(eventRepositoryProvider);
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
