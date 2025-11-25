// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cohost_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CohostProfileEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String get profilePhoto => throw _privateConstructorUsedError;
  List<ResourceCategory> get categories => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get eventsCompleted => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  List<String>? get portfolio => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get responseTime => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String bio,
      String profilePhoto,
      List<ResourceCategory> categories,
      double rating,
      int eventsCompleted,
      bool isVerified,
      List<String>? portfolio,
      String? location,
      String? responseTime,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String bio,
      String profilePhoto,
      List<ResourceCategory> categories,
      double rating,
      int eventsCompleted,
      bool isVerified,
      List<String>? portfolio,
      String? location,
      String? responseTime,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String bio,
      String profilePhoto,
      List<ResourceCategory> categories,
      double rating,
      int eventsCompleted,
      bool isVerified,
      List<String>? portfolio,
      String? location,
      String? responseTime,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostProfileEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostProfileEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostProfileEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of CohostProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CohostProfileEntityCopyWith<CohostProfileEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CohostProfileEntityCopyWith<$Res> {
  factory $CohostProfileEntityCopyWith(
    CohostProfileEntity value,
    $Res Function(CohostProfileEntity) then,
  ) = _$CohostProfileEntityCopyWithImpl<$Res, CohostProfileEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    String bio,
    String profilePhoto,
    List<ResourceCategory> categories,
    double rating,
    int eventsCompleted,
    bool isVerified,
    List<String>? portfolio,
    String? location,
    String? responseTime,
  });
}

/// @nodoc
class _$CohostProfileEntityCopyWithImpl<$Res, $Val extends CohostProfileEntity>
    implements $CohostProfileEntityCopyWith<$Res> {
  _$CohostProfileEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CohostProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? bio = null,
    Object? profilePhoto = null,
    Object? categories = null,
    Object? rating = null,
    Object? eventsCompleted = null,
    Object? isVerified = null,
    Object? portfolio = freezed,
    Object? location = freezed,
    Object? responseTime = freezed,
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
            profilePhoto: null == profilePhoto
                ? _value.profilePhoto
                : profilePhoto // ignore: cast_nullable_to_non_nullable
                      as String,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<ResourceCategory>,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            eventsCompleted: null == eventsCompleted
                ? _value.eventsCompleted
                : eventsCompleted // ignore: cast_nullable_to_non_nullable
                      as int,
            isVerified: null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            portfolio: freezed == portfolio
                ? _value.portfolio
                : portfolio // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            responseTime: freezed == responseTime
                ? _value.responseTime
                : responseTime // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CohostProfileEntityImplCopyWith<$Res>
    implements $CohostProfileEntityCopyWith<$Res> {
  factory _$$CohostProfileEntityImplCopyWith(
    _$CohostProfileEntityImpl value,
    $Res Function(_$CohostProfileEntityImpl) then,
  ) = __$$CohostProfileEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String bio,
    String profilePhoto,
    List<ResourceCategory> categories,
    double rating,
    int eventsCompleted,
    bool isVerified,
    List<String>? portfolio,
    String? location,
    String? responseTime,
  });
}

/// @nodoc
class __$$CohostProfileEntityImplCopyWithImpl<$Res>
    extends _$CohostProfileEntityCopyWithImpl<$Res, _$CohostProfileEntityImpl>
    implements _$$CohostProfileEntityImplCopyWith<$Res> {
  __$$CohostProfileEntityImplCopyWithImpl(
    _$CohostProfileEntityImpl _value,
    $Res Function(_$CohostProfileEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CohostProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? bio = null,
    Object? profilePhoto = null,
    Object? categories = null,
    Object? rating = null,
    Object? eventsCompleted = null,
    Object? isVerified = null,
    Object? portfolio = freezed,
    Object? location = freezed,
    Object? responseTime = freezed,
  }) {
    return _then(
      _$CohostProfileEntityImpl(
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
        profilePhoto: null == profilePhoto
            ? _value.profilePhoto
            : profilePhoto // ignore: cast_nullable_to_non_nullable
                  as String,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<ResourceCategory>,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        eventsCompleted: null == eventsCompleted
            ? _value.eventsCompleted
            : eventsCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        isVerified: null == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        portfolio: freezed == portfolio
            ? _value._portfolio
            : portfolio // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        responseTime: freezed == responseTime
            ? _value.responseTime
            : responseTime // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CohostProfileEntityImpl implements _CohostProfileEntity {
  const _$CohostProfileEntityImpl({
    required this.id,
    required this.name,
    required this.bio,
    required this.profilePhoto,
    required final List<ResourceCategory> categories,
    required this.rating,
    required this.eventsCompleted,
    required this.isVerified,
    final List<String>? portfolio,
    this.location,
    this.responseTime,
  }) : _categories = categories,
       _portfolio = portfolio;

  @override
  final String id;
  @override
  final String name;
  @override
  final String bio;
  @override
  final String profilePhoto;
  final List<ResourceCategory> _categories;
  @override
  List<ResourceCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final double rating;
  @override
  final int eventsCompleted;
  @override
  final bool isVerified;
  final List<String>? _portfolio;
  @override
  List<String>? get portfolio {
    final value = _portfolio;
    if (value == null) return null;
    if (_portfolio is EqualUnmodifiableListView) return _portfolio;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? location;
  @override
  final String? responseTime;

  @override
  String toString() {
    return 'CohostProfileEntity(id: $id, name: $name, bio: $bio, profilePhoto: $profilePhoto, categories: $categories, rating: $rating, eventsCompleted: $eventsCompleted, isVerified: $isVerified, portfolio: $portfolio, location: $location, responseTime: $responseTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CohostProfileEntityImpl &&
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
            (identical(other.eventsCompleted, eventsCompleted) ||
                other.eventsCompleted == eventsCompleted) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            const DeepCollectionEquality().equals(
              other._portfolio,
              _portfolio,
            ) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.responseTime, responseTime) ||
                other.responseTime == responseTime));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    bio,
    profilePhoto,
    const DeepCollectionEquality().hash(_categories),
    rating,
    eventsCompleted,
    isVerified,
    const DeepCollectionEquality().hash(_portfolio),
    location,
    responseTime,
  );

  /// Create a copy of CohostProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CohostProfileEntityImplCopyWith<_$CohostProfileEntityImpl> get copyWith =>
      __$$CohostProfileEntityImplCopyWithImpl<_$CohostProfileEntityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String bio,
      String profilePhoto,
      List<ResourceCategory> categories,
      double rating,
      int eventsCompleted,
      bool isVerified,
      List<String>? portfolio,
      String? location,
      String? responseTime,
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
      eventsCompleted,
      isVerified,
      portfolio,
      location,
      responseTime,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String bio,
      String profilePhoto,
      List<ResourceCategory> categories,
      double rating,
      int eventsCompleted,
      bool isVerified,
      List<String>? portfolio,
      String? location,
      String? responseTime,
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
      eventsCompleted,
      isVerified,
      portfolio,
      location,
      responseTime,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String bio,
      String profilePhoto,
      List<ResourceCategory> categories,
      double rating,
      int eventsCompleted,
      bool isVerified,
      List<String>? portfolio,
      String? location,
      String? responseTime,
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
        eventsCompleted,
        isVerified,
        portfolio,
        location,
        responseTime,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostProfileEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostProfileEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostProfileEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _CohostProfileEntity implements CohostProfileEntity {
  const factory _CohostProfileEntity({
    required final String id,
    required final String name,
    required final String bio,
    required final String profilePhoto,
    required final List<ResourceCategory> categories,
    required final double rating,
    required final int eventsCompleted,
    required final bool isVerified,
    final List<String>? portfolio,
    final String? location,
    final String? responseTime,
  }) = _$CohostProfileEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get bio;
  @override
  String get profilePhoto;
  @override
  List<ResourceCategory> get categories;
  @override
  double get rating;
  @override
  int get eventsCompleted;
  @override
  bool get isVerified;
  @override
  List<String>? get portfolio;
  @override
  String? get location;
  @override
  String? get responseTime;

  /// Create a copy of CohostProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CohostProfileEntityImplCopyWith<_$CohostProfileEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
