// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorProfileImpl _$$VendorProfileImplFromJson(Map json) => $checkedCreate(
  r'_$VendorProfileImpl',
  json,
  ($checkedConvert) {
    final val = _$VendorProfileImpl(
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      bio: $checkedConvert('bio', (v) => v as String),
      categories: $checkedConvert(
        'categories',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      rating: $checkedConvert('rating', (v) => (v as num).toDouble()),
      reviewCount: $checkedConvert('reviewCount', (v) => (v as num).toInt()),
      eventsCompleted: $checkedConvert(
        'eventsCompleted',
        (v) => (v as num).toInt(),
      ),
      isVerified: $checkedConvert('isVerified', (v) => v as bool),
      responseTime: $checkedConvert('responseTime', (v) => v as String),
      location: $checkedConvert('location', (v) => v as String),
      portfolio: $checkedConvert(
        'portfolio',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      resources: $checkedConvert(
        'resources',
        (v) => (v as List<dynamic>)
            .map(
              (e) =>
                  VendorResource.fromJson(Map<String, dynamic>.from(e as Map)),
            )
            .toList(),
      ),
      reviews: $checkedConvert(
        'reviews',
        (v) => (v as List<dynamic>)
            .map(
              (e) => VendorReview.fromJson(Map<String, dynamic>.from(e as Map)),
            )
            .toList(),
      ),
      profilePhoto: $checkedConvert('profilePhoto', (v) => v as String?),
    );
    return val;
  },
);

Map<String, dynamic> _$$VendorProfileImplToJson(_$VendorProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'categories': instance.categories,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'eventsCompleted': instance.eventsCompleted,
      'isVerified': instance.isVerified,
      'responseTime': instance.responseTime,
      'location': instance.location,
      'portfolio': instance.portfolio,
      'resources': instance.resources.map((e) => e.toJson()).toList(),
      'reviews': instance.reviews.map((e) => e.toJson()).toList(),
      if (instance.profilePhoto case final value?) 'profilePhoto': value,
    };

_$VendorResourceImpl _$$VendorResourceImplFromJson(Map json) =>
    $checkedCreate(r'_$VendorResourceImpl', json, ($checkedConvert) {
      final val = _$VendorResourceImpl(
        id: $checkedConvert('id', (v) => v as String),
        title: $checkedConvert('title', (v) => v as String),
        basePrice: $checkedConvert('basePrice', (v) => (v as num).toDouble()),
        isAvailable: $checkedConvert('isAvailable', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$$VendorResourceImplToJson(
  _$VendorResourceImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'basePrice': instance.basePrice,
  'isAvailable': instance.isAvailable,
};

_$VendorReviewImpl _$$VendorReviewImplFromJson(Map json) =>
    $checkedCreate(r'_$VendorReviewImpl', json, ($checkedConvert) {
      final val = _$VendorReviewImpl(
        id: $checkedConvert('id', (v) => v as String),
        userId: $checkedConvert('userId', (v) => v as String),
        userName: $checkedConvert('userName', (v) => v as String),
        rating: $checkedConvert('rating', (v) => (v as num).toDouble()),
        comment: $checkedConvert('comment', (v) => v as String),
        eventDate: $checkedConvert('eventDate', (v) => v as String),
        createdAt: $checkedConvert('createdAt', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$VendorReviewImplToJson(_$VendorReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'rating': instance.rating,
      'comment': instance.comment,
      'eventDate': instance.eventDate,
      'createdAt': instance.createdAt,
    };
