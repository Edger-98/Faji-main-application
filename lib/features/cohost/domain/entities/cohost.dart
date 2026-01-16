import 'package:freezed_annotation/freezed_annotation.dart';

part 'cohost.freezed.dart';
part 'cohost.g.dart';

/// Co-Host entity - matches API spec
@freezed
class Cohost with _$Cohost {
  const factory Cohost({
    required String id,
    required String name,
    required String email,
    String? avatar,
    required double revenueShare,
    required String role,
    required String joinedAt,
    required double earnings,
    required CohostPermissions permissions,
  }) = _Cohost;

  factory Cohost.fromJson(Map<String, dynamic> json) =>
      _$CohostFromJson(json);
}

@freezed
class CohostPermissions with _$CohostPermissions {
  const factory CohostPermissions({
    required bool canEditEvent,
    required bool canViewGuests,
    required bool canViewFinancials,
    required bool canInviteGuests,
  }) = _CohostPermissions;

  factory CohostPermissions.fromJson(Map<String, dynamic> json) =>
      _$CohostPermissionsFromJson(json);
}

@freezed
class EventCohostsResponse with _$EventCohostsResponse {
  const factory EventCohostsResponse({
    required List<Cohost> cohosts,
    required double totalRevenueShared,
  }) = _EventCohostsResponse;

  factory EventCohostsResponse.fromJson(Map<String, dynamic> json) =>
      _$EventCohostsResponseFromJson(json);
}
