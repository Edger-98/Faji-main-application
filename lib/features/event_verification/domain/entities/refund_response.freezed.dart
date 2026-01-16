// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RefundResponse _$RefundResponseFromJson(Map<String, dynamic> json) {
  return _RefundResponse.fromJson(json);
}

/// @nodoc
mixin _$RefundResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  RefundResult get refundResult => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool success, String message, RefundResult refundResult)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool success, String message, RefundResult refundResult)?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool success, String message, RefundResult refundResult)?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RefundResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RefundResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RefundResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this RefundResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefundResponseCopyWith<RefundResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundResponseCopyWith<$Res> {
  factory $RefundResponseCopyWith(
    RefundResponse value,
    $Res Function(RefundResponse) then,
  ) = _$RefundResponseCopyWithImpl<$Res, RefundResponse>;
  @useResult
  $Res call({bool success, String message, RefundResult refundResult});

  $RefundResultCopyWith<$Res> get refundResult;
}

/// @nodoc
class _$RefundResponseCopyWithImpl<$Res, $Val extends RefundResponse>
    implements $RefundResponseCopyWith<$Res> {
  _$RefundResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? refundResult = null,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            refundResult: null == refundResult
                ? _value.refundResult
                : refundResult // ignore: cast_nullable_to_non_nullable
                      as RefundResult,
          )
          as $Val,
    );
  }

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RefundResultCopyWith<$Res> get refundResult {
    return $RefundResultCopyWith<$Res>(_value.refundResult, (value) {
      return _then(_value.copyWith(refundResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RefundResponseImplCopyWith<$Res>
    implements $RefundResponseCopyWith<$Res> {
  factory _$$RefundResponseImplCopyWith(
    _$RefundResponseImpl value,
    $Res Function(_$RefundResponseImpl) then,
  ) = __$$RefundResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, RefundResult refundResult});

  @override
  $RefundResultCopyWith<$Res> get refundResult;
}

/// @nodoc
class __$$RefundResponseImplCopyWithImpl<$Res>
    extends _$RefundResponseCopyWithImpl<$Res, _$RefundResponseImpl>
    implements _$$RefundResponseImplCopyWith<$Res> {
  __$$RefundResponseImplCopyWithImpl(
    _$RefundResponseImpl _value,
    $Res Function(_$RefundResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? refundResult = null,
  }) {
    return _then(
      _$RefundResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        refundResult: null == refundResult
            ? _value.refundResult
            : refundResult // ignore: cast_nullable_to_non_nullable
                  as RefundResult,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RefundResponseImpl implements _RefundResponse {
  const _$RefundResponseImpl({
    required this.success,
    required this.message,
    required this.refundResult,
  });

  factory _$RefundResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefundResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final RefundResult refundResult;

  @override
  String toString() {
    return 'RefundResponse(success: $success, message: $message, refundResult: $refundResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.refundResult, refundResult) ||
                other.refundResult == refundResult));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, refundResult);

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundResponseImplCopyWith<_$RefundResponseImpl> get copyWith =>
      __$$RefundResponseImplCopyWithImpl<_$RefundResponseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool success, String message, RefundResult refundResult)
    $default,
  ) {
    return $default(success, message, refundResult);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool success, String message, RefundResult refundResult)?
    $default,
  ) {
    return $default?.call(success, message, refundResult);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool success, String message, RefundResult refundResult)?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(success, message, refundResult);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RefundResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RefundResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RefundResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RefundResponseImplToJson(this);
  }
}

abstract class _RefundResponse implements RefundResponse {
  const factory _RefundResponse({
    required final bool success,
    required final String message,
    required final RefundResult refundResult,
  }) = _$RefundResponseImpl;

  factory _RefundResponse.fromJson(Map<String, dynamic> json) =
      _$RefundResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  RefundResult get refundResult;

  /// Create a copy of RefundResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefundResponseImplCopyWith<_$RefundResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefundResult _$RefundResultFromJson(Map<String, dynamic> json) {
  return _RefundResult.fromJson(json);
}

/// @nodoc
mixin _$RefundResult {
  int get refunded => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  List<RefundDetail> get refunds => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int refunded,
      double totalAmount,
      List<RefundDetail> refunds,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int refunded,
      double totalAmount,
      List<RefundDetail> refunds,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int refunded,
      double totalAmount,
      List<RefundDetail> refunds,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RefundResult value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RefundResult value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RefundResult value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this RefundResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefundResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefundResultCopyWith<RefundResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundResultCopyWith<$Res> {
  factory $RefundResultCopyWith(
    RefundResult value,
    $Res Function(RefundResult) then,
  ) = _$RefundResultCopyWithImpl<$Res, RefundResult>;
  @useResult
  $Res call({int refunded, double totalAmount, List<RefundDetail> refunds});
}

/// @nodoc
class _$RefundResultCopyWithImpl<$Res, $Val extends RefundResult>
    implements $RefundResultCopyWith<$Res> {
  _$RefundResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefundResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refunded = null,
    Object? totalAmount = null,
    Object? refunds = null,
  }) {
    return _then(
      _value.copyWith(
            refunded: null == refunded
                ? _value.refunded
                : refunded // ignore: cast_nullable_to_non_nullable
                      as int,
            totalAmount: null == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            refunds: null == refunds
                ? _value.refunds
                : refunds // ignore: cast_nullable_to_non_nullable
                      as List<RefundDetail>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RefundResultImplCopyWith<$Res>
    implements $RefundResultCopyWith<$Res> {
  factory _$$RefundResultImplCopyWith(
    _$RefundResultImpl value,
    $Res Function(_$RefundResultImpl) then,
  ) = __$$RefundResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int refunded, double totalAmount, List<RefundDetail> refunds});
}

/// @nodoc
class __$$RefundResultImplCopyWithImpl<$Res>
    extends _$RefundResultCopyWithImpl<$Res, _$RefundResultImpl>
    implements _$$RefundResultImplCopyWith<$Res> {
  __$$RefundResultImplCopyWithImpl(
    _$RefundResultImpl _value,
    $Res Function(_$RefundResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RefundResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refunded = null,
    Object? totalAmount = null,
    Object? refunds = null,
  }) {
    return _then(
      _$RefundResultImpl(
        refunded: null == refunded
            ? _value.refunded
            : refunded // ignore: cast_nullable_to_non_nullable
                  as int,
        totalAmount: null == totalAmount
            ? _value.totalAmount
            : totalAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        refunds: null == refunds
            ? _value._refunds
            : refunds // ignore: cast_nullable_to_non_nullable
                  as List<RefundDetail>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RefundResultImpl implements _RefundResult {
  const _$RefundResultImpl({
    required this.refunded,
    required this.totalAmount,
    required final List<RefundDetail> refunds,
  }) : _refunds = refunds;

  factory _$RefundResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefundResultImplFromJson(json);

  @override
  final int refunded;
  @override
  final double totalAmount;
  final List<RefundDetail> _refunds;
  @override
  List<RefundDetail> get refunds {
    if (_refunds is EqualUnmodifiableListView) return _refunds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_refunds);
  }

  @override
  String toString() {
    return 'RefundResult(refunded: $refunded, totalAmount: $totalAmount, refunds: $refunds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundResultImpl &&
            (identical(other.refunded, refunded) ||
                other.refunded == refunded) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            const DeepCollectionEquality().equals(other._refunds, _refunds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    refunded,
    totalAmount,
    const DeepCollectionEquality().hash(_refunds),
  );

  /// Create a copy of RefundResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundResultImplCopyWith<_$RefundResultImpl> get copyWith =>
      __$$RefundResultImplCopyWithImpl<_$RefundResultImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int refunded,
      double totalAmount,
      List<RefundDetail> refunds,
    )
    $default,
  ) {
    return $default(refunded, totalAmount, refunds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int refunded,
      double totalAmount,
      List<RefundDetail> refunds,
    )?
    $default,
  ) {
    return $default?.call(refunded, totalAmount, refunds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int refunded,
      double totalAmount,
      List<RefundDetail> refunds,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(refunded, totalAmount, refunds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RefundResult value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RefundResult value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RefundResult value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RefundResultImplToJson(this);
  }
}

abstract class _RefundResult implements RefundResult {
  const factory _RefundResult({
    required final int refunded,
    required final double totalAmount,
    required final List<RefundDetail> refunds,
  }) = _$RefundResultImpl;

  factory _RefundResult.fromJson(Map<String, dynamic> json) =
      _$RefundResultImpl.fromJson;

  @override
  int get refunded;
  @override
  double get totalAmount;
  @override
  List<RefundDetail> get refunds;

  /// Create a copy of RefundResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefundResultImplCopyWith<_$RefundResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefundDetail _$RefundDetailFromJson(Map<String, dynamic> json) {
  return _RefundDetail.fromJson(json);
}

/// @nodoc
mixin _$RefundDetail {
  String get userId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String userId, double amount, String orderId) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String userId, double amount, String orderId)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String userId, double amount, String orderId)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RefundDetail value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RefundDetail value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RefundDetail value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this RefundDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefundDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefundDetailCopyWith<RefundDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundDetailCopyWith<$Res> {
  factory $RefundDetailCopyWith(
    RefundDetail value,
    $Res Function(RefundDetail) then,
  ) = _$RefundDetailCopyWithImpl<$Res, RefundDetail>;
  @useResult
  $Res call({String userId, double amount, String orderId});
}

/// @nodoc
class _$RefundDetailCopyWithImpl<$Res, $Val extends RefundDetail>
    implements $RefundDetailCopyWith<$Res> {
  _$RefundDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefundDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
    Object? orderId = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            orderId: null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RefundDetailImplCopyWith<$Res>
    implements $RefundDetailCopyWith<$Res> {
  factory _$$RefundDetailImplCopyWith(
    _$RefundDetailImpl value,
    $Res Function(_$RefundDetailImpl) then,
  ) = __$$RefundDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, double amount, String orderId});
}

/// @nodoc
class __$$RefundDetailImplCopyWithImpl<$Res>
    extends _$RefundDetailCopyWithImpl<$Res, _$RefundDetailImpl>
    implements _$$RefundDetailImplCopyWith<$Res> {
  __$$RefundDetailImplCopyWithImpl(
    _$RefundDetailImpl _value,
    $Res Function(_$RefundDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RefundDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
    Object? orderId = null,
  }) {
    return _then(
      _$RefundDetailImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        orderId: null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RefundDetailImpl implements _RefundDetail {
  const _$RefundDetailImpl({
    required this.userId,
    required this.amount,
    required this.orderId,
  });

  factory _$RefundDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefundDetailImplFromJson(json);

  @override
  final String userId;
  @override
  final double amount;
  @override
  final String orderId;

  @override
  String toString() {
    return 'RefundDetail(userId: $userId, amount: $amount, orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundDetailImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, amount, orderId);

  /// Create a copy of RefundDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundDetailImplCopyWith<_$RefundDetailImpl> get copyWith =>
      __$$RefundDetailImplCopyWithImpl<_$RefundDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String userId, double amount, String orderId) $default,
  ) {
    return $default(userId, amount, orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String userId, double amount, String orderId)? $default,
  ) {
    return $default?.call(userId, amount, orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String userId, double amount, String orderId)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(userId, amount, orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RefundDetail value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RefundDetail value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RefundDetail value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RefundDetailImplToJson(this);
  }
}

abstract class _RefundDetail implements RefundDetail {
  const factory _RefundDetail({
    required final String userId,
    required final double amount,
    required final String orderId,
  }) = _$RefundDetailImpl;

  factory _RefundDetail.fromJson(Map<String, dynamic> json) =
      _$RefundDetailImpl.fromJson;

  @override
  String get userId;
  @override
  double get amount;
  @override
  String get orderId;

  /// Create a copy of RefundDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefundDetailImplCopyWith<_$RefundDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
