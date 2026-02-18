import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_cohost_request.freezed.dart';
part 'invite_cohost_request.g.dart';

/// Invite Co-Host Request - matches API spec
@freezed
class InviteCohostRequest with _$InviteCohostRequest {
  const factory InviteCohostRequest({
    required String userId,
    required double revenueShare,
    String? message,
  }) = _InviteCohostRequest;

  factory InviteCohostRequest.fromJson(Map<String, dynamic> json) =>
      _$InviteCohostRequestFromJson(json);
}

@freezed
class InviteCohostResponse with _$InviteCohostResponse {
  const factory InviteCohostResponse({
    required String invitationId,
    required String eventId,
    required String eventName,
    required InviteHost host,
    required InviteInvitee invitee,
    required double revenueShare,
    required String status,
    required String createdAt, required String expiresAt, String? message,
  }) = _InviteCohostResponse;

  factory InviteCohostResponse.fromJson(Map<String, dynamic> json) =>
      _$InviteCohostResponseFromJson(json);
}

@freezed
class InviteHost with _$InviteHost {
  const factory InviteHost({
    required String id,
    required String name,
  }) = _InviteHost;

  factory InviteHost.fromJson(Map<String, dynamic> json) =>
      _$InviteHostFromJson(json);
}

@freezed
class InviteInvitee with _$InviteInvitee {
  const factory InviteInvitee({
    required String id,
    required String name,
    required String email,
  }) = _InviteInvitee;

  factory InviteInvitee.fromJson(Map<String, dynamic> json) =>
      _$InviteInviteeFromJson(json);
}
