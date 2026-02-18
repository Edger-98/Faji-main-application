import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_profile.freezed.dart';
part 'vendor_profile.g.dart';

/// Vendor Profile - matches API spec
@freezed
class VendorProfile with _$VendorProfile {
  const factory VendorProfile({
    required String id,
    required String name,
    required String bio,
    required List<String> categories, required double rating, required int reviewCount, required int eventsCompleted, required bool isVerified, required String responseTime, required String location, required List<String> portfolio, required List<VendorResource> resources, required List<VendorReview> reviews, String? profilePhoto,
  }) = _VendorProfile;

  factory VendorProfile.fromJson(Map<String, dynamic> json) =>
      _$VendorProfileFromJson(json);
}

@freezed
class VendorResource with _$VendorResource {
  const factory VendorResource({
    required String id,
    required String title,
    required double basePrice,
    required bool isAvailable,
  }) = _VendorResource;

  factory VendorResource.fromJson(Map<String, dynamic> json) =>
      _$VendorResourceFromJson(json);
}

@freezed
class VendorReview with _$VendorReview {
  const factory VendorReview({
    required String id,
    required String userId,
    required String userName,
    required double rating,
    required String comment,
    required String eventDate,
    required String createdAt,
  }) = _VendorReview;

  factory VendorReview.fromJson(Map<String, dynamic> json) =>
      _$VendorReviewFromJson(json);
}
