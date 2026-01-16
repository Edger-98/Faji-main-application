import 'package:freezed_annotation/freezed_annotation.dart';

part 'revenue_distribution.freezed.dart';
part 'revenue_distribution.g.dart';

/// Revenue Distribution - matches API spec
@freezed
class RevenueDistribution with _$RevenueDistribution {
  const factory RevenueDistribution({
    required HostRevenue host,
    required List<CohostRevenue> cohosts,
    required RevenueSummary summary,
  }) = _RevenueDistribution;

  factory RevenueDistribution.fromJson(Map<String, dynamic> json) =>
      _$RevenueDistributionFromJson(json);
}

@freezed
class HostRevenue with _$HostRevenue {
  const factory HostRevenue({
    required String userId,
    required String name,
    required double share,
    required double amount,
  }) = _HostRevenue;

  factory HostRevenue.fromJson(Map<String, dynamic> json) =>
      _$HostRevenueFromJson(json);
}

@freezed
class CohostRevenue with _$CohostRevenue {
  const factory CohostRevenue({
    required String userId,
    required String name,
    required double share,
    required double amount,
  }) = _CohostRevenue;

  factory CohostRevenue.fromJson(Map<String, dynamic> json) =>
      _$CohostRevenueFromJson(json);
}

@freezed
class RevenueSummary with _$RevenueSummary {
  const factory RevenueSummary({
    required double totalRevenue,
    required double platformFee,
    required double netRevenue,
    required double hostAmount,
    required double cohostAmount,
  }) = _RevenueSummary;

  factory RevenueSummary.fromJson(Map<String, dynamic> json) =>
      _$RevenueSummaryFromJson(json);
}
