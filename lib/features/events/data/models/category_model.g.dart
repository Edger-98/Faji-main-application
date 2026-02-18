// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map json) =>
    $checkedCreate(r'_$CategoryModelImpl', json, ($checkedConvert) {
      final val = _$CategoryModelImpl(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        icon: $checkedConvert('icon', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String?),
        isActive: $checkedConvert('isActive', (v) => v as bool? ?? true),
      );
      return val;
    });

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      if (instance.description case final value?) 'description': value,
      'isActive': instance.isActive,
    };
