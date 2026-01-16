import 'package:freezed_annotation/freezed_annotation.dart';

part 'cohost_dashboard.freezed.dart';
part 'cohost_dashboard.g.dart';

/// Co-Host Dashboard - matches API spec
@freezed
class CohostDashboard with _$CohostDashboard {
  const factory CohostDashboard({
    required DashboardEvent event,
    required DashboardRole role,
    required DashboardEarnings earnings,
    required DashboardStats stats,
  }) = _CohostDashboard;

  factory CohostDashboard.fromJson(Map<String, dynamic> json) =>
      _$CohostDashboardFromJson(json);
}

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent({
    required String id,
    required String name,
    required String startDate,
    String? imageUrl,
  }) = _DashboardEvent;

  factory DashboardEvent.fromJson(Map<String, dynamic> json) =>
      _$DashboardEventFromJson(json);
}

@freezed
class DashboardRole with _$DashboardRole {
  const factory DashboardRole({
    required String title,
    required double revenueShare,
    required DashboardPermissions permissions,
  }) = _DashboardRole;

  factory DashboardRole.fromJson(Map<String, dynamic> json) =>
      _$DashboardRoleFromJson(json);
}

@freezed
class DashboardPermissions with _$DashboardPermissions {
  const factory DashboardPermissions({
    required bool canEditEvent,
    required bool canViewGuests,
    required bool canViewFinancials,
  }) = _DashboardPermissions;

  factory DashboardPermissions.fromJson(Map<String, dynamic> json) =>
      _$DashboardPermissionsFromJson(json);
}

@freezed
class DashboardEarnings with _$DashboardEarnings {
  const factory DashboardEarnings({
    required double total,
    required double pending,
    required double paid,
    required String currency,
  }) = _DashboardEarnings;

  factory DashboardEarnings.fromJson(Map<String, dynamic> json) =>
      _$DashboardEarningsFromJson(json);
}

@freezed
class DashboardStats with _$DashboardStats {
  const factory DashboardStats({
    required double totalRevenue,
    required double yourShare,
    required int ticketsSold,
    required int guestsCheckedIn,
  }) = _DashboardStats;

  factory DashboardStats.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsFromJson(json);
}
