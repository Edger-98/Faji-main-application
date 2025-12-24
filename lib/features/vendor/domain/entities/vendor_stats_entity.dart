import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_stats_entity.freezed.dart';
part 'vendor_stats_entity.g.dart';

@freezed
class VendorStatsEntity with _$VendorStatsEntity {
  const factory VendorStatsEntity({
    @Default(0) int totalBookings,
    @Default(0.0) double totalEarnings,
    @Default(0) int pendingRequests,
    @Default(0) int activeResources,
    @Default(0) int completedBookings,
    @Default(0.0) double averageRating,
  }) = _VendorStatsEntity;

  factory VendorStatsEntity.fromJson(Map<String, dynamic> json) =>
      _$VendorStatsEntityFromJson(json);
}
