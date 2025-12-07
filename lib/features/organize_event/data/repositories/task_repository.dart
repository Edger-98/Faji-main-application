import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/models/task_model.dart';

class TaskRepository {
  final ApiService _api;
  
  TaskRepository(this._api);
  
  Future<TaskListResponse> getTasks(String eventId) async {
    try {
      final response = await _api.get('/events/$eventId/tasks');
      
      final data = response.data['data'];
      final tasks = (data['tasks'] as List)
          .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList();
      
      final stats = TaskStatsModel.fromJson(data['stats'] as Map<String, dynamic>);
      
      return TaskListResponse(tasks: tasks, stats: stats);
    } catch (e) {
      throw Exception('Failed to load tasks: $e');
    }
  }
  
  Future<TaskModel> updateTaskStatus(
    String eventId,
    String taskId,
    String status,
  ) async {
    try {
      final response = await _api.patch('/events/$eventId/tasks/$taskId', data: {
        'status': status,
      });
      
      return TaskModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }
}

class TaskListResponse {
  final List<TaskModel> tasks;
  final TaskStatsModel stats;

  TaskListResponse({
    required this.tasks,
    required this.stats,
  });
}

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepository(ref.read(apiServiceProvider));
});
