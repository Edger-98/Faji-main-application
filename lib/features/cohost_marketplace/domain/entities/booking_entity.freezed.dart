// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BookingEntity {
  String get id => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get hostId => throw _privateConstructorUsedError;
  String get cohostId => throw _privateConstructorUsedError;
  String get resourceId => throw _privateConstructorUsedError;
  BookingStatus get status => throw _privateConstructorUsedError;
  PaymentOption get paymentOption => throw _privateConstructorUsedError;
  double get offeredPrice => throw _privateConstructorUsedError;
  double? get agreedPrice => throw _privateConstructorUsedError;
  double? get percentageSplit => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  DateTime? get eventDate => throw _privateConstructorUsedError;
  EscrowStatus? get escrowStatus => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String eventId,
      String hostId,
      String cohostId,
      String resourceId,
      BookingStatus status,
      PaymentOption paymentOption,
      double offeredPrice,
      double? agreedPrice,
      double? percentageSplit,
      String? message,
      DateTime? eventDate,
      EscrowStatus? escrowStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String eventId,
      String hostId,
      String cohostId,
      String resourceId,
      BookingStatus status,
      PaymentOption paymentOption,
      double offeredPrice,
      double? agreedPrice,
      double? percentageSplit,
      String? message,
      DateTime? eventDate,
      EscrowStatus? escrowStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String eventId,
      String hostId,
      String cohostId,
      String resourceId,
      BookingStatus status,
      PaymentOption paymentOption,
      double offeredPrice,
      double? agreedPrice,
      double? percentageSplit,
      String? message,
      DateTime? eventDate,
      EscrowStatus? escrowStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_BookingEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BookingEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BookingEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingEntityCopyWith<BookingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingEntityCopyWith<$Res> {
  factory $BookingEntityCopyWith(
    BookingEntity value,
    $Res Function(BookingEntity) then,
  ) = _$BookingEntityCopyWithImpl<$Res, BookingEntity>;
  @useResult
  $Res call({
    String id,
    String eventId,
    String hostId,
    String cohostId,
    String resourceId,
    BookingStatus status,
    PaymentOption paymentOption,
    double offeredPrice,
    double? agreedPrice,
    double? percentageSplit,
    String? message,
    DateTime? eventDate,
    EscrowStatus? escrowStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$BookingEntityCopyWithImpl<$Res, $Val extends BookingEntity>
    implements $BookingEntityCopyWith<$Res> {
  _$BookingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? hostId = null,
    Object? cohostId = null,
    Object? resourceId = null,
    Object? status = null,
    Object? paymentOption = null,
    Object? offeredPrice = null,
    Object? agreedPrice = freezed,
    Object? percentageSplit = freezed,
    Object? message = freezed,
    Object? eventDate = freezed,
    Object? escrowStatus = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
            hostId: null == hostId
                ? _value.hostId
                : hostId // ignore: cast_nullable_to_non_nullable
                      as String,
            cohostId: null == cohostId
                ? _value.cohostId
                : cohostId // ignore: cast_nullable_to_non_nullable
                      as String,
            resourceId: null == resourceId
                ? _value.resourceId
                : resourceId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as BookingStatus,
            paymentOption: null == paymentOption
                ? _value.paymentOption
                : paymentOption // ignore: cast_nullable_to_non_nullable
                      as PaymentOption,
            offeredPrice: null == offeredPrice
                ? _value.offeredPrice
                : offeredPrice // ignore: cast_nullable_to_non_nullable
                      as double,
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
                      as DateTime?,
            escrowStatus: freezed == escrowStatus
                ? _value.escrowStatus
                : escrowStatus // ignore: cast_nullable_to_non_nullable
                      as EscrowStatus?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookingEntityImplCopyWith<$Res>
    implements $BookingEntityCopyWith<$Res> {
  factory _$$BookingEntityImplCopyWith(
    _$BookingEntityImpl value,
    $Res Function(_$BookingEntityImpl) then,
  ) = __$$BookingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String eventId,
    String hostId,
    String cohostId,
    String resourceId,
    BookingStatus status,
    PaymentOption paymentOption,
    double offeredPrice,
    double? agreedPrice,
    double? percentageSplit,
    String? message,
    DateTime? eventDate,
    EscrowStatus? escrowStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$BookingEntityImplCopyWithImpl<$Res>
    extends _$BookingEntityCopyWithImpl<$Res, _$BookingEntityImpl>
    implements _$$BookingEntityImplCopyWith<$Res> {
  __$$BookingEntityImplCopyWithImpl(
    _$BookingEntityImpl _value,
    $Res Function(_$BookingEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? hostId = null,
    Object? cohostId = null,
    Object? resourceId = null,
    Object? status = null,
    Object? paymentOption = null,
    Object? offeredPrice = null,
    Object? agreedPrice = freezed,
    Object? percentageSplit = freezed,
    Object? message = freezed,
    Object? eventDate = freezed,
    Object? escrowStatus = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$BookingEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String,
        hostId: null == hostId
            ? _value.hostId
            : hostId // ignore: cast_nullable_to_non_nullable
                  as String,
        cohostId: null == cohostId
            ? _value.cohostId
            : cohostId // ignore: cast_nullable_to_non_nullable
                  as String,
        resourceId: null == resourceId
            ? _value.resourceId
            : resourceId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as BookingStatus,
        paymentOption: null == paymentOption
            ? _value.paymentOption
            : paymentOption // ignore: cast_nullable_to_non_nullable
                  as PaymentOption,
        offeredPrice: null == offeredPrice
            ? _value.offeredPrice
            : offeredPrice // ignore: cast_nullable_to_non_nullable
                  as double,
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
                  as DateTime?,
        escrowStatus: freezed == escrowStatus
            ? _value.escrowStatus
            : escrowStatus // ignore: cast_nullable_to_non_nullable
                  as EscrowStatus?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$BookingEntityImpl implements _BookingEntity {
  const _$BookingEntityImpl({
    required this.id,
    required this.eventId,
    required this.hostId,
    required this.cohostId,
    required this.resourceId,
    required this.status,
    required this.paymentOption,
    required this.offeredPrice,
    this.agreedPrice,
    this.percentageSplit,
    this.message,
    this.eventDate,
    this.escrowStatus,
    this.createdAt,
    this.updatedAt,
  });

  @override
  final String id;
  @override
  final String eventId;
  @override
  final String hostId;
  @override
  final String cohostId;
  @override
  final String resourceId;
  @override
  final BookingStatus status;
  @override
  final PaymentOption paymentOption;
  @override
  final double offeredPrice;
  @override
  final double? agreedPrice;
  @override
  final double? percentageSplit;
  @override
  final String? message;
  @override
  final DateTime? eventDate;
  @override
  final EscrowStatus? escrowStatus;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BookingEntity(id: $id, eventId: $eventId, hostId: $hostId, cohostId: $cohostId, resourceId: $resourceId, status: $status, paymentOption: $paymentOption, offeredPrice: $offeredPrice, agreedPrice: $agreedPrice, percentageSplit: $percentageSplit, message: $message, eventDate: $eventDate, escrowStatus: $escrowStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            (identical(other.cohostId, cohostId) ||
                other.cohostId == cohostId) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
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

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    eventId,
    hostId,
    cohostId,
    resourceId,
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

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingEntityImplCopyWith<_$BookingEntityImpl> get copyWith =>
      __$$BookingEntityImplCopyWithImpl<_$BookingEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String eventId,
      String hostId,
      String cohostId,
      String resourceId,
      BookingStatus status,
      PaymentOption paymentOption,
      double offeredPrice,
      double? agreedPrice,
      double? percentageSplit,
      String? message,
      DateTime? eventDate,
      EscrowStatus? escrowStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
    )
    $default,
  ) {
    return $default(
      id,
      eventId,
      hostId,
      cohostId,
      resourceId,
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
      String hostId,
      String cohostId,
      String resourceId,
      BookingStatus status,
      PaymentOption paymentOption,
      double offeredPrice,
      double? agreedPrice,
      double? percentageSplit,
      String? message,
      DateTime? eventDate,
      EscrowStatus? escrowStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      eventId,
      hostId,
      cohostId,
      resourceId,
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
      String hostId,
      String cohostId,
      String resourceId,
      BookingStatus status,
      PaymentOption paymentOption,
      double offeredPrice,
      double? agreedPrice,
      double? percentageSplit,
      String? message,
      DateTime? eventDate,
      EscrowStatus? escrowStatus,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        eventId,
        hostId,
        cohostId,
        resourceId,
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
    TResult Function(_BookingEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_BookingEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_BookingEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _BookingEntity implements BookingEntity {
  const factory _BookingEntity({
    required final String id,
    required final String eventId,
    required final String hostId,
    required final String cohostId,
    required final String resourceId,
    required final BookingStatus status,
    required final PaymentOption paymentOption,
    required final double offeredPrice,
    final double? agreedPrice,
    final double? percentageSplit,
    final String? message,
    final DateTime? eventDate,
    final EscrowStatus? escrowStatus,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$BookingEntityImpl;

  @override
  String get id;
  @override
  String get eventId;
  @override
  String get hostId;
  @override
  String get cohostId;
  @override
  String get resourceId;
  @override
  BookingStatus get status;
  @override
  PaymentOption get paymentOption;
  @override
  double get offeredPrice;
  @override
  double? get agreedPrice;
  @override
  double? get percentageSplit;
  @override
  String? get message;
  @override
  DateTime? get eventDate;
  @override
  EscrowStatus? get escrowStatus;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of BookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingEntityImplCopyWith<_$BookingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
