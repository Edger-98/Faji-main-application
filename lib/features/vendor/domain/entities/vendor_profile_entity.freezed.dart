// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VendorProfileEntity _$VendorProfileEntityFromJson(Map<String, dynamic> json) {
  return _VendorProfileEntity.fromJson(json);
}

/// @nodoc
mixin _$VendorProfileEntity {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get businessName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  List<String>? get portfolioImages => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get totalBookings => throw _privateConstructorUsedError;
  int get completedBookings => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String businessName,
      String description,
      List<String> categories,
      String? profilePhoto,
      List<String>? portfolioImages,
      double rating,
      int totalBookings,
      int completedBookings,
      bool isActive,
      bool isVerified,
      DateTime? createdAt,
      DateTime? updatedAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String userId,
      String businessName,
      String description,
      List<String> categories,
      String? profilePhoto,
      List<String>? portfolioImages,
      double rating,
      int totalBookings,
      int completedBookings,
      bool isActive,
      bool isVerified,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String businessName,
      String description,
      List<String> categories,
      String? profilePhoto,
      List<String>? portfolioImages,
      double rating,
      int totalBookings,
      int completedBookings,
      bool isActive,
      bool isVerified,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorProfileEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorProfileEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorProfileEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorProfileEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorProfileEntityCopyWith<VendorProfileEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorProfileEntityCopyWith<$Res> {
  factory $VendorProfileEntityCopyWith(
    VendorProfileEntity value,
    $Res Function(VendorProfileEntity) then,
  ) = _$VendorProfileEntityCopyWithImpl<$Res, VendorProfileEntity>;
  @useResult
  $Res call({
    String id,
    String userId,
    String businessName,
    String description,
    List<String> categories,
    String? profilePhoto,
    List<String>? portfolioImages,
    double rating,
    int totalBookings,
    int completedBookings,
    bool isActive,
    bool isVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$VendorProfileEntityCopyWithImpl<$Res, $Val extends VendorProfileEntity>
    implements $VendorProfileEntityCopyWith<$Res> {
  _$VendorProfileEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? businessName = null,
    Object? description = null,
    Object? categories = null,
    Object? profilePhoto = freezed,
    Object? portfolioImages = freezed,
    Object? rating = null,
    Object? totalBookings = null,
    Object? completedBookings = null,
    Object? isActive = null,
    Object? isVerified = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
            businessName: null == businessName
                ? _value.businessName
                : businessName // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            profilePhoto: freezed == profilePhoto
                ? _value.profilePhoto
                : profilePhoto // ignore: cast_nullable_to_non_nullable
                      as String?,
            portfolioImages: freezed == portfolioImages
                ? _value.portfolioImages
                : portfolioImages // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            totalBookings: null == totalBookings
                ? _value.totalBookings
                : totalBookings // ignore: cast_nullable_to_non_nullable
                      as int,
            completedBookings: null == completedBookings
                ? _value.completedBookings
                : completedBookings // ignore: cast_nullable_to_non_nullable
                      as int,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            isVerified: null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VendorProfileEntityImplCopyWith<$Res>
    implements $VendorProfileEntityCopyWith<$Res> {
  factory _$$VendorProfileEntityImplCopyWith(
    _$VendorProfileEntityImpl value,
    $Res Function(_$VendorProfileEntityImpl) then,
  ) = __$$VendorProfileEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String businessName,
    String description,
    List<String> categories,
    String? profilePhoto,
    List<String>? portfolioImages,
    double rating,
    int totalBookings,
    int completedBookings,
    bool isActive,
    bool isVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$VendorProfileEntityImplCopyWithImpl<$Res>
    extends _$VendorProfileEntityCopyWithImpl<$Res, _$VendorProfileEntityImpl>
    implements _$$VendorProfileEntityImplCopyWith<$Res> {
  __$$VendorProfileEntityImplCopyWithImpl(
    _$VendorProfileEntityImpl _value,
    $Res Function(_$VendorProfileEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? businessName = null,
    Object? description = null,
    Object? categories = null,
    Object? profilePhoto = freezed,
    Object? portfolioImages = freezed,
    Object? rating = null,
    Object? totalBookings = null,
    Object? completedBookings = null,
    Object? isActive = null,
    Object? isVerified = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$VendorProfileEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        businessName: null == businessName
            ? _value.businessName
            : businessName // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        profilePhoto: freezed == profilePhoto
            ? _value.profilePhoto
            : profilePhoto // ignore: cast_nullable_to_non_nullable
                  as String?,
        portfolioImages: freezed == portfolioImages
            ? _value._portfolioImages
            : portfolioImages // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        totalBookings: null == totalBookings
            ? _value.totalBookings
            : totalBookings // ignore: cast_nullable_to_non_nullable
                  as int,
        completedBookings: null == completedBookings
            ? _value.completedBookings
            : completedBookings // ignore: cast_nullable_to_non_nullable
                  as int,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        isVerified: null == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorProfileEntityImpl implements _VendorProfileEntity {
  const _$VendorProfileEntityImpl({
    required this.id,
    required this.userId,
    required this.businessName,
    required this.description,
    required final List<String> categories,
    this.profilePhoto,
    final List<String>? portfolioImages,
    this.rating = 0.0,
    this.totalBookings = 0,
    this.completedBookings = 0,
    this.isActive = true,
    this.isVerified = false,
    this.createdAt,
    this.updatedAt,
  }) : _categories = categories,
       _portfolioImages = portfolioImages;

  factory _$VendorProfileEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorProfileEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String businessName;
  @override
  final String description;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String? profilePhoto;
  final List<String>? _portfolioImages;
  @override
  List<String>? get portfolioImages {
    final value = _portfolioImages;
    if (value == null) return null;
    if (_portfolioImages is EqualUnmodifiableListView) return _portfolioImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final int totalBookings;
  @override
  @JsonKey()
  final int completedBookings;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'VendorProfileEntity(id: $id, userId: $userId, businessName: $businessName, description: $description, categories: $categories, profilePhoto: $profilePhoto, portfolioImages: $portfolioImages, rating: $rating, totalBookings: $totalBookings, completedBookings: $completedBookings, isActive: $isActive, isVerified: $isVerified, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorProfileEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            const DeepCollectionEquality().equals(
              other._portfolioImages,
              _portfolioImages,
            ) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.totalBookings, totalBookings) ||
                other.totalBookings == totalBookings) &&
            (identical(other.completedBookings, completedBookings) ||
                other.completedBookings == completedBookings) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    businessName,
    description,
    const DeepCollectionEquality().hash(_categories),
    profilePhoto,
    const DeepCollectionEquality().hash(_portfolioImages),
    rating,
    totalBookings,
    completedBookings,
    isActive,
    isVerified,
    createdAt,
    updatedAt,
  );

  /// Create a copy of VendorProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorProfileEntityImplCopyWith<_$VendorProfileEntityImpl> get copyWith =>
      __$$VendorProfileEntityImplCopyWithImpl<_$VendorProfileEntityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String businessName,
      String description,
      List<String> categories,
      String? profilePhoto,
      List<String>? portfolioImages,
      double rating,
      int totalBookings,
      int completedBookings,
      bool isActive,
      bool isVerified,
      DateTime? createdAt,
      DateTime? updatedAt,
    )
    $default,
  ) {
    return $default(
      id,
      userId,
      businessName,
      description,
      categories,
      profilePhoto,
      portfolioImages,
      rating,
      totalBookings,
      completedBookings,
      isActive,
      isVerified,
      createdAt,
      updatedAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String userId,
      String businessName,
      String description,
      List<String> categories,
      String? profilePhoto,
      List<String>? portfolioImages,
      double rating,
      int totalBookings,
      int completedBookings,
      bool isActive,
      bool isVerified,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      userId,
      businessName,
      description,
      categories,
      profilePhoto,
      portfolioImages,
      rating,
      totalBookings,
      completedBookings,
      isActive,
      isVerified,
      createdAt,
      updatedAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String businessName,
      String description,
      List<String> categories,
      String? profilePhoto,
      List<String>? portfolioImages,
      double rating,
      int totalBookings,
      int completedBookings,
      bool isActive,
      bool isVerified,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        userId,
        businessName,
        description,
        categories,
        profilePhoto,
        portfolioImages,
        rating,
        totalBookings,
        completedBookings,
        isActive,
        isVerified,
        createdAt,
        updatedAt,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorProfileEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorProfileEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorProfileEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorProfileEntityImplToJson(this);
  }
}

abstract class _VendorProfileEntity implements VendorProfileEntity {
  const factory _VendorProfileEntity({
    required final String id,
    required final String userId,
    required final String businessName,
    required final String description,
    required final List<String> categories,
    final String? profilePhoto,
    final List<String>? portfolioImages,
    final double rating,
    final int totalBookings,
    final int completedBookings,
    final bool isActive,
    final bool isVerified,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$VendorProfileEntityImpl;

  factory _VendorProfileEntity.fromJson(Map<String, dynamic> json) =
      _$VendorProfileEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get businessName;
  @override
  String get description;
  @override
  List<String> get categories;
  @override
  String? get profilePhoto;
  @override
  List<String>? get portfolioImages;
  @override
  double get rating;
  @override
  int get totalBookings;
  @override
  int get completedBookings;
  @override
  bool get isActive;
  @override
  bool get isVerified;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of VendorProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorProfileEntityImplCopyWith<_$VendorProfileEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
