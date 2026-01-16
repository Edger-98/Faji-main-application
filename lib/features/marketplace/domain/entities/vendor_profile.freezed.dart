// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VendorProfile _$VendorProfileFromJson(Map<String, dynamic> json) {
  return _VendorProfile.fromJson(json);
}

/// @nodoc
mixin _$VendorProfile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  int get eventsCompleted => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  String get responseTime => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  List<String> get portfolio => throw _privateConstructorUsedError;
  List<VendorResource> get resources => throw _privateConstructorUsedError;
  List<VendorReview> get reviews => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String bio,
      String? profilePhoto,
      List<String> categories,
      double rating,
      int reviewCount,
      int eventsCompleted,
      bool isVerified,
      String responseTime,
      String location,
      List<String> portfolio,
      List<VendorResource> resources,
      List<VendorReview> reviews,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String bio,
      String? profilePhoto,
      List<String> categories,
      double rating,
      int reviewCount,
      int eventsCompleted,
      bool isVerified,
      String responseTime,
      String location,
      List<String> portfolio,
      List<VendorResource> resources,
      List<VendorReview> reviews,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String bio,
      String? profilePhoto,
      List<String> categories,
      double rating,
      int reviewCount,
      int eventsCompleted,
      bool isVerified,
      String responseTime,
      String location,
      List<String> portfolio,
      List<VendorResource> resources,
      List<VendorReview> reviews,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorProfile value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorProfile value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorProfile value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorProfileCopyWith<VendorProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorProfileCopyWith<$Res> {
  factory $VendorProfileCopyWith(
    VendorProfile value,
    $Res Function(VendorProfile) then,
  ) = _$VendorProfileCopyWithImpl<$Res, VendorProfile>;
  @useResult
  $Res call({
    String id,
    String name,
    String bio,
    String? profilePhoto,
    List<String> categories,
    double rating,
    int reviewCount,
    int eventsCompleted,
    bool isVerified,
    String responseTime,
    String location,
    List<String> portfolio,
    List<VendorResource> resources,
    List<VendorReview> reviews,
  });
}

/// @nodoc
class _$VendorProfileCopyWithImpl<$Res, $Val extends VendorProfile>
    implements $VendorProfileCopyWith<$Res> {
  _$VendorProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? bio = null,
    Object? profilePhoto = freezed,
    Object? categories = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? eventsCompleted = null,
    Object? isVerified = null,
    Object? responseTime = null,
    Object? location = null,
    Object? portfolio = null,
    Object? resources = null,
    Object? reviews = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            bio: null == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String,
            profilePhoto: freezed == profilePhoto
                ? _value.profilePhoto
                : profilePhoto // ignore: cast_nullable_to_non_nullable
                      as String?,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            reviewCount: null == reviewCount
                ? _value.reviewCount
                : reviewCount // ignore: cast_nullable_to_non_nullable
                      as int,
            eventsCompleted: null == eventsCompleted
                ? _value.eventsCompleted
                : eventsCompleted // ignore: cast_nullable_to_non_nullable
                      as int,
            isVerified: null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            responseTime: null == responseTime
                ? _value.responseTime
                : responseTime // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            portfolio: null == portfolio
                ? _value.portfolio
                : portfolio // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            resources: null == resources
                ? _value.resources
                : resources // ignore: cast_nullable_to_non_nullable
                      as List<VendorResource>,
            reviews: null == reviews
                ? _value.reviews
                : reviews // ignore: cast_nullable_to_non_nullable
                      as List<VendorReview>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VendorProfileImplCopyWith<$Res>
    implements $VendorProfileCopyWith<$Res> {
  factory _$$VendorProfileImplCopyWith(
    _$VendorProfileImpl value,
    $Res Function(_$VendorProfileImpl) then,
  ) = __$$VendorProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String bio,
    String? profilePhoto,
    List<String> categories,
    double rating,
    int reviewCount,
    int eventsCompleted,
    bool isVerified,
    String responseTime,
    String location,
    List<String> portfolio,
    List<VendorResource> resources,
    List<VendorReview> reviews,
  });
}

/// @nodoc
class __$$VendorProfileImplCopyWithImpl<$Res>
    extends _$VendorProfileCopyWithImpl<$Res, _$VendorProfileImpl>
    implements _$$VendorProfileImplCopyWith<$Res> {
  __$$VendorProfileImplCopyWithImpl(
    _$VendorProfileImpl _value,
    $Res Function(_$VendorProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? bio = null,
    Object? profilePhoto = freezed,
    Object? categories = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? eventsCompleted = null,
    Object? isVerified = null,
    Object? responseTime = null,
    Object? location = null,
    Object? portfolio = null,
    Object? resources = null,
    Object? reviews = null,
  }) {
    return _then(
      _$VendorProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        bio: null == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String,
        profilePhoto: freezed == profilePhoto
            ? _value.profilePhoto
            : profilePhoto // ignore: cast_nullable_to_non_nullable
                  as String?,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        reviewCount: null == reviewCount
            ? _value.reviewCount
            : reviewCount // ignore: cast_nullable_to_non_nullable
                  as int,
        eventsCompleted: null == eventsCompleted
            ? _value.eventsCompleted
            : eventsCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        isVerified: null == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        responseTime: null == responseTime
            ? _value.responseTime
            : responseTime // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        portfolio: null == portfolio
            ? _value._portfolio
            : portfolio // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        resources: null == resources
            ? _value._resources
            : resources // ignore: cast_nullable_to_non_nullable
                  as List<VendorResource>,
        reviews: null == reviews
            ? _value._reviews
            : reviews // ignore: cast_nullable_to_non_nullable
                  as List<VendorReview>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorProfileImpl implements _VendorProfile {
  const _$VendorProfileImpl({
    required this.id,
    required this.name,
    required this.bio,
    this.profilePhoto,
    required final List<String> categories,
    required this.rating,
    required this.reviewCount,
    required this.eventsCompleted,
    required this.isVerified,
    required this.responseTime,
    required this.location,
    required final List<String> portfolio,
    required final List<VendorResource> resources,
    required final List<VendorReview> reviews,
  }) : _categories = categories,
       _portfolio = portfolio,
       _resources = resources,
       _reviews = reviews;

  factory _$VendorProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String bio;
  @override
  final String? profilePhoto;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final double rating;
  @override
  final int reviewCount;
  @override
  final int eventsCompleted;
  @override
  final bool isVerified;
  @override
  final String responseTime;
  @override
  final String location;
  final List<String> _portfolio;
  @override
  List<String> get portfolio {
    if (_portfolio is EqualUnmodifiableListView) return _portfolio;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_portfolio);
  }

  final List<VendorResource> _resources;
  @override
  List<VendorResource> get resources {
    if (_resources is EqualUnmodifiableListView) return _resources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resources);
  }

  final List<VendorReview> _reviews;
  @override
  List<VendorReview> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  String toString() {
    return 'VendorProfile(id: $id, name: $name, bio: $bio, profilePhoto: $profilePhoto, categories: $categories, rating: $rating, reviewCount: $reviewCount, eventsCompleted: $eventsCompleted, isVerified: $isVerified, responseTime: $responseTime, location: $location, portfolio: $portfolio, resources: $resources, reviews: $reviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.eventsCompleted, eventsCompleted) ||
                other.eventsCompleted == eventsCompleted) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(
              other._portfolio,
              _portfolio,
            ) &&
            const DeepCollectionEquality().equals(
              other._resources,
              _resources,
            ) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    bio,
    profilePhoto,
    const DeepCollectionEquality().hash(_categories),
    rating,
    reviewCount,
    eventsCompleted,
    isVerified,
    responseTime,
    location,
    const DeepCollectionEquality().hash(_portfolio),
    const DeepCollectionEquality().hash(_resources),
    const DeepCollectionEquality().hash(_reviews),
  );

  /// Create a copy of VendorProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorProfileImplCopyWith<_$VendorProfileImpl> get copyWith =>
      __$$VendorProfileImplCopyWithImpl<_$VendorProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String bio,
      String? profilePhoto,
      List<String> categories,
      double rating,
      int reviewCount,
      int eventsCompleted,
      bool isVerified,
      String responseTime,
      String location,
      List<String> portfolio,
      List<VendorResource> resources,
      List<VendorReview> reviews,
    )
    $default,
  ) {
    return $default(
      id,
      name,
      bio,
      profilePhoto,
      categories,
      rating,
      reviewCount,
      eventsCompleted,
      isVerified,
      responseTime,
      location,
      portfolio,
      resources,
      reviews,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String bio,
      String? profilePhoto,
      List<String> categories,
      double rating,
      int reviewCount,
      int eventsCompleted,
      bool isVerified,
      String responseTime,
      String location,
      List<String> portfolio,
      List<VendorResource> resources,
      List<VendorReview> reviews,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      name,
      bio,
      profilePhoto,
      categories,
      rating,
      reviewCount,
      eventsCompleted,
      isVerified,
      responseTime,
      location,
      portfolio,
      resources,
      reviews,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String bio,
      String? profilePhoto,
      List<String> categories,
      double rating,
      int reviewCount,
      int eventsCompleted,
      bool isVerified,
      String responseTime,
      String location,
      List<String> portfolio,
      List<VendorResource> resources,
      List<VendorReview> reviews,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        name,
        bio,
        profilePhoto,
        categories,
        rating,
        reviewCount,
        eventsCompleted,
        isVerified,
        responseTime,
        location,
        portfolio,
        resources,
        reviews,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorProfile value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorProfile value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorProfile value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorProfileImplToJson(this);
  }
}

abstract class _VendorProfile implements VendorProfile {
  const factory _VendorProfile({
    required final String id,
    required final String name,
    required final String bio,
    final String? profilePhoto,
    required final List<String> categories,
    required final double rating,
    required final int reviewCount,
    required final int eventsCompleted,
    required final bool isVerified,
    required final String responseTime,
    required final String location,
    required final List<String> portfolio,
    required final List<VendorResource> resources,
    required final List<VendorReview> reviews,
  }) = _$VendorProfileImpl;

  factory _VendorProfile.fromJson(Map<String, dynamic> json) =
      _$VendorProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get bio;
  @override
  String? get profilePhoto;
  @override
  List<String> get categories;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  int get eventsCompleted;
  @override
  bool get isVerified;
  @override
  String get responseTime;
  @override
  String get location;
  @override
  List<String> get portfolio;
  @override
  List<VendorResource> get resources;
  @override
  List<VendorReview> get reviews;

  /// Create a copy of VendorProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorProfileImplCopyWith<_$VendorProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VendorResource _$VendorResourceFromJson(Map<String, dynamic> json) {
  return _VendorResource.fromJson(json);
}

/// @nodoc
mixin _$VendorResource {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get basePrice => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String title,
      double basePrice,
      bool isAvailable,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String title,
      double basePrice,
      bool isAvailable,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String title,
      double basePrice,
      bool isAvailable,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorResource value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorResource value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorResource value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorResource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorResourceCopyWith<VendorResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorResourceCopyWith<$Res> {
  factory $VendorResourceCopyWith(
    VendorResource value,
    $Res Function(VendorResource) then,
  ) = _$VendorResourceCopyWithImpl<$Res, VendorResource>;
  @useResult
  $Res call({String id, String title, double basePrice, bool isAvailable});
}

/// @nodoc
class _$VendorResourceCopyWithImpl<$Res, $Val extends VendorResource>
    implements $VendorResourceCopyWith<$Res> {
  _$VendorResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? basePrice = null,
    Object? isAvailable = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            basePrice: null == basePrice
                ? _value.basePrice
                : basePrice // ignore: cast_nullable_to_non_nullable
                      as double,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VendorResourceImplCopyWith<$Res>
    implements $VendorResourceCopyWith<$Res> {
  factory _$$VendorResourceImplCopyWith(
    _$VendorResourceImpl value,
    $Res Function(_$VendorResourceImpl) then,
  ) = __$$VendorResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, double basePrice, bool isAvailable});
}

/// @nodoc
class __$$VendorResourceImplCopyWithImpl<$Res>
    extends _$VendorResourceCopyWithImpl<$Res, _$VendorResourceImpl>
    implements _$$VendorResourceImplCopyWith<$Res> {
  __$$VendorResourceImplCopyWithImpl(
    _$VendorResourceImpl _value,
    $Res Function(_$VendorResourceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? basePrice = null,
    Object? isAvailable = null,
  }) {
    return _then(
      _$VendorResourceImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        basePrice: null == basePrice
            ? _value.basePrice
            : basePrice // ignore: cast_nullable_to_non_nullable
                  as double,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorResourceImpl implements _VendorResource {
  const _$VendorResourceImpl({
    required this.id,
    required this.title,
    required this.basePrice,
    required this.isAvailable,
  });

  factory _$VendorResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorResourceImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final double basePrice;
  @override
  final bool isAvailable;

  @override
  String toString() {
    return 'VendorResource(id: $id, title: $title, basePrice: $basePrice, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorResourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, basePrice, isAvailable);

  /// Create a copy of VendorResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorResourceImplCopyWith<_$VendorResourceImpl> get copyWith =>
      __$$VendorResourceImplCopyWithImpl<_$VendorResourceImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String title,
      double basePrice,
      bool isAvailable,
    )
    $default,
  ) {
    return $default(id, title, basePrice, isAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String title,
      double basePrice,
      bool isAvailable,
    )?
    $default,
  ) {
    return $default?.call(id, title, basePrice, isAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String title,
      double basePrice,
      bool isAvailable,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, title, basePrice, isAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorResource value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorResource value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorResource value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorResourceImplToJson(this);
  }
}

abstract class _VendorResource implements VendorResource {
  const factory _VendorResource({
    required final String id,
    required final String title,
    required final double basePrice,
    required final bool isAvailable,
  }) = _$VendorResourceImpl;

  factory _VendorResource.fromJson(Map<String, dynamic> json) =
      _$VendorResourceImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  double get basePrice;
  @override
  bool get isAvailable;

  /// Create a copy of VendorResource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorResourceImplCopyWith<_$VendorResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VendorReview _$VendorReviewFromJson(Map<String, dynamic> json) {
  return _VendorReview.fromJson(json);
}

/// @nodoc
mixin _$VendorReview {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get eventDate => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String userName,
      double rating,
      String comment,
      String eventDate,
      String createdAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String userId,
      String userName,
      double rating,
      String comment,
      String eventDate,
      String createdAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String userName,
      double rating,
      String comment,
      String eventDate,
      String createdAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorReview value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorReview value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorReview value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorReview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorReviewCopyWith<VendorReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorReviewCopyWith<$Res> {
  factory $VendorReviewCopyWith(
    VendorReview value,
    $Res Function(VendorReview) then,
  ) = _$VendorReviewCopyWithImpl<$Res, VendorReview>;
  @useResult
  $Res call({
    String id,
    String userId,
    String userName,
    double rating,
    String comment,
    String eventDate,
    String createdAt,
  });
}

/// @nodoc
class _$VendorReviewCopyWithImpl<$Res, $Val extends VendorReview>
    implements $VendorReviewCopyWith<$Res> {
  _$VendorReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? rating = null,
    Object? comment = null,
    Object? eventDate = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            userName: null == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                      as String,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            comment: null == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String,
            eventDate: null == eventDate
                ? _value.eventDate
                : eventDate // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VendorReviewImplCopyWith<$Res>
    implements $VendorReviewCopyWith<$Res> {
  factory _$$VendorReviewImplCopyWith(
    _$VendorReviewImpl value,
    $Res Function(_$VendorReviewImpl) then,
  ) = __$$VendorReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String userName,
    double rating,
    String comment,
    String eventDate,
    String createdAt,
  });
}

/// @nodoc
class __$$VendorReviewImplCopyWithImpl<$Res>
    extends _$VendorReviewCopyWithImpl<$Res, _$VendorReviewImpl>
    implements _$$VendorReviewImplCopyWith<$Res> {
  __$$VendorReviewImplCopyWithImpl(
    _$VendorReviewImpl _value,
    $Res Function(_$VendorReviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorReview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? rating = null,
    Object? comment = null,
    Object? eventDate = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$VendorReviewImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        userName: null == userName
            ? _value.userName
            : userName // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        comment: null == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String,
        eventDate: null == eventDate
            ? _value.eventDate
            : eventDate // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorReviewImpl implements _VendorReview {
  const _$VendorReviewImpl({
    required this.id,
    required this.userId,
    required this.userName,
    required this.rating,
    required this.comment,
    required this.eventDate,
    required this.createdAt,
  });

  factory _$VendorReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorReviewImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final double rating;
  @override
  final String comment;
  @override
  final String eventDate;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'VendorReview(id: $id, userId: $userId, userName: $userName, rating: $rating, comment: $comment, eventDate: $eventDate, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    userName,
    rating,
    comment,
    eventDate,
    createdAt,
  );

  /// Create a copy of VendorReview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorReviewImplCopyWith<_$VendorReviewImpl> get copyWith =>
      __$$VendorReviewImplCopyWithImpl<_$VendorReviewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String userName,
      double rating,
      String comment,
      String eventDate,
      String createdAt,
    )
    $default,
  ) {
    return $default(
      id,
      userId,
      userName,
      rating,
      comment,
      eventDate,
      createdAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String userId,
      String userName,
      double rating,
      String comment,
      String eventDate,
      String createdAt,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      userId,
      userName,
      rating,
      comment,
      eventDate,
      createdAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String userName,
      double rating,
      String comment,
      String eventDate,
      String createdAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        userId,
        userName,
        rating,
        comment,
        eventDate,
        createdAt,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorReview value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorReview value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorReview value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorReviewImplToJson(this);
  }
}

abstract class _VendorReview implements VendorReview {
  const factory _VendorReview({
    required final String id,
    required final String userId,
    required final String userName,
    required final double rating,
    required final String comment,
    required final String eventDate,
    required final String createdAt,
  }) = _$VendorReviewImpl;

  factory _VendorReview.fromJson(Map<String, dynamic> json) =
      _$VendorReviewImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get userName;
  @override
  double get rating;
  @override
  String get comment;
  @override
  String get eventDate;
  @override
  String get createdAt;

  /// Create a copy of VendorReview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorReviewImplCopyWith<_$VendorReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
