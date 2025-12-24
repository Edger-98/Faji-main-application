// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_stats_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorStatsEntityImpl _$$VendorStatsEntityImplFromJson(Map json) =>
    $checkedCreate(r'_$VendorStatsEntityImpl', json, ($checkedConvert) {
      final val = _$VendorStatsEntityImpl(
        totalBookings: $checkedConvert(
          'totalBookings',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
        totalEarnings: $checkedConvert(
          'totalEarnings',
          (v) => (v as num?)?.toDouble() ?? 0.0,
        ),
        pendingRequests: $checkedConvert(
          'pendingRequests',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
        activeResources: $checkedConvert(
          'activeResources',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
        completedBookings: $checkedConvert(
          'completedBookings',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
        averageRating: $checkedConvert(
          'averageRating',
          (v) => (v as num?)?.toDouble() ?? 0.0,
        ),
      );
      return val;
    });

Map<String, dynamic> _$$VendorStatsEntityImplToJson(
  _$VendorStatsEntityImpl instance,
) => <String, dynamic>{
  'totalBookings': instance.totalBookings,
  'totalEarnings': instance.totalEarnings,
  'pendingRequests': instance.pendingRequests,
  'activeResources': instance.activeResources,
  'completedBookings': instance.completedBookings,
  'averageRating': instance.averageRating,
};
