// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_complete_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationCompleteModel _$RegistrationCompleteModelFromJson(Map json) =>
    $checkedCreate('RegistrationCompleteModel', json, ($checkedConvert) {
      final val = RegistrationCompleteModel(
        message: $checkedConvert('message', (v) => v as String),
        token: $checkedConvert('token', (v) => v as String),
        userId: $checkedConvert('userId', (v) => v as String),
        user: $checkedConvert(
          'user',
          (v) => UserModel.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RegistrationCompleteModelToJson(
  RegistrationCompleteModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'token': instance.token,
  'userId': instance.userId,
  'user': instance.user.toJson(),
};
