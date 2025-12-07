import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/task_model.dart';
import '../../data/repositories/task_repository.dart';

// Task list provider
final taskListProvider = FutureProvider.autoDispose.family<TaskListResponse, String>(
  (ref, eventId) async {
    final repository = ref.read(taskRepositoryProvider);
    return repository.getTasks(eventId);
  },
);

// Task update notifier
final taskUpdateProvider = StateNotifierProvider<TaskUpdateNotifier, AsyncValue<void>>(
  (ref) => TaskUpdateNotifier(ref),
);

class TaskUpdateNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  TaskUpdateNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<void> updateTaskStatus(String eventId, String taskId, String status) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(taskRepositoryProvider);
      await repository.updateTaskStatus(eventId, taskId, status);
      
      // Refresh task list
      ref.invalidate(taskListProvider(eventId));
      
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
