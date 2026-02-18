import 'package:json_annotation/json_annotation.dart';

import 'package:fajimobileapp/features/auth/domain/entities/registration_complete_entity.dart';
import 'package:fajimobileapp/features/auth/data/models/user_model.dart';

part 'registration_complete_model.g.dart';

@JsonSerializable()
class RegistrationCompleteModel {

  RegistrationCompleteModel({
    required this.message,
    required this.token,
    this.refreshToken,
    this.expiresIn,
    this.tokenType,
    required this.userId,
    required this.user,
  });

  factory RegistrationCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationCompleteModelFromJson(json);
  final String message;
  @JsonKey(name: 'accessToken')
  final String token;
  final String? refreshToken;
  final int? expiresIn;
  final String? tokenType;
  final String userId;
  final UserModel user;

  Map<String, dynamic> toJson() => _$RegistrationCompleteModelToJson(this);

  RegistrationCompleteEntity toEntity() => RegistrationCompleteEntity(
      message: message,
      token: token,
      userId: userId,
      user: user.toEntity(),
    );
}
