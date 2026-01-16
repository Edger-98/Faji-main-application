// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cohost_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CohostDashboardImpl _$$CohostDashboardImplFromJson(Map json) =>
    $checkedCreate(r'_$CohostDashboardImpl', json, ($checkedConvert) {
      final val = _$CohostDashboardImpl(
        event: $checkedConvert(
          'event',
          (v) => DashboardEvent.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
        role: $checkedConvert(
          'role',
          (v) => DashboardRole.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
        earnings: $checkedConvert(
          'earnings',
          (v) =>
              DashboardEarnings.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
        stats: $checkedConvert(
          'stats',
          (v) => DashboardStats.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$CohostDashboardImplToJson(
  _$CohostDashboardImpl instance,
) => <String, dynamic>{
  'event': instance.event.toJson(),
  'role': instance.role.toJson(),
  'earnings': instance.earnings.toJson(),
  'stats': instance.stats.toJson(),
};

_$DashboardEventImpl _$$DashboardEventImplFromJson(Map json) =>
    $checkedCreate(r'_$DashboardEventImpl', json, ($checkedConvert) {
      final val = _$DashboardEventImpl(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        startDate: $checkedConvert('startDate', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$DashboardEventImplToJson(
  _$DashboardEventImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'startDate': instance.startDate,
  if (instance.imageUrl case final value?) 'imageUrl': value,
};

_$DashboardRoleImpl _$$DashboardRoleImplFromJson(
  Map json,
) => $checkedCreate(r'_$DashboardRoleImpl', json, ($checkedConvert) {
  final val = _$DashboardRoleImpl(
    title: $checkedConvert('title', (v) => v as String),
    revenueShare: $checkedConvert('revenueShare', (v) => (v as num).toDouble()),
    permissions: $checkedConvert(
      'permissions',
      (v) => DashboardPermissions.fromJson(Map<String, dynamic>.from(v as Map)),
    ),
  );
  return val;
});

Map<String, dynamic> _$$DashboardRoleImplToJson(_$DashboardRoleImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'revenueShare': instance.revenueShare,
      'permissions': instance.permissions.toJson(),
    };

_$DashboardPermissionsImpl _$$DashboardPermissionsImplFromJson(Map json) =>
    $checkedCreate(r'_$DashboardPermissionsImpl', json, ($checkedConvert) {
      final val = _$DashboardPermissionsImpl(
        canEditEvent: $checkedConvert('canEditEvent', (v) => v as bool),
        canViewGuests: $checkedConvert('canViewGuests', (v) => v as bool),
        canViewFinancials: $checkedConvert(
          'canViewFinancials',
          (v) => v as bool,
        ),
      );
      return val;
    });

Map<String, dynamic> _$$DashboardPermissionsImplToJson(
  _$DashboardPermissionsImpl instance,
) => <String, dynamic>{
  'canEditEvent': instance.canEditEvent,
  'canViewGuests': instance.canViewGuests,
  'canViewFinancials': instance.canViewFinancials,
};

_$DashboardEarningsImpl _$$DashboardEarningsImplFromJson(Map json) =>
    $checkedCreate(r'_$DashboardEarningsImpl', json, ($checkedConvert) {
      final val = _$DashboardEarningsImpl(
        total: $checkedConvert('total', (v) => (v as num).toDouble()),
        pending: $checkedConvert('pending', (v) => (v as num).toDouble()),
        paid: $checkedConvert('paid', (v) => (v as num).toDouble()),
        currency: $checkedConvert('currency', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$DashboardEarningsImplToJson(
  _$DashboardEarningsImpl instance,
) => <String, dynamic>{
  'total': instance.total,
  'pending': instance.pending,
  'paid': instance.paid,
  'currency': instance.currency,
};

_$DashboardStatsImpl _$$DashboardStatsImplFromJson(Map json) =>
    $checkedCreate(r'_$DashboardStatsImpl', json, ($checkedConvert) {
      final val = _$DashboardStatsImpl(
        totalRevenue: $checkedConvert(
          'totalRevenue',
          (v) => (v as num).toDouble(),
        ),
        yourShare: $checkedConvert('yourShare', (v) => (v as num).toDouble()),
        ticketsSold: $checkedConvert('ticketsSold', (v) => (v as num).toInt()),
        guestsCheckedIn: $checkedConvert(
          'guestsCheckedIn',
          (v) => (v as num).toInt(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$DashboardStatsImplToJson(
  _$DashboardStatsImpl instance,
) => <String, dynamic>{
  'totalRevenue': instance.totalRevenue,
  'yourShare': instance.yourShare,
  'ticketsSold': instance.ticketsSold,
  'guestsCheckedIn': instance.guestsCheckedIn,
};
