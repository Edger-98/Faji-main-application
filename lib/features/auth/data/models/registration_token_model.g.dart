// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationTokenModel _$RegistrationTokenModelFromJson(Map json) =>
    $checkedCreate('RegistrationTokenModel', json, ($checkedConvert) {
      final val = RegistrationTokenModel(
        message: $checkedConvert('message', (v) => v as String),
        registrationToken: $checkedConvert(
          'registrationToken',
          (v) => v as String,
        ),
      );
      return val;
    });

Map<String, dynamic> _$RegistrationTokenModelToJson(
  RegistrationTokenModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'registrationToken': instance.registrationToken,
};
