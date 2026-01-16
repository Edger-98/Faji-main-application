// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WalletBalance _$WalletBalanceFromJson(Map<String, dynamic> json) {
  return _WalletBalance.fromJson(json);
}

/// @nodoc
mixin _$WalletBalance {
  double get balance => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get currencySymbol => throw _privateConstructorUsedError;
  double get pendingBalance => throw _privateConstructorUsedError;
  double get availableBalance => throw _privateConstructorUsedError;
  double get escrowBalance => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      double balance,
      String currency,
      String currencySymbol,
      double pendingBalance,
      double availableBalance,
      double escrowBalance,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double balance,
      String currency,
      String currencySymbol,
      double pendingBalance,
      double availableBalance,
      double escrowBalance,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double balance,
      String currency,
      String currencySymbol,
      double pendingBalance,
      double availableBalance,
      double escrowBalance,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WalletBalance value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WalletBalance value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WalletBalance value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this WalletBalance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletBalanceCopyWith<WalletBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletBalanceCopyWith<$Res> {
  factory $WalletBalanceCopyWith(
    WalletBalance value,
    $Res Function(WalletBalance) then,
  ) = _$WalletBalanceCopyWithImpl<$Res, WalletBalance>;
  @useResult
  $Res call({
    double balance,
    String currency,
    String currencySymbol,
    double pendingBalance,
    double availableBalance,
    double escrowBalance,
  });
}

/// @nodoc
class _$WalletBalanceCopyWithImpl<$Res, $Val extends WalletBalance>
    implements $WalletBalanceCopyWith<$Res> {
  _$WalletBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? currency = null,
    Object? currencySymbol = null,
    Object? pendingBalance = null,
    Object? availableBalance = null,
    Object? escrowBalance = null,
  }) {
    return _then(
      _value.copyWith(
            balance: null == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            currencySymbol: null == currencySymbol
                ? _value.currencySymbol
                : currencySymbol // ignore: cast_nullable_to_non_nullable
                      as String,
            pendingBalance: null == pendingBalance
                ? _value.pendingBalance
                : pendingBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            availableBalance: null == availableBalance
                ? _value.availableBalance
                : availableBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            escrowBalance: null == escrowBalance
                ? _value.escrowBalance
                : escrowBalance // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WalletBalanceImplCopyWith<$Res>
    implements $WalletBalanceCopyWith<$Res> {
  factory _$$WalletBalanceImplCopyWith(
    _$WalletBalanceImpl value,
    $Res Function(_$WalletBalanceImpl) then,
  ) = __$$WalletBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double balance,
    String currency,
    String currencySymbol,
    double pendingBalance,
    double availableBalance,
    double escrowBalance,
  });
}

/// @nodoc
class __$$WalletBalanceImplCopyWithImpl<$Res>
    extends _$WalletBalanceCopyWithImpl<$Res, _$WalletBalanceImpl>
    implements _$$WalletBalanceImplCopyWith<$Res> {
  __$$WalletBalanceImplCopyWithImpl(
    _$WalletBalanceImpl _value,
    $Res Function(_$WalletBalanceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WalletBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? currency = null,
    Object? currencySymbol = null,
    Object? pendingBalance = null,
    Object? availableBalance = null,
    Object? escrowBalance = null,
  }) {
    return _then(
      _$WalletBalanceImpl(
        balance: null == balance
            ? _value.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        currencySymbol: null == currencySymbol
            ? _value.currencySymbol
            : currencySymbol // ignore: cast_nullable_to_non_nullable
                  as String,
        pendingBalance: null == pendingBalance
            ? _value.pendingBalance
            : pendingBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        availableBalance: null == availableBalance
            ? _value.availableBalance
            : availableBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        escrowBalance: null == escrowBalance
            ? _value.escrowBalance
            : escrowBalance // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletBalanceImpl implements _WalletBalance {
  const _$WalletBalanceImpl({
    required this.balance,
    required this.currency,
    required this.currencySymbol,
    required this.pendingBalance,
    required this.availableBalance,
    required this.escrowBalance,
  });

  factory _$WalletBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletBalanceImplFromJson(json);

  @override
  final double balance;
  @override
  final String currency;
  @override
  final String currencySymbol;
  @override
  final double pendingBalance;
  @override
  final double availableBalance;
  @override
  final double escrowBalance;

  @override
  String toString() {
    return 'WalletBalance(balance: $balance, currency: $currency, currencySymbol: $currencySymbol, pendingBalance: $pendingBalance, availableBalance: $availableBalance, escrowBalance: $escrowBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletBalanceImpl &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.pendingBalance, pendingBalance) ||
                other.pendingBalance == pendingBalance) &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance) &&
            (identical(other.escrowBalance, escrowBalance) ||
                other.escrowBalance == escrowBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    balance,
    currency,
    currencySymbol,
    pendingBalance,
    availableBalance,
    escrowBalance,
  );

  /// Create a copy of WalletBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletBalanceImplCopyWith<_$WalletBalanceImpl> get copyWith =>
      __$$WalletBalanceImplCopyWithImpl<_$WalletBalanceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      double balance,
      String currency,
      String currencySymbol,
      double pendingBalance,
      double availableBalance,
      double escrowBalance,
    )
    $default,
  ) {
    return $default(
      balance,
      currency,
      currencySymbol,
      pendingBalance,
      availableBalance,
      escrowBalance,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double balance,
      String currency,
      String currencySymbol,
      double pendingBalance,
      double availableBalance,
      double escrowBalance,
    )?
    $default,
  ) {
    return $default?.call(
      balance,
      currency,
      currencySymbol,
      pendingBalance,
      availableBalance,
      escrowBalance,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double balance,
      String currency,
      String currencySymbol,
      double pendingBalance,
      double availableBalance,
      double escrowBalance,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        balance,
        currency,
        currencySymbol,
        pendingBalance,
        availableBalance,
        escrowBalance,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WalletBalance value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WalletBalance value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WalletBalance value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletBalanceImplToJson(this);
  }
}

abstract class _WalletBalance implements WalletBalance {
  const factory _WalletBalance({
    required final double balance,
    required final String currency,
    required final String currencySymbol,
    required final double pendingBalance,
    required final double availableBalance,
    required final double escrowBalance,
  }) = _$WalletBalanceImpl;

  factory _WalletBalance.fromJson(Map<String, dynamic> json) =
      _$WalletBalanceImpl.fromJson;

  @override
  double get balance;
  @override
  String get currency;
  @override
  String get currencySymbol;
  @override
  double get pendingBalance;
  @override
  double get availableBalance;
  @override
  double get escrowBalance;

  /// Create a copy of WalletBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletBalanceImplCopyWith<_$WalletBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
