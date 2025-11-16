// To parse this JSON data, do
//
//     final authTokenModel = authTokenModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/auth_token_entity.dart';

AuthTokenModel authTokenModelFromJson(String str) =>
    AuthTokenModel.fromJson(json.decode(str) as Map<String, dynamic>);

String authTokenModelToJson(AuthTokenModel data) => json.encode(data.toJson());

class AuthTokenModel {
  final String token;
  final String userId;
  final String email;
  final String role;

  AuthTokenModel({
    required this.token,
    required this.userId,
    required this.email,
    required this.role,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    // Handle response with 'user' object
    if (json.containsKey('user') && json['user'] is Map) {
      final user = json['user'] as Map<String, dynamic>;
      return AuthTokenModel(
        token: json['token'] as String? ?? '',
        userId: user['_id'] as String? ?? user['id'] as String? ?? '',
        email: user['email'] as String? ?? '',
        role: user['role'] as String? ?? 'Attendee',
      );
    }
    
    // Handle direct response
    return AuthTokenModel(
      token: json['token'] as String? ?? '',
      userId: json['userId'] as String? ?? json['_id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      role: json['role'] as String? ?? 'Attendee',
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'userId': userId,
        'email': email,
        'role': role,
      };

  /// Convert to entity
  AuthTokenEntity toEntity() {
    return AuthTokenEntity(
      token: token,
      userId: userId,
      email: email,
      role: role,
    );
  }

  /// Create from entity
  factory AuthTokenModel.fromEntity(AuthTokenEntity entity) {
    return AuthTokenModel(
      token: entity.token,
      userId: entity.userId,
      email: entity.email,
      role: entity.role,
    );
  }
}
