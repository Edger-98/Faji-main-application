// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_portfolio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorPortfolioImpl _$$VendorPortfolioImplFromJson(Map json) =>
    $checkedCreate(r'_$VendorPortfolioImpl', json, ($checkedConvert) {
      final val = _$VendorPortfolioImpl(
        id: $checkedConvert('id', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String),
        uploadedAt: $checkedConvert('uploadedAt', (v) => v as String),
        caption: $checkedConvert('caption', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$VendorPortfolioImplToJson(
  _$VendorPortfolioImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'imageUrl': instance.imageUrl,
  'uploadedAt': instance.uploadedAt,
  if (instance.caption case final value?) 'caption': value,
};

_$UploadPortfolioRequestImpl _$$UploadPortfolioRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$UploadPortfolioRequestImpl', json, ($checkedConvert) {
      final val = _$UploadPortfolioRequestImpl(
        imageUrl: $checkedConvert('imageUrl', (v) => v as String),
        caption: $checkedConvert('caption', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$UploadPortfolioRequestImplToJson(
  _$UploadPortfolioRequestImpl instance,
) => <String, dynamic>{
  'imageUrl': instance.imageUrl,
  if (instance.caption case final value?) 'caption': value,
};
