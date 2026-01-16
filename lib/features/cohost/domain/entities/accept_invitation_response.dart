import 'package:freezed_annotation/freezed_annotation.dart';

part 'accept_invitation_response.freezed.dart';
part 'accept_invitation_response.g.dart';

/// Accept Invitation Response - matches API spec
@freezed
class AcceptInvitationResponse with _$AcceptInvitationResponse {
  const factory AcceptInvitationResponse({
    required String invitationId,
    required String eventId,
    required String status,
    required AcceptedCohost cohost,
    required String acceptedAt,
  }) = _AcceptInvitationResponse;

  factory AcceptInvitationResponse.fromJson(Map<String, dynamic> json) =>
      _$AcceptInvitationResponseFromJson(json);
}

@freezed
class AcceptedCohost with _$AcceptedCohost {
  const factory AcceptedCohost({
    required String id,
    required String name,
    required double revenueShare,
    required String role,
  }) = _AcceptedCohost;

  factory AcceptedCohost.fromJson(Map<String, dynamic> json) =>
      _$AcceptedCohostFromJson(json);
}

/// Decline Invitation Request - matches API spec
@freezed
class DeclineInvitationRequest with _$DeclineInvitationRequest {
  const factory DeclineInvitationRequest({
    String? reason,
  }) = _DeclineInvitationRequest;

  factory DeclineInvitationRequest.fromJson(Map<String, dynamic> json) =>
      _$DeclineInvitationRequestFromJson(json);
}

@freezed
class DeclineInvitationResponse with _$DeclineInvitationResponse {
  const factory DeclineInvitationResponse({
    required String invitationId,
    required String status,
    required String declinedAt,
  }) = _DeclineInvitationResponse;

  factory DeclineInvitationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeclineInvitationResponseFromJson(json);
}
