import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/bank_details.dart';

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
    required String updatedAt, String? rejectionReason,
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
    required String status, required List<String> documents, required List<String> portfolio, required String createdAt, required String updatedAt, String? website,
    BankDetailsResponse? bankDetails,
  }) = _VendorRegistrationProfile;

  factory VendorRegistrationProfile.fromJson(Map<String, dynamic> json) =>
      _$VendorRegistrationProfileFromJson(json);
}
