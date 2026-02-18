// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorStatusImpl _$$VendorStatusImplFromJson(Map json) =>
    $checkedCreate(r'_$VendorStatusImpl', json, ($checkedConvert) {
      final val = _$VendorStatusImpl(
        isVendor: $checkedConvert('isVendor', (v) => v as bool),
        hasVendorAccount: $checkedConvert('hasVendorAccount', (v) => v as bool),
        vendorId: $checkedConvert('vendorId', (v) => v as String?),
        verificationStatus: $checkedConvert(
          'verificationStatus',
          (v) => v as String?,
        ),
        isVerified: $checkedConvert('isVerified', (v) => v as bool? ?? false),
        isActive: $checkedConvert('isActive', (v) => v as bool? ?? false),
        name: $checkedConvert('name', (v) => v as String?),
        categories: $checkedConvert(
          'categories',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        message: $checkedConvert('message', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$VendorStatusImplToJson(_$VendorStatusImpl instance) =>
    <String, dynamic>{
      'isVendor': instance.isVendor,
      'hasVendorAccount': instance.hasVendorAccount,
      if (instance.vendorId case final value?) 'vendorId': value,
      if (instance.verificationStatus case final value?)
        'verificationStatus': value,
      'isVerified': instance.isVerified,
      'isActive': instance.isActive,
      if (instance.name case final value?) 'name': value,
      if (instance.categories case final value?) 'categories': value,
      if (instance.message case final value?) 'message': value,
    };
