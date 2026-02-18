import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/models/message_model.dart';
import 'package:fajimobileapp/features/organize_event/data/repositories/message_repository.dart';

// Message list provider
final AutoDisposeFutureProviderFamily<List<MessageModel>, String> messageListProvider = FutureProvider.autoDispose.family<List<MessageModel>, String>(
  (AutoDisposeFutureProviderRef<List<MessageModel>> ref, String eventId) async {
    final MessageRepository repository = ref.read(messageRepositoryProvider);
    return repository.getMessages(eventId);
  },
);

// Message send notifier
final StateNotifierProvider<MessageSendNotifier, AsyncValue<void>> messageSendProvider = StateNotifierProvider<MessageSendNotifier, AsyncValue<void>>(
  MessageSendNotifier.new,
);

class MessageSendNotifier extends StateNotifier<AsyncValue<void>> {

  MessageSendNotifier(this.ref) : super(const AsyncValue.data(null));
  final Ref ref;

  Future<void> sendMessage(String eventId, String content) async {
    state = const AsyncValue.loading();
    try {
      final MessageRepository repository = ref.read(messageRepositoryProvider);
      await repository.sendMessage(eventId, content);
      
      // Refresh message list
      ref.invalidate(messageListProvider(eventId));
      
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
