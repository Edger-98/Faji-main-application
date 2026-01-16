// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return _Booking.fromJson(json);
}

/// @nodoc
mixin _$Booking {
  String get id => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String? get eventName => throw _privateConstructorUsedError;
  String get hostId => throw _privateConstructorUsedError;
  String? get hostName => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;
  String? get vendorName => throw _privateConstructorUsedError;
  String get resourceId => throw _privateConstructorUsedError;
  String? get resourceTitle => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get paymentOption => throw _privateConstructorUsedError;
  double? get offeredPrice => throw _privateConstructorUsedError;
  double? get agreedPrice => throw _privateConstructorUsedError;
  double? get percentageSplit => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get eventDate => throw _privateConstructorUsedError;
  String? get escrowStatus => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String eventId,
      String? eventName,
      String hostId,
      String? hostName,
      String vendorId,
      String? vendorName,
      String resourceId,
      String? resourceTitle,
      String status,
      String paymentOption,
      double? offeredPrice,
      double? agreedPrice,
      double? percentageSplit,
      String? message,
      String? eventDate,
      String? escrowStatus,
      String createdAt,
      String updatedAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String eventId,
      String? eventName,
      String hostId,
      String? hostName,
      String vendorId,
      String? vendorName,
      String resourceId,
      String? resourceTitle,
      String status,
      String paymentOption,
      double? offeredPrice,
      double? agreedPrice,
      double? percentageSplit,
      String? message,
      String? eventDate,
      String? escrowStatus,
      String createdAt,
      String updatedAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String eventId,
      String? eventName,
      String hostId,
      String? hostName,
      String vendorId,
      String? vendorName,
      String resourceId,
      String? resourceTitle,
      String status,
      String paymentOption,
      double? offeredPrice,
      double? agreedPrice,
      double? percentageSplit,
      String? message,
      String? eventDate,
      String? escrowStatus,
      String createdAt,
      String updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Booking value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Booking value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Booking value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this Booking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingCopyWith<Booking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) then) =
      _$BookingCopyWithImpl<$Res, Booking>;
  @useResult
  $Res call({
    String id,
    String eventId,
    String? eventName,
    String hostId,
    String? hostName,
    String vendorId,
    String? vendorName,
    String resourceId,
    String? resourceTitle,
    String status,
    String paymentOption,
    double? offeredPrice,
    double? agreedPrice,
    double? percentageSplit,
    String? message,
    String? eventDate,
    String? escrowStatus,
    String createdAt,
    String updatedAt,
  });
}

/// @nodoc
class _$BookingCopyWithImpl<$Res, $Val extends Booking>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? eventName = freezed,
    Object? hostId = null,
    Object? hostName = freezed,
    Object? vendorId = null,
    Object? vendorName = freezed,
    Object? resourceId = null,
    Object? resourceTitle = freezed,
    Object? status = null,
    Object? paymentOption = null,
    Object? offeredPrice = freezed,
    Object? agreedPrice = freezed,
    Object? percentageSplit = freezed,
    Object? message = freezed,
    Object? eventDate = freezed,
    Object? escrowStatus = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
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
            eventName: freezed == eventName
                ? _value.eventName
                : eventName // ignore: cast_nullable_to_non_nullable
                      as String?,
            hostId: null == hostId
                ? _value.hostId
                : hostId // ignore: cast_nullable_to_non_nullable
                      as String,
            hostName: freezed == hostName
                ? _value.hostName
                : hostName // ignore: cast_nullable_to_non_nullable
                      as String?,
            vendorId: null == vendorId
                ? _value.vendorId
                : vendorId // ignore: cast_nullable_to_non_nullable
                      as String,
            vendorName: freezed == vendorName
                ? _value.vendorName
                : vendorName // ignore: cast_nullable_to_non_nullable
                      as String?,
            resourceId: null == resourceId
                ? _value.resourceId
                : resourceId // ignore: cast_nullable_to_non_nullable
                      as String,
            resourceTitle: freezed == resourceTitle
                ? _value.resourceTitle
                : resourceTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentOption: null == paymentOption
                ? _value.paymentOption
                : paymentOption // ignore: cast_nullable_to_non_nullable
                      as String,
            offeredPrice: freezed == offeredPrice
                ? _value.offeredPrice
                : offeredPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            agreedPrice: freezed == agreedPrice
                ? _value.agreedPrice
                : agreedPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            percentageSplit: freezed == percentageSplit
                ? _value.percentageSplit
                : percentageSplit // ignore: cast_nullable_to_non_nullable
                      as double?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventDate: freezed == eventDate
                ? _value.eventDate
                : eventDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            escrowStatus: freezed == escrowStatus
                ? _value.escrowStatus
                : escrowStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$BookingImplCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$$BookingImplCopyWith(
    _$BookingImpl value,
    $Res Function(_$BookingImpl) then,
  ) = __$$BookingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String eventId,
    String? eventName,
    String hostId,
    String? hostName,
    String vendorId,
    String? vendorName,
    String resourceId,
    String? resourceTitle,
    String status,
    String paymentOption,
    double? offeredPrice,
    double? agreedPrice,
    double? percentageSplit,
    String? message,
    String? eventDate,
    String? escrowStatus,
    String createdAt,
    String updatedAt,
  });
}

/// @nodoc
class __$$BookingImplCopyWithImpl<$Res>
    extends _$BookingCopyWithImpl<$Res, _$BookingImpl>
    implements _$$BookingImplCopyWith<$Res> {
  __$$BookingImplCopyWithImpl(
    _$BookingImpl _value,
    $Res Function(_$BookingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? eventName = freezed,
    Object? hostId = null,
    Object? hostName = freezed,
    Object? vendorId = null,
    Object? vendorName = freezed,
    Object? resourceId = null,
    Object? resourceTitle = freezed,
    Object? status = null,
    Object? paymentOption = null,
    Object? offeredPrice = freezed,
    Object? agreedPrice = freezed,
    Object? percentageSplit = freezed,
    Object? message = freezed,
    Object? eventDate = freezed,
    Object? escrowStatus = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$BookingImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String,
        eventName: freezed == eventName
            ? _value.eventName
            : eventName // ignore: cast_nullable_to_non_nullable
                  as String?,
        hostId: null == hostId
            ? _value.hostId
            : hostId // ignore: cast_nullable_to_non_nullable
                  as String,
        hostName: freezed == hostName
            ? _value.hostName
            : hostName // ignore: cast_nullable_to_non_nullable
                  as String?,
        vendorId: null == vendorId
            ? _value.vendorId
            : vendorId // ignore: cast_nullable_to_non_nullable
                  as String,
        vendorName: freezed == vendorName
            ? _value.vendorName
            : vendorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        resourceId: null == resourceId
            ? _value.resourceId
            : resourceId // ignore: cast_nullable_to_non_nullable
                  as String,
        resourceTitle: freezed == resourceTitle
            ? _value.resourceTitle
            : resourceTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentOption: null == paymentOption
            ? _value.paymentOption
            : paymentOption // ignore: cast_nullable_to_non_nullable
                  as String,
        offeredPrice: freezed == offeredPrice
            ? _value.offeredPrice
            : offeredPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        agreedPrice: freezed == agreedPrice
            ? _value.agreedPrice
            : agreedPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        percentageSplit: freezed == percentageSplit
            ? _value.percentageSplit
            : percentageSplit // ignore: cast_nullable_to_non_nullable
                  as double?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventDate: freezed == eventDate
            ? _value.eventDate
            : eventDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        escrowStatus: freezed == escrowStatus
            ? _value.escrowStatus
            : escrowStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$BookingImpl implements _Booking {
  const _$BookingImpl({
    required this.id,
    required this.eventId,
    this.eventName,
    required this.hostId,
    this.hostName,
    required this.vendorId,
    this.vendorName,
    required this.resourceId,
    this.resourceTitle,
    required this.status,
    required this.paymentOption,
    this.offeredPrice,
    this.agreedPrice,
    this.percentageSplit,
    this.message,
    this.eventDate,
    this.escrowStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$BookingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingImplFromJson(json);

  @override
  final String id;
  @override
  final String eventId;
  @override
  final String? eventName;
  @override
  final String hostId;
  @override
  final String? hostName;
  @override
  final String vendorId;
  @override
  final String? vendorName;
  @override
  final String resourceId;
  @override
  final String? resourceTitle;
  @override
  final String status;
  @override
  final String paymentOption;
  @override
  final double? offeredPrice;
  @override
  final double? agreedPrice;
  @override
  final double? percentageSplit;
  @override
  final String? message;
  @override
  final String? eventDate;
  @override
  final String? escrowStatus;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'Booking(id: $id, eventId: $eventId, eventName: $eventName, hostId: $hostId, hostName: $hostName, vendorId: $vendorId, vendorName: $vendorName, resourceId: $resourceId, resourceTitle: $resourceTitle, status: $status, paymentOption: $paymentOption, offeredPrice: $offeredPrice, agreedPrice: $agreedPrice, percentageSplit: $percentageSplit, message: $message, eventDate: $eventDate, escrowStatus: $escrowStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            (identical(other.hostName, hostName) ||
                other.hostName == hostName) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.vendorName, vendorName) ||
                other.vendorName == vendorName) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.resourceTitle, resourceTitle) ||
                other.resourceTitle == resourceTitle) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentOption, paymentOption) ||
                other.paymentOption == paymentOption) &&
            (identical(other.offeredPrice, offeredPrice) ||
                other.offeredPrice == offeredPrice) &&
            (identical(other.agreedPrice, agreedPrice) ||
                other.agreedPrice == agreedPrice) &&
            (identical(other.percentageSplit, percentageSplit) ||
                other.percentageSplit == percentageSplit) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.escrowStatus, escrowStatus) ||
                other.escrowStatus == escrowStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    eventId,
    eventName,
    hostId,
    hostName,
    vendorId,
    vendorName,
    resourceId,
    resourceTitle,
    status,
    paymentOption,
    offeredPrice,
    agreedPrice,
    percentageSplit,
    message,
    eventDate,
    escrowStatus,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      __$$BookingImplCopyWithImpl<_$BookingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String eventId,
      String? eventName,
      String hostId,
      String? hostName,
      String vendorId,
      String? vendorName,
      String resourceId,
      String? resourceTitle,
      String status,
      String paymentOption,
      double? offeredPrice,
      double? agreedPrice,
      double? percentageSplit,
      String? message,
      String? eventDate,
      String? escrowStatus,
      String createdAt,
      String updatedAt,
    )
    $default,
  ) {
    return $default(
      id,
      eventId,
      eventName,
      hostId,
      hostName,
      vendorId,
      vendorName,
      resourceId,
      resourceTitle,
      status,
      paymentOption,
      offeredPrice,
      agreedPrice,
      percentageSplit,
      message,
      eventDate,
      escrowStatus,
      createdAt,
      updatedAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String eventId,
      String? eventName,
      String hostId,
      String? hostName,
      String vendorId,
      String? vendorName,
      String resourceId,
      String? resourceTitle,
      String status,
      String paymentOption,
      double? offeredPrice,
      double? agreedPrice,
      double? percentageSplit,
      String? message,
      String? eventDate,
      String? escrowStatus,
      String createdAt,
      String updatedAt,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      eventId,
      eventName,
      hostId,
      hostName,
      vendorId,
      vendorName,
      resourceId,
      resourceTitle,
      status,
      paymentOption,
      offeredPrice,
      agreedPrice,
      percentageSplit,
      message,
      eventDate,
      escrowStatus,
      createdAt,
      updatedAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String eventId,
      String? eventName,
      String hostId,
      String? hostName,
      String vendorId,
      String? vendorName,
      String resourceId,
      String? resourceTitle,
      String status,
      String paymentOption,
      double? offeredPrice,
      double? agreedPrice,
      double? percentageSplit,
      String? message,
      String? eventDate,
      String? escrowStatus,
      String createdAt,
      String updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        eventId,
        eventName,
        hostId,
        hostName,
        vendorId,
        vendorName,
        resourceId,
        resourceTitle,
        status,
        paymentOption,
        offeredPrice,
        agreedPrice,
        percentageSplit,
        message,
        eventDate,
        escrowStatus,
        createdAt,
        updatedAt,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Booking value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Booking value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Booking value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingImplToJson(this);
  }
}

abstract class _Booking implements Booking {
  const factory _Booking({
    required final String id,
    required final String eventId,
    final String? eventName,
    required final String hostId,
    final String? hostName,
    required final String vendorId,
    final String? vendorName,
    required final String resourceId,
    final String? resourceTitle,
    required final String status,
    required final String paymentOption,
    final double? offeredPrice,
    final double? agreedPrice,
    final double? percentageSplit,
    final String? message,
    final String? eventDate,
    final String? escrowStatus,
    required final String createdAt,
    required final String updatedAt,
  }) = _$BookingImpl;

  factory _Booking.fromJson(Map<String, dynamic> json) = _$BookingImpl.fromJson;

  @override
  String get id;
  @override
  String get eventId;
  @override
  String? get eventName;
  @override
  String get hostId;
  @override
  String? get hostName;
  @override
  String get vendorId;
  @override
  String? get vendorName;
  @override
  String get resourceId;
  @override
  String? get resourceTitle;
  @override
  String get status;
  @override
  String get paymentOption;
  @override
  double? get offeredPrice;
  @override
  double? get agreedPrice;
  @override
  double? get percentageSplit;
  @override
  String? get message;
  @override
  String? get eventDate;
  @override
  String? get escrowStatus;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateBookingRequest _$CreateBookingRequestFromJson(Map<String, dynamic> json) {
  return _CreateBookingRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateBookingRequest {
  String get eventId => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;
  String get resourceId => throw _privateConstructorUsedError;
  String get paymentOption => throw _privateConstructorUsedError;
  double? get offeredPrice => throw _privateConstructorUsedError;
  double? get percentageSplit => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get eventDate => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String eventId,
      String vendorId,
      String resourceId,
      String paymentOption,
      double? offeredPrice,
      double? percentageSplit,
      String? message,
      String? eventDate,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String eventId,
      String vendorId,
      String resourceId,
      String paymentOption,
      double? offeredPrice,
      double? percentageSplit,
      String? message,
      String? eventDate,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String eventId,
      String vendorId,
      String resourceId,
      String paymentOption,
      double? offeredPrice,
      double? percentageSplit,
      String? message,
      String? eventDate,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CreateBookingRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CreateBookingRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CreateBookingRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this CreateBookingRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateBookingRequestCopyWith<CreateBookingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBookingRequestCopyWith<$Res> {
  factory $CreateBookingRequestCopyWith(
    CreateBookingRequest value,
    $Res Function(CreateBookingRequest) then,
  ) = _$CreateBookingRequestCopyWithImpl<$Res, CreateBookingRequest>;
  @useResult
  $Res call({
    String eventId,
    String vendorId,
    String resourceId,
    String paymentOption,
    double? offeredPrice,
    double? percentageSplit,
    String? message,
    String? eventDate,
  });
}

/// @nodoc
class _$CreateBookingRequestCopyWithImpl<
  $Res,
  $Val extends CreateBookingRequest
>
    implements $CreateBookingRequestCopyWith<$Res> {
  _$CreateBookingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? vendorId = null,
    Object? resourceId = null,
    Object? paymentOption = null,
    Object? offeredPrice = freezed,
    Object? percentageSplit = freezed,
    Object? message = freezed,
    Object? eventDate = freezed,
  }) {
    return _then(
      _value.copyWith(
            eventId: null == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String,
            vendorId: null == vendorId
                ? _value.vendorId
                : vendorId // ignore: cast_nullable_to_non_nullable
                      as String,
            resourceId: null == resourceId
                ? _value.resourceId
                : resourceId // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentOption: null == paymentOption
                ? _value.paymentOption
                : paymentOption // ignore: cast_nullable_to_non_nullable
                      as String,
            offeredPrice: freezed == offeredPrice
                ? _value.offeredPrice
                : offeredPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            percentageSplit: freezed == percentageSplit
                ? _value.percentageSplit
                : percentageSplit // ignore: cast_nullable_to_non_nullable
                      as double?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventDate: freezed == eventDate
                ? _value.eventDate
                : eventDate // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateBookingRequestImplCopyWith<$Res>
    implements $CreateBookingRequestCopyWith<$Res> {
  factory _$$CreateBookingRequestImplCopyWith(
    _$CreateBookingRequestImpl value,
    $Res Function(_$CreateBookingRequestImpl) then,
  ) = __$$CreateBookingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String eventId,
    String vendorId,
    String resourceId,
    String paymentOption,
    double? offeredPrice,
    double? percentageSplit,
    String? message,
    String? eventDate,
  });
}

/// @nodoc
class __$$CreateBookingRequestImplCopyWithImpl<$Res>
    extends _$CreateBookingRequestCopyWithImpl<$Res, _$CreateBookingRequestImpl>
    implements _$$CreateBookingRequestImplCopyWith<$Res> {
  __$$CreateBookingRequestImplCopyWithImpl(
    _$CreateBookingRequestImpl _value,
    $Res Function(_$CreateBookingRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? vendorId = null,
    Object? resourceId = null,
    Object? paymentOption = null,
    Object? offeredPrice = freezed,
    Object? percentageSplit = freezed,
    Object? message = freezed,
    Object? eventDate = freezed,
  }) {
    return _then(
      _$CreateBookingRequestImpl(
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String,
        vendorId: null == vendorId
            ? _value.vendorId
            : vendorId // ignore: cast_nullable_to_non_nullable
                  as String,
        resourceId: null == resourceId
            ? _value.resourceId
            : resourceId // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentOption: null == paymentOption
            ? _value.paymentOption
            : paymentOption // ignore: cast_nullable_to_non_nullable
                  as String,
        offeredPrice: freezed == offeredPrice
            ? _value.offeredPrice
            : offeredPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        percentageSplit: freezed == percentageSplit
            ? _value.percentageSplit
            : percentageSplit // ignore: cast_nullable_to_non_nullable
                  as double?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventDate: freezed == eventDate
            ? _value.eventDate
            : eventDate // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateBookingRequestImpl implements _CreateBookingRequest {
  const _$CreateBookingRequestImpl({
    required this.eventId,
    required this.vendorId,
    required this.resourceId,
    required this.paymentOption,
    this.offeredPrice,
    this.percentageSplit,
    this.message,
    this.eventDate,
  });

  factory _$CreateBookingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateBookingRequestImplFromJson(json);

  @override
  final String eventId;
  @override
  final String vendorId;
  @override
  final String resourceId;
  @override
  final String paymentOption;
  @override
  final double? offeredPrice;
  @override
  final double? percentageSplit;
  @override
  final String? message;
  @override
  final String? eventDate;

  @override
  String toString() {
    return 'CreateBookingRequest(eventId: $eventId, vendorId: $vendorId, resourceId: $resourceId, paymentOption: $paymentOption, offeredPrice: $offeredPrice, percentageSplit: $percentageSplit, message: $message, eventDate: $eventDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBookingRequestImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.paymentOption, paymentOption) ||
                other.paymentOption == paymentOption) &&
            (identical(other.offeredPrice, offeredPrice) ||
                other.offeredPrice == offeredPrice) &&
            (identical(other.percentageSplit, percentageSplit) ||
                other.percentageSplit == percentageSplit) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    eventId,
    vendorId,
    resourceId,
    paymentOption,
    offeredPrice,
    percentageSplit,
    message,
    eventDate,
  );

  /// Create a copy of CreateBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBookingRequestImplCopyWith<_$CreateBookingRequestImpl>
  get copyWith =>
      __$$CreateBookingRequestImplCopyWithImpl<_$CreateBookingRequestImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String eventId,
      String vendorId,
      String resourceId,
      String paymentOption,
      double? offeredPrice,
      double? percentageSplit,
      String? message,
      String? eventDate,
    )
    $default,
  ) {
    return $default(
      eventId,
      vendorId,
      resourceId,
      paymentOption,
      offeredPrice,
      percentageSplit,
      message,
      eventDate,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String eventId,
      String vendorId,
      String resourceId,
      String paymentOption,
      double? offeredPrice,
      double? percentageSplit,
      String? message,
      String? eventDate,
    )?
    $default,
  ) {
    return $default?.call(
      eventId,
      vendorId,
      resourceId,
      paymentOption,
      offeredPrice,
      percentageSplit,
      message,
      eventDate,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String eventId,
      String vendorId,
      String resourceId,
      String paymentOption,
      double? offeredPrice,
      double? percentageSplit,
      String? message,
      String? eventDate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        eventId,
        vendorId,
        resourceId,
        paymentOption,
        offeredPrice,
        percentageSplit,
        message,
        eventDate,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CreateBookingRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CreateBookingRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CreateBookingRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBookingRequestImplToJson(this);
  }
}

abstract class _CreateBookingRequest implements CreateBookingRequest {
  const factory _CreateBookingRequest({
    required final String eventId,
    required final String vendorId,
    required final String resourceId,
    required final String paymentOption,
    final double? offeredPrice,
    final double? percentageSplit,
    final String? message,
    final String? eventDate,
  }) = _$CreateBookingRequestImpl;

  factory _CreateBookingRequest.fromJson(Map<String, dynamic> json) =
      _$CreateBookingRequestImpl.fromJson;

  @override
  String get eventId;
  @override
  String get vendorId;
  @override
  String get resourceId;
  @override
  String get paymentOption;
  @override
  double? get offeredPrice;
  @override
  double? get percentageSplit;
  @override
  String? get message;
  @override
  String? get eventDate;

  /// Create a copy of CreateBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateBookingRequestImplCopyWith<_$CreateBookingRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BookingsResponse _$BookingsResponseFromJson(Map<String, dynamic> json) {
  return _BookingsResponse.fromJson(json);
}

/// @nodoc
mixin _$BookingsResponse {
  List<Booking> get bookings => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Booking> bookings) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Booking> bookings)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Booking> bookings)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BookingsResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BookingsResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BookingsResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this BookingsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingsResponseCopyWith<BookingsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingsResponseCopyWith<$Res> {
  factory $BookingsResponseCopyWith(
    BookingsResponse value,
    $Res Function(BookingsResponse) then,
  ) = _$BookingsResponseCopyWithImpl<$Res, BookingsResponse>;
  @useResult
  $Res call({List<Booking> bookings});
}

/// @nodoc
class _$BookingsResponseCopyWithImpl<$Res, $Val extends BookingsResponse>
    implements $BookingsResponseCopyWith<$Res> {
  _$BookingsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? bookings = null}) {
    return _then(
      _value.copyWith(
            bookings: null == bookings
                ? _value.bookings
                : bookings // ignore: cast_nullable_to_non_nullable
                      as List<Booking>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookingsResponseImplCopyWith<$Res>
    implements $BookingsResponseCopyWith<$Res> {
  factory _$$BookingsResponseImplCopyWith(
    _$BookingsResponseImpl value,
    $Res Function(_$BookingsResponseImpl) then,
  ) = __$$BookingsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Booking> bookings});
}

/// @nodoc
class __$$BookingsResponseImplCopyWithImpl<$Res>
    extends _$BookingsResponseCopyWithImpl<$Res, _$BookingsResponseImpl>
    implements _$$BookingsResponseImplCopyWith<$Res> {
  __$$BookingsResponseImplCopyWithImpl(
    _$BookingsResponseImpl _value,
    $Res Function(_$BookingsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? bookings = null}) {
    return _then(
      _$BookingsResponseImpl(
        bookings: null == bookings
            ? _value._bookings
            : bookings // ignore: cast_nullable_to_non_nullable
                  as List<Booking>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingsResponseImpl implements _BookingsResponse {
  const _$BookingsResponseImpl({required final List<Booking> bookings})
    : _bookings = bookings;

  factory _$BookingsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingsResponseImplFromJson(json);

  final List<Booking> _bookings;
  @override
  List<Booking> get bookings {
    if (_bookings is EqualUnmodifiableListView) return _bookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookings);
  }

  @override
  String toString() {
    return 'BookingsResponse(bookings: $bookings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingsResponseImpl &&
            const DeepCollectionEquality().equals(other._bookings, _bookings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_bookings));

  /// Create a copy of BookingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingsResponseImplCopyWith<_$BookingsResponseImpl> get copyWith =>
      __$$BookingsResponseImplCopyWithImpl<_$BookingsResponseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Booking> bookings) $default,
  ) {
    return $default(bookings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Booking> bookings)? $default,
  ) {
    return $default?.call(bookings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Booking> bookings)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(bookings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BookingsResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BookingsResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BookingsResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingsResponseImplToJson(this);
  }
}

abstract class _BookingsResponse implements BookingsResponse {
  const factory _BookingsResponse({required final List<Booking> bookings}) =
      _$BookingsResponseImpl;

  factory _BookingsResponse.fromJson(Map<String, dynamic> json) =
      _$BookingsResponseImpl.fromJson;

  @override
  List<Booking> get bookings;

  /// Create a copy of BookingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingsResponseImplCopyWith<_$BookingsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AcceptBookingRequest _$AcceptBookingRequestFromJson(Map<String, dynamic> json) {
  return _AcceptBookingRequest.fromJson(json);
}

/// @nodoc
mixin _$AcceptBookingRequest {
  double? get agreedPrice => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double? agreedPrice) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double? agreedPrice)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double? agreedPrice)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AcceptBookingRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AcceptBookingRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AcceptBookingRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this AcceptBookingRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AcceptBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AcceptBookingRequestCopyWith<AcceptBookingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptBookingRequestCopyWith<$Res> {
  factory $AcceptBookingRequestCopyWith(
    AcceptBookingRequest value,
    $Res Function(AcceptBookingRequest) then,
  ) = _$AcceptBookingRequestCopyWithImpl<$Res, AcceptBookingRequest>;
  @useResult
  $Res call({double? agreedPrice});
}

/// @nodoc
class _$AcceptBookingRequestCopyWithImpl<
  $Res,
  $Val extends AcceptBookingRequest
>
    implements $AcceptBookingRequestCopyWith<$Res> {
  _$AcceptBookingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AcceptBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? agreedPrice = freezed}) {
    return _then(
      _value.copyWith(
            agreedPrice: freezed == agreedPrice
                ? _value.agreedPrice
                : agreedPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AcceptBookingRequestImplCopyWith<$Res>
    implements $AcceptBookingRequestCopyWith<$Res> {
  factory _$$AcceptBookingRequestImplCopyWith(
    _$AcceptBookingRequestImpl value,
    $Res Function(_$AcceptBookingRequestImpl) then,
  ) = __$$AcceptBookingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? agreedPrice});
}

/// @nodoc
class __$$AcceptBookingRequestImplCopyWithImpl<$Res>
    extends _$AcceptBookingRequestCopyWithImpl<$Res, _$AcceptBookingRequestImpl>
    implements _$$AcceptBookingRequestImplCopyWith<$Res> {
  __$$AcceptBookingRequestImplCopyWithImpl(
    _$AcceptBookingRequestImpl _value,
    $Res Function(_$AcceptBookingRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AcceptBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? agreedPrice = freezed}) {
    return _then(
      _$AcceptBookingRequestImpl(
        agreedPrice: freezed == agreedPrice
            ? _value.agreedPrice
            : agreedPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AcceptBookingRequestImpl implements _AcceptBookingRequest {
  const _$AcceptBookingRequestImpl({this.agreedPrice});

  factory _$AcceptBookingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AcceptBookingRequestImplFromJson(json);

  @override
  final double? agreedPrice;

  @override
  String toString() {
    return 'AcceptBookingRequest(agreedPrice: $agreedPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptBookingRequestImpl &&
            (identical(other.agreedPrice, agreedPrice) ||
                other.agreedPrice == agreedPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, agreedPrice);

  /// Create a copy of AcceptBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptBookingRequestImplCopyWith<_$AcceptBookingRequestImpl>
  get copyWith =>
      __$$AcceptBookingRequestImplCopyWithImpl<_$AcceptBookingRequestImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double? agreedPrice) $default,
  ) {
    return $default(agreedPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double? agreedPrice)? $default,
  ) {
    return $default?.call(agreedPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double? agreedPrice)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(agreedPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AcceptBookingRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AcceptBookingRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AcceptBookingRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AcceptBookingRequestImplToJson(this);
  }
}

abstract class _AcceptBookingRequest implements AcceptBookingRequest {
  const factory _AcceptBookingRequest({final double? agreedPrice}) =
      _$AcceptBookingRequestImpl;

  factory _AcceptBookingRequest.fromJson(Map<String, dynamic> json) =
      _$AcceptBookingRequestImpl.fromJson;

  @override
  double? get agreedPrice;

  /// Create a copy of AcceptBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcceptBookingRequestImplCopyWith<_$AcceptBookingRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DeclineBookingRequest _$DeclineBookingRequestFromJson(
  Map<String, dynamic> json,
) {
  return _DeclineBookingRequest.fromJson(json);
}

/// @nodoc
mixin _$DeclineBookingRequest {
  String? get reason => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? reason) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? reason)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? reason)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeclineBookingRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeclineBookingRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeclineBookingRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this DeclineBookingRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeclineBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeclineBookingRequestCopyWith<DeclineBookingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeclineBookingRequestCopyWith<$Res> {
  factory $DeclineBookingRequestCopyWith(
    DeclineBookingRequest value,
    $Res Function(DeclineBookingRequest) then,
  ) = _$DeclineBookingRequestCopyWithImpl<$Res, DeclineBookingRequest>;
  @useResult
  $Res call({String? reason});
}

/// @nodoc
class _$DeclineBookingRequestCopyWithImpl<
  $Res,
  $Val extends DeclineBookingRequest
>
    implements $DeclineBookingRequestCopyWith<$Res> {
  _$DeclineBookingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeclineBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = freezed}) {
    return _then(
      _value.copyWith(
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeclineBookingRequestImplCopyWith<$Res>
    implements $DeclineBookingRequestCopyWith<$Res> {
  factory _$$DeclineBookingRequestImplCopyWith(
    _$DeclineBookingRequestImpl value,
    $Res Function(_$DeclineBookingRequestImpl) then,
  ) = __$$DeclineBookingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? reason});
}

/// @nodoc
class __$$DeclineBookingRequestImplCopyWithImpl<$Res>
    extends
        _$DeclineBookingRequestCopyWithImpl<$Res, _$DeclineBookingRequestImpl>
    implements _$$DeclineBookingRequestImplCopyWith<$Res> {
  __$$DeclineBookingRequestImplCopyWithImpl(
    _$DeclineBookingRequestImpl _value,
    $Res Function(_$DeclineBookingRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeclineBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = freezed}) {
    return _then(
      _$DeclineBookingRequestImpl(
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeclineBookingRequestImpl implements _DeclineBookingRequest {
  const _$DeclineBookingRequestImpl({this.reason});

  factory _$DeclineBookingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeclineBookingRequestImplFromJson(json);

  @override
  final String? reason;

  @override
  String toString() {
    return 'DeclineBookingRequest(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeclineBookingRequestImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of DeclineBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeclineBookingRequestImplCopyWith<_$DeclineBookingRequestImpl>
  get copyWith =>
      __$$DeclineBookingRequestImplCopyWithImpl<_$DeclineBookingRequestImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? reason) $default,
  ) {
    return $default(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? reason)? $default,
  ) {
    return $default?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? reason)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeclineBookingRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeclineBookingRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeclineBookingRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeclineBookingRequestImplToJson(this);
  }
}

abstract class _DeclineBookingRequest implements DeclineBookingRequest {
  const factory _DeclineBookingRequest({final String? reason}) =
      _$DeclineBookingRequestImpl;

  factory _DeclineBookingRequest.fromJson(Map<String, dynamic> json) =
      _$DeclineBookingRequestImpl.fromJson;

  @override
  String? get reason;

  /// Create a copy of DeclineBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeclineBookingRequestImplCopyWith<_$DeclineBookingRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UpdateBookingRequest _$UpdateBookingRequestFromJson(Map<String, dynamic> json) {
  return _UpdateBookingRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateBookingRequest {
  String? get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? status) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? status)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? status)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UpdateBookingRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UpdateBookingRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UpdateBookingRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this UpdateBookingRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateBookingRequestCopyWith<UpdateBookingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateBookingRequestCopyWith<$Res> {
  factory $UpdateBookingRequestCopyWith(
    UpdateBookingRequest value,
    $Res Function(UpdateBookingRequest) then,
  ) = _$UpdateBookingRequestCopyWithImpl<$Res, UpdateBookingRequest>;
  @useResult
  $Res call({String? status});
}

/// @nodoc
class _$UpdateBookingRequestCopyWithImpl<
  $Res,
  $Val extends UpdateBookingRequest
>
    implements $UpdateBookingRequestCopyWith<$Res> {
  _$UpdateBookingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = freezed}) {
    return _then(
      _value.copyWith(
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdateBookingRequestImplCopyWith<$Res>
    implements $UpdateBookingRequestCopyWith<$Res> {
  factory _$$UpdateBookingRequestImplCopyWith(
    _$UpdateBookingRequestImpl value,
    $Res Function(_$UpdateBookingRequestImpl) then,
  ) = __$$UpdateBookingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status});
}

/// @nodoc
class __$$UpdateBookingRequestImplCopyWithImpl<$Res>
    extends _$UpdateBookingRequestCopyWithImpl<$Res, _$UpdateBookingRequestImpl>
    implements _$$UpdateBookingRequestImplCopyWith<$Res> {
  __$$UpdateBookingRequestImplCopyWithImpl(
    _$UpdateBookingRequestImpl _value,
    $Res Function(_$UpdateBookingRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdateBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = freezed}) {
    return _then(
      _$UpdateBookingRequestImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateBookingRequestImpl implements _UpdateBookingRequest {
  const _$UpdateBookingRequestImpl({this.status});

  factory _$UpdateBookingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateBookingRequestImplFromJson(json);

  @override
  final String? status;

  @override
  String toString() {
    return 'UpdateBookingRequest(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBookingRequestImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of UpdateBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBookingRequestImplCopyWith<_$UpdateBookingRequestImpl>
  get copyWith =>
      __$$UpdateBookingRequestImplCopyWithImpl<_$UpdateBookingRequestImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? status) $default,
  ) {
    return $default(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? status)? $default,
  ) {
    return $default?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? status)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UpdateBookingRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UpdateBookingRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UpdateBookingRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateBookingRequestImplToJson(this);
  }
}

abstract class _UpdateBookingRequest implements UpdateBookingRequest {
  const factory _UpdateBookingRequest({final String? status}) =
      _$UpdateBookingRequestImpl;

  factory _UpdateBookingRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateBookingRequestImpl.fromJson;

  @override
  String? get status;

  /// Create a copy of UpdateBookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateBookingRequestImplCopyWith<_$UpdateBookingRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
