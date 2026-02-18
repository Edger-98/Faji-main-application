import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/features/organize_event/data/repositories/event_repository.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_providers.dart';

/// Settings update notifier
final StateNotifierProvider<SettingsUpdateNotifier, AsyncValue<void>> settingsUpdateProvider =
    StateNotifierProvider<SettingsUpdateNotifier, AsyncValue<void>>(
  SettingsUpdateNotifier.new,
);

class SettingsUpdateNotifier extends StateNotifier<AsyncValue<void>> {

  SettingsUpdateNotifier(this.ref) : super(const AsyncValue.data(null));
  final Ref ref;

  Future<void> updateSettings({
    required String eventId,
    required Map<String, dynamic> settings,
  }) async {
    state = const AsyncValue.loading();
    try {
      final EventRepository repository = ref.read(eventRepositoryProvider);
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
    required value,
  }) async => updateSettings(
      eventId: eventId,
      settings: {key: value},
    );
}

/// Media upload notifier
final StateNotifierProvider<MediaUploadNotifier, AsyncValue<String?>> mediaUploadProvider =
    StateNotifierProvider<MediaUploadNotifier, AsyncValue<String?>>(
  MediaUploadNotifier.new,
);

class MediaUploadNotifier extends StateNotifier<AsyncValue<String?>> {

  MediaUploadNotifier(this.ref) : super(const AsyncValue.data(null));
  final Ref ref;

  Future<String> uploadMedia({
    required String eventId,
    required String filePath,
    required String type, // 'poster' or 'pre-event'
  }) async {
    state = const AsyncValue.loading();
    try {
      final EventRepository repository = ref.read(eventRepositoryProvider);
      // TODO: Implement media upload in repository
      const String url = 'https://placeholder.com/media.jpg'; // Placeholder

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
