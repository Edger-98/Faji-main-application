import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_registration.freezed.dart';
part 'vendor_registration.g.dart';

/// Vendor Registration - matches API spec
@freezed
class VendorRegistrationRequest with _$VendorRegistrationRequest {
  const factory VendorRegistrationRequest({
    required String businessName,
    required String category,
    required String bio,
    required String location,
    required String phoneNumber,
    String? website,
  }) = _VendorRegistrationRequest;

  factory VendorRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$VendorRegistrationRequestFromJson(json);
}

@freezed
class VendorRegistrationResponse with _$VendorRegistrationResponse {
  const factory VendorRegistrationResponse({
    required String id,
    required String businessName,
    required String category,
    required String status,
    required String createdAt,
  }) = _VendorRegistrationResponse;

  factory VendorRegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$VendorRegistrationResponseFromJson(json);
}
