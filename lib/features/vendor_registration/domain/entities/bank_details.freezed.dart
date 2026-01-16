// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BankDetailsRequest _$BankDetailsRequestFromJson(Map<String, dynamic> json) {
  return _BankDetailsRequest.fromJson(json);
}

/// @nodoc
mixin _$BankDetailsRequest {
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
    TResult Function(_BankDetailsRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BankDetailsRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BankDetailsRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this BankDetailsRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankDetailsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankDetailsRequestCopyWith<BankDetailsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankDetailsRequestCopyWith<$Res> {
  factory $BankDetailsRequestCopyWith(
    BankDetailsRequest value,
    $Res Function(BankDetailsRequest) then,
  ) = _$BankDetailsRequestCopyWithImpl<$Res, BankDetailsRequest>;
  @useResult
  $Res call({String accountNumber, String bankCode, String accountName});
}

/// @nodoc
class _$BankDetailsRequestCopyWithImpl<$Res, $Val extends BankDetailsRequest>
    implements $BankDetailsRequestCopyWith<$Res> {
  _$BankDetailsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankDetailsRequest
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
abstract class _$$BankDetailsRequestImplCopyWith<$Res>
    implements $BankDetailsRequestCopyWith<$Res> {
  factory _$$BankDetailsRequestImplCopyWith(
    _$BankDetailsRequestImpl value,
    $Res Function(_$BankDetailsRequestImpl) then,
  ) = __$$BankDetailsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accountNumber, String bankCode, String accountName});
}

/// @nodoc
class __$$BankDetailsRequestImplCopyWithImpl<$Res>
    extends _$BankDetailsRequestCopyWithImpl<$Res, _$BankDetailsRequestImpl>
    implements _$$BankDetailsRequestImplCopyWith<$Res> {
  __$$BankDetailsRequestImplCopyWithImpl(
    _$BankDetailsRequestImpl _value,
    $Res Function(_$BankDetailsRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BankDetailsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
    Object? bankCode = null,
    Object? accountName = null,
  }) {
    return _then(
      _$BankDetailsRequestImpl(
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
class _$BankDetailsRequestImpl implements _BankDetailsRequest {
  const _$BankDetailsRequestImpl({
    required this.accountNumber,
    required this.bankCode,
    required this.accountName,
  });

  factory _$BankDetailsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankDetailsRequestImplFromJson(json);

  @override
  final String accountNumber;
  @override
  final String bankCode;
  @override
  final String accountName;

  @override
  String toString() {
    return 'BankDetailsRequest(accountNumber: $accountNumber, bankCode: $bankCode, accountName: $accountName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankDetailsRequestImpl &&
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

  /// Create a copy of BankDetailsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankDetailsRequestImplCopyWith<_$BankDetailsRequestImpl> get copyWith =>
      __$$BankDetailsRequestImplCopyWithImpl<_$BankDetailsRequestImpl>(
        this,
        _$identity,
      );

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
    TResult Function(_BankDetailsRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BankDetailsRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BankDetailsRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BankDetailsRequestImplToJson(this);
  }
}

abstract class _BankDetailsRequest implements BankDetailsRequest {
  const factory _BankDetailsRequest({
    required final String accountNumber,
    required final String bankCode,
    required final String accountName,
  }) = _$BankDetailsRequestImpl;

  factory _BankDetailsRequest.fromJson(Map<String, dynamic> json) =
      _$BankDetailsRequestImpl.fromJson;

  @override
  String get accountNumber;
  @override
  String get bankCode;
  @override
  String get accountName;

  /// Create a copy of BankDetailsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankDetailsRequestImplCopyWith<_$BankDetailsRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BankDetailsResponse _$BankDetailsResponseFromJson(Map<String, dynamic> json) {
  return _BankDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$BankDetailsResponse {
  String get accountNumber => throw _privateConstructorUsedError;
  String get bankCode => throw _privateConstructorUsedError;
  String get accountName => throw _privateConstructorUsedError;
  String get bankName => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String accountNumber,
      String bankCode,
      String accountName,
      String bankName,
      bool isVerified,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String accountNumber,
      String bankCode,
      String accountName,
      String bankName,
      bool isVerified,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String accountNumber,
      String bankCode,
      String accountName,
      String bankName,
      bool isVerified,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BankDetailsResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BankDetailsResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BankDetailsResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this BankDetailsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankDetailsResponseCopyWith<BankDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankDetailsResponseCopyWith<$Res> {
  factory $BankDetailsResponseCopyWith(
    BankDetailsResponse value,
    $Res Function(BankDetailsResponse) then,
  ) = _$BankDetailsResponseCopyWithImpl<$Res, BankDetailsResponse>;
  @useResult
  $Res call({
    String accountNumber,
    String bankCode,
    String accountName,
    String bankName,
    bool isVerified,
  });
}

/// @nodoc
class _$BankDetailsResponseCopyWithImpl<$Res, $Val extends BankDetailsResponse>
    implements $BankDetailsResponseCopyWith<$Res> {
  _$BankDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
    Object? bankCode = null,
    Object? accountName = null,
    Object? bankName = null,
    Object? isVerified = null,
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
            bankName: null == bankName
                ? _value.bankName
                : bankName // ignore: cast_nullable_to_non_nullable
                      as String,
            isVerified: null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BankDetailsResponseImplCopyWith<$Res>
    implements $BankDetailsResponseCopyWith<$Res> {
  factory _$$BankDetailsResponseImplCopyWith(
    _$BankDetailsResponseImpl value,
    $Res Function(_$BankDetailsResponseImpl) then,
  ) = __$$BankDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountNumber,
    String bankCode,
    String accountName,
    String bankName,
    bool isVerified,
  });
}

/// @nodoc
class __$$BankDetailsResponseImplCopyWithImpl<$Res>
    extends _$BankDetailsResponseCopyWithImpl<$Res, _$BankDetailsResponseImpl>
    implements _$$BankDetailsResponseImplCopyWith<$Res> {
  __$$BankDetailsResponseImplCopyWithImpl(
    _$BankDetailsResponseImpl _value,
    $Res Function(_$BankDetailsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BankDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
    Object? bankCode = null,
    Object? accountName = null,
    Object? bankName = null,
    Object? isVerified = null,
  }) {
    return _then(
      _$BankDetailsResponseImpl(
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
        bankName: null == bankName
            ? _value.bankName
            : bankName // ignore: cast_nullable_to_non_nullable
                  as String,
        isVerified: null == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BankDetailsResponseImpl implements _BankDetailsResponse {
  const _$BankDetailsResponseImpl({
    required this.accountNumber,
    required this.bankCode,
    required this.accountName,
    required this.bankName,
    required this.isVerified,
  });

  factory _$BankDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankDetailsResponseImplFromJson(json);

  @override
  final String accountNumber;
  @override
  final String bankCode;
  @override
  final String accountName;
  @override
  final String bankName;
  @override
  final bool isVerified;

  @override
  String toString() {
    return 'BankDetailsResponse(accountNumber: $accountNumber, bankCode: $bankCode, accountName: $accountName, bankName: $bankName, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankDetailsResponseImpl &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountNumber,
    bankCode,
    accountName,
    bankName,
    isVerified,
  );

  /// Create a copy of BankDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankDetailsResponseImplCopyWith<_$BankDetailsResponseImpl> get copyWith =>
      __$$BankDetailsResponseImplCopyWithImpl<_$BankDetailsResponseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String accountNumber,
      String bankCode,
      String accountName,
      String bankName,
      bool isVerified,
    )
    $default,
  ) {
    return $default(accountNumber, bankCode, accountName, bankName, isVerified);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String accountNumber,
      String bankCode,
      String accountName,
      String bankName,
      bool isVerified,
    )?
    $default,
  ) {
    return $default?.call(
      accountNumber,
      bankCode,
      accountName,
      bankName,
      isVerified,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String accountNumber,
      String bankCode,
      String accountName,
      String bankName,
      bool isVerified,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        accountNumber,
        bankCode,
        accountName,
        bankName,
        isVerified,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BankDetailsResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BankDetailsResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BankDetailsResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BankDetailsResponseImplToJson(this);
  }
}

abstract class _BankDetailsResponse implements BankDetailsResponse {
  const factory _BankDetailsResponse({
    required final String accountNumber,
    required final String bankCode,
    required final String accountName,
    required final String bankName,
    required final bool isVerified,
  }) = _$BankDetailsResponseImpl;

  factory _BankDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$BankDetailsResponseImpl.fromJson;

  @override
  String get accountNumber;
  @override
  String get bankCode;
  @override
  String get accountName;
  @override
  String get bankName;
  @override
  bool get isVerified;

  /// Create a copy of BankDetailsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankDetailsResponseImplCopyWith<_$BankDetailsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
