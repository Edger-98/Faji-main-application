import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/registration_complete_entity.dart';
import 'user_model.dart';

part 'registration_complete_model.g.dart';

@JsonSerializable()
class RegistrationCompleteModel {
  final String message;
  final String token;
  final String userId;
  final UserModel user;

  RegistrationCompleteModel({
    required this.message,
    required this.token,
    required this.userId,
    required this.user,
  });

  factory RegistrationCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationCompleteModelToJson(this);

  RegistrationCompleteEntity toEntity() {
    return RegistrationCompleteEntity(
      message: message,
      token: token,
      userId: userId,
      user: user.toEntity(),
    );
  }
}
