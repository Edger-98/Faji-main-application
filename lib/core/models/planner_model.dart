class PlannerModel {

  PlannerModel({
    required this.id,
    required this.name,
    required this.role,
    this.avatar,
    required this.permissions,
    required this.addedAt,
  });

  factory PlannerModel.fromJson(Map<String, dynamic> json) {
    return PlannerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      avatar: json['avatar'] as String?,
      permissions: List<String>.from(json['permissions'] as List),
      addedAt: DateTime.parse(json['addedAt'] as String),
    );
  }
  final String id;
  final String name;
  final String role;
  final String? avatar;
  final List<String> permissions;
  final DateTime addedAt;
}
