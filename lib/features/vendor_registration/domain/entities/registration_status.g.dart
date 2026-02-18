// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistrationStatusImpl _$$RegistrationStatusImplFromJson(
  Map json,
) => $checkedCreate(r'_$RegistrationStatusImpl', json, ($checkedConvert) {
  final val = _$RegistrationStatusImpl(
    status: $checkedConvert('status', (v) => v as String),
    isApproved: $checkedConvert('isApproved', (v) => v as bool),
    documentsUploaded: $checkedConvert('documentsUploaded', (v) => v as bool),
    portfolioUploaded: $checkedConvert('portfolioUploaded', (v) => v as bool),
    bankDetailsAdded: $checkedConvert('bankDetailsAdded', (v) => v as bool),
    updatedAt: $checkedConvert('updatedAt', (v) => v as String),
    rejectionReason: $checkedConvert('rejectionReason', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$$RegistrationStatusImplToJson(
  _$RegistrationStatusImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'isApproved': instance.isApproved,
  'documentsUploaded': instance.documentsUploaded,
  'portfolioUploaded': instance.portfolioUploaded,
  'bankDetailsAdded': instance.bankDetailsAdded,
  'updatedAt': instance.updatedAt,
  if (instance.rejectionReason case final value?) 'rejectionReason': value,
};

_$VendorRegistrationProfileImpl _$$VendorRegistrationProfileImplFromJson(
  Map json,
) => $checkedCreate(r'_$VendorRegistrationProfileImpl', json, (
  $checkedConvert,
) {
  final val = _$VendorRegistrationProfileImpl(
    id: $checkedConvert('id', (v) => v as String),
    businessName: $checkedConvert('businessName', (v) => v as String),
    category: $checkedConvert('category', (v) => v as String),
    bio: $checkedConvert('bio', (v) => v as String),
    location: $checkedConvert('location', (v) => v as String),
    phoneNumber: $checkedConvert('phoneNumber', (v) => v as String),
    status: $checkedConvert('status', (v) => v as String),
    documents: $checkedConvert(
      'documents',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
    portfolio: $checkedConvert(
      'portfolio',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
    createdAt: $checkedConvert('createdAt', (v) => v as String),
    updatedAt: $checkedConvert('updatedAt', (v) => v as String),
    website: $checkedConvert('website', (v) => v as String?),
    bankDetails: $checkedConvert(
      'bankDetails',
      (v) => v == null
          ? null
          : BankDetailsResponse.fromJson(Map<String, dynamic>.from(v as Map)),
    ),
  );
  return val;
});

Map<String, dynamic> _$$VendorRegistrationProfileImplToJson(
  _$VendorRegistrationProfileImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'businessName': instance.businessName,
  'category': instance.category,
  'bio': instance.bio,
  'location': instance.location,
  'phoneNumber': instance.phoneNumber,
  'status': instance.status,
  'documents': instance.documents,
  'portfolio': instance.portfolio,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  if (instance.website case final value?) 'website': value,
  if (instance.bankDetails?.toJson() case final value?) 'bankDetails': value,
};
