// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationSessionModel _$RegistrationSessionModelFromJson(Map json) =>
    $checkedCreate('RegistrationSessionModel', json, ($checkedConvert) {
      final val = RegistrationSessionModel(
        message: $checkedConvert('message', (v) => v as String),
        sessionId: $checkedConvert('sessionId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$RegistrationSessionModelToJson(
  RegistrationSessionModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'sessionId': instance.sessionId,
};
