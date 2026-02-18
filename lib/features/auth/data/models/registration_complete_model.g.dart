// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_complete_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationCompleteModel _$RegistrationCompleteModelFromJson(Map json) =>
    $checkedCreate('RegistrationCompleteModel', json, ($checkedConvert) {
      final val = RegistrationCompleteModel(
        message: $checkedConvert('message', (v) => v as String),
        token: $checkedConvert('accessToken', (v) => v as String),
        refreshToken: $checkedConvert('refreshToken', (v) => v as String?),
        expiresIn: $checkedConvert('expiresIn', (v) => (v as num?)?.toInt()),
        tokenType: $checkedConvert('tokenType', (v) => v as String?),
        userId: $checkedConvert('userId', (v) => v as String),
        user: $checkedConvert(
          'user',
          (v) => UserModel.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
      );
      return val;
    }, fieldKeyMap: const {'token': 'accessToken'});

Map<String, dynamic> _$RegistrationCompleteModelToJson(
  RegistrationCompleteModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'accessToken': instance.token,
  if (instance.refreshToken case final value?) 'refreshToken': value,
  if (instance.expiresIn case final value?) 'expiresIn': value,
  if (instance.tokenType case final value?) 'tokenType': value,
  'userId': instance.userId,
  'user': instance.user.toJson(),
};
