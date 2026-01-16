// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cohost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CohostImpl _$$CohostImplFromJson(Map json) =>
    $checkedCreate(r'_$CohostImpl', json, ($checkedConvert) {
      final val = _$CohostImpl(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        email: $checkedConvert('email', (v) => v as String),
        avatar: $checkedConvert('avatar', (v) => v as String?),
        revenueShare: $checkedConvert(
          'revenueShare',
          (v) => (v as num).toDouble(),
        ),
        role: $checkedConvert('role', (v) => v as String),
        joinedAt: $checkedConvert('joinedAt', (v) => v as String),
        earnings: $checkedConvert('earnings', (v) => (v as num).toDouble()),
        permissions: $checkedConvert(
          'permissions',
          (v) =>
              CohostPermissions.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$CohostImplToJson(_$CohostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      if (instance.avatar case final value?) 'avatar': value,
      'revenueShare': instance.revenueShare,
      'role': instance.role,
      'joinedAt': instance.joinedAt,
      'earnings': instance.earnings,
      'permissions': instance.permissions.toJson(),
    };

_$CohostPermissionsImpl _$$CohostPermissionsImplFromJson(Map json) =>
    $checkedCreate(r'_$CohostPermissionsImpl', json, ($checkedConvert) {
      final val = _$CohostPermissionsImpl(
        canEditEvent: $checkedConvert('canEditEvent', (v) => v as bool),
        canViewGuests: $checkedConvert('canViewGuests', (v) => v as bool),
        canViewFinancials: $checkedConvert(
          'canViewFinancials',
          (v) => v as bool,
        ),
        canInviteGuests: $checkedConvert('canInviteGuests', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$$CohostPermissionsImplToJson(
  _$CohostPermissionsImpl instance,
) => <String, dynamic>{
  'canEditEvent': instance.canEditEvent,
  'canViewGuests': instance.canViewGuests,
  'canViewFinancials': instance.canViewFinancials,
  'canInviteGuests': instance.canInviteGuests,
};

_$EventCohostsResponseImpl _$$EventCohostsResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$EventCohostsResponseImpl', json, ($checkedConvert) {
      final val = _$EventCohostsResponseImpl(
        cohosts: $checkedConvert(
          'cohosts',
          (v) => (v as List<dynamic>)
              .map((e) => Cohost.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList(),
        ),
        totalRevenueShared: $checkedConvert(
          'totalRevenueShared',
          (v) => (v as num).toDouble(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$EventCohostsResponseImplToJson(
  _$EventCohostsResponseImpl instance,
) => <String, dynamic>{
  'cohosts': instance.cohosts.map((e) => e.toJson()).toList(),
  'totalRevenueShared': instance.totalRevenueShared,
};
