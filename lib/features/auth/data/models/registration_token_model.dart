import 'package:json_annotation/json_annotation.dart';

import 'package:fajimobileapp/features/auth/domain/entities/registration_token_entity.dart';

part 'registration_token_model.g.dart';

@JsonSerializable()
class RegistrationTokenModel {

  RegistrationTokenModel({
    required this.message,
    required this.registrationToken,
  });

  factory RegistrationTokenModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationTokenModelFromJson(json);
  final String message;
  final String registrationToken;

  Map<String, dynamic> toJson() => _$RegistrationTokenModelToJson(this);

  RegistrationTokenEntity toEntity() => RegistrationTokenEntity(
      message: message,
      registrationToken: registrationToken,
    );
}
