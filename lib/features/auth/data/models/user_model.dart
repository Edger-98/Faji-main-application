// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:fajimobileapp/features/auth/domain/entities/user_entity.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str) as Map<String, dynamic>);

String? _sanitizeImageUrl(String? url) {
  if (url == null || url.isEmpty) return null;
  if (url.startsWith('http://') || url.startsWith('https://')) return url;
  return null;
}

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {

  UserModel({
    required this.id,
    required this.email,
    required this.phoneNo,
    required this.firstName,
    required this.lastName,
    required this.role,
    this.image,
    required this.pushNotificationsEnabled,
    this.expoPushToken,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['_id'] as String? ?? json['id'] as String? ?? '',
        email: json['email'] as String? ?? '',
        phoneNo: json['phoneNo'] as String? ?? '',
        firstName: json['firstName'] as String? ?? '',
        lastName: json['lastName'] as String? ?? '',
        role: json['role'] as String? ?? 'Attendee',
        image: _sanitizeImageUrl(json['image'] as String?),
        pushNotificationsEnabled: json['pushNotificationsEnabled'] as bool? ?? false,
        expoPushToken: json['expoPushToken'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  /// Create from entity
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      phoneNo: entity.phoneNo,
      firstName: entity.firstName,
      lastName: entity.lastName,
      role: entity.role,
      image: entity.image,
      pushNotificationsEnabled: entity.pushNotificationsEnabled,
      expoPushToken: entity.expoPushToken,
      createdAt: entity.createdAt,
    );
  }
  final String id;
  final String email;
  final String phoneNo;
  final String firstName;
  final String lastName;
  final String role;
  final String? image;
  final bool pushNotificationsEnabled;
  final String? expoPushToken;
  final DateTime? createdAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'email': email,
        'phoneNo': phoneNo,
        'firstName': firstName,
        'lastName': lastName,
        'role': role,
        'image': image,
        'pushNotificationsEnabled': pushNotificationsEnabled,
        'expoPushToken': expoPushToken,
        'createdAt': createdAt?.toIso8601String(),
      };

  /// Convert to entity
  UserEntity toEntity() => UserEntity(
      id: id,
      email: email,
      phoneNo: phoneNo,
      firstName: firstName,
      lastName: lastName,
      role: role,
      image: image,
      pushNotificationsEnabled: pushNotificationsEnabled,
      expoPushToken: expoPushToken,
      createdAt: createdAt,
    );
}
