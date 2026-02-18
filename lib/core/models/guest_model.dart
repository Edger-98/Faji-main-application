class GuestModel {

  GuestModel({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    required this.status,
    this.rsvpDate,
    required this.isOnline,
    this.avatar,
    required this.invitedAt,
  });

  factory GuestModel.fromJson(Map<String, dynamic> json) {
    return GuestModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      status: json['status'] as String,
      rsvpDate: json['rsvpDate'] != null 
          ? DateTime.parse(json['rsvpDate'] as String)
          : null,
      isOnline: json['isOnline'] as bool? ?? false,
      avatar: json['avatar'] as String?,
      invitedAt: DateTime.parse(json['invitedAt'] as String),
    );
  }
  final String id;
  final String name;
  final String? phone;
  final String? email;
  final String status;
  final DateTime? rsvpDate;
  final bool isOnline;
  final String? avatar;
  final DateTime invitedAt;

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'status': status,
      'rsvpDate': rsvpDate?.toIso8601String(),
      'isOnline': isOnline,
      'avatar': avatar,
      'invitedAt': invitedAt.toIso8601String(),
    };
}

class GuestStatsModel {

  GuestStatsModel({
    required this.total,
    required this.confirmed,
    required this.invited,
    required this.declined,
  });

  factory GuestStatsModel.fromJson(Map<String, dynamic> json) {
    return GuestStatsModel(
      total: json['total'] as int,
      confirmed: json['confirmed'] as int,
      invited: json['invited'] as int,
      declined: json['declined'] as int,
    );
  }
  final int total;
  final int confirmed;
  final int invited;
  final int declined;
}
