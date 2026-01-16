import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_document.freezed.dart';
part 'vendor_document.g.dart';

/// Vendor Document - matches API spec
@freezed
class VendorDocument with _$VendorDocument {
  const factory VendorDocument({
    required String id,
    required String documentType,
    required String documentUrl,
    required String status,
    required String uploadedAt,
  }) = _VendorDocument;

  factory VendorDocument.fromJson(Map<String, dynamic> json) =>
      _$VendorDocumentFromJson(json);
}

@freezed
class UploadDocumentRequest with _$UploadDocumentRequest {
  const factory UploadDocumentRequest({
    required String documentType,
    required String documentUrl,
  }) = _UploadDocumentRequest;

  factory UploadDocumentRequest.fromJson(Map<String, dynamic> json) =>
      _$UploadDocumentRequestFromJson(json);
}
