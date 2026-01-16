// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorRegistrationRequestImpl _$$VendorRegistrationRequestImplFromJson(
  Map json,
) =>
    $checkedCreate(r'_$VendorRegistrationRequestImpl', json, ($checkedConvert) {
      final val = _$VendorRegistrationRequestImpl(
        businessName: $checkedConvert('businessName', (v) => v as String),
        category: $checkedConvert('category', (v) => v as String),
        bio: $checkedConvert('bio', (v) => v as String),
        location: $checkedConvert('location', (v) => v as String),
        phoneNumber: $checkedConvert('phoneNumber', (v) => v as String),
        website: $checkedConvert('website', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$VendorRegistrationRequestImplToJson(
  _$VendorRegistrationRequestImpl instance,
) => <String, dynamic>{
  'businessName': instance.businessName,
  'category': instance.category,
  'bio': instance.bio,
  'location': instance.location,
  'phoneNumber': instance.phoneNumber,
  if (instance.website case final value?) 'website': value,
};

_$VendorRegistrationResponseImpl _$$VendorRegistrationResponseImplFromJson(
  Map json,
) => $checkedCreate(r'_$VendorRegistrationResponseImpl', json, (
  $checkedConvert,
) {
  final val = _$VendorRegistrationResponseImpl(
    id: $checkedConvert('id', (v) => v as String),
    businessName: $checkedConvert('businessName', (v) => v as String),
    category: $checkedConvert('category', (v) => v as String),
    status: $checkedConvert('status', (v) => v as String),
    createdAt: $checkedConvert('createdAt', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$$VendorRegistrationResponseImplToJson(
  _$VendorRegistrationResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'businessName': instance.businessName,
  'category': instance.category,
  'status': instance.status,
  'createdAt': instance.createdAt,
};
