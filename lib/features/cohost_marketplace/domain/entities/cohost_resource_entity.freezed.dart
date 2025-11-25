// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cohost_resource_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CohostResourceEntity {
  String get id => throw _privateConstructorUsedError;
  String get cohostId => throw _privateConstructorUsedError;
  String get cohostName => throw _privateConstructorUsedError;
  ResourceCategory get category => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get photos => throw _privateConstructorUsedError;
  double get basePrice => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  int? get eventsCompleted => throw _privateConstructorUsedError;
  bool? get isVerified => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String cohostId,
      String cohostName,
      ResourceCategory category,
      String title,
      String description,
      List<String> photos,
      double basePrice,
      bool isAvailable,
      double rating,
      int reviewCount,
      String? profilePhoto,
      int? eventsCompleted,
      bool? isVerified,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String cohostId,
      String cohostName,
      ResourceCategory category,
      String title,
      String description,
      List<String> photos,
      double basePrice,
      bool isAvailable,
      double rating,
      int reviewCount,
      String? profilePhoto,
      int? eventsCompleted,
      bool? isVerified,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String cohostId,
      String cohostName,
      ResourceCategory category,
      String title,
      String description,
      List<String> photos,
      double basePrice,
      bool isAvailable,
      double rating,
      int reviewCount,
      String? profilePhoto,
      int? eventsCompleted,
      bool? isVerified,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostResourceEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostResourceEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostResourceEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of CohostResourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CohostResourceEntityCopyWith<CohostResourceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CohostResourceEntityCopyWith<$Res> {
  factory $CohostResourceEntityCopyWith(
    CohostResourceEntity value,
    $Res Function(CohostResourceEntity) then,
  ) = _$CohostResourceEntityCopyWithImpl<$Res, CohostResourceEntity>;
  @useResult
  $Res call({
    String id,
    String cohostId,
    String cohostName,
    ResourceCategory category,
    String title,
    String description,
    List<String> photos,
    double basePrice,
    bool isAvailable,
    double rating,
    int reviewCount,
    String? profilePhoto,
    int? eventsCompleted,
    bool? isVerified,
  });
}

/// @nodoc
class _$CohostResourceEntityCopyWithImpl<
  $Res,
  $Val extends CohostResourceEntity
>
    implements $CohostResourceEntityCopyWith<$Res> {
  _$CohostResourceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CohostResourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cohostId = null,
    Object? cohostName = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? photos = null,
    Object? basePrice = null,
    Object? isAvailable = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? profilePhoto = freezed,
    Object? eventsCompleted = freezed,
    Object? isVerified = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            cohostId: null == cohostId
                ? _value.cohostId
                : cohostId // ignore: cast_nullable_to_non_nullable
                      as String,
            cohostName: null == cohostName
                ? _value.cohostName
                : cohostName // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as ResourceCategory,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            photos: null == photos
                ? _value.photos
                : photos // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            basePrice: null == basePrice
                ? _value.basePrice
                : basePrice // ignore: cast_nullable_to_non_nullable
                      as double,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            reviewCount: null == reviewCount
                ? _value.reviewCount
                : reviewCount // ignore: cast_nullable_to_non_nullable
                      as int,
            profilePhoto: freezed == profilePhoto
                ? _value.profilePhoto
                : profilePhoto // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventsCompleted: freezed == eventsCompleted
                ? _value.eventsCompleted
                : eventsCompleted // ignore: cast_nullable_to_non_nullable
                      as int?,
            isVerified: freezed == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CohostResourceEntityImplCopyWith<$Res>
    implements $CohostResourceEntityCopyWith<$Res> {
  factory _$$CohostResourceEntityImplCopyWith(
    _$CohostResourceEntityImpl value,
    $Res Function(_$CohostResourceEntityImpl) then,
  ) = __$$CohostResourceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String cohostId,
    String cohostName,
    ResourceCategory category,
    String title,
    String description,
    List<String> photos,
    double basePrice,
    bool isAvailable,
    double rating,
    int reviewCount,
    String? profilePhoto,
    int? eventsCompleted,
    bool? isVerified,
  });
}

/// @nodoc
class __$$CohostResourceEntityImplCopyWithImpl<$Res>
    extends _$CohostResourceEntityCopyWithImpl<$Res, _$CohostResourceEntityImpl>
    implements _$$CohostResourceEntityImplCopyWith<$Res> {
  __$$CohostResourceEntityImplCopyWithImpl(
    _$CohostResourceEntityImpl _value,
    $Res Function(_$CohostResourceEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CohostResourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cohostId = null,
    Object? cohostName = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? photos = null,
    Object? basePrice = null,
    Object? isAvailable = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? profilePhoto = freezed,
    Object? eventsCompleted = freezed,
    Object? isVerified = freezed,
  }) {
    return _then(
      _$CohostResourceEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        cohostId: null == cohostId
            ? _value.cohostId
            : cohostId // ignore: cast_nullable_to_non_nullable
                  as String,
        cohostName: null == cohostName
            ? _value.cohostName
            : cohostName // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as ResourceCategory,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        photos: null == photos
            ? _value._photos
            : photos // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        basePrice: null == basePrice
            ? _value.basePrice
            : basePrice // ignore: cast_nullable_to_non_nullable
                  as double,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        reviewCount: null == reviewCount
            ? _value.reviewCount
            : reviewCount // ignore: cast_nullable_to_non_nullable
                  as int,
        profilePhoto: freezed == profilePhoto
            ? _value.profilePhoto
            : profilePhoto // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventsCompleted: freezed == eventsCompleted
            ? _value.eventsCompleted
            : eventsCompleted // ignore: cast_nullable_to_non_nullable
                  as int?,
        isVerified: freezed == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc

class _$CohostResourceEntityImpl implements _CohostResourceEntity {
  const _$CohostResourceEntityImpl({
    required this.id,
    required this.cohostId,
    required this.cohostName,
    required this.category,
    required this.title,
    required this.description,
    required final List<String> photos,
    required this.basePrice,
    required this.isAvailable,
    required this.rating,
    required this.reviewCount,
    this.profilePhoto,
    this.eventsCompleted,
    this.isVerified,
  }) : _photos = photos;

  @override
  final String id;
  @override
  final String cohostId;
  @override
  final String cohostName;
  @override
  final ResourceCategory category;
  @override
  final String title;
  @override
  final String description;
  final List<String> _photos;
  @override
  List<String> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  final double basePrice;
  @override
  final bool isAvailable;
  @override
  final double rating;
  @override
  final int reviewCount;
  @override
  final String? profilePhoto;
  @override
  final int? eventsCompleted;
  @override
  final bool? isVerified;

  @override
  String toString() {
    return 'CohostResourceEntity(id: $id, cohostId: $cohostId, cohostName: $cohostName, category: $category, title: $title, description: $description, photos: $photos, basePrice: $basePrice, isAvailable: $isAvailable, rating: $rating, reviewCount: $reviewCount, profilePhoto: $profilePhoto, eventsCompleted: $eventsCompleted, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CohostResourceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cohostId, cohostId) ||
                other.cohostId == cohostId) &&
            (identical(other.cohostName, cohostName) ||
                other.cohostName == cohostName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.eventsCompleted, eventsCompleted) ||
                other.eventsCompleted == eventsCompleted) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    cohostId,
    cohostName,
    category,
    title,
    description,
    const DeepCollectionEquality().hash(_photos),
    basePrice,
    isAvailable,
    rating,
    reviewCount,
    profilePhoto,
    eventsCompleted,
    isVerified,
  );

  /// Create a copy of CohostResourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CohostResourceEntityImplCopyWith<_$CohostResourceEntityImpl>
  get copyWith =>
      __$$CohostResourceEntityImplCopyWithImpl<_$CohostResourceEntityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String cohostId,
      String cohostName,
      ResourceCategory category,
      String title,
      String description,
      List<String> photos,
      double basePrice,
      bool isAvailable,
      double rating,
      int reviewCount,
      String? profilePhoto,
      int? eventsCompleted,
      bool? isVerified,
    )
    $default,
  ) {
    return $default(
      id,
      cohostId,
      cohostName,
      category,
      title,
      description,
      photos,
      basePrice,
      isAvailable,
      rating,
      reviewCount,
      profilePhoto,
      eventsCompleted,
      isVerified,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String cohostId,
      String cohostName,
      ResourceCategory category,
      String title,
      String description,
      List<String> photos,
      double basePrice,
      bool isAvailable,
      double rating,
      int reviewCount,
      String? profilePhoto,
      int? eventsCompleted,
      bool? isVerified,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      cohostId,
      cohostName,
      category,
      title,
      description,
      photos,
      basePrice,
      isAvailable,
      rating,
      reviewCount,
      profilePhoto,
      eventsCompleted,
      isVerified,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String cohostId,
      String cohostName,
      ResourceCategory category,
      String title,
      String description,
      List<String> photos,
      double basePrice,
      bool isAvailable,
      double rating,
      int reviewCount,
      String? profilePhoto,
      int? eventsCompleted,
      bool? isVerified,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        cohostId,
        cohostName,
        category,
        title,
        description,
        photos,
        basePrice,
        isAvailable,
        rating,
        reviewCount,
        profilePhoto,
        eventsCompleted,
        isVerified,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostResourceEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostResourceEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostResourceEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _CohostResourceEntity implements CohostResourceEntity {
  const factory _CohostResourceEntity({
    required final String id,
    required final String cohostId,
    required final String cohostName,
    required final ResourceCategory category,
    required final String title,
    required final String description,
    required final List<String> photos,
    required final double basePrice,
    required final bool isAvailable,
    required final double rating,
    required final int reviewCount,
    final String? profilePhoto,
    final int? eventsCompleted,
    final bool? isVerified,
  }) = _$CohostResourceEntityImpl;

  @override
  String get id;
  @override
  String get cohostId;
  @override
  String get cohostName;
  @override
  ResourceCategory get category;
  @override
  String get title;
  @override
  String get description;
  @override
  List<String> get photos;
  @override
  double get basePrice;
  @override
  bool get isAvailable;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  String? get profilePhoto;
  @override
  int? get eventsCompleted;
  @override
  bool? get isVerified;

  /// Create a copy of CohostResourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CohostResourceEntityImplCopyWith<_$CohostResourceEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}
