// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_ticket_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PurchaseTicketRequest _$PurchaseTicketRequestFromJson(
  Map<String, dynamic> json,
) {
  return _PurchaseTicketRequest.fromJson(json);
}

/// @nodoc
mixin _$PurchaseTicketRequest {
  String get eventId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String eventId,
      int quantity,
      String? promoCode,
      String paymentMethod,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String eventId,
      int quantity,
      String? promoCode,
      String paymentMethod,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String eventId,
      int quantity,
      String? promoCode,
      String paymentMethod,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PurchaseTicketRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PurchaseTicketRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PurchaseTicketRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this PurchaseTicketRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseTicketRequestCopyWith<PurchaseTicketRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseTicketRequestCopyWith<$Res> {
  factory $PurchaseTicketRequestCopyWith(
    PurchaseTicketRequest value,
    $Res Function(PurchaseTicketRequest) then,
  ) = _$PurchaseTicketRequestCopyWithImpl<$Res, PurchaseTicketRequest>;
  @useResult
  $Res call({
    String eventId,
    int quantity,
    String? promoCode,
    String paymentMethod,
  });
}

/// @nodoc
class _$PurchaseTicketRequestCopyWithImpl<
  $Res,
  $Val extends PurchaseTicketRequest
>
    implements $PurchaseTicketRequestCopyWith<$Res> {
  _$PurchaseTicketRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? quantity = null,
    Object? promoCode = freezed,
    Object? paymentMethod = null,
  }) {
    return _then(
      _value.copyWith(
            eventId: null == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            promoCode: freezed == promoCode
                ? _value.promoCode
                : promoCode // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$PurchaseTicketRequestImplCopyWith<$Res>
    implements $PurchaseTicketRequestCopyWith<$Res> {
  factory _$$PurchaseTicketRequestImplCopyWith(
    _$PurchaseTicketRequestImpl value,
    $Res Function(_$PurchaseTicketRequestImpl) then,
  ) = __$$PurchaseTicketRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String eventId,
    int quantity,
    String? promoCode,
    String paymentMethod,
  });
}

/// @nodoc
class __$$PurchaseTicketRequestImplCopyWithImpl<$Res>
    extends
        _$PurchaseTicketRequestCopyWithImpl<$Res, _$PurchaseTicketRequestImpl>
    implements _$$PurchaseTicketRequestImplCopyWith<$Res> {
  __$$PurchaseTicketRequestImplCopyWithImpl(
    _$PurchaseTicketRequestImpl _value,
    $Res Function(_$PurchaseTicketRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PurchaseTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? quantity = null,
    Object? promoCode = freezed,
    Object? paymentMethod = null,
  }) {
    return _then(
      _$PurchaseTicketRequestImpl(
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        promoCode: freezed == promoCode
            ? _value.promoCode
            : promoCode // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$PurchaseTicketRequestImpl implements _PurchaseTicketRequest {
  const _$PurchaseTicketRequestImpl({
    required this.eventId,
    required this.quantity,
    this.promoCode,
    this.paymentMethod = 'paystack',
  });

  factory _$PurchaseTicketRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseTicketRequestImplFromJson(json);

  @override
  final String eventId;
  @override
  final int quantity;
  @override
  final String? promoCode;
  @override
  @JsonKey()
  final String paymentMethod;

  @override
  String toString() {
    return 'PurchaseTicketRequest(eventId: $eventId, quantity: $quantity, promoCode: $promoCode, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseTicketRequestImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, quantity, promoCode, paymentMethod);

  /// Create a copy of PurchaseTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseTicketRequestImplCopyWith<_$PurchaseTicketRequestImpl>
  get copyWith =>
      __$$PurchaseTicketRequestImplCopyWithImpl<_$PurchaseTicketRequestImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String eventId,
      int quantity,
      String? promoCode,
      String paymentMethod,
    )
    $default,
  ) {
    return $default(eventId, quantity, promoCode, paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String eventId,
      int quantity,
      String? promoCode,
      String paymentMethod,
    )?
    $default,
  ) {
    return $default?.call(eventId, quantity, promoCode, paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String eventId,
      int quantity,
      String? promoCode,
      String paymentMethod,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(eventId, quantity, promoCode, paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PurchaseTicketRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PurchaseTicketRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PurchaseTicketRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseTicketRequestImplToJson(this);
  }
}

abstract class _PurchaseTicketRequest implements PurchaseTicketRequest {
  const factory _PurchaseTicketRequest({
    required final String eventId,
    required final int quantity,
    final String? promoCode,
    final String paymentMethod,
  }) = _$PurchaseTicketRequestImpl;

  factory _PurchaseTicketRequest.fromJson(Map<String, dynamic> json) =
      _$PurchaseTicketRequestImpl.fromJson;

  @override
  String get eventId;
  @override
  int get quantity;
  @override
  String? get promoCode;
  @override
  String get paymentMethod;

  /// Create a copy of PurchaseTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseTicketRequestImplCopyWith<_$PurchaseTicketRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
