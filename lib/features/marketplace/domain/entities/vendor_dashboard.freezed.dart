// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VendorDashboard _$VendorDashboardFromJson(Map<String, dynamic> json) {
  return _VendorDashboard.fromJson(json);
}

/// @nodoc
mixin _$VendorDashboard {
  VendorStats get stats => throw _privateConstructorUsedError;
  List<Booking> get recentBookings => throw _privateConstructorUsedError;
  VendorEarnings get earnings => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      VendorStats stats,
      List<Booking> recentBookings,
      VendorEarnings earnings,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      VendorStats stats,
      List<Booking> recentBookings,
      VendorEarnings earnings,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      VendorStats stats,
      List<Booking> recentBookings,
      VendorEarnings earnings,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorDashboard value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorDashboard value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorDashboard value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorDashboard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorDashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorDashboardCopyWith<VendorDashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorDashboardCopyWith<$Res> {
  factory $VendorDashboardCopyWith(
    VendorDashboard value,
    $Res Function(VendorDashboard) then,
  ) = _$VendorDashboardCopyWithImpl<$Res, VendorDashboard>;
  @useResult
  $Res call({
    VendorStats stats,
    List<Booking> recentBookings,
    VendorEarnings earnings,
  });

  $VendorStatsCopyWith<$Res> get stats;
  $VendorEarningsCopyWith<$Res> get earnings;
}

/// @nodoc
class _$VendorDashboardCopyWithImpl<$Res, $Val extends VendorDashboard>
    implements $VendorDashboardCopyWith<$Res> {
  _$VendorDashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorDashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? recentBookings = null,
    Object? earnings = null,
  }) {
    return _then(
      _value.copyWith(
            stats: null == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                      as VendorStats,
            recentBookings: null == recentBookings
                ? _value.recentBookings
                : recentBookings // ignore: cast_nullable_to_non_nullable
                      as List<Booking>,
            earnings: null == earnings
                ? _value.earnings
                : earnings // ignore: cast_nullable_to_non_nullable
                      as VendorEarnings,
          )
          as $Val,
    );
  }

  /// Create a copy of VendorDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VendorStatsCopyWith<$Res> get stats {
    return $VendorStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  /// Create a copy of VendorDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VendorEarningsCopyWith<$Res> get earnings {
    return $VendorEarningsCopyWith<$Res>(_value.earnings, (value) {
      return _then(_value.copyWith(earnings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VendorDashboardImplCopyWith<$Res>
    implements $VendorDashboardCopyWith<$Res> {
  factory _$$VendorDashboardImplCopyWith(
    _$VendorDashboardImpl value,
    $Res Function(_$VendorDashboardImpl) then,
  ) = __$$VendorDashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    VendorStats stats,
    List<Booking> recentBookings,
    VendorEarnings earnings,
  });

  @override
  $VendorStatsCopyWith<$Res> get stats;
  @override
  $VendorEarningsCopyWith<$Res> get earnings;
}

/// @nodoc
class __$$VendorDashboardImplCopyWithImpl<$Res>
    extends _$VendorDashboardCopyWithImpl<$Res, _$VendorDashboardImpl>
    implements _$$VendorDashboardImplCopyWith<$Res> {
  __$$VendorDashboardImplCopyWithImpl(
    _$VendorDashboardImpl _value,
    $Res Function(_$VendorDashboardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorDashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? recentBookings = null,
    Object? earnings = null,
  }) {
    return _then(
      _$VendorDashboardImpl(
        stats: null == stats
            ? _value.stats
            : stats // ignore: cast_nullable_to_non_nullable
                  as VendorStats,
        recentBookings: null == recentBookings
            ? _value._recentBookings
            : recentBookings // ignore: cast_nullable_to_non_nullable
                  as List<Booking>,
        earnings: null == earnings
            ? _value.earnings
            : earnings // ignore: cast_nullable_to_non_nullable
                  as VendorEarnings,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorDashboardImpl implements _VendorDashboard {
  const _$VendorDashboardImpl({
    required this.stats,
    required final List<Booking> recentBookings,
    required this.earnings,
  }) : _recentBookings = recentBookings;

  factory _$VendorDashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorDashboardImplFromJson(json);

  @override
  final VendorStats stats;
  final List<Booking> _recentBookings;
  @override
  List<Booking> get recentBookings {
    if (_recentBookings is EqualUnmodifiableListView) return _recentBookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentBookings);
  }

  @override
  final VendorEarnings earnings;

  @override
  String toString() {
    return 'VendorDashboard(stats: $stats, recentBookings: $recentBookings, earnings: $earnings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorDashboardImpl &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality().equals(
              other._recentBookings,
              _recentBookings,
            ) &&
            (identical(other.earnings, earnings) ||
                other.earnings == earnings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    stats,
    const DeepCollectionEquality().hash(_recentBookings),
    earnings,
  );

  /// Create a copy of VendorDashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorDashboardImplCopyWith<_$VendorDashboardImpl> get copyWith =>
      __$$VendorDashboardImplCopyWithImpl<_$VendorDashboardImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      VendorStats stats,
      List<Booking> recentBookings,
      VendorEarnings earnings,
    )
    $default,
  ) {
    return $default(stats, recentBookings, earnings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      VendorStats stats,
      List<Booking> recentBookings,
      VendorEarnings earnings,
    )?
    $default,
  ) {
    return $default?.call(stats, recentBookings, earnings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      VendorStats stats,
      List<Booking> recentBookings,
      VendorEarnings earnings,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(stats, recentBookings, earnings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorDashboard value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorDashboard value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorDashboard value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorDashboardImplToJson(this);
  }
}

abstract class _VendorDashboard implements VendorDashboard {
  const factory _VendorDashboard({
    required final VendorStats stats,
    required final List<Booking> recentBookings,
    required final VendorEarnings earnings,
  }) = _$VendorDashboardImpl;

  factory _VendorDashboard.fromJson(Map<String, dynamic> json) =
      _$VendorDashboardImpl.fromJson;

  @override
  VendorStats get stats;
  @override
  List<Booking> get recentBookings;
  @override
  VendorEarnings get earnings;

  /// Create a copy of VendorDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorDashboardImplCopyWith<_$VendorDashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VendorEarnings _$VendorEarningsFromJson(Map<String, dynamic> json) {
  return _VendorEarnings.fromJson(json);
}

/// @nodoc
mixin _$VendorEarnings {
  double get total => throw _privateConstructorUsedError;
  double get pending => throw _privateConstructorUsedError;
  double get paid => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double total, double pending, double paid, String currency)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double total,
      double pending,
      double paid,
      String currency,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double total,
      double pending,
      double paid,
      String currency,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorEarnings value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorEarnings value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorEarnings value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorEarnings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorEarnings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorEarningsCopyWith<VendorEarnings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorEarningsCopyWith<$Res> {
  factory $VendorEarningsCopyWith(
    VendorEarnings value,
    $Res Function(VendorEarnings) then,
  ) = _$VendorEarningsCopyWithImpl<$Res, VendorEarnings>;
  @useResult
  $Res call({double total, double pending, double paid, String currency});
}

/// @nodoc
class _$VendorEarningsCopyWithImpl<$Res, $Val extends VendorEarnings>
    implements $VendorEarningsCopyWith<$Res> {
  _$VendorEarningsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorEarnings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? pending = null,
    Object? paid = null,
    Object? currency = null,
  }) {
    return _then(
      _value.copyWith(
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            pending: null == pending
                ? _value.pending
                : pending // ignore: cast_nullable_to_non_nullable
                      as double,
            paid: null == paid
                ? _value.paid
                : paid // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VendorEarningsImplCopyWith<$Res>
    implements $VendorEarningsCopyWith<$Res> {
  factory _$$VendorEarningsImplCopyWith(
    _$VendorEarningsImpl value,
    $Res Function(_$VendorEarningsImpl) then,
  ) = __$$VendorEarningsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double total, double pending, double paid, String currency});
}

/// @nodoc
class __$$VendorEarningsImplCopyWithImpl<$Res>
    extends _$VendorEarningsCopyWithImpl<$Res, _$VendorEarningsImpl>
    implements _$$VendorEarningsImplCopyWith<$Res> {
  __$$VendorEarningsImplCopyWithImpl(
    _$VendorEarningsImpl _value,
    $Res Function(_$VendorEarningsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorEarnings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? pending = null,
    Object? paid = null,
    Object? currency = null,
  }) {
    return _then(
      _$VendorEarningsImpl(
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        pending: null == pending
            ? _value.pending
            : pending // ignore: cast_nullable_to_non_nullable
                  as double,
        paid: null == paid
            ? _value.paid
            : paid // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorEarningsImpl implements _VendorEarnings {
  const _$VendorEarningsImpl({
    required this.total,
    required this.pending,
    required this.paid,
    required this.currency,
  });

  factory _$VendorEarningsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorEarningsImplFromJson(json);

  @override
  final double total;
  @override
  final double pending;
  @override
  final double paid;
  @override
  final String currency;

  @override
  String toString() {
    return 'VendorEarnings(total: $total, pending: $pending, paid: $paid, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorEarningsImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, pending, paid, currency);

  /// Create a copy of VendorEarnings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorEarningsImplCopyWith<_$VendorEarningsImpl> get copyWith =>
      __$$VendorEarningsImplCopyWithImpl<_$VendorEarningsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double total, double pending, double paid, String currency)
    $default,
  ) {
    return $default(total, pending, paid, currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double total,
      double pending,
      double paid,
      String currency,
    )?
    $default,
  ) {
    return $default?.call(total, pending, paid, currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double total,
      double pending,
      double paid,
      String currency,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(total, pending, paid, currency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorEarnings value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorEarnings value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorEarnings value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorEarningsImplToJson(this);
  }
}

abstract class _VendorEarnings implements VendorEarnings {
  const factory _VendorEarnings({
    required final double total,
    required final double pending,
    required final double paid,
    required final String currency,
  }) = _$VendorEarningsImpl;

  factory _VendorEarnings.fromJson(Map<String, dynamic> json) =
      _$VendorEarningsImpl.fromJson;

  @override
  double get total;
  @override
  double get pending;
  @override
  double get paid;
  @override
  String get currency;

  /// Create a copy of VendorEarnings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorEarningsImplCopyWith<_$VendorEarningsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
