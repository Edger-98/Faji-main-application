// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorDocumentImpl _$$VendorDocumentImplFromJson(Map json) =>
    $checkedCreate(r'_$VendorDocumentImpl', json, ($checkedConvert) {
      final val = _$VendorDocumentImpl(
        id: $checkedConvert('id', (v) => v as String),
        documentType: $checkedConvert('documentType', (v) => v as String),
        documentUrl: $checkedConvert('documentUrl', (v) => v as String),
        status: $checkedConvert('status', (v) => v as String),
        uploadedAt: $checkedConvert('uploadedAt', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$VendorDocumentImplToJson(
  _$VendorDocumentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'documentType': instance.documentType,
  'documentUrl': instance.documentUrl,
  'status': instance.status,
  'uploadedAt': instance.uploadedAt,
};

_$UploadDocumentRequestImpl _$$UploadDocumentRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$UploadDocumentRequestImpl', json, ($checkedConvert) {
      final val = _$UploadDocumentRequestImpl(
        documentType: $checkedConvert('documentType', (v) => v as String),
        documentUrl: $checkedConvert('documentUrl', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$UploadDocumentRequestImplToJson(
  _$UploadDocumentRequestImpl instance,
) => <String, dynamic>{
  'documentType': instance.documentType,
  'documentUrl': instance.documentUrl,
};
