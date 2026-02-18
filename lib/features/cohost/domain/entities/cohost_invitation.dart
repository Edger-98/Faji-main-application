import 'package:freezed_annotation/freezed_annotation.dart';

part 'cohost_invitation.freezed.dart';
part 'cohost_invitation.g.dart';

/// Co-Host Invitation - matches API spec
@freezed
class CohostInvitation with _$CohostInvitation {
  const factory CohostInvitation({
    required String id,
    required CohostEvent event,
    required CohostUser host,
    required double revenueShare,
    required String status,
    required String createdAt, required String expiresAt, String? message,
    String? respondedAt,
  }) = _CohostInvitation;

  factory CohostInvitation.fromJson(Map<String, dynamic> json) =>
      _$CohostInvitationFromJson(json);
}

@freezed
class CohostEvent with _$CohostEvent {
  const factory CohostEvent({
    required String id,
    required String name,
    required String startDate,
    String? imageUrl,
  }) = _CohostEvent;

  factory CohostEvent.fromJson(Map<String, dynamic> json) =>
      _$CohostEventFromJson(json);
}

@freezed
class CohostUser with _$CohostUser {
  const factory CohostUser({
    required String id,
    required String name,
    String? avatar,
  }) = _CohostUser;

  factory CohostUser.fromJson(Map<String, dynamic> json) =>
      _$CohostUserFromJson(json);
}

@freezed
class CohostInvitationsResponse with _$CohostInvitationsResponse {
  const factory CohostInvitationsResponse({
    required List<CohostInvitation> invitations,
    required PaginationData pagination,
  }) = _CohostInvitationsResponse;

  factory CohostInvitationsResponse.fromJson(Map<String, dynamic> json) =>
      _$CohostInvitationsResponseFromJson(json);
}

@freezed
class PaginationData with _$PaginationData {
  const factory PaginationData({
    required int page,
    required int limit,
    required int total,
    required int pages,
  }) = _PaginationData;

  factory PaginationData.fromJson(Map<String, dynamic> json) =>
      _$PaginationDataFromJson(json);
}
