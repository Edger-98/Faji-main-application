import 'package:dio/src/response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/services/api_service.dart';
import 'package:fajimobileapp/core/models/task_model.dart';

class TaskRepository {
  
  TaskRepository(this._api);
  final ApiService _api;
  
  Future<TaskListResponse> getTasks(String eventId) async {
    try {
      final Response response = await _api.get('/events/$eventId/tasks');
      
      final data = response.data['data'];
      final List<TaskModel> tasks = (data['tasks'] as List)
          .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList();
      
      final TaskStatsModel stats = TaskStatsModel.fromJson(data['stats'] as Map<String, dynamic>);
      
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
      final Response response = await _api.patch('/events/$eventId/tasks/$taskId', data: <String, String>{
        'status': status,
      });
      
      return TaskModel.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to update task: $e');
    }
  }
}

class TaskListResponse {

  TaskListResponse({
    required this.tasks,
    required this.stats,
  });
  final List<TaskModel> tasks;
  final TaskStatsModel stats;
}

final Provider<TaskRepository> taskRepositoryProvider = Provider<TaskRepository>((ProviderRef<TaskRepository> ref) => TaskRepository(ref.read(apiServiceProvider)));
