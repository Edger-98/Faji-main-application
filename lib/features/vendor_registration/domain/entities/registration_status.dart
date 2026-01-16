import 'package:freezed_annotation/freezed_annotation.dart';
import 'bank_details.dart';

part 'registration_status.freezed.dart';
part 'registration_status.g.dart';

/// Registration Status - matches API spec
@freezed
class RegistrationStatus with _$RegistrationStatus {
  const factory RegistrationStatus({
    required String status,
    required bool isApproved,
    required bool documentsUploaded,
    required bool portfolioUploaded,
    required bool bankDetailsAdded,
    String? rejectionReason,
    required String updatedAt,
  }) = _RegistrationStatus;

  factory RegistrationStatus.fromJson(Map<String, dynamic> json) =>
      _$RegistrationStatusFromJson(json);
}

@freezed
class VendorRegistrationProfile with _$VendorRegistrationProfile {
  const factory VendorRegistrationProfile({
    required String id,
    required String businessName,
    required String category,
    required String bio,
    required String location,
    required String phoneNumber,
    String? website,
    required String status,
    required List<String> documents,
    required List<String> portfolio,
    BankDetailsResponse? bankDetails,
    required String createdAt,
    required String updatedAt,
  }) = _VendorRegistrationProfile;

  factory VendorRegistrationProfile.fromJson(Map<String, dynamic> json) =>
      _$VendorRegistrationProfileFromJson(json);
}
