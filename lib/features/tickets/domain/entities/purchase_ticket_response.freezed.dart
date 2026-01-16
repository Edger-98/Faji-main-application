// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_ticket_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PurchaseTicketResponse _$PurchaseTicketResponseFromJson(
  Map<String, dynamic> json,
) {
  return _PurchaseTicketResponse.fromJson(json);
}

/// @nodoc
mixin _$PurchaseTicketResponse {
  String get orderId => throw _privateConstructorUsedError;
  List<TicketData> get tickets => throw _privateConstructorUsedError;
  PaymentData get payment => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String orderId,
      List<TicketData> tickets,
      PaymentData payment,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String orderId,
      List<TicketData> tickets,
      PaymentData payment,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String orderId,
      List<TicketData> tickets,
      PaymentData payment,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PurchaseTicketResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PurchaseTicketResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PurchaseTicketResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this PurchaseTicketResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseTicketResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseTicketResponseCopyWith<PurchaseTicketResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseTicketResponseCopyWith<$Res> {
  factory $PurchaseTicketResponseCopyWith(
    PurchaseTicketResponse value,
    $Res Function(PurchaseTicketResponse) then,
  ) = _$PurchaseTicketResponseCopyWithImpl<$Res, PurchaseTicketResponse>;
  @useResult
  $Res call({String orderId, List<TicketData> tickets, PaymentData payment});

  $PaymentDataCopyWith<$Res> get payment;
}

/// @nodoc
class _$PurchaseTicketResponseCopyWithImpl<
  $Res,
  $Val extends PurchaseTicketResponse
>
    implements $PurchaseTicketResponseCopyWith<$Res> {
  _$PurchaseTicketResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseTicketResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? tickets = null,
    Object? payment = null,
  }) {
    return _then(
      _value.copyWith(
            orderId: null == orderId
                ? _value.orderId
                : orderId // ignore: cast_nullable_to_non_nullable
                      as String,
            tickets: null == tickets
                ? _value.tickets
                : tickets // ignore: cast_nullable_to_non_nullable
                      as List<TicketData>,
            payment: null == payment
                ? _value.payment
                : payment // ignore: cast_nullable_to_non_nullable
                      as PaymentData,
          )
          as $Val,
    );
  }

  /// Create a copy of PurchaseTicketResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentDataCopyWith<$Res> get payment {
    return $PaymentDataCopyWith<$Res>(_value.payment, (value) {
      return _then(_value.copyWith(payment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseTicketResponseImplCopyWith<$Res>
    implements $PurchaseTicketResponseCopyWith<$Res> {
  factory _$$PurchaseTicketResponseImplCopyWith(
    _$PurchaseTicketResponseImpl value,
    $Res Function(_$PurchaseTicketResponseImpl) then,
  ) = __$$PurchaseTicketResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderId, List<TicketData> tickets, PaymentData payment});

  @override
  $PaymentDataCopyWith<$Res> get payment;
}

/// @nodoc
class __$$PurchaseTicketResponseImplCopyWithImpl<$Res>
    extends
        _$PurchaseTicketResponseCopyWithImpl<$Res, _$PurchaseTicketResponseImpl>
    implements _$$PurchaseTicketResponseImplCopyWith<$Res> {
  __$$PurchaseTicketResponseImplCopyWithImpl(
    _$PurchaseTicketResponseImpl _value,
    $Res Function(_$PurchaseTicketResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PurchaseTicketResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? tickets = null,
    Object? payment = null,
  }) {
    return _then(
      _$PurchaseTicketResponseImpl(
        orderId: null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as String,
        tickets: null == tickets
            ? _value._tickets
            : tickets // ignore: cast_nullable_to_non_nullable
                  as List<TicketData>,
        payment: null == payment
            ? _value.payment
            : payment // ignore: cast_nullable_to_non_nullable
                  as PaymentData,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseTicketResponseImpl implements _PurchaseTicketResponse {
  const _$PurchaseTicketResponseImpl({
    required this.orderId,
    required final List<TicketData> tickets,
    required this.payment,
  }) : _tickets = tickets;

  factory _$PurchaseTicketResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseTicketResponseImplFromJson(json);

  @override
  final String orderId;
  final List<TicketData> _tickets;
  @override
  List<TicketData> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  @override
  final PaymentData payment;

  @override
  String toString() {
    return 'PurchaseTicketResponse(orderId: $orderId, tickets: $tickets, payment: $payment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseTicketResponseImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            (identical(other.payment, payment) || other.payment == payment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    orderId,
    const DeepCollectionEquality().hash(_tickets),
    payment,
  );

  /// Create a copy of PurchaseTicketResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseTicketResponseImplCopyWith<_$PurchaseTicketResponseImpl>
  get copyWith =>
      __$$PurchaseTicketResponseImplCopyWithImpl<_$PurchaseTicketResponseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String orderId,
      List<TicketData> tickets,
      PaymentData payment,
    )
    $default,
  ) {
    return $default(orderId, tickets, payment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String orderId,
      List<TicketData> tickets,
      PaymentData payment,
    )?
    $default,
  ) {
    return $default?.call(orderId, tickets, payment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String orderId,
      List<TicketData> tickets,
      PaymentData payment,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(orderId, tickets, payment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PurchaseTicketResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PurchaseTicketResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PurchaseTicketResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseTicketResponseImplToJson(this);
  }
}

abstract class _PurchaseTicketResponse implements PurchaseTicketResponse {
  const factory _PurchaseTicketResponse({
    required final String orderId,
    required final List<TicketData> tickets,
    required final PaymentData payment,
  }) = _$PurchaseTicketResponseImpl;

  factory _PurchaseTicketResponse.fromJson(Map<String, dynamic> json) =
      _$PurchaseTicketResponseImpl.fromJson;

  @override
  String get orderId;
  @override
  List<TicketData> get tickets;
  @override
  PaymentData get payment;

  /// Create a copy of PurchaseTicketResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseTicketResponseImplCopyWith<_$PurchaseTicketResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TicketData _$TicketDataFromJson(Map<String, dynamic> json) {
  return _TicketData.fromJson(json);
}

/// @nodoc
mixin _$TicketData {
  String get id => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get qrCode => throw _privateConstructorUsedError;
  String get ticketNumber => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String eventId,
      String qrCode,
      String ticketNumber,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String eventId,
      String qrCode,
      String ticketNumber,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String eventId,
      String qrCode,
      String ticketNumber,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TicketData value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TicketData value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TicketData value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this TicketData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketDataCopyWith<TicketData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketDataCopyWith<$Res> {
  factory $TicketDataCopyWith(
    TicketData value,
    $Res Function(TicketData) then,
  ) = _$TicketDataCopyWithImpl<$Res, TicketData>;
  @useResult
  $Res call({String id, String eventId, String qrCode, String ticketNumber});
}

/// @nodoc
class _$TicketDataCopyWithImpl<$Res, $Val extends TicketData>
    implements $TicketDataCopyWith<$Res> {
  _$TicketDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? qrCode = null,
    Object? ticketNumber = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            eventId: null == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String,
            qrCode: null == qrCode
                ? _value.qrCode
                : qrCode // ignore: cast_nullable_to_non_nullable
                      as String,
            ticketNumber: null == ticketNumber
                ? _value.ticketNumber
                : ticketNumber // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TicketDataImplCopyWith<$Res>
    implements $TicketDataCopyWith<$Res> {
  factory _$$TicketDataImplCopyWith(
    _$TicketDataImpl value,
    $Res Function(_$TicketDataImpl) then,
  ) = __$$TicketDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String eventId, String qrCode, String ticketNumber});
}

/// @nodoc
class __$$TicketDataImplCopyWithImpl<$Res>
    extends _$TicketDataCopyWithImpl<$Res, _$TicketDataImpl>
    implements _$$TicketDataImplCopyWith<$Res> {
  __$$TicketDataImplCopyWithImpl(
    _$TicketDataImpl _value,
    $Res Function(_$TicketDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? qrCode = null,
    Object? ticketNumber = null,
  }) {
    return _then(
      _$TicketDataImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String,
        qrCode: null == qrCode
            ? _value.qrCode
            : qrCode // ignore: cast_nullable_to_non_nullable
                  as String,
        ticketNumber: null == ticketNumber
            ? _value.ticketNumber
            : ticketNumber // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketDataImpl implements _TicketData {
  const _$TicketDataImpl({
    required this.id,
    required this.eventId,
    required this.qrCode,
    required this.ticketNumber,
  });

  factory _$TicketDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketDataImplFromJson(json);

  @override
  final String id;
  @override
  final String eventId;
  @override
  final String qrCode;
  @override
  final String ticketNumber;

  @override
  String toString() {
    return 'TicketData(id: $id, eventId: $eventId, qrCode: $qrCode, ticketNumber: $ticketNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.ticketNumber, ticketNumber) ||
                other.ticketNumber == ticketNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, eventId, qrCode, ticketNumber);

  /// Create a copy of TicketData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketDataImplCopyWith<_$TicketDataImpl> get copyWith =>
      __$$TicketDataImplCopyWithImpl<_$TicketDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String eventId,
      String qrCode,
      String ticketNumber,
    )
    $default,
  ) {
    return $default(id, eventId, qrCode, ticketNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String eventId,
      String qrCode,
      String ticketNumber,
    )?
    $default,
  ) {
    return $default?.call(id, eventId, qrCode, ticketNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String eventId,
      String qrCode,
      String ticketNumber,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, eventId, qrCode, ticketNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TicketData value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TicketData value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TicketData value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketDataImplToJson(this);
  }
}

abstract class _TicketData implements TicketData {
  const factory _TicketData({
    required final String id,
    required final String eventId,
    required final String qrCode,
    required final String ticketNumber,
  }) = _$TicketDataImpl;

  factory _TicketData.fromJson(Map<String, dynamic> json) =
      _$TicketDataImpl.fromJson;

  @override
  String get id;
  @override
  String get eventId;
  @override
  String get qrCode;
  @override
  String get ticketNumber;

  /// Create a copy of TicketData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketDataImplCopyWith<_$TicketDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentData _$PaymentDataFromJson(Map<String, dynamic> json) {
  return _PaymentData.fromJson(json);
}

/// @nodoc
mixin _$PaymentData {
  double get subtotal => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get platformFee => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get escrowStatus => throw _privateConstructorUsedError;
  String? get paymentUrl => throw _privateConstructorUsedError;
  String? get clientSecret => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      double subtotal,
      double discount,
      double platformFee,
      double total,
      String currency,
      String status,
      String escrowStatus,
      String? paymentUrl,
      String? clientSecret,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double subtotal,
      double discount,
      double platformFee,
      double total,
      String currency,
      String status,
      String escrowStatus,
      String? paymentUrl,
      String? clientSecret,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double subtotal,
      double discount,
      double platformFee,
      double total,
      String currency,
      String status,
      String escrowStatus,
      String? paymentUrl,
      String? clientSecret,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PaymentData value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PaymentData value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PaymentData value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this PaymentData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentDataCopyWith<PaymentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDataCopyWith<$Res> {
  factory $PaymentDataCopyWith(
    PaymentData value,
    $Res Function(PaymentData) then,
  ) = _$PaymentDataCopyWithImpl<$Res, PaymentData>;
  @useResult
  $Res call({
    double subtotal,
    double discount,
    double platformFee,
    double total,
    String currency,
    String status,
    String escrowStatus,
    String? paymentUrl,
    String? clientSecret,
  });
}

/// @nodoc
class _$PaymentDataCopyWithImpl<$Res, $Val extends PaymentData>
    implements $PaymentDataCopyWith<$Res> {
  _$PaymentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? discount = null,
    Object? platformFee = null,
    Object? total = null,
    Object? currency = null,
    Object? status = null,
    Object? escrowStatus = null,
    Object? paymentUrl = freezed,
    Object? clientSecret = freezed,
  }) {
    return _then(
      _value.copyWith(
            subtotal: null == subtotal
                ? _value.subtotal
                : subtotal // ignore: cast_nullable_to_non_nullable
                      as double,
            discount: null == discount
                ? _value.discount
                : discount // ignore: cast_nullable_to_non_nullable
                      as double,
            platformFee: null == platformFee
                ? _value.platformFee
                : platformFee // ignore: cast_nullable_to_non_nullable
                      as double,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            escrowStatus: null == escrowStatus
                ? _value.escrowStatus
                : escrowStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentUrl: freezed == paymentUrl
                ? _value.paymentUrl
                : paymentUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            clientSecret: freezed == clientSecret
                ? _value.clientSecret
                : clientSecret // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentDataImplCopyWith<$Res>
    implements $PaymentDataCopyWith<$Res> {
  factory _$$PaymentDataImplCopyWith(
    _$PaymentDataImpl value,
    $Res Function(_$PaymentDataImpl) then,
  ) = __$$PaymentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double subtotal,
    double discount,
    double platformFee,
    double total,
    String currency,
    String status,
    String escrowStatus,
    String? paymentUrl,
    String? clientSecret,
  });
}

/// @nodoc
class __$$PaymentDataImplCopyWithImpl<$Res>
    extends _$PaymentDataCopyWithImpl<$Res, _$PaymentDataImpl>
    implements _$$PaymentDataImplCopyWith<$Res> {
  __$$PaymentDataImplCopyWithImpl(
    _$PaymentDataImpl _value,
    $Res Function(_$PaymentDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subtotal = null,
    Object? discount = null,
    Object? platformFee = null,
    Object? total = null,
    Object? currency = null,
    Object? status = null,
    Object? escrowStatus = null,
    Object? paymentUrl = freezed,
    Object? clientSecret = freezed,
  }) {
    return _then(
      _$PaymentDataImpl(
        subtotal: null == subtotal
            ? _value.subtotal
            : subtotal // ignore: cast_nullable_to_non_nullable
                  as double,
        discount: null == discount
            ? _value.discount
            : discount // ignore: cast_nullable_to_non_nullable
                  as double,
        platformFee: null == platformFee
            ? _value.platformFee
            : platformFee // ignore: cast_nullable_to_non_nullable
                  as double,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        escrowStatus: null == escrowStatus
            ? _value.escrowStatus
            : escrowStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentUrl: freezed == paymentUrl
            ? _value.paymentUrl
            : paymentUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        clientSecret: freezed == clientSecret
            ? _value.clientSecret
            : clientSecret // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentDataImpl implements _PaymentData {
  const _$PaymentDataImpl({
    required this.subtotal,
    required this.discount,
    required this.platformFee,
    required this.total,
    required this.currency,
    required this.status,
    required this.escrowStatus,
    this.paymentUrl,
    this.clientSecret,
  });

  factory _$PaymentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentDataImplFromJson(json);

  @override
  final double subtotal;
  @override
  final double discount;
  @override
  final double platformFee;
  @override
  final double total;
  @override
  final String currency;
  @override
  final String status;
  @override
  final String escrowStatus;
  @override
  final String? paymentUrl;
  @override
  final String? clientSecret;

  @override
  String toString() {
    return 'PaymentData(subtotal: $subtotal, discount: $discount, platformFee: $platformFee, total: $total, currency: $currency, status: $status, escrowStatus: $escrowStatus, paymentUrl: $paymentUrl, clientSecret: $clientSecret)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDataImpl &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.platformFee, platformFee) ||
                other.platformFee == platformFee) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.escrowStatus, escrowStatus) ||
                other.escrowStatus == escrowStatus) &&
            (identical(other.paymentUrl, paymentUrl) ||
                other.paymentUrl == paymentUrl) &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    subtotal,
    discount,
    platformFee,
    total,
    currency,
    status,
    escrowStatus,
    paymentUrl,
    clientSecret,
  );

  /// Create a copy of PaymentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDataImplCopyWith<_$PaymentDataImpl> get copyWith =>
      __$$PaymentDataImplCopyWithImpl<_$PaymentDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      double subtotal,
      double discount,
      double platformFee,
      double total,
      String currency,
      String status,
      String escrowStatus,
      String? paymentUrl,
      String? clientSecret,
    )
    $default,
  ) {
    return $default(
      subtotal,
      discount,
      platformFee,
      total,
      currency,
      status,
      escrowStatus,
      paymentUrl,
      clientSecret,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double subtotal,
      double discount,
      double platformFee,
      double total,
      String currency,
      String status,
      String escrowStatus,
      String? paymentUrl,
      String? clientSecret,
    )?
    $default,
  ) {
    return $default?.call(
      subtotal,
      discount,
      platformFee,
      total,
      currency,
      status,
      escrowStatus,
      paymentUrl,
      clientSecret,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double subtotal,
      double discount,
      double platformFee,
      double total,
      String currency,
      String status,
      String escrowStatus,
      String? paymentUrl,
      String? clientSecret,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        subtotal,
        discount,
        platformFee,
        total,
        currency,
        status,
        escrowStatus,
        paymentUrl,
        clientSecret,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PaymentData value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PaymentData value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PaymentData value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentDataImplToJson(this);
  }
}

abstract class _PaymentData implements PaymentData {
  const factory _PaymentData({
    required final double subtotal,
    required final double discount,
    required final double platformFee,
    required final double total,
    required final String currency,
    required final String status,
    required final String escrowStatus,
    final String? paymentUrl,
    final String? clientSecret,
  }) = _$PaymentDataImpl;

  factory _PaymentData.fromJson(Map<String, dynamic> json) =
      _$PaymentDataImpl.fromJson;

  @override
  double get subtotal;
  @override
  double get discount;
  @override
  double get platformFee;
  @override
  double get total;
  @override
  String get currency;
  @override
  String get status;
  @override
  String get escrowStatus;
  @override
  String? get paymentUrl;
  @override
  String? get clientSecret;

  /// Create a copy of PaymentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentDataImplCopyWith<_$PaymentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
