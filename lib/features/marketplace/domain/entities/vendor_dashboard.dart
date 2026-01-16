import 'package:freezed_annotation/freezed_annotation.dart';
import 'vendor_stats.dart';
import 'booking.dart';

part 'vendor_dashboard.freezed.dart';
part 'vendor_dashboard.g.dart';

/// Vendor Dashboard - matches API spec
@freezed
class VendorDashboard with _$VendorDashboard {
  const factory VendorDashboard({
    required VendorStats stats,
    required List<Booking> recentBookings,
    required VendorEarnings earnings,
  }) = _VendorDashboard;

  factory VendorDashboard.fromJson(Map<String, dynamic> json) =>
      _$VendorDashboardFromJson(json);
}

@freezed
class VendorEarnings with _$VendorEarnings {
  const factory VendorEarnings({
    required double total,
    required double pending,
    required double paid,
    required String currency,
  }) = _VendorEarnings;

  factory VendorEarnings.fromJson(Map<String, dynamic> json) =>
      _$VendorEarningsFromJson(json);
}
