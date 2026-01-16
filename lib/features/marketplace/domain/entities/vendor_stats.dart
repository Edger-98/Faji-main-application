import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_stats.freezed.dart';
part 'vendor_stats.g.dart';

/// Vendor Stats - matches API spec
@freezed
class VendorStats with _$VendorStats {
  const factory VendorStats({
    required int totalBookings,
    required int pendingBookings,
    required int acceptedBookings,
    required int completedBookings,
    required double totalEarnings,
    required double pendingEarnings,
    required double rating,
    required int reviewCount,
    required int eventsCompleted,
  }) = _VendorStats;

  factory VendorStats.fromJson(Map<String, dynamic> json) =>
      _$VendorStatsFromJson(json);
}
