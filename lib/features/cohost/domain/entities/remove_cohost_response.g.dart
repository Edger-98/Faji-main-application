// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_cohost_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoveCohostResponseImpl _$$RemoveCohostResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$RemoveCohostResponseImpl', json, ($checkedConvert) {
      final val = _$RemoveCohostResponseImpl(
        success: $checkedConvert('success', (v) => v as bool),
        message: $checkedConvert('message', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$RemoveCohostResponseImplToJson(
  _$RemoveCohostResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
