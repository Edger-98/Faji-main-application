// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revenue_distribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RevenueDistribution _$RevenueDistributionFromJson(Map<String, dynamic> json) {
  return _RevenueDistribution.fromJson(json);
}

/// @nodoc
mixin _$RevenueDistribution {
  HostRevenue get host => throw _privateConstructorUsedError;
  List<CohostRevenue> get cohosts => throw _privateConstructorUsedError;
  RevenueSummary get summary => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      HostRevenue host,
      List<CohostRevenue> cohosts,
      RevenueSummary summary,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      HostRevenue host,
      List<CohostRevenue> cohosts,
      RevenueSummary summary,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      HostRevenue host,
      List<CohostRevenue> cohosts,
      RevenueSummary summary,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RevenueDistribution value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RevenueDistribution value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RevenueDistribution value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this RevenueDistribution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RevenueDistribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RevenueDistributionCopyWith<RevenueDistribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RevenueDistributionCopyWith<$Res> {
  factory $RevenueDistributionCopyWith(
    RevenueDistribution value,
    $Res Function(RevenueDistribution) then,
  ) = _$RevenueDistributionCopyWithImpl<$Res, RevenueDistribution>;
  @useResult
  $Res call({
    HostRevenue host,
    List<CohostRevenue> cohosts,
    RevenueSummary summary,
  });

  $HostRevenueCopyWith<$Res> get host;
  $RevenueSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$RevenueDistributionCopyWithImpl<$Res, $Val extends RevenueDistribution>
    implements $RevenueDistributionCopyWith<$Res> {
  _$RevenueDistributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RevenueDistribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? cohosts = null,
    Object? summary = null,
  }) {
    return _then(
      _value.copyWith(
            host: null == host
                ? _value.host
                : host // ignore: cast_nullable_to_non_nullable
                      as HostRevenue,
            cohosts: null == cohosts
                ? _value.cohosts
                : cohosts // ignore: cast_nullable_to_non_nullable
                      as List<CohostRevenue>,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as RevenueSummary,
          )
          as $Val,
    );
  }

  /// Create a copy of RevenueDistribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HostRevenueCopyWith<$Res> get host {
    return $HostRevenueCopyWith<$Res>(_value.host, (value) {
      return _then(_value.copyWith(host: value) as $Val);
    });
  }

  /// Create a copy of RevenueDistribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RevenueSummaryCopyWith<$Res> get summary {
    return $RevenueSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RevenueDistributionImplCopyWith<$Res>
    implements $RevenueDistributionCopyWith<$Res> {
  factory _$$RevenueDistributionImplCopyWith(
    _$RevenueDistributionImpl value,
    $Res Function(_$RevenueDistributionImpl) then,
  ) = __$$RevenueDistributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    HostRevenue host,
    List<CohostRevenue> cohosts,
    RevenueSummary summary,
  });

  @override
  $HostRevenueCopyWith<$Res> get host;
  @override
  $RevenueSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$RevenueDistributionImplCopyWithImpl<$Res>
    extends _$RevenueDistributionCopyWithImpl<$Res, _$RevenueDistributionImpl>
    implements _$$RevenueDistributionImplCopyWith<$Res> {
  __$$RevenueDistributionImplCopyWithImpl(
    _$RevenueDistributionImpl _value,
    $Res Function(_$RevenueDistributionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RevenueDistribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? cohosts = null,
    Object? summary = null,
  }) {
    return _then(
      _$RevenueDistributionImpl(
        host: null == host
            ? _value.host
            : host // ignore: cast_nullable_to_non_nullable
                  as HostRevenue,
        cohosts: null == cohosts
            ? _value._cohosts
            : cohosts // ignore: cast_nullable_to_non_nullable
                  as List<CohostRevenue>,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as RevenueSummary,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RevenueDistributionImpl implements _RevenueDistribution {
  const _$RevenueDistributionImpl({
    required this.host,
    required final List<CohostRevenue> cohosts,
    required this.summary,
  }) : _cohosts = cohosts;

  factory _$RevenueDistributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RevenueDistributionImplFromJson(json);

  @override
  final HostRevenue host;
  final List<CohostRevenue> _cohosts;
  @override
  List<CohostRevenue> get cohosts {
    if (_cohosts is EqualUnmodifiableListView) return _cohosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cohosts);
  }

  @override
  final RevenueSummary summary;

  @override
  String toString() {
    return 'RevenueDistribution(host: $host, cohosts: $cohosts, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RevenueDistributionImpl &&
            (identical(other.host, host) || other.host == host) &&
            const DeepCollectionEquality().equals(other._cohosts, _cohosts) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    host,
    const DeepCollectionEquality().hash(_cohosts),
    summary,
  );

  /// Create a copy of RevenueDistribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RevenueDistributionImplCopyWith<_$RevenueDistributionImpl> get copyWith =>
      __$$RevenueDistributionImplCopyWithImpl<_$RevenueDistributionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      HostRevenue host,
      List<CohostRevenue> cohosts,
      RevenueSummary summary,
    )
    $default,
  ) {
    return $default(host, cohosts, summary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      HostRevenue host,
      List<CohostRevenue> cohosts,
      RevenueSummary summary,
    )?
    $default,
  ) {
    return $default?.call(host, cohosts, summary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      HostRevenue host,
      List<CohostRevenue> cohosts,
      RevenueSummary summary,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(host, cohosts, summary);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RevenueDistribution value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RevenueDistribution value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RevenueDistribution value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RevenueDistributionImplToJson(this);
  }
}

abstract class _RevenueDistribution implements RevenueDistribution {
  const factory _RevenueDistribution({
    required final HostRevenue host,
    required final List<CohostRevenue> cohosts,
    required final RevenueSummary summary,
  }) = _$RevenueDistributionImpl;

  factory _RevenueDistribution.fromJson(Map<String, dynamic> json) =
      _$RevenueDistributionImpl.fromJson;

  @override
  HostRevenue get host;
  @override
  List<CohostRevenue> get cohosts;
  @override
  RevenueSummary get summary;

  /// Create a copy of RevenueDistribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RevenueDistributionImplCopyWith<_$RevenueDistributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HostRevenue _$HostRevenueFromJson(Map<String, dynamic> json) {
  return _HostRevenue.fromJson(json);
}

/// @nodoc
mixin _$HostRevenue {
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get share => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String userId, String name, double share, double amount)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String userId, String name, double share, double amount)?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String userId, String name, double share, double amount)?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_HostRevenue value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_HostRevenue value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_HostRevenue value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this HostRevenue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HostRevenue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HostRevenueCopyWith<HostRevenue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostRevenueCopyWith<$Res> {
  factory $HostRevenueCopyWith(
    HostRevenue value,
    $Res Function(HostRevenue) then,
  ) = _$HostRevenueCopyWithImpl<$Res, HostRevenue>;
  @useResult
  $Res call({String userId, String name, double share, double amount});
}

/// @nodoc
class _$HostRevenueCopyWithImpl<$Res, $Val extends HostRevenue>
    implements $HostRevenueCopyWith<$Res> {
  _$HostRevenueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HostRevenue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? share = null,
    Object? amount = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            share: null == share
                ? _value.share
                : share // ignore: cast_nullable_to_non_nullable
                      as double,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HostRevenueImplCopyWith<$Res>
    implements $HostRevenueCopyWith<$Res> {
  factory _$$HostRevenueImplCopyWith(
    _$HostRevenueImpl value,
    $Res Function(_$HostRevenueImpl) then,
  ) = __$$HostRevenueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String name, double share, double amount});
}

/// @nodoc
class __$$HostRevenueImplCopyWithImpl<$Res>
    extends _$HostRevenueCopyWithImpl<$Res, _$HostRevenueImpl>
    implements _$$HostRevenueImplCopyWith<$Res> {
  __$$HostRevenueImplCopyWithImpl(
    _$HostRevenueImpl _value,
    $Res Function(_$HostRevenueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HostRevenue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? share = null,
    Object? amount = null,
  }) {
    return _then(
      _$HostRevenueImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        share: null == share
            ? _value.share
            : share // ignore: cast_nullable_to_non_nullable
                  as double,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HostRevenueImpl implements _HostRevenue {
  const _$HostRevenueImpl({
    required this.userId,
    required this.name,
    required this.share,
    required this.amount,
  });

  factory _$HostRevenueImpl.fromJson(Map<String, dynamic> json) =>
      _$$HostRevenueImplFromJson(json);

  @override
  final String userId;
  @override
  final String name;
  @override
  final double share;
  @override
  final double amount;

  @override
  String toString() {
    return 'HostRevenue(userId: $userId, name: $name, share: $share, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HostRevenueImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.share, share) || other.share == share) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, share, amount);

  /// Create a copy of HostRevenue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HostRevenueImplCopyWith<_$HostRevenueImpl> get copyWith =>
      __$$HostRevenueImplCopyWithImpl<_$HostRevenueImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String userId, String name, double share, double amount)
    $default,
  ) {
    return $default(userId, name, share, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String userId, String name, double share, double amount)?
    $default,
  ) {
    return $default?.call(userId, name, share, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String userId, String name, double share, double amount)?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(userId, name, share, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_HostRevenue value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_HostRevenue value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_HostRevenue value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HostRevenueImplToJson(this);
  }
}

abstract class _HostRevenue implements HostRevenue {
  const factory _HostRevenue({
    required final String userId,
    required final String name,
    required final double share,
    required final double amount,
  }) = _$HostRevenueImpl;

  factory _HostRevenue.fromJson(Map<String, dynamic> json) =
      _$HostRevenueImpl.fromJson;

  @override
  String get userId;
  @override
  String get name;
  @override
  double get share;
  @override
  double get amount;

  /// Create a copy of HostRevenue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HostRevenueImplCopyWith<_$HostRevenueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CohostRevenue _$CohostRevenueFromJson(Map<String, dynamic> json) {
  return _CohostRevenue.fromJson(json);
}

/// @nodoc
mixin _$CohostRevenue {
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get share => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String userId, String name, double share, double amount)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String userId, String name, double share, double amount)?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String userId, String name, double share, double amount)?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostRevenue value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostRevenue value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostRevenue value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this CohostRevenue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CohostRevenue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CohostRevenueCopyWith<CohostRevenue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CohostRevenueCopyWith<$Res> {
  factory $CohostRevenueCopyWith(
    CohostRevenue value,
    $Res Function(CohostRevenue) then,
  ) = _$CohostRevenueCopyWithImpl<$Res, CohostRevenue>;
  @useResult
  $Res call({String userId, String name, double share, double amount});
}

/// @nodoc
class _$CohostRevenueCopyWithImpl<$Res, $Val extends CohostRevenue>
    implements $CohostRevenueCopyWith<$Res> {
  _$CohostRevenueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CohostRevenue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? share = null,
    Object? amount = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            share: null == share
                ? _value.share
                : share // ignore: cast_nullable_to_non_nullable
                      as double,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CohostRevenueImplCopyWith<$Res>
    implements $CohostRevenueCopyWith<$Res> {
  factory _$$CohostRevenueImplCopyWith(
    _$CohostRevenueImpl value,
    $Res Function(_$CohostRevenueImpl) then,
  ) = __$$CohostRevenueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String name, double share, double amount});
}

/// @nodoc
class __$$CohostRevenueImplCopyWithImpl<$Res>
    extends _$CohostRevenueCopyWithImpl<$Res, _$CohostRevenueImpl>
    implements _$$CohostRevenueImplCopyWith<$Res> {
  __$$CohostRevenueImplCopyWithImpl(
    _$CohostRevenueImpl _value,
    $Res Function(_$CohostRevenueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CohostRevenue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? share = null,
    Object? amount = null,
  }) {
    return _then(
      _$CohostRevenueImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        share: null == share
            ? _value.share
            : share // ignore: cast_nullable_to_non_nullable
                  as double,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CohostRevenueImpl implements _CohostRevenue {
  const _$CohostRevenueImpl({
    required this.userId,
    required this.name,
    required this.share,
    required this.amount,
  });

  factory _$CohostRevenueImpl.fromJson(Map<String, dynamic> json) =>
      _$$CohostRevenueImplFromJson(json);

  @override
  final String userId;
  @override
  final String name;
  @override
  final double share;
  @override
  final double amount;

  @override
  String toString() {
    return 'CohostRevenue(userId: $userId, name: $name, share: $share, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CohostRevenueImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.share, share) || other.share == share) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, share, amount);

  /// Create a copy of CohostRevenue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CohostRevenueImplCopyWith<_$CohostRevenueImpl> get copyWith =>
      __$$CohostRevenueImplCopyWithImpl<_$CohostRevenueImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String userId, String name, double share, double amount)
    $default,
  ) {
    return $default(userId, name, share, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String userId, String name, double share, double amount)?
    $default,
  ) {
    return $default?.call(userId, name, share, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String userId, String name, double share, double amount)?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(userId, name, share, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostRevenue value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostRevenue value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostRevenue value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CohostRevenueImplToJson(this);
  }
}

abstract class _CohostRevenue implements CohostRevenue {
  const factory _CohostRevenue({
    required final String userId,
    required final String name,
    required final double share,
    required final double amount,
  }) = _$CohostRevenueImpl;

  factory _CohostRevenue.fromJson(Map<String, dynamic> json) =
      _$CohostRevenueImpl.fromJson;

  @override
  String get userId;
  @override
  String get name;
  @override
  double get share;
  @override
  double get amount;

  /// Create a copy of CohostRevenue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CohostRevenueImplCopyWith<_$CohostRevenueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RevenueSummary _$RevenueSummaryFromJson(Map<String, dynamic> json) {
  return _RevenueSummary.fromJson(json);
}

/// @nodoc
mixin _$RevenueSummary {
  double get totalRevenue => throw _privateConstructorUsedError;
  double get platformFee => throw _privateConstructorUsedError;
  double get netRevenue => throw _privateConstructorUsedError;
  double get hostAmount => throw _privateConstructorUsedError;
  double get cohostAmount => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      double totalRevenue,
      double platformFee,
      double netRevenue,
      double hostAmount,
      double cohostAmount,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double totalRevenue,
      double platformFee,
      double netRevenue,
      double hostAmount,
      double cohostAmount,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double totalRevenue,
      double platformFee,
      double netRevenue,
      double hostAmount,
      double cohostAmount,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RevenueSummary value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RevenueSummary value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RevenueSummary value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this RevenueSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RevenueSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RevenueSummaryCopyWith<RevenueSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RevenueSummaryCopyWith<$Res> {
  factory $RevenueSummaryCopyWith(
    RevenueSummary value,
    $Res Function(RevenueSummary) then,
  ) = _$RevenueSummaryCopyWithImpl<$Res, RevenueSummary>;
  @useResult
  $Res call({
    double totalRevenue,
    double platformFee,
    double netRevenue,
    double hostAmount,
    double cohostAmount,
  });
}

/// @nodoc
class _$RevenueSummaryCopyWithImpl<$Res, $Val extends RevenueSummary>
    implements $RevenueSummaryCopyWith<$Res> {
  _$RevenueSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RevenueSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRevenue = null,
    Object? platformFee = null,
    Object? netRevenue = null,
    Object? hostAmount = null,
    Object? cohostAmount = null,
  }) {
    return _then(
      _value.copyWith(
            totalRevenue: null == totalRevenue
                ? _value.totalRevenue
                : totalRevenue // ignore: cast_nullable_to_non_nullable
                      as double,
            platformFee: null == platformFee
                ? _value.platformFee
                : platformFee // ignore: cast_nullable_to_non_nullable
                      as double,
            netRevenue: null == netRevenue
                ? _value.netRevenue
                : netRevenue // ignore: cast_nullable_to_non_nullable
                      as double,
            hostAmount: null == hostAmount
                ? _value.hostAmount
                : hostAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            cohostAmount: null == cohostAmount
                ? _value.cohostAmount
                : cohostAmount // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RevenueSummaryImplCopyWith<$Res>
    implements $RevenueSummaryCopyWith<$Res> {
  factory _$$RevenueSummaryImplCopyWith(
    _$RevenueSummaryImpl value,
    $Res Function(_$RevenueSummaryImpl) then,
  ) = __$$RevenueSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double totalRevenue,
    double platformFee,
    double netRevenue,
    double hostAmount,
    double cohostAmount,
  });
}

/// @nodoc
class __$$RevenueSummaryImplCopyWithImpl<$Res>
    extends _$RevenueSummaryCopyWithImpl<$Res, _$RevenueSummaryImpl>
    implements _$$RevenueSummaryImplCopyWith<$Res> {
  __$$RevenueSummaryImplCopyWithImpl(
    _$RevenueSummaryImpl _value,
    $Res Function(_$RevenueSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RevenueSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRevenue = null,
    Object? platformFee = null,
    Object? netRevenue = null,
    Object? hostAmount = null,
    Object? cohostAmount = null,
  }) {
    return _then(
      _$RevenueSummaryImpl(
        totalRevenue: null == totalRevenue
            ? _value.totalRevenue
            : totalRevenue // ignore: cast_nullable_to_non_nullable
                  as double,
        platformFee: null == platformFee
            ? _value.platformFee
            : platformFee // ignore: cast_nullable_to_non_nullable
                  as double,
        netRevenue: null == netRevenue
            ? _value.netRevenue
            : netRevenue // ignore: cast_nullable_to_non_nullable
                  as double,
        hostAmount: null == hostAmount
            ? _value.hostAmount
            : hostAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        cohostAmount: null == cohostAmount
            ? _value.cohostAmount
            : cohostAmount // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RevenueSummaryImpl implements _RevenueSummary {
  const _$RevenueSummaryImpl({
    required this.totalRevenue,
    required this.platformFee,
    required this.netRevenue,
    required this.hostAmount,
    required this.cohostAmount,
  });

  factory _$RevenueSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RevenueSummaryImplFromJson(json);

  @override
  final double totalRevenue;
  @override
  final double platformFee;
  @override
  final double netRevenue;
  @override
  final double hostAmount;
  @override
  final double cohostAmount;

  @override
  String toString() {
    return 'RevenueSummary(totalRevenue: $totalRevenue, platformFee: $platformFee, netRevenue: $netRevenue, hostAmount: $hostAmount, cohostAmount: $cohostAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RevenueSummaryImpl &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.platformFee, platformFee) ||
                other.platformFee == platformFee) &&
            (identical(other.netRevenue, netRevenue) ||
                other.netRevenue == netRevenue) &&
            (identical(other.hostAmount, hostAmount) ||
                other.hostAmount == hostAmount) &&
            (identical(other.cohostAmount, cohostAmount) ||
                other.cohostAmount == cohostAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalRevenue,
    platformFee,
    netRevenue,
    hostAmount,
    cohostAmount,
  );

  /// Create a copy of RevenueSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RevenueSummaryImplCopyWith<_$RevenueSummaryImpl> get copyWith =>
      __$$RevenueSummaryImplCopyWithImpl<_$RevenueSummaryImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      double totalRevenue,
      double platformFee,
      double netRevenue,
      double hostAmount,
      double cohostAmount,
    )
    $default,
  ) {
    return $default(
      totalRevenue,
      platformFee,
      netRevenue,
      hostAmount,
      cohostAmount,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double totalRevenue,
      double platformFee,
      double netRevenue,
      double hostAmount,
      double cohostAmount,
    )?
    $default,
  ) {
    return $default?.call(
      totalRevenue,
      platformFee,
      netRevenue,
      hostAmount,
      cohostAmount,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double totalRevenue,
      double platformFee,
      double netRevenue,
      double hostAmount,
      double cohostAmount,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        totalRevenue,
        platformFee,
        netRevenue,
        hostAmount,
        cohostAmount,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RevenueSummary value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RevenueSummary value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RevenueSummary value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RevenueSummaryImplToJson(this);
  }
}

abstract class _RevenueSummary implements RevenueSummary {
  const factory _RevenueSummary({
    required final double totalRevenue,
    required final double platformFee,
    required final double netRevenue,
    required final double hostAmount,
    required final double cohostAmount,
  }) = _$RevenueSummaryImpl;

  factory _RevenueSummary.fromJson(Map<String, dynamic> json) =
      _$RevenueSummaryImpl.fromJson;

  @override
  double get totalRevenue;
  @override
  double get platformFee;
  @override
  double get netRevenue;
  @override
  double get hostAmount;
  @override
  double get cohostAmount;

  /// Create a copy of RevenueSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RevenueSummaryImplCopyWith<_$RevenueSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
