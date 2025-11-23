import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/registration_session_entity.dart';

part 'registration_session_model.g.dart';

@JsonSerializable()
class RegistrationSessionModel {
  final String message;
  final String sessionId;

  RegistrationSessionModel({
    required this.message,
    required this.sessionId,
  });

  factory RegistrationSessionModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationSessionModelToJson(this);

  RegistrationSessionEntity toEntity() {
    return RegistrationSessionEntity(
      message: message,
      sessionId: sessionId,
    );
  }
}
