// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl<T> _$$ApiResponseImplFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) => $checkedCreate(r'_$ApiResponseImpl', json, ($checkedConvert) {
  final val = _$ApiResponseImpl<T>(
    success: $checkedConvert('success', (v) => v as bool? ?? true),
    message: $checkedConvert('message', (v) => v as String? ?? ''),
    data: $checkedConvert(
      'data',
      (v) => _$nullableGenericFromJson(v, fromJsonT),
    ),
    errors: $checkedConvert(
      'errors',
      (v) => (v as Map?)?.map((k, e) => MapEntry(k as String, e)),
    ),
    meta: $checkedConvert(
      'meta',
      (v) => (v as Map?)?.map((k, e) => MapEntry(k as String, e)),
    ),
  );
  return val;
});

Map<String, dynamic> _$$ApiResponseImplToJson<T>(
  _$ApiResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  if (_$nullableGenericToJson(instance.data, toJsonT) case final value?)
    'data': value,
  if (instance.errors case final value?) 'errors': value,
  if (instance.meta case final value?) 'meta': value,
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

_$PaginatedResponseImpl<T> _$$PaginatedResponseImplFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) => $checkedCreate(r'_$PaginatedResponseImpl', json, ($checkedConvert) {
  final val = _$PaginatedResponseImpl<T>(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>).map(fromJsonT).toList(),
    ),
    currentPage: $checkedConvert('currentPage', (v) => (v as num).toInt()),
    lastPage: $checkedConvert('lastPage', (v) => (v as num).toInt()),
    perPage: $checkedConvert('perPage', (v) => (v as num).toInt()),
    total: $checkedConvert('total', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$$PaginatedResponseImplToJson<T>(
  _$PaginatedResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'currentPage': instance.currentPage,
  'lastPage': instance.lastPage,
  'perPage': instance.perPage,
  'total': instance.total,
};
