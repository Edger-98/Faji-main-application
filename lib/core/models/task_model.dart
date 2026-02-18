class TaskModel {

  TaskModel({
    required this.id,
    required this.title,
    this.description,
    required this.status,
    this.dueDate,
    this.assignedTo,
    required this.createdAt,
    this.completedAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      status: json['status'] as String,
      dueDate: json['dueDate'] != null 
          ? DateTime.parse(json['dueDate'] as String)
          : null,
      assignedTo: json['assignedTo'] != null
          ? AssignedUserModel.fromJson(json['assignedTo'] as Map<String, dynamic>)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'] as String)
          : null,
    );
  }
  final String id;
  final String title;
  final String? description;
  final String status;
  final DateTime? dueDate;
  final AssignedUserModel? assignedTo;
  final DateTime createdAt;
  final DateTime? completedAt;

  Map<String, dynamic> toJson() => {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'dueDate': dueDate?.toIso8601String(),
      'assignedTo': assignedTo?.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
    };
}

class AssignedUserModel {

  AssignedUserModel({
    required this.id,
    required this.name,
  });

  factory AssignedUserModel.fromJson(Map<String, dynamic> json) {
    return AssignedUserModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
  final String id;
  final String name;

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
    };
}

class TaskStatsModel {

  TaskStatsModel({
    required this.total,
    required this.completed,
    required this.inProgress,
    required this.notStarted,
  });

  factory TaskStatsModel.fromJson(Map<String, dynamic> json) {
    return TaskStatsModel(
      total: json['total'] as int,
      completed: json['completed'] as int,
      inProgress: json['inProgress'] as int,
      notStarted: json['notStarted'] as int,
    );
  }
  final int total;
  final int completed;
  final int inProgress;
  final int notStarted;
}
