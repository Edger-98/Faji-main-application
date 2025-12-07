import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/event_repository.dart';
import 'event_providers.dart';

/// Settings update notifier
final settingsUpdateProvider =
    StateNotifierProvider<SettingsUpdateNotifier, AsyncValue<void>>(
  (ref) => SettingsUpdateNotifier(ref),
);

class SettingsUpdateNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  SettingsUpdateNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<void> updateSettings({
    required String eventId,
    required Map<String, dynamic> settings,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(eventRepositoryProvider);
      await repository.updateEvent(eventId, settings);

      // Refresh event details to get updated settings
      ref.invalidate(eventDetailsProvider(eventId));

      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }

  Future<void> updateSingleSetting({
    required String eventId,
    required String key,
    required dynamic value,
  }) async {
    return updateSettings(
      eventId: eventId,
      settings: {key: value},
    );
  }
}

/// Media upload notifier
final mediaUploadProvider =
    StateNotifierProvider<MediaUploadNotifier, AsyncValue<String?>>(
  (ref) => MediaUploadNotifier(ref),
);

class MediaUploadNotifier extends StateNotifier<AsyncValue<String?>> {
  final Ref ref;

  MediaUploadNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<String> uploadMedia({
    required String eventId,
    required String filePath,
    required String type, // 'poster' or 'pre-event'
  }) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(eventRepositoryProvider);
      // TODO: Implement media upload in repository
      final url = 'https://placeholder.com/media.jpg'; // Placeholder

      // Refresh event details to get updated media
      ref.invalidate(eventDetailsProvider(eventId));

      state = AsyncValue.data(url);
      return url;
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      rethrow;
    }
  }
}
