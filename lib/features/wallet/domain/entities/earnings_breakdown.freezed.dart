// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'earnings_breakdown.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EarningsBreakdown _$EarningsBreakdownFromJson(Map<String, dynamic> json) {
  return _EarningsBreakdown.fromJson(json);
}

/// @nodoc
mixin _$EarningsBreakdown {
  double get totalEarnings => throw _privateConstructorUsedError;
  double get availableBalance => throw _privateConstructorUsedError;
  double get pendingBalance => throw _privateConstructorUsedError;
  double get escrowBalance => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  Map<String, dynamic> get breakdown => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      double totalEarnings,
      double availableBalance,
      double pendingBalance,
      double escrowBalance,
      String currency,
      Map<String, dynamic> breakdown,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double totalEarnings,
      double availableBalance,
      double pendingBalance,
      double escrowBalance,
      String currency,
      Map<String, dynamic> breakdown,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double totalEarnings,
      double availableBalance,
      double pendingBalance,
      double escrowBalance,
      String currency,
      Map<String, dynamic> breakdown,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EarningsBreakdown value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EarningsBreakdown value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EarningsBreakdown value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this EarningsBreakdown to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EarningsBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EarningsBreakdownCopyWith<EarningsBreakdown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarningsBreakdownCopyWith<$Res> {
  factory $EarningsBreakdownCopyWith(
    EarningsBreakdown value,
    $Res Function(EarningsBreakdown) then,
  ) = _$EarningsBreakdownCopyWithImpl<$Res, EarningsBreakdown>;
  @useResult
  $Res call({
    double totalEarnings,
    double availableBalance,
    double pendingBalance,
    double escrowBalance,
    String currency,
    Map<String, dynamic> breakdown,
  });
}

/// @nodoc
class _$EarningsBreakdownCopyWithImpl<$Res, $Val extends EarningsBreakdown>
    implements $EarningsBreakdownCopyWith<$Res> {
  _$EarningsBreakdownCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EarningsBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEarnings = null,
    Object? availableBalance = null,
    Object? pendingBalance = null,
    Object? escrowBalance = null,
    Object? currency = null,
    Object? breakdown = null,
  }) {
    return _then(
      _value.copyWith(
            totalEarnings: null == totalEarnings
                ? _value.totalEarnings
                : totalEarnings // ignore: cast_nullable_to_non_nullable
                      as double,
            availableBalance: null == availableBalance
                ? _value.availableBalance
                : availableBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            pendingBalance: null == pendingBalance
                ? _value.pendingBalance
                : pendingBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            escrowBalance: null == escrowBalance
                ? _value.escrowBalance
                : escrowBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            breakdown: null == breakdown
                ? _value.breakdown
                : breakdown // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EarningsBreakdownImplCopyWith<$Res>
    implements $EarningsBreakdownCopyWith<$Res> {
  factory _$$EarningsBreakdownImplCopyWith(
    _$EarningsBreakdownImpl value,
    $Res Function(_$EarningsBreakdownImpl) then,
  ) = __$$EarningsBreakdownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double totalEarnings,
    double availableBalance,
    double pendingBalance,
    double escrowBalance,
    String currency,
    Map<String, dynamic> breakdown,
  });
}

/// @nodoc
class __$$EarningsBreakdownImplCopyWithImpl<$Res>
    extends _$EarningsBreakdownCopyWithImpl<$Res, _$EarningsBreakdownImpl>
    implements _$$EarningsBreakdownImplCopyWith<$Res> {
  __$$EarningsBreakdownImplCopyWithImpl(
    _$EarningsBreakdownImpl _value,
    $Res Function(_$EarningsBreakdownImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EarningsBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEarnings = null,
    Object? availableBalance = null,
    Object? pendingBalance = null,
    Object? escrowBalance = null,
    Object? currency = null,
    Object? breakdown = null,
  }) {
    return _then(
      _$EarningsBreakdownImpl(
        totalEarnings: null == totalEarnings
            ? _value.totalEarnings
            : totalEarnings // ignore: cast_nullable_to_non_nullable
                  as double,
        availableBalance: null == availableBalance
            ? _value.availableBalance
            : availableBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        pendingBalance: null == pendingBalance
            ? _value.pendingBalance
            : pendingBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        escrowBalance: null == escrowBalance
            ? _value.escrowBalance
            : escrowBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        breakdown: null == breakdown
            ? _value._breakdown
            : breakdown // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EarningsBreakdownImpl implements _EarningsBreakdown {
  const _$EarningsBreakdownImpl({
    required this.totalEarnings,
    required this.availableBalance,
    required this.pendingBalance,
    required this.escrowBalance,
    required this.currency,
    required final Map<String, dynamic> breakdown,
  }) : _breakdown = breakdown;

  factory _$EarningsBreakdownImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarningsBreakdownImplFromJson(json);

  @override
  final double totalEarnings;
  @override
  final double availableBalance;
  @override
  final double pendingBalance;
  @override
  final double escrowBalance;
  @override
  final String currency;
  final Map<String, dynamic> _breakdown;
  @override
  Map<String, dynamic> get breakdown {
    if (_breakdown is EqualUnmodifiableMapView) return _breakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_breakdown);
  }

  @override
  String toString() {
    return 'EarningsBreakdown(totalEarnings: $totalEarnings, availableBalance: $availableBalance, pendingBalance: $pendingBalance, escrowBalance: $escrowBalance, currency: $currency, breakdown: $breakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarningsBreakdownImpl &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance) &&
            (identical(other.pendingBalance, pendingBalance) ||
                other.pendingBalance == pendingBalance) &&
            (identical(other.escrowBalance, escrowBalance) ||
                other.escrowBalance == escrowBalance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(
              other._breakdown,
              _breakdown,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalEarnings,
    availableBalance,
    pendingBalance,
    escrowBalance,
    currency,
    const DeepCollectionEquality().hash(_breakdown),
  );

  /// Create a copy of EarningsBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EarningsBreakdownImplCopyWith<_$EarningsBreakdownImpl> get copyWith =>
      __$$EarningsBreakdownImplCopyWithImpl<_$EarningsBreakdownImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      double totalEarnings,
      double availableBalance,
      double pendingBalance,
      double escrowBalance,
      String currency,
      Map<String, dynamic> breakdown,
    )
    $default,
  ) {
    return $default(
      totalEarnings,
      availableBalance,
      pendingBalance,
      escrowBalance,
      currency,
      breakdown,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double totalEarnings,
      double availableBalance,
      double pendingBalance,
      double escrowBalance,
      String currency,
      Map<String, dynamic> breakdown,
    )?
    $default,
  ) {
    return $default?.call(
      totalEarnings,
      availableBalance,
      pendingBalance,
      escrowBalance,
      currency,
      breakdown,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double totalEarnings,
      double availableBalance,
      double pendingBalance,
      double escrowBalance,
      String currency,
      Map<String, dynamic> breakdown,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        totalEarnings,
        availableBalance,
        pendingBalance,
        escrowBalance,
        currency,
        breakdown,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EarningsBreakdown value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EarningsBreakdown value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EarningsBreakdown value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EarningsBreakdownImplToJson(this);
  }
}

abstract class _EarningsBreakdown implements EarningsBreakdown {
  const factory _EarningsBreakdown({
    required final double totalEarnings,
    required final double availableBalance,
    required final double pendingBalance,
    required final double escrowBalance,
    required final String currency,
    required final Map<String, dynamic> breakdown,
  }) = _$EarningsBreakdownImpl;

  factory _EarningsBreakdown.fromJson(Map<String, dynamic> json) =
      _$EarningsBreakdownImpl.fromJson;

  @override
  double get totalEarnings;
  @override
  double get availableBalance;
  @override
  double get pendingBalance;
  @override
  double get escrowBalance;
  @override
  String get currency;
  @override
  Map<String, dynamic> get breakdown;

  /// Create a copy of EarningsBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EarningsBreakdownImplCopyWith<_$EarningsBreakdownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EarningsSummary _$EarningsSummaryFromJson(Map<String, dynamic> json) {
  return _EarningsSummary.fromJson(json);
}

/// @nodoc
mixin _$EarningsSummary {
  double get totalEarnings => throw _privateConstructorUsedError;
  double get ticketSales => throw _privateConstructorUsedError;
  double get cohostEarnings => throw _privateConstructorUsedError;
  double get vendorEarnings => throw _privateConstructorUsedError;
  double get platformFees => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      double totalEarnings,
      double ticketSales,
      double cohostEarnings,
      double vendorEarnings,
      double platformFees,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double totalEarnings,
      double ticketSales,
      double cohostEarnings,
      double vendorEarnings,
      double platformFees,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double totalEarnings,
      double ticketSales,
      double cohostEarnings,
      double vendorEarnings,
      double platformFees,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EarningsSummary value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EarningsSummary value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EarningsSummary value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this EarningsSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EarningsSummaryCopyWith<EarningsSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarningsSummaryCopyWith<$Res> {
  factory $EarningsSummaryCopyWith(
    EarningsSummary value,
    $Res Function(EarningsSummary) then,
  ) = _$EarningsSummaryCopyWithImpl<$Res, EarningsSummary>;
  @useResult
  $Res call({
    double totalEarnings,
    double ticketSales,
    double cohostEarnings,
    double vendorEarnings,
    double platformFees,
  });
}

/// @nodoc
class _$EarningsSummaryCopyWithImpl<$Res, $Val extends EarningsSummary>
    implements $EarningsSummaryCopyWith<$Res> {
  _$EarningsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEarnings = null,
    Object? ticketSales = null,
    Object? cohostEarnings = null,
    Object? vendorEarnings = null,
    Object? platformFees = null,
  }) {
    return _then(
      _value.copyWith(
            totalEarnings: null == totalEarnings
                ? _value.totalEarnings
                : totalEarnings // ignore: cast_nullable_to_non_nullable
                      as double,
            ticketSales: null == ticketSales
                ? _value.ticketSales
                : ticketSales // ignore: cast_nullable_to_non_nullable
                      as double,
            cohostEarnings: null == cohostEarnings
                ? _value.cohostEarnings
                : cohostEarnings // ignore: cast_nullable_to_non_nullable
                      as double,
            vendorEarnings: null == vendorEarnings
                ? _value.vendorEarnings
                : vendorEarnings // ignore: cast_nullable_to_non_nullable
                      as double,
            platformFees: null == platformFees
                ? _value.platformFees
                : platformFees // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EarningsSummaryImplCopyWith<$Res>
    implements $EarningsSummaryCopyWith<$Res> {
  factory _$$EarningsSummaryImplCopyWith(
    _$EarningsSummaryImpl value,
    $Res Function(_$EarningsSummaryImpl) then,
  ) = __$$EarningsSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double totalEarnings,
    double ticketSales,
    double cohostEarnings,
    double vendorEarnings,
    double platformFees,
  });
}

/// @nodoc
class __$$EarningsSummaryImplCopyWithImpl<$Res>
    extends _$EarningsSummaryCopyWithImpl<$Res, _$EarningsSummaryImpl>
    implements _$$EarningsSummaryImplCopyWith<$Res> {
  __$$EarningsSummaryImplCopyWithImpl(
    _$EarningsSummaryImpl _value,
    $Res Function(_$EarningsSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEarnings = null,
    Object? ticketSales = null,
    Object? cohostEarnings = null,
    Object? vendorEarnings = null,
    Object? platformFees = null,
  }) {
    return _then(
      _$EarningsSummaryImpl(
        totalEarnings: null == totalEarnings
            ? _value.totalEarnings
            : totalEarnings // ignore: cast_nullable_to_non_nullable
                  as double,
        ticketSales: null == ticketSales
            ? _value.ticketSales
            : ticketSales // ignore: cast_nullable_to_non_nullable
                  as double,
        cohostEarnings: null == cohostEarnings
            ? _value.cohostEarnings
            : cohostEarnings // ignore: cast_nullable_to_non_nullable
                  as double,
        vendorEarnings: null == vendorEarnings
            ? _value.vendorEarnings
            : vendorEarnings // ignore: cast_nullable_to_non_nullable
                  as double,
        platformFees: null == platformFees
            ? _value.platformFees
            : platformFees // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EarningsSummaryImpl implements _EarningsSummary {
  const _$EarningsSummaryImpl({
    required this.totalEarnings,
    required this.ticketSales,
    required this.cohostEarnings,
    required this.vendorEarnings,
    required this.platformFees,
  });

  factory _$EarningsSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarningsSummaryImplFromJson(json);

  @override
  final double totalEarnings;
  @override
  final double ticketSales;
  @override
  final double cohostEarnings;
  @override
  final double vendorEarnings;
  @override
  final double platformFees;

  @override
  String toString() {
    return 'EarningsSummary(totalEarnings: $totalEarnings, ticketSales: $ticketSales, cohostEarnings: $cohostEarnings, vendorEarnings: $vendorEarnings, platformFees: $platformFees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarningsSummaryImpl &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.ticketSales, ticketSales) ||
                other.ticketSales == ticketSales) &&
            (identical(other.cohostEarnings, cohostEarnings) ||
                other.cohostEarnings == cohostEarnings) &&
            (identical(other.vendorEarnings, vendorEarnings) ||
                other.vendorEarnings == vendorEarnings) &&
            (identical(other.platformFees, platformFees) ||
                other.platformFees == platformFees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalEarnings,
    ticketSales,
    cohostEarnings,
    vendorEarnings,
    platformFees,
  );

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EarningsSummaryImplCopyWith<_$EarningsSummaryImpl> get copyWith =>
      __$$EarningsSummaryImplCopyWithImpl<_$EarningsSummaryImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      double totalEarnings,
      double ticketSales,
      double cohostEarnings,
      double vendorEarnings,
      double platformFees,
    )
    $default,
  ) {
    return $default(
      totalEarnings,
      ticketSales,
      cohostEarnings,
      vendorEarnings,
      platformFees,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double totalEarnings,
      double ticketSales,
      double cohostEarnings,
      double vendorEarnings,
      double platformFees,
    )?
    $default,
  ) {
    return $default?.call(
      totalEarnings,
      ticketSales,
      cohostEarnings,
      vendorEarnings,
      platformFees,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double totalEarnings,
      double ticketSales,
      double cohostEarnings,
      double vendorEarnings,
      double platformFees,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        totalEarnings,
        ticketSales,
        cohostEarnings,
        vendorEarnings,
        platformFees,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EarningsSummary value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EarningsSummary value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EarningsSummary value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EarningsSummaryImplToJson(this);
  }
}

abstract class _EarningsSummary implements EarningsSummary {
  const factory _EarningsSummary({
    required final double totalEarnings,
    required final double ticketSales,
    required final double cohostEarnings,
    required final double vendorEarnings,
    required final double platformFees,
  }) = _$EarningsSummaryImpl;

  factory _EarningsSummary.fromJson(Map<String, dynamic> json) =
      _$EarningsSummaryImpl.fromJson;

  @override
  double get totalEarnings;
  @override
  double get ticketSales;
  @override
  double get cohostEarnings;
  @override
  double get vendorEarnings;
  @override
  double get platformFees;

  /// Create a copy of EarningsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EarningsSummaryImplCopyWith<_$EarningsSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EarningsSource _$EarningsSourceFromJson(Map<String, dynamic> json) {
  return _EarningsSource.fromJson(json);
}

/// @nodoc
mixin _$EarningsSource {
  String get eventId => throw _privateConstructorUsedError;
  String get eventName => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String eventId,
      String eventName,
      String type,
      double amount,
      String date,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String eventId,
      String eventName,
      String type,
      double amount,
      String date,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String eventId,
      String eventName,
      String type,
      double amount,
      String date,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EarningsSource value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EarningsSource value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EarningsSource value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this EarningsSource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EarningsSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EarningsSourceCopyWith<EarningsSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarningsSourceCopyWith<$Res> {
  factory $EarningsSourceCopyWith(
    EarningsSource value,
    $Res Function(EarningsSource) then,
  ) = _$EarningsSourceCopyWithImpl<$Res, EarningsSource>;
  @useResult
  $Res call({
    String eventId,
    String eventName,
    String type,
    double amount,
    String date,
  });
}

/// @nodoc
class _$EarningsSourceCopyWithImpl<$Res, $Val extends EarningsSource>
    implements $EarningsSourceCopyWith<$Res> {
  _$EarningsSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EarningsSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventName = null,
    Object? type = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(
      _value.copyWith(
            eventId: null == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String,
            eventName: null == eventName
                ? _value.eventName
                : eventName // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EarningsSourceImplCopyWith<$Res>
    implements $EarningsSourceCopyWith<$Res> {
  factory _$$EarningsSourceImplCopyWith(
    _$EarningsSourceImpl value,
    $Res Function(_$EarningsSourceImpl) then,
  ) = __$$EarningsSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String eventId,
    String eventName,
    String type,
    double amount,
    String date,
  });
}

/// @nodoc
class __$$EarningsSourceImplCopyWithImpl<$Res>
    extends _$EarningsSourceCopyWithImpl<$Res, _$EarningsSourceImpl>
    implements _$$EarningsSourceImplCopyWith<$Res> {
  __$$EarningsSourceImplCopyWithImpl(
    _$EarningsSourceImpl _value,
    $Res Function(_$EarningsSourceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EarningsSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventName = null,
    Object? type = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(
      _$EarningsSourceImpl(
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String,
        eventName: null == eventName
            ? _value.eventName
            : eventName // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EarningsSourceImpl implements _EarningsSource {
  const _$EarningsSourceImpl({
    required this.eventId,
    required this.eventName,
    required this.type,
    required this.amount,
    required this.date,
  });

  factory _$EarningsSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$EarningsSourceImplFromJson(json);

  @override
  final String eventId;
  @override
  final String eventName;
  @override
  final String type;
  @override
  final double amount;
  @override
  final String date;

  @override
  String toString() {
    return 'EarningsSource(eventId: $eventId, eventName: $eventName, type: $type, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EarningsSourceImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, eventName, type, amount, date);

  /// Create a copy of EarningsSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EarningsSourceImplCopyWith<_$EarningsSourceImpl> get copyWith =>
      __$$EarningsSourceImplCopyWithImpl<_$EarningsSourceImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String eventId,
      String eventName,
      String type,
      double amount,
      String date,
    )
    $default,
  ) {
    return $default(eventId, eventName, type, amount, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String eventId,
      String eventName,
      String type,
      double amount,
      String date,
    )?
    $default,
  ) {
    return $default?.call(eventId, eventName, type, amount, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String eventId,
      String eventName,
      String type,
      double amount,
      String date,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(eventId, eventName, type, amount, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EarningsSource value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EarningsSource value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EarningsSource value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EarningsSourceImplToJson(this);
  }
}

abstract class _EarningsSource implements EarningsSource {
  const factory _EarningsSource({
    required final String eventId,
    required final String eventName,
    required final String type,
    required final double amount,
    required final String date,
  }) = _$EarningsSourceImpl;

  factory _EarningsSource.fromJson(Map<String, dynamic> json) =
      _$EarningsSourceImpl.fromJson;

  @override
  String get eventId;
  @override
  String get eventName;
  @override
  String get type;
  @override
  double get amount;
  @override
  String get date;

  /// Create a copy of EarningsSource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EarningsSourceImplCopyWith<_$EarningsSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
