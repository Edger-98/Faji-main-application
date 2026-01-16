// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CounterOfferRequest _$CounterOfferRequestFromJson(Map<String, dynamic> json) {
  return _CounterOfferRequest.fromJson(json);
}

/// @nodoc
mixin _$CounterOfferRequest {
  double get counterPrice => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double counterPrice, String? message) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double counterPrice, String? message)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double counterPrice, String? message)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CounterOfferRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CounterOfferRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CounterOfferRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this CounterOfferRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CounterOfferRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CounterOfferRequestCopyWith<CounterOfferRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterOfferRequestCopyWith<$Res> {
  factory $CounterOfferRequestCopyWith(
    CounterOfferRequest value,
    $Res Function(CounterOfferRequest) then,
  ) = _$CounterOfferRequestCopyWithImpl<$Res, CounterOfferRequest>;
  @useResult
  $Res call({double counterPrice, String? message});
}

/// @nodoc
class _$CounterOfferRequestCopyWithImpl<$Res, $Val extends CounterOfferRequest>
    implements $CounterOfferRequestCopyWith<$Res> {
  _$CounterOfferRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CounterOfferRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? counterPrice = null, Object? message = freezed}) {
    return _then(
      _value.copyWith(
            counterPrice: null == counterPrice
                ? _value.counterPrice
                : counterPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CounterOfferRequestImplCopyWith<$Res>
    implements $CounterOfferRequestCopyWith<$Res> {
  factory _$$CounterOfferRequestImplCopyWith(
    _$CounterOfferRequestImpl value,
    $Res Function(_$CounterOfferRequestImpl) then,
  ) = __$$CounterOfferRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double counterPrice, String? message});
}

/// @nodoc
class __$$CounterOfferRequestImplCopyWithImpl<$Res>
    extends _$CounterOfferRequestCopyWithImpl<$Res, _$CounterOfferRequestImpl>
    implements _$$CounterOfferRequestImplCopyWith<$Res> {
  __$$CounterOfferRequestImplCopyWithImpl(
    _$CounterOfferRequestImpl _value,
    $Res Function(_$CounterOfferRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CounterOfferRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? counterPrice = null, Object? message = freezed}) {
    return _then(
      _$CounterOfferRequestImpl(
        counterPrice: null == counterPrice
            ? _value.counterPrice
            : counterPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CounterOfferRequestImpl implements _CounterOfferRequest {
  const _$CounterOfferRequestImpl({required this.counterPrice, this.message});

  factory _$CounterOfferRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CounterOfferRequestImplFromJson(json);

  @override
  final double counterPrice;
  @override
  final String? message;

  @override
  String toString() {
    return 'CounterOfferRequest(counterPrice: $counterPrice, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterOfferRequestImpl &&
            (identical(other.counterPrice, counterPrice) ||
                other.counterPrice == counterPrice) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, counterPrice, message);

  /// Create a copy of CounterOfferRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterOfferRequestImplCopyWith<_$CounterOfferRequestImpl> get copyWith =>
      __$$CounterOfferRequestImplCopyWithImpl<_$CounterOfferRequestImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double counterPrice, String? message) $default,
  ) {
    return $default(counterPrice, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double counterPrice, String? message)? $default,
  ) {
    return $default?.call(counterPrice, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double counterPrice, String? message)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(counterPrice, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CounterOfferRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CounterOfferRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CounterOfferRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CounterOfferRequestImplToJson(this);
  }
}

abstract class _CounterOfferRequest implements CounterOfferRequest {
  const factory _CounterOfferRequest({
    required final double counterPrice,
    final String? message,
  }) = _$CounterOfferRequestImpl;

  factory _CounterOfferRequest.fromJson(Map<String, dynamic> json) =
      _$CounterOfferRequestImpl.fromJson;

  @override
  double get counterPrice;
  @override
  String? get message;

  /// Create a copy of CounterOfferRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CounterOfferRequestImplCopyWith<_$CounterOfferRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CounterOfferResponse _$CounterOfferResponseFromJson(Map<String, dynamic> json) {
  return _CounterOfferResponse.fromJson(json);
}

/// @nodoc
mixin _$CounterOfferResponse {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get counterPrice => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String status,
      double counterPrice,
      String? message,
      String updatedAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String status,
      double counterPrice,
      String? message,
      String updatedAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String status,
      double counterPrice,
      String? message,
      String updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CounterOfferResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CounterOfferResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CounterOfferResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this CounterOfferResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CounterOfferResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CounterOfferResponseCopyWith<CounterOfferResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterOfferResponseCopyWith<$Res> {
  factory $CounterOfferResponseCopyWith(
    CounterOfferResponse value,
    $Res Function(CounterOfferResponse) then,
  ) = _$CounterOfferResponseCopyWithImpl<$Res, CounterOfferResponse>;
  @useResult
  $Res call({
    String id,
    String status,
    double counterPrice,
    String? message,
    String updatedAt,
  });
}

/// @nodoc
class _$CounterOfferResponseCopyWithImpl<
  $Res,
  $Val extends CounterOfferResponse
>
    implements $CounterOfferResponseCopyWith<$Res> {
  _$CounterOfferResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CounterOfferResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? counterPrice = null,
    Object? message = freezed,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            counterPrice: null == counterPrice
                ? _value.counterPrice
                : counterPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CounterOfferResponseImplCopyWith<$Res>
    implements $CounterOfferResponseCopyWith<$Res> {
  factory _$$CounterOfferResponseImplCopyWith(
    _$CounterOfferResponseImpl value,
    $Res Function(_$CounterOfferResponseImpl) then,
  ) = __$$CounterOfferResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String status,
    double counterPrice,
    String? message,
    String updatedAt,
  });
}

/// @nodoc
class __$$CounterOfferResponseImplCopyWithImpl<$Res>
    extends _$CounterOfferResponseCopyWithImpl<$Res, _$CounterOfferResponseImpl>
    implements _$$CounterOfferResponseImplCopyWith<$Res> {
  __$$CounterOfferResponseImplCopyWithImpl(
    _$CounterOfferResponseImpl _value,
    $Res Function(_$CounterOfferResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CounterOfferResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? counterPrice = null,
    Object? message = freezed,
    Object? updatedAt = null,
  }) {
    return _then(
      _$CounterOfferResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        counterPrice: null == counterPrice
            ? _value.counterPrice
            : counterPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CounterOfferResponseImpl implements _CounterOfferResponse {
  const _$CounterOfferResponseImpl({
    required this.id,
    required this.status,
    required this.counterPrice,
    this.message,
    required this.updatedAt,
  });

  factory _$CounterOfferResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CounterOfferResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String status;
  @override
  final double counterPrice;
  @override
  final String? message;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'CounterOfferResponse(id: $id, status: $status, counterPrice: $counterPrice, message: $message, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterOfferResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.counterPrice, counterPrice) ||
                other.counterPrice == counterPrice) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, counterPrice, message, updatedAt);

  /// Create a copy of CounterOfferResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterOfferResponseImplCopyWith<_$CounterOfferResponseImpl>
  get copyWith =>
      __$$CounterOfferResponseImplCopyWithImpl<_$CounterOfferResponseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String status,
      double counterPrice,
      String? message,
      String updatedAt,
    )
    $default,
  ) {
    return $default(id, status, counterPrice, message, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String status,
      double counterPrice,
      String? message,
      String updatedAt,
    )?
    $default,
  ) {
    return $default?.call(id, status, counterPrice, message, updatedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String status,
      double counterPrice,
      String? message,
      String updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, status, counterPrice, message, updatedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CounterOfferResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CounterOfferResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CounterOfferResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CounterOfferResponseImplToJson(this);
  }
}

abstract class _CounterOfferResponse implements CounterOfferResponse {
  const factory _CounterOfferResponse({
    required final String id,
    required final String status,
    required final double counterPrice,
    final String? message,
    required final String updatedAt,
  }) = _$CounterOfferResponseImpl;

  factory _CounterOfferResponse.fromJson(Map<String, dynamic> json) =
      _$CounterOfferResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  double get counterPrice;
  @override
  String? get message;
  @override
  String get updatedAt;

  /// Create a copy of CounterOfferResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CounterOfferResponseImplCopyWith<_$CounterOfferResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
