// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorProfileEntityImpl _$$VendorProfileEntityImplFromJson(Map json) =>
    $checkedCreate(r'_$VendorProfileEntityImpl', json, ($checkedConvert) {
      final val = _$VendorProfileEntityImpl(
        id: $checkedConvert('id', (v) => v as String),
        userId: $checkedConvert('userId', (v) => v as String),
        businessName: $checkedConvert('businessName', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        categories: $checkedConvert(
          'categories',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        profilePhoto: $checkedConvert('profilePhoto', (v) => v as String?),
        portfolioImages: $checkedConvert(
          'portfolioImages',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        rating: $checkedConvert(
          'rating',
          (v) => (v as num?)?.toDouble() ?? 0.0,
        ),
        totalBookings: $checkedConvert(
          'totalBookings',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
        completedBookings: $checkedConvert(
          'completedBookings',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
        isActive: $checkedConvert('isActive', (v) => v as bool? ?? true),
        isVerified: $checkedConvert('isVerified', (v) => v as bool? ?? false),
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

Map<String, dynamic> _$$VendorProfileEntityImplToJson(
  _$VendorProfileEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'businessName': instance.businessName,
  'description': instance.description,
  'categories': instance.categories,
  if (instance.profilePhoto case final value?) 'profilePhoto': value,
  if (instance.portfolioImages case final value?) 'portfolioImages': value,
  'rating': instance.rating,
  'totalBookings': instance.totalBookings,
  'completedBookings': instance.completedBookings,
  'isActive': instance.isActive,
  'isVerified': instance.isVerified,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updatedAt': value,
};
