import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_profile_entity.freezed.dart';
part 'vendor_profile_entity.g.dart';

@freezed
class VendorProfileEntity with _$VendorProfileEntity {
  const factory VendorProfileEntity({
    required String id,
    required String userId,
    required String businessName,
    required String description,
    required List<String> categories,
    String? profilePhoto,
    List<String>? portfolioImages,
    @Default(0.0) double rating,
    @Default(0) int totalBookings,
    @Default(0) int completedBookings,
    @Default(true) bool isActive,
    @Default(false) bool isVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VendorProfileEntity;

  factory VendorProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$VendorProfileEntityFromJson(json);
}
