import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_resource_entity.freezed.dart';
part 'vendor_resource_entity.g.dart';

@freezed
class VendorResourceEntity with _$VendorResourceEntity {
  const factory VendorResourceEntity({
    required String id,
    required String vendorId,
    required String category,
    required String title,
    required String description,
    required double price,
    List<String>? images,
    @Default(true) bool isAvailable,
    @Default(0) int bookingCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VendorResourceEntity;

  factory VendorResourceEntity.fromJson(Map<String, dynamic> json) =>
      _$VendorResourceEntityFromJson(json);
}
