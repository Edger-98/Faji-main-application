import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_status.freezed.dart';
part 'vendor_status.g.dart';

@freezed
class VendorStatus with _$VendorStatus {
  const factory VendorStatus({
    required bool isVendor,
    required bool hasVendorAccount,
    String? vendorId,
    String? verificationStatus,
    @Default(false) bool isVerified,
    @Default(false) bool isActive,
    String? name,
    List<String>? categories,
    String? message,
  }) = _VendorStatus;

  factory VendorStatus.fromJson(Map<String, dynamic> json) =>
      _$VendorStatusFromJson(json);
}
