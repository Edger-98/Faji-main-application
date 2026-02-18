import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/models/task_model.dart';
import 'package:fajimobileapp/features/organize_event/data/repositories/task_repository.dart';

// Task list provider
final AutoDisposeFutureProviderFamily<TaskListResponse, String> taskListProvider = FutureProvider.autoDispose.family<TaskListResponse, String>(
  (AutoDisposeFutureProviderRef<TaskListResponse> ref, String eventId) async {
    final TaskRepository repository = ref.read(taskRepositoryProvider);
    return repository.getTasks(eventId);
  },
);

// Task update notifier
final StateNotifierProvider<TaskUpdateNotifier, AsyncValue<void>> taskUpdateProvider = StateNotifierProvider<TaskUpdateNotifier, AsyncValue<void>>(
  TaskUpdateNotifier.new,
);

class TaskUpdateNotifier extends StateNotifier<AsyncValue<void>> {

  TaskUpdateNotifier(this.ref) : super(const AsyncValue.data(null));
  final Ref ref;

  Future<void> updateTaskStatus(String eventId, String taskId, String status) async {
    state = const AsyncValue.loading();
    try {
      final TaskRepository repository = ref.read(taskRepositoryProvider);
      await repository.updateTaskStatus(eventId, taskId, status);
      
      // Refresh task list
      ref.invalidate(taskListProvider(eventId));
      
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
