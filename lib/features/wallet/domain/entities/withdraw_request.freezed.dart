// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WithdrawRequest _$WithdrawRequestFromJson(Map<String, dynamic> json) {
  return _WithdrawRequest.fromJson(json);
}

/// @nodoc
mixin _$WithdrawRequest {
  double get amount => throw _privateConstructorUsedError;
  BankAccount get bankAccount => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double amount, BankAccount bankAccount) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double amount, BankAccount bankAccount)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double amount, BankAccount bankAccount)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WithdrawRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WithdrawRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WithdrawRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this WithdrawRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WithdrawRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WithdrawRequestCopyWith<WithdrawRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawRequestCopyWith<$Res> {
  factory $WithdrawRequestCopyWith(
    WithdrawRequest value,
    $Res Function(WithdrawRequest) then,
  ) = _$WithdrawRequestCopyWithImpl<$Res, WithdrawRequest>;
  @useResult
  $Res call({double amount, BankAccount bankAccount});

  $BankAccountCopyWith<$Res> get bankAccount;
}

/// @nodoc
class _$WithdrawRequestCopyWithImpl<$Res, $Val extends WithdrawRequest>
    implements $WithdrawRequestCopyWith<$Res> {
  _$WithdrawRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WithdrawRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? bankAccount = null}) {
    return _then(
      _value.copyWith(
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            bankAccount: null == bankAccount
                ? _value.bankAccount
                : bankAccount // ignore: cast_nullable_to_non_nullable
                      as BankAccount,
          )
          as $Val,
    );
  }

  /// Create a copy of WithdrawRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BankAccountCopyWith<$Res> get bankAccount {
    return $BankAccountCopyWith<$Res>(_value.bankAccount, (value) {
      return _then(_value.copyWith(bankAccount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WithdrawRequestImplCopyWith<$Res>
    implements $WithdrawRequestCopyWith<$Res> {
  factory _$$WithdrawRequestImplCopyWith(
    _$WithdrawRequestImpl value,
    $Res Function(_$WithdrawRequestImpl) then,
  ) = __$$WithdrawRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, BankAccount bankAccount});

  @override
  $BankAccountCopyWith<$Res> get bankAccount;
}

/// @nodoc
class __$$WithdrawRequestImplCopyWithImpl<$Res>
    extends _$WithdrawRequestCopyWithImpl<$Res, _$WithdrawRequestImpl>
    implements _$$WithdrawRequestImplCopyWith<$Res> {
  __$$WithdrawRequestImplCopyWithImpl(
    _$WithdrawRequestImpl _value,
    $Res Function(_$WithdrawRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WithdrawRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? bankAccount = null}) {
    return _then(
      _$WithdrawRequestImpl(
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        bankAccount: null == bankAccount
            ? _value.bankAccount
            : bankAccount // ignore: cast_nullable_to_non_nullable
                  as BankAccount,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WithdrawRequestImpl implements _WithdrawRequest {
  const _$WithdrawRequestImpl({
    required this.amount,
    required this.bankAccount,
  });

  factory _$WithdrawRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithdrawRequestImplFromJson(json);

  @override
  final double amount;
  @override
  final BankAccount bankAccount;

  @override
  String toString() {
    return 'WithdrawRequest(amount: $amount, bankAccount: $bankAccount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, bankAccount);

  /// Create a copy of WithdrawRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawRequestImplCopyWith<_$WithdrawRequestImpl> get copyWith =>
      __$$WithdrawRequestImplCopyWithImpl<_$WithdrawRequestImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double amount, BankAccount bankAccount) $default,
  ) {
    return $default(amount, bankAccount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double amount, BankAccount bankAccount)? $default,
  ) {
    return $default?.call(amount, bankAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double amount, BankAccount bankAccount)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(amount, bankAccount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WithdrawRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WithdrawRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WithdrawRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WithdrawRequestImplToJson(this);
  }
}

abstract class _WithdrawRequest implements WithdrawRequest {
  const factory _WithdrawRequest({
    required final double amount,
    required final BankAccount bankAccount,
  }) = _$WithdrawRequestImpl;

  factory _WithdrawRequest.fromJson(Map<String, dynamic> json) =
      _$WithdrawRequestImpl.fromJson;

  @override
  double get amount;
  @override
  BankAccount get bankAccount;

  /// Create a copy of WithdrawRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WithdrawRequestImplCopyWith<_$WithdrawRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) {
  return _BankAccount.fromJson(json);
}

/// @nodoc
mixin _$BankAccount {
  String get accountNumber => throw _privateConstructorUsedError;
  String get bankCode => throw _privateConstructorUsedError;
  String get accountName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String accountNumber, String bankCode, String accountName)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String accountNumber,
      String bankCode,
      String accountName,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String accountNumber, String bankCode, String accountName)?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BankAccount value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BankAccount value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BankAccount value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this BankAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankAccountCopyWith<BankAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountCopyWith<$Res> {
  factory $BankAccountCopyWith(
    BankAccount value,
    $Res Function(BankAccount) then,
  ) = _$BankAccountCopyWithImpl<$Res, BankAccount>;
  @useResult
  $Res call({String accountNumber, String bankCode, String accountName});
}

/// @nodoc
class _$BankAccountCopyWithImpl<$Res, $Val extends BankAccount>
    implements $BankAccountCopyWith<$Res> {
  _$BankAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
    Object? bankCode = null,
    Object? accountName = null,
  }) {
    return _then(
      _value.copyWith(
            accountNumber: null == accountNumber
                ? _value.accountNumber
                : accountNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            bankCode: null == bankCode
                ? _value.bankCode
                : bankCode // ignore: cast_nullable_to_non_nullable
                      as String,
            accountName: null == accountName
                ? _value.accountName
                : accountName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BankAccountImplCopyWith<$Res>
    implements $BankAccountCopyWith<$Res> {
  factory _$$BankAccountImplCopyWith(
    _$BankAccountImpl value,
    $Res Function(_$BankAccountImpl) then,
  ) = __$$BankAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accountNumber, String bankCode, String accountName});
}

/// @nodoc
class __$$BankAccountImplCopyWithImpl<$Res>
    extends _$BankAccountCopyWithImpl<$Res, _$BankAccountImpl>
    implements _$$BankAccountImplCopyWith<$Res> {
  __$$BankAccountImplCopyWithImpl(
    _$BankAccountImpl _value,
    $Res Function(_$BankAccountImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
    Object? bankCode = null,
    Object? accountName = null,
  }) {
    return _then(
      _$BankAccountImpl(
        accountNumber: null == accountNumber
            ? _value.accountNumber
            : accountNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        bankCode: null == bankCode
            ? _value.bankCode
            : bankCode // ignore: cast_nullable_to_non_nullable
                  as String,
        accountName: null == accountName
            ? _value.accountName
            : accountName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BankAccountImpl implements _BankAccount {
  const _$BankAccountImpl({
    required this.accountNumber,
    required this.bankCode,
    required this.accountName,
  });

  factory _$BankAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankAccountImplFromJson(json);

  @override
  final String accountNumber;
  @override
  final String bankCode;
  @override
  final String accountName;

  @override
  String toString() {
    return 'BankAccount(accountNumber: $accountNumber, bankCode: $bankCode, accountName: $accountName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountImpl &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accountNumber, bankCode, accountName);

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankAccountImplCopyWith<_$BankAccountImpl> get copyWith =>
      __$$BankAccountImplCopyWithImpl<_$BankAccountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String accountNumber, String bankCode, String accountName)
    $default,
  ) {
    return $default(accountNumber, bankCode, accountName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String accountNumber,
      String bankCode,
      String accountName,
    )?
    $default,
  ) {
    return $default?.call(accountNumber, bankCode, accountName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String accountNumber, String bankCode, String accountName)?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(accountNumber, bankCode, accountName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BankAccount value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BankAccount value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BankAccount value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BankAccountImplToJson(this);
  }
}

abstract class _BankAccount implements BankAccount {
  const factory _BankAccount({
    required final String accountNumber,
    required final String bankCode,
    required final String accountName,
  }) = _$BankAccountImpl;

  factory _BankAccount.fromJson(Map<String, dynamic> json) =
      _$BankAccountImpl.fromJson;

  @override
  String get accountNumber;
  @override
  String get bankCode;
  @override
  String get accountName;

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankAccountImplCopyWith<_$BankAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WithdrawResponse _$WithdrawResponseFromJson(Map<String, dynamic> json) {
  return _WithdrawResponse.fromJson(json);
}

/// @nodoc
mixin _$WithdrawResponse {
  String get withdrawalId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get estimatedArrival => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String withdrawalId,
      double amount,
      String currency,
      String status,
      String estimatedArrival,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String withdrawalId,
      double amount,
      String currency,
      String status,
      String estimatedArrival,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String withdrawalId,
      double amount,
      String currency,
      String status,
      String estimatedArrival,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WithdrawResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WithdrawResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WithdrawResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this WithdrawResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WithdrawResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WithdrawResponseCopyWith<WithdrawResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawResponseCopyWith<$Res> {
  factory $WithdrawResponseCopyWith(
    WithdrawResponse value,
    $Res Function(WithdrawResponse) then,
  ) = _$WithdrawResponseCopyWithImpl<$Res, WithdrawResponse>;
  @useResult
  $Res call({
    String withdrawalId,
    double amount,
    String currency,
    String status,
    String estimatedArrival,
  });
}

/// @nodoc
class _$WithdrawResponseCopyWithImpl<$Res, $Val extends WithdrawResponse>
    implements $WithdrawResponseCopyWith<$Res> {
  _$WithdrawResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WithdrawResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withdrawalId = null,
    Object? amount = null,
    Object? currency = null,
    Object? status = null,
    Object? estimatedArrival = null,
  }) {
    return _then(
      _value.copyWith(
            withdrawalId: null == withdrawalId
                ? _value.withdrawalId
                : withdrawalId // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            estimatedArrival: null == estimatedArrival
                ? _value.estimatedArrival
                : estimatedArrival // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WithdrawResponseImplCopyWith<$Res>
    implements $WithdrawResponseCopyWith<$Res> {
  factory _$$WithdrawResponseImplCopyWith(
    _$WithdrawResponseImpl value,
    $Res Function(_$WithdrawResponseImpl) then,
  ) = __$$WithdrawResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String withdrawalId,
    double amount,
    String currency,
    String status,
    String estimatedArrival,
  });
}

/// @nodoc
class __$$WithdrawResponseImplCopyWithImpl<$Res>
    extends _$WithdrawResponseCopyWithImpl<$Res, _$WithdrawResponseImpl>
    implements _$$WithdrawResponseImplCopyWith<$Res> {
  __$$WithdrawResponseImplCopyWithImpl(
    _$WithdrawResponseImpl _value,
    $Res Function(_$WithdrawResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WithdrawResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? withdrawalId = null,
    Object? amount = null,
    Object? currency = null,
    Object? status = null,
    Object? estimatedArrival = null,
  }) {
    return _then(
      _$WithdrawResponseImpl(
        withdrawalId: null == withdrawalId
            ? _value.withdrawalId
            : withdrawalId // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        estimatedArrival: null == estimatedArrival
            ? _value.estimatedArrival
            : estimatedArrival // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WithdrawResponseImpl implements _WithdrawResponse {
  const _$WithdrawResponseImpl({
    required this.withdrawalId,
    required this.amount,
    required this.currency,
    required this.status,
    required this.estimatedArrival,
  });

  factory _$WithdrawResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WithdrawResponseImplFromJson(json);

  @override
  final String withdrawalId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String status;
  @override
  final String estimatedArrival;

  @override
  String toString() {
    return 'WithdrawResponse(withdrawalId: $withdrawalId, amount: $amount, currency: $currency, status: $status, estimatedArrival: $estimatedArrival)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WithdrawResponseImpl &&
            (identical(other.withdrawalId, withdrawalId) ||
                other.withdrawalId == withdrawalId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.estimatedArrival, estimatedArrival) ||
                other.estimatedArrival == estimatedArrival));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    withdrawalId,
    amount,
    currency,
    status,
    estimatedArrival,
  );

  /// Create a copy of WithdrawResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WithdrawResponseImplCopyWith<_$WithdrawResponseImpl> get copyWith =>
      __$$WithdrawResponseImplCopyWithImpl<_$WithdrawResponseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String withdrawalId,
      double amount,
      String currency,
      String status,
      String estimatedArrival,
    )
    $default,
  ) {
    return $default(withdrawalId, amount, currency, status, estimatedArrival);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String withdrawalId,
      double amount,
      String currency,
      String status,
      String estimatedArrival,
    )?
    $default,
  ) {
    return $default?.call(
      withdrawalId,
      amount,
      currency,
      status,
      estimatedArrival,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String withdrawalId,
      double amount,
      String currency,
      String status,
      String estimatedArrival,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(withdrawalId, amount, currency, status, estimatedArrival);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WithdrawResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WithdrawResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WithdrawResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WithdrawResponseImplToJson(this);
  }
}

abstract class _WithdrawResponse implements WithdrawResponse {
  const factory _WithdrawResponse({
    required final String withdrawalId,
    required final double amount,
    required final String currency,
    required final String status,
    required final String estimatedArrival,
  }) = _$WithdrawResponseImpl;

  factory _WithdrawResponse.fromJson(Map<String, dynamic> json) =
      _$WithdrawResponseImpl.fromJson;

  @override
  String get withdrawalId;
  @override
  double get amount;
  @override
  String get currency;
  @override
  String get status;
  @override
  String get estimatedArrival;

  /// Create a copy of WithdrawResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WithdrawResponseImplCopyWith<_$WithdrawResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
