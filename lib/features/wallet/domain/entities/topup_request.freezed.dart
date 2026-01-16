// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topup_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TopupRequest _$TopupRequestFromJson(Map<String, dynamic> json) {
  return _TopupRequest.fromJson(json);
}

/// @nodoc
mixin _$TopupRequest {
  double get amount => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double amount, String paymentMethod) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double amount, String paymentMethod)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double amount, String paymentMethod)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TopupRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TopupRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TopupRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this TopupRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopupRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopupRequestCopyWith<TopupRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopupRequestCopyWith<$Res> {
  factory $TopupRequestCopyWith(
    TopupRequest value,
    $Res Function(TopupRequest) then,
  ) = _$TopupRequestCopyWithImpl<$Res, TopupRequest>;
  @useResult
  $Res call({double amount, String paymentMethod});
}

/// @nodoc
class _$TopupRequestCopyWithImpl<$Res, $Val extends TopupRequest>
    implements $TopupRequestCopyWith<$Res> {
  _$TopupRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopupRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? paymentMethod = null}) {
    return _then(
      _value.copyWith(
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            paymentMethod: null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TopupRequestImplCopyWith<$Res>
    implements $TopupRequestCopyWith<$Res> {
  factory _$$TopupRequestImplCopyWith(
    _$TopupRequestImpl value,
    $Res Function(_$TopupRequestImpl) then,
  ) = __$$TopupRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String paymentMethod});
}

/// @nodoc
class __$$TopupRequestImplCopyWithImpl<$Res>
    extends _$TopupRequestCopyWithImpl<$Res, _$TopupRequestImpl>
    implements _$$TopupRequestImplCopyWith<$Res> {
  __$$TopupRequestImplCopyWithImpl(
    _$TopupRequestImpl _value,
    $Res Function(_$TopupRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TopupRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? amount = null, Object? paymentMethod = null}) {
    return _then(
      _$TopupRequestImpl(
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        paymentMethod: null == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TopupRequestImpl implements _TopupRequest {
  const _$TopupRequestImpl({required this.amount, required this.paymentMethod});

  factory _$TopupRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopupRequestImplFromJson(json);

  @override
  final double amount;
  @override
  final String paymentMethod;

  @override
  String toString() {
    return 'TopupRequest(amount: $amount, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopupRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, paymentMethod);

  /// Create a copy of TopupRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopupRequestImplCopyWith<_$TopupRequestImpl> get copyWith =>
      __$$TopupRequestImplCopyWithImpl<_$TopupRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double amount, String paymentMethod) $default,
  ) {
    return $default(amount, paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double amount, String paymentMethod)? $default,
  ) {
    return $default?.call(amount, paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double amount, String paymentMethod)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(amount, paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TopupRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TopupRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TopupRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TopupRequestImplToJson(this);
  }
}

abstract class _TopupRequest implements TopupRequest {
  const factory _TopupRequest({
    required final double amount,
    required final String paymentMethod,
  }) = _$TopupRequestImpl;

  factory _TopupRequest.fromJson(Map<String, dynamic> json) =
      _$TopupRequestImpl.fromJson;

  @override
  double get amount;
  @override
  String get paymentMethod;

  /// Create a copy of TopupRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopupRequestImplCopyWith<_$TopupRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TopupResponse _$TopupResponseFromJson(Map<String, dynamic> json) {
  return _TopupResponse.fromJson(json);
}

/// @nodoc
mixin _$TopupResponse {
  String get topupId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get paymentUrl => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String topupId,
      double amount,
      String currency,
      String paymentUrl,
      String reference,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String topupId,
      double amount,
      String currency,
      String paymentUrl,
      String reference,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String topupId,
      double amount,
      String currency,
      String paymentUrl,
      String reference,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TopupResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TopupResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TopupResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this TopupResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopupResponseCopyWith<TopupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopupResponseCopyWith<$Res> {
  factory $TopupResponseCopyWith(
    TopupResponse value,
    $Res Function(TopupResponse) then,
  ) = _$TopupResponseCopyWithImpl<$Res, TopupResponse>;
  @useResult
  $Res call({
    String topupId,
    double amount,
    String currency,
    String paymentUrl,
    String reference,
  });
}

/// @nodoc
class _$TopupResponseCopyWithImpl<$Res, $Val extends TopupResponse>
    implements $TopupResponseCopyWith<$Res> {
  _$TopupResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topupId = null,
    Object? amount = null,
    Object? currency = null,
    Object? paymentUrl = null,
    Object? reference = null,
  }) {
    return _then(
      _value.copyWith(
            topupId: null == topupId
                ? _value.topupId
                : topupId // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentUrl: null == paymentUrl
                ? _value.paymentUrl
                : paymentUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            reference: null == reference
                ? _value.reference
                : reference // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TopupResponseImplCopyWith<$Res>
    implements $TopupResponseCopyWith<$Res> {
  factory _$$TopupResponseImplCopyWith(
    _$TopupResponseImpl value,
    $Res Function(_$TopupResponseImpl) then,
  ) = __$$TopupResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String topupId,
    double amount,
    String currency,
    String paymentUrl,
    String reference,
  });
}

/// @nodoc
class __$$TopupResponseImplCopyWithImpl<$Res>
    extends _$TopupResponseCopyWithImpl<$Res, _$TopupResponseImpl>
    implements _$$TopupResponseImplCopyWith<$Res> {
  __$$TopupResponseImplCopyWithImpl(
    _$TopupResponseImpl _value,
    $Res Function(_$TopupResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TopupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topupId = null,
    Object? amount = null,
    Object? currency = null,
    Object? paymentUrl = null,
    Object? reference = null,
  }) {
    return _then(
      _$TopupResponseImpl(
        topupId: null == topupId
            ? _value.topupId
            : topupId // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentUrl: null == paymentUrl
            ? _value.paymentUrl
            : paymentUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        reference: null == reference
            ? _value.reference
            : reference // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TopupResponseImpl implements _TopupResponse {
  const _$TopupResponseImpl({
    required this.topupId,
    required this.amount,
    required this.currency,
    required this.paymentUrl,
    required this.reference,
  });

  factory _$TopupResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopupResponseImplFromJson(json);

  @override
  final String topupId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String paymentUrl;
  @override
  final String reference;

  @override
  String toString() {
    return 'TopupResponse(topupId: $topupId, amount: $amount, currency: $currency, paymentUrl: $paymentUrl, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopupResponseImpl &&
            (identical(other.topupId, topupId) || other.topupId == topupId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    topupId,
    amount,
    currency,
    paymentUrl,
    reference,
  );

  /// Create a copy of TopupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopupResponseImplCopyWith<_$TopupResponseImpl> get copyWith =>
      __$$TopupResponseImplCopyWithImpl<_$TopupResponseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String topupId,
      double amount,
      String currency,
      String paymentUrl,
      String reference,
    )
    $default,
  ) {
    return $default(topupId, amount, currency, paymentUrl, reference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String topupId,
      double amount,
      String currency,
      String paymentUrl,
      String reference,
    )?
    $default,
  ) {
    return $default?.call(topupId, amount, currency, paymentUrl, reference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String topupId,
      double amount,
      String currency,
      String paymentUrl,
      String reference,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(topupId, amount, currency, paymentUrl, reference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TopupResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TopupResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TopupResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TopupResponseImplToJson(this);
  }
}

abstract class _TopupResponse implements TopupResponse {
  const factory _TopupResponse({
    required final String topupId,
    required final double amount,
    required final String currency,
    required final String paymentUrl,
    required final String reference,
  }) = _$TopupResponseImpl;

  factory _TopupResponse.fromJson(Map<String, dynamic> json) =
      _$TopupResponseImpl.fromJson;

  @override
  String get topupId;
  @override
  double get amount;
  @override
  String get currency;
  @override
  String get paymentUrl;
  @override
  String get reference;

  /// Create a copy of TopupResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopupResponseImplCopyWith<_$TopupResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
