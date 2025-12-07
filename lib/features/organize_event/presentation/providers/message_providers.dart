import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/message_model.dart';
import '../../data/repositories/message_repository.dart';

// Message list provider
final messageListProvider = FutureProvider.autoDispose.family<List<MessageModel>, String>(
  (ref, eventId) async {
    final repository = ref.read(messageRepositoryProvider);
    return repository.getMessages(eventId);
  },
);

// Message send notifier
final messageSendProvider = StateNotifierProvider<MessageSendNotifier, AsyncValue<void>>(
  (ref) => MessageSendNotifier(ref),
);

class MessageSendNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  MessageSendNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<void> sendMessage(String eventId, String content) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(messageRepositoryProvider);
      await repository.sendMessage(eventId, content);
      
      // Refresh message list
      ref.invalidate(messageListProvider(eventId));
      
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
