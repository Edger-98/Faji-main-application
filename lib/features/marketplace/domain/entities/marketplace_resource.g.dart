// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarketplaceResourceImpl _$$MarketplaceResourceImplFromJson(Map json) =>
    $checkedCreate(r'_$MarketplaceResourceImpl', json, ($checkedConvert) {
      final val = _$MarketplaceResourceImpl(
        id: $checkedConvert('id', (v) => v as String),
        vendorId: $checkedConvert('vendorId', (v) => v as String),
        vendorName: $checkedConvert('vendorName', (v) => v as String),
        category: $checkedConvert('category', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        photos: $checkedConvert(
          'photos',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        basePrice: $checkedConvert('basePrice', (v) => (v as num).toDouble()),
        isAvailable: $checkedConvert('isAvailable', (v) => v as bool),
        rating: $checkedConvert('rating', (v) => (v as num).toDouble()),
        reviewCount: $checkedConvert('reviewCount', (v) => (v as num).toInt()),
        eventsCompleted: $checkedConvert(
          'eventsCompleted',
          (v) => (v as num).toInt(),
        ),
        isVerified: $checkedConvert('isVerified', (v) => v as bool),
        createdAt: $checkedConvert('createdAt', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$MarketplaceResourceImplToJson(
  _$MarketplaceResourceImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'vendorId': instance.vendorId,
  'vendorName': instance.vendorName,
  'category': instance.category,
  'title': instance.title,
  'description': instance.description,
  'photos': instance.photos,
  'basePrice': instance.basePrice,
  'isAvailable': instance.isAvailable,
  'rating': instance.rating,
  'reviewCount': instance.reviewCount,
  'eventsCompleted': instance.eventsCompleted,
  'isVerified': instance.isVerified,
  'createdAt': instance.createdAt,
};

_$MarketplaceResourcesResponseImpl _$$MarketplaceResourcesResponseImplFromJson(
  Map json,
) => $checkedCreate(r'_$MarketplaceResourcesResponseImpl', json, (
  $checkedConvert,
) {
  final val = _$MarketplaceResourcesResponseImpl(
    resources: $checkedConvert(
      'resources',
      (v) => (v as List<dynamic>)
          .map(
            (e) => MarketplaceResource.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList(),
    ),
    pagination: $checkedConvert(
      'pagination',
      (v) => ResourcePagination.fromJson(Map<String, dynamic>.from(v as Map)),
    ),
  );
  return val;
});

Map<String, dynamic> _$$MarketplaceResourcesResponseImplToJson(
  _$MarketplaceResourcesResponseImpl instance,
) => <String, dynamic>{
  'resources': instance.resources.map((e) => e.toJson()).toList(),
  'pagination': instance.pagination.toJson(),
};

_$ResourcePaginationImpl _$$ResourcePaginationImplFromJson(Map json) =>
    $checkedCreate(r'_$ResourcePaginationImpl', json, ($checkedConvert) {
      final val = _$ResourcePaginationImpl(
        page: $checkedConvert('page', (v) => (v as num).toInt()),
        limit: $checkedConvert('limit', (v) => (v as num).toInt()),
        total: $checkedConvert('total', (v) => (v as num).toInt()),
        pages: $checkedConvert('pages', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$$ResourcePaginationImplToJson(
  _$ResourcePaginationImpl instance,
) => <String, dynamic>{
  'page': instance.page,
  'limit': instance.limit,
  'total': instance.total,
  'pages': instance.pages,
};
