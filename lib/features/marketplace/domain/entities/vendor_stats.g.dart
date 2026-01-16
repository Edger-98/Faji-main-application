// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorStatsImpl _$$VendorStatsImplFromJson(Map json) =>
    $checkedCreate(r'_$VendorStatsImpl', json, ($checkedConvert) {
      final val = _$VendorStatsImpl(
        totalBookings: $checkedConvert(
          'totalBookings',
          (v) => (v as num).toInt(),
        ),
        pendingBookings: $checkedConvert(
          'pendingBookings',
          (v) => (v as num).toInt(),
        ),
        acceptedBookings: $checkedConvert(
          'acceptedBookings',
          (v) => (v as num).toInt(),
        ),
        completedBookings: $checkedConvert(
          'completedBookings',
          (v) => (v as num).toInt(),
        ),
        totalEarnings: $checkedConvert(
          'totalEarnings',
          (v) => (v as num).toDouble(),
        ),
        pendingEarnings: $checkedConvert(
          'pendingEarnings',
          (v) => (v as num).toDouble(),
        ),
        rating: $checkedConvert('rating', (v) => (v as num).toDouble()),
        reviewCount: $checkedConvert('reviewCount', (v) => (v as num).toInt()),
        eventsCompleted: $checkedConvert(
          'eventsCompleted',
          (v) => (v as num).toInt(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$VendorStatsImplToJson(_$VendorStatsImpl instance) =>
    <String, dynamic>{
      'totalBookings': instance.totalBookings,
      'pendingBookings': instance.pendingBookings,
      'acceptedBookings': instance.acceptedBookings,
      'completedBookings': instance.completedBookings,
      'totalEarnings': instance.totalEarnings,
      'pendingEarnings': instance.pendingEarnings,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'eventsCompleted': instance.eventsCompleted,
    };
