import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_booking_entity.freezed.dart';
part 'vendor_booking_entity.g.dart';

enum BookingStatus {
  pending,
  accepted,
  declined,
  counterOffer,
  completed,
  cancelled,
}

@freezed
class VendorBookingEntity with _$VendorBookingEntity {
  const factory VendorBookingEntity({
    required String id,
    required String vendorId,
    required String resourceId,
    required String customerId,
    required String customerName,
    required String eventName,
    required DateTime eventDate,
    required double offeredPrice,
    required BookingStatus status, double? counterOfferPrice,
    String? message,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VendorBookingEntity;

  factory VendorBookingEntity.fromJson(Map<String, dynamic> json) =>
      _$VendorBookingEntityFromJson(json);
}
