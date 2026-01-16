// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VendorStats _$VendorStatsFromJson(Map<String, dynamic> json) {
  return _VendorStats.fromJson(json);
}

/// @nodoc
mixin _$VendorStats {
  int get totalBookings => throw _privateConstructorUsedError;
  int get pendingBookings => throw _privateConstructorUsedError;
  int get acceptedBookings => throw _privateConstructorUsedError;
  int get completedBookings => throw _privateConstructorUsedError;
  double get totalEarnings => throw _privateConstructorUsedError;
  double get pendingEarnings => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviewCount => throw _privateConstructorUsedError;
  int get eventsCompleted => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int totalBookings,
      int pendingBookings,
      int acceptedBookings,
      int completedBookings,
      double totalEarnings,
      double pendingEarnings,
      double rating,
      int reviewCount,
      int eventsCompleted,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int totalBookings,
      int pendingBookings,
      int acceptedBookings,
      int completedBookings,
      double totalEarnings,
      double pendingEarnings,
      double rating,
      int reviewCount,
      int eventsCompleted,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int totalBookings,
      int pendingBookings,
      int acceptedBookings,
      int completedBookings,
      double totalEarnings,
      double pendingEarnings,
      double rating,
      int reviewCount,
      int eventsCompleted,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorStats value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorStats value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorStats value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorStatsCopyWith<VendorStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorStatsCopyWith<$Res> {
  factory $VendorStatsCopyWith(
    VendorStats value,
    $Res Function(VendorStats) then,
  ) = _$VendorStatsCopyWithImpl<$Res, VendorStats>;
  @useResult
  $Res call({
    int totalBookings,
    int pendingBookings,
    int acceptedBookings,
    int completedBookings,
    double totalEarnings,
    double pendingEarnings,
    double rating,
    int reviewCount,
    int eventsCompleted,
  });
}

/// @nodoc
class _$VendorStatsCopyWithImpl<$Res, $Val extends VendorStats>
    implements $VendorStatsCopyWith<$Res> {
  _$VendorStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBookings = null,
    Object? pendingBookings = null,
    Object? acceptedBookings = null,
    Object? completedBookings = null,
    Object? totalEarnings = null,
    Object? pendingEarnings = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? eventsCompleted = null,
  }) {
    return _then(
      _value.copyWith(
            totalBookings: null == totalBookings
                ? _value.totalBookings
                : totalBookings // ignore: cast_nullable_to_non_nullable
                      as int,
            pendingBookings: null == pendingBookings
                ? _value.pendingBookings
                : pendingBookings // ignore: cast_nullable_to_non_nullable
                      as int,
            acceptedBookings: null == acceptedBookings
                ? _value.acceptedBookings
                : acceptedBookings // ignore: cast_nullable_to_non_nullable
                      as int,
            completedBookings: null == completedBookings
                ? _value.completedBookings
                : completedBookings // ignore: cast_nullable_to_non_nullable
                      as int,
            totalEarnings: null == totalEarnings
                ? _value.totalEarnings
                : totalEarnings // ignore: cast_nullable_to_non_nullable
                      as double,
            pendingEarnings: null == pendingEarnings
                ? _value.pendingEarnings
                : pendingEarnings // ignore: cast_nullable_to_non_nullable
                      as double,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VendorStatsImplCopyWith<$Res>
    implements $VendorStatsCopyWith<$Res> {
  factory _$$VendorStatsImplCopyWith(
    _$VendorStatsImpl value,
    $Res Function(_$VendorStatsImpl) then,
  ) = __$$VendorStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalBookings,
    int pendingBookings,
    int acceptedBookings,
    int completedBookings,
    double totalEarnings,
    double pendingEarnings,
    double rating,
    int reviewCount,
    int eventsCompleted,
  });
}

/// @nodoc
class __$$VendorStatsImplCopyWithImpl<$Res>
    extends _$VendorStatsCopyWithImpl<$Res, _$VendorStatsImpl>
    implements _$$VendorStatsImplCopyWith<$Res> {
  __$$VendorStatsImplCopyWithImpl(
    _$VendorStatsImpl _value,
    $Res Function(_$VendorStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBookings = null,
    Object? pendingBookings = null,
    Object? acceptedBookings = null,
    Object? completedBookings = null,
    Object? totalEarnings = null,
    Object? pendingEarnings = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? eventsCompleted = null,
  }) {
    return _then(
      _$VendorStatsImpl(
        totalBookings: null == totalBookings
            ? _value.totalBookings
            : totalBookings // ignore: cast_nullable_to_non_nullable
                  as int,
        pendingBookings: null == pendingBookings
            ? _value.pendingBookings
            : pendingBookings // ignore: cast_nullable_to_non_nullable
                  as int,
        acceptedBookings: null == acceptedBookings
            ? _value.acceptedBookings
            : acceptedBookings // ignore: cast_nullable_to_non_nullable
                  as int,
        completedBookings: null == completedBookings
            ? _value.completedBookings
            : completedBookings // ignore: cast_nullable_to_non_nullable
                  as int,
        totalEarnings: null == totalEarnings
            ? _value.totalEarnings
            : totalEarnings // ignore: cast_nullable_to_non_nullable
                  as double,
        pendingEarnings: null == pendingEarnings
            ? _value.pendingEarnings
            : pendingEarnings // ignore: cast_nullable_to_non_nullable
                  as double,
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorStatsImpl implements _VendorStats {
  const _$VendorStatsImpl({
    required this.totalBookings,
    required this.pendingBookings,
    required this.acceptedBookings,
    required this.completedBookings,
    required this.totalEarnings,
    required this.pendingEarnings,
    required this.rating,
    required this.reviewCount,
    required this.eventsCompleted,
  });

  factory _$VendorStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorStatsImplFromJson(json);

  @override
  final int totalBookings;
  @override
  final int pendingBookings;
  @override
  final int acceptedBookings;
  @override
  final int completedBookings;
  @override
  final double totalEarnings;
  @override
  final double pendingEarnings;
  @override
  final double rating;
  @override
  final int reviewCount;
  @override
  final int eventsCompleted;

  @override
  String toString() {
    return 'VendorStats(totalBookings: $totalBookings, pendingBookings: $pendingBookings, acceptedBookings: $acceptedBookings, completedBookings: $completedBookings, totalEarnings: $totalEarnings, pendingEarnings: $pendingEarnings, rating: $rating, reviewCount: $reviewCount, eventsCompleted: $eventsCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorStatsImpl &&
            (identical(other.totalBookings, totalBookings) ||
                other.totalBookings == totalBookings) &&
            (identical(other.pendingBookings, pendingBookings) ||
                other.pendingBookings == pendingBookings) &&
            (identical(other.acceptedBookings, acceptedBookings) ||
                other.acceptedBookings == acceptedBookings) &&
            (identical(other.completedBookings, completedBookings) ||
                other.completedBookings == completedBookings) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.pendingEarnings, pendingEarnings) ||
                other.pendingEarnings == pendingEarnings) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.eventsCompleted, eventsCompleted) ||
                other.eventsCompleted == eventsCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalBookings,
    pendingBookings,
    acceptedBookings,
    completedBookings,
    totalEarnings,
    pendingEarnings,
    rating,
    reviewCount,
    eventsCompleted,
  );

  /// Create a copy of VendorStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorStatsImplCopyWith<_$VendorStatsImpl> get copyWith =>
      __$$VendorStatsImplCopyWithImpl<_$VendorStatsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int totalBookings,
      int pendingBookings,
      int acceptedBookings,
      int completedBookings,
      double totalEarnings,
      double pendingEarnings,
      double rating,
      int reviewCount,
      int eventsCompleted,
    )
    $default,
  ) {
    return $default(
      totalBookings,
      pendingBookings,
      acceptedBookings,
      completedBookings,
      totalEarnings,
      pendingEarnings,
      rating,
      reviewCount,
      eventsCompleted,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int totalBookings,
      int pendingBookings,
      int acceptedBookings,
      int completedBookings,
      double totalEarnings,
      double pendingEarnings,
      double rating,
      int reviewCount,
      int eventsCompleted,
    )?
    $default,
  ) {
    return $default?.call(
      totalBookings,
      pendingBookings,
      acceptedBookings,
      completedBookings,
      totalEarnings,
      pendingEarnings,
      rating,
      reviewCount,
      eventsCompleted,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int totalBookings,
      int pendingBookings,
      int acceptedBookings,
      int completedBookings,
      double totalEarnings,
      double pendingEarnings,
      double rating,
      int reviewCount,
      int eventsCompleted,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        totalBookings,
        pendingBookings,
        acceptedBookings,
        completedBookings,
        totalEarnings,
        pendingEarnings,
        rating,
        reviewCount,
        eventsCompleted,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorStats value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorStats value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorStats value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorStatsImplToJson(this);
  }
}

abstract class _VendorStats implements VendorStats {
  const factory _VendorStats({
    required final int totalBookings,
    required final int pendingBookings,
    required final int acceptedBookings,
    required final int completedBookings,
    required final double totalEarnings,
    required final double pendingEarnings,
    required final double rating,
    required final int reviewCount,
    required final int eventsCompleted,
  }) = _$VendorStatsImpl;

  factory _VendorStats.fromJson(Map<String, dynamic> json) =
      _$VendorStatsImpl.fromJson;

  @override
  int get totalBookings;
  @override
  int get pendingBookings;
  @override
  int get acceptedBookings;
  @override
  int get completedBookings;
  @override
  double get totalEarnings;
  @override
  double get pendingEarnings;
  @override
  double get rating;
  @override
  int get reviewCount;
  @override
  int get eventsCompleted;

  /// Create a copy of VendorStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorStatsImplCopyWith<_$VendorStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
