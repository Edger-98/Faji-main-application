import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/registration_token_entity.dart';

part 'registration_token_model.g.dart';

@JsonSerializable()
class RegistrationTokenModel {
  final String message;
  final String registrationToken;

  RegistrationTokenModel({
    required this.message,
    required this.registrationToken,
  });

  factory RegistrationTokenModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationTokenModelToJson(this);

  RegistrationTokenEntity toEntity() {
    return RegistrationTokenEntity(
      message: message,
      registrationToken: registrationToken,
    );
  }
}
