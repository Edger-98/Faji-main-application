// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_stats_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VendorStatsEntity _$VendorStatsEntityFromJson(Map<String, dynamic> json) {
  return _VendorStatsEntity.fromJson(json);
}

/// @nodoc
mixin _$VendorStatsEntity {
  int get totalBookings => throw _privateConstructorUsedError;
  double get totalEarnings => throw _privateConstructorUsedError;
  int get pendingRequests => throw _privateConstructorUsedError;
  int get activeResources => throw _privateConstructorUsedError;
  int get completedBookings => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int totalBookings,
      double totalEarnings,
      int pendingRequests,
      int activeResources,
      int completedBookings,
      double averageRating,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int totalBookings,
      double totalEarnings,
      int pendingRequests,
      int activeResources,
      int completedBookings,
      double averageRating,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int totalBookings,
      double totalEarnings,
      int pendingRequests,
      int activeResources,
      int completedBookings,
      double averageRating,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorStatsEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorStatsEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorStatsEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorStatsEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorStatsEntityCopyWith<VendorStatsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorStatsEntityCopyWith<$Res> {
  factory $VendorStatsEntityCopyWith(
    VendorStatsEntity value,
    $Res Function(VendorStatsEntity) then,
  ) = _$VendorStatsEntityCopyWithImpl<$Res, VendorStatsEntity>;
  @useResult
  $Res call({
    int totalBookings,
    double totalEarnings,
    int pendingRequests,
    int activeResources,
    int completedBookings,
    double averageRating,
  });
}

/// @nodoc
class _$VendorStatsEntityCopyWithImpl<$Res, $Val extends VendorStatsEntity>
    implements $VendorStatsEntityCopyWith<$Res> {
  _$VendorStatsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBookings = null,
    Object? totalEarnings = null,
    Object? pendingRequests = null,
    Object? activeResources = null,
    Object? completedBookings = null,
    Object? averageRating = null,
  }) {
    return _then(
      _value.copyWith(
            totalBookings: null == totalBookings
                ? _value.totalBookings
                : totalBookings // ignore: cast_nullable_to_non_nullable
                      as int,
            totalEarnings: null == totalEarnings
                ? _value.totalEarnings
                : totalEarnings // ignore: cast_nullable_to_non_nullable
                      as double,
            pendingRequests: null == pendingRequests
                ? _value.pendingRequests
                : pendingRequests // ignore: cast_nullable_to_non_nullable
                      as int,
            activeResources: null == activeResources
                ? _value.activeResources
                : activeResources // ignore: cast_nullable_to_non_nullable
                      as int,
            completedBookings: null == completedBookings
                ? _value.completedBookings
                : completedBookings // ignore: cast_nullable_to_non_nullable
                      as int,
            averageRating: null == averageRating
                ? _value.averageRating
                : averageRating // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VendorStatsEntityImplCopyWith<$Res>
    implements $VendorStatsEntityCopyWith<$Res> {
  factory _$$VendorStatsEntityImplCopyWith(
    _$VendorStatsEntityImpl value,
    $Res Function(_$VendorStatsEntityImpl) then,
  ) = __$$VendorStatsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalBookings,
    double totalEarnings,
    int pendingRequests,
    int activeResources,
    int completedBookings,
    double averageRating,
  });
}

/// @nodoc
class __$$VendorStatsEntityImplCopyWithImpl<$Res>
    extends _$VendorStatsEntityCopyWithImpl<$Res, _$VendorStatsEntityImpl>
    implements _$$VendorStatsEntityImplCopyWith<$Res> {
  __$$VendorStatsEntityImplCopyWithImpl(
    _$VendorStatsEntityImpl _value,
    $Res Function(_$VendorStatsEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBookings = null,
    Object? totalEarnings = null,
    Object? pendingRequests = null,
    Object? activeResources = null,
    Object? completedBookings = null,
    Object? averageRating = null,
  }) {
    return _then(
      _$VendorStatsEntityImpl(
        totalBookings: null == totalBookings
            ? _value.totalBookings
            : totalBookings // ignore: cast_nullable_to_non_nullable
                  as int,
        totalEarnings: null == totalEarnings
            ? _value.totalEarnings
            : totalEarnings // ignore: cast_nullable_to_non_nullable
                  as double,
        pendingRequests: null == pendingRequests
            ? _value.pendingRequests
            : pendingRequests // ignore: cast_nullable_to_non_nullable
                  as int,
        activeResources: null == activeResources
            ? _value.activeResources
            : activeResources // ignore: cast_nullable_to_non_nullable
                  as int,
        completedBookings: null == completedBookings
            ? _value.completedBookings
            : completedBookings // ignore: cast_nullable_to_non_nullable
                  as int,
        averageRating: null == averageRating
            ? _value.averageRating
            : averageRating // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorStatsEntityImpl implements _VendorStatsEntity {
  const _$VendorStatsEntityImpl({
    this.totalBookings = 0,
    this.totalEarnings = 0.0,
    this.pendingRequests = 0,
    this.activeResources = 0,
    this.completedBookings = 0,
    this.averageRating = 0.0,
  });

  factory _$VendorStatsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorStatsEntityImplFromJson(json);

  @override
  @JsonKey()
  final int totalBookings;
  @override
  @JsonKey()
  final double totalEarnings;
  @override
  @JsonKey()
  final int pendingRequests;
  @override
  @JsonKey()
  final int activeResources;
  @override
  @JsonKey()
  final int completedBookings;
  @override
  @JsonKey()
  final double averageRating;

  @override
  String toString() {
    return 'VendorStatsEntity(totalBookings: $totalBookings, totalEarnings: $totalEarnings, pendingRequests: $pendingRequests, activeResources: $activeResources, completedBookings: $completedBookings, averageRating: $averageRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorStatsEntityImpl &&
            (identical(other.totalBookings, totalBookings) ||
                other.totalBookings == totalBookings) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.pendingRequests, pendingRequests) ||
                other.pendingRequests == pendingRequests) &&
            (identical(other.activeResources, activeResources) ||
                other.activeResources == activeResources) &&
            (identical(other.completedBookings, completedBookings) ||
                other.completedBookings == completedBookings) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalBookings,
    totalEarnings,
    pendingRequests,
    activeResources,
    completedBookings,
    averageRating,
  );

  /// Create a copy of VendorStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorStatsEntityImplCopyWith<_$VendorStatsEntityImpl> get copyWith =>
      __$$VendorStatsEntityImplCopyWithImpl<_$VendorStatsEntityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int totalBookings,
      double totalEarnings,
      int pendingRequests,
      int activeResources,
      int completedBookings,
      double averageRating,
    )
    $default,
  ) {
    return $default(
      totalBookings,
      totalEarnings,
      pendingRequests,
      activeResources,
      completedBookings,
      averageRating,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int totalBookings,
      double totalEarnings,
      int pendingRequests,
      int activeResources,
      int completedBookings,
      double averageRating,
    )?
    $default,
  ) {
    return $default?.call(
      totalBookings,
      totalEarnings,
      pendingRequests,
      activeResources,
      completedBookings,
      averageRating,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int totalBookings,
      double totalEarnings,
      int pendingRequests,
      int activeResources,
      int completedBookings,
      double averageRating,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        totalBookings,
        totalEarnings,
        pendingRequests,
        activeResources,
        completedBookings,
        averageRating,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorStatsEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorStatsEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorStatsEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorStatsEntityImplToJson(this);
  }
}

abstract class _VendorStatsEntity implements VendorStatsEntity {
  const factory _VendorStatsEntity({
    final int totalBookings,
    final double totalEarnings,
    final int pendingRequests,
    final int activeResources,
    final int completedBookings,
    final double averageRating,
  }) = _$VendorStatsEntityImpl;

  factory _VendorStatsEntity.fromJson(Map<String, dynamic> json) =
      _$VendorStatsEntityImpl.fromJson;

  @override
  int get totalBookings;
  @override
  double get totalEarnings;
  @override
  int get pendingRequests;
  @override
  int get activeResources;
  @override
  int get completedBookings;
  @override
  double get averageRating;

  /// Create a copy of VendorStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorStatsEntityImplCopyWith<_$VendorStatsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
