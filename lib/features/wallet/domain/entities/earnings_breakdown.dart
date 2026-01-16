import 'package:freezed_annotation/freezed_annotation.dart';

part 'earnings_breakdown.freezed.dart';
part 'earnings_breakdown.g.dart';

/// Earnings Breakdown - matches actual backend response
@freezed
class EarningsBreakdown with _$EarningsBreakdown {
  const factory EarningsBreakdown({
    required double totalEarnings,
    required double availableBalance,
    required double pendingBalance,
    required double escrowBalance,
    required String currency,
    required Map<String, dynamic> breakdown,
  }) = _EarningsBreakdown;

  factory EarningsBreakdown.fromJson(Map<String, dynamic> json) =>
      _$EarningsBreakdownFromJson(json);
}

// Keep old models for backward compatibility if needed
@freezed
class EarningsSummary with _$EarningsSummary {
  const factory EarningsSummary({
    required double totalEarnings,
    required double ticketSales,
    required double cohostEarnings,
    required double vendorEarnings,
    required double platformFees,
  }) = _EarningsSummary;

  factory EarningsSummary.fromJson(Map<String, dynamic> json) =>
      _$EarningsSummaryFromJson(json);
}

@freezed
class EarningsSource with _$EarningsSource {
  const factory EarningsSource({
    required String eventId,
    required String eventName,
    required String type,
    required double amount,
    required String date,
  }) = _EarningsSource;

  factory EarningsSource.fromJson(Map<String, dynamic> json) =>
      _$EarningsSourceFromJson(json);
}
