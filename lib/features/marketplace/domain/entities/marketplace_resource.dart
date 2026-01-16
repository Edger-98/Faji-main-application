import 'package:freezed_annotation/freezed_annotation.dart';

part 'marketplace_resource.freezed.dart';
part 'marketplace_resource.g.dart';

/// Marketplace Resource - matches API spec
@freezed
class MarketplaceResource with _$MarketplaceResource {
  const factory MarketplaceResource({
    required String id,
    required String vendorId,
    required String vendorName,
    required String category,
    required String title,
    required String description,
    required List<String> photos,
    required double basePrice,
    required bool isAvailable,
    required double rating,
    required int reviewCount,
    required int eventsCompleted,
    required bool isVerified,
    required String createdAt,
  }) = _MarketplaceResource;

  factory MarketplaceResource.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceResourceFromJson(json);
}

@freezed
class MarketplaceResourcesResponse with _$MarketplaceResourcesResponse {
  const factory MarketplaceResourcesResponse({
    required List<MarketplaceResource> resources,
    required ResourcePagination pagination,
  }) = _MarketplaceResourcesResponse;

  factory MarketplaceResourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceResourcesResponseFromJson(json);
}

@freezed
class ResourcePagination with _$ResourcePagination {
  const factory ResourcePagination({
    required int page,
    required int limit,
    required int total,
    required int pages,
  }) = _ResourcePagination;

  factory ResourcePagination.fromJson(Map<String, dynamic> json) =>
      _$ResourcePaginationFromJson(json);
}
