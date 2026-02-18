import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

/// User entity - domain layer
@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    required String phoneNo,
    required String firstName,
    required String lastName,
    required String role,
    required bool pushNotificationsEnabled, String? image,
    String? expoPushToken,
    DateTime? createdAt,
  }) = _UserEntity;

  const UserEntity._();

  String get fullName => '$firstName $lastName';
  
  bool get isOrganizer => role == 'Organizer';
  bool get isAttendee => role == 'Attendee';
}
