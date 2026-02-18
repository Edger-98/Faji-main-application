import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_event_response.freezed.dart';
part 'verify_event_response.g.dart';

/// Verify Event Response - matches API spec
@freezed
class VerifyEventResponse with _$VerifyEventResponse {
  const factory VerifyEventResponse({
    required bool success,
    required String message,
    VerificationData? verification,
    EscrowRelease? escrowRelease,
    VerificationStatus? status,
  }) = _VerifyEventResponse;

  factory VerifyEventResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEventResponseFromJson(json);
}

@freezed
class VerificationData with _$VerificationData {
  const factory VerificationData({
    required bool isVerified,
    required String verifiedAt,
    bool? manualOverride,
  }) = _VerificationData;

  factory VerificationData.fromJson(Map<String, dynamic> json) =>
      _$VerificationDataFromJson(json);
}

@freezed
class EscrowRelease with _$EscrowRelease {
  const factory EscrowRelease({
    required int released,
    required double totalAmount,
    required double platformFee,
    required double netRevenue,
    required List<RevenueRecipient> distribution,
  }) = _EscrowRelease;

  factory EscrowRelease.fromJson(Map<String, dynamic> json) =>
      _$EscrowReleaseFromJson(json);
}

@freezed
class RevenueRecipient with _$RevenueRecipient {
  const factory RevenueRecipient({
    required String userId,
    required String accountType,
    required double share,
    required double amount,
  }) = _RevenueRecipient;

  factory RevenueRecipient.fromJson(Map<String, dynamic> json) =>
      _$RevenueRecipientFromJson(json);
}

@freezed
class VerificationStatus with _$VerificationStatus {
  const factory VerificationStatus({
    required String eventId,
    required String eventName,
    required int soldTickets,
    required int checkedInGuests,
    required int checkInPercentage,
    required int threshold,
    required bool meetsThreshold,
    required bool isVerified,
    required bool canVerify, String? verifiedAt,
  }) = _VerificationStatus;

  factory VerificationStatus.fromJson(Map<String, dynamic> json) =>
      _$VerificationStatusFromJson(json);
}
