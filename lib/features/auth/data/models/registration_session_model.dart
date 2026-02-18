import 'package:json_annotation/json_annotation.dart';

import 'package:fajimobileapp/features/auth/domain/entities/registration_session_entity.dart';

part 'registration_session_model.g.dart';

@JsonSerializable()
class RegistrationSessionModel {

  RegistrationSessionModel({
    required this.message,
    required this.sessionId,
  });

  factory RegistrationSessionModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationSessionModelFromJson(json);
  final String message;
  final String sessionId;

  Map<String, dynamic> toJson() => _$RegistrationSessionModelToJson(this);

  RegistrationSessionEntity toEntity() => RegistrationSessionEntity(
      message: message,
      sessionId: sessionId,
    );
}
