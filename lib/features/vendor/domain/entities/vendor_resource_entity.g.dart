// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_resource_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorResourceEntityImpl _$$VendorResourceEntityImplFromJson(Map json) =>
    $checkedCreate(r'_$VendorResourceEntityImpl', json, ($checkedConvert) {
      final val = _$VendorResourceEntityImpl(
        id: $checkedConvert('id', (v) => v as String),
        vendorId: $checkedConvert('vendorId', (v) => v as String),
        category: $checkedConvert('category', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        price: $checkedConvert('price', (v) => (v as num).toDouble()),
        images: $checkedConvert(
          'images',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        isAvailable: $checkedConvert('isAvailable', (v) => v as bool? ?? true),
        bookingCount: $checkedConvert(
          'bookingCount',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        updatedAt: $checkedConvert(
          'updatedAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$VendorResourceEntityImplToJson(
  _$VendorResourceEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'vendorId': instance.vendorId,
  'category': instance.category,
  'title': instance.title,
  'description': instance.description,
  'price': instance.price,
  if (instance.images case final value?) 'images': value,
  'isAvailable': instance.isAvailable,
  'bookingCount': instance.bookingCount,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updatedAt': value,
};
