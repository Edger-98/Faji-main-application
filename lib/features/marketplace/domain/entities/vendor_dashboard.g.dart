// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorDashboardImpl _$$VendorDashboardImplFromJson(Map json) =>
    $checkedCreate(r'_$VendorDashboardImpl', json, ($checkedConvert) {
      final val = _$VendorDashboardImpl(
        stats: $checkedConvert(
          'stats',
          (v) => VendorStats.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
        recentBookings: $checkedConvert(
          'recentBookings',
          (v) => (v as List<dynamic>)
              .map((e) => Booking.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList(),
        ),
        earnings: $checkedConvert(
          'earnings',
          (v) => VendorEarnings.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$VendorDashboardImplToJson(
  _$VendorDashboardImpl instance,
) => <String, dynamic>{
  'stats': instance.stats.toJson(),
  'recentBookings': instance.recentBookings.map((e) => e.toJson()).toList(),
  'earnings': instance.earnings.toJson(),
};

_$VendorEarningsImpl _$$VendorEarningsImplFromJson(Map json) =>
    $checkedCreate(r'_$VendorEarningsImpl', json, ($checkedConvert) {
      final val = _$VendorEarningsImpl(
        total: $checkedConvert('total', (v) => (v as num).toDouble()),
        pending: $checkedConvert('pending', (v) => (v as num).toDouble()),
        paid: $checkedConvert('paid', (v) => (v as num).toDouble()),
        currency: $checkedConvert('currency', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$VendorEarningsImplToJson(
  _$VendorEarningsImpl instance,
) => <String, dynamic>{
  'total': instance.total,
  'pending': instance.pending,
  'paid': instance.paid,
  'currency': instance.currency,
};
