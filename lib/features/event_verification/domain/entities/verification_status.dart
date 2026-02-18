import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_status.freezed.dart';
part 'verification_status.g.dart';

/// Verification Status - matches API spec
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
