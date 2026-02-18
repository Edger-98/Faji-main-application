// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_booking_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VendorBookingEntity _$VendorBookingEntityFromJson(Map<String, dynamic> json) {
  return _VendorBookingEntity.fromJson(json);
}

/// @nodoc
mixin _$VendorBookingEntity {
  String get id => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;
  String get resourceId => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  String get eventName => throw _privateConstructorUsedError;
  DateTime get eventDate => throw _privateConstructorUsedError;
  double get offeredPrice => throw _privateConstructorUsedError;
  BookingStatus get status => throw _privateConstructorUsedError;
  double? get counterOfferPrice => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String vendorId,
      String resourceId,
      String customerId,
      String customerName,
      String eventName,
      DateTime eventDate,
      double offeredPrice,
      BookingStatus status,
      double? counterOfferPrice,
      String? message,
      DateTime? createdAt,
      DateTime? updatedAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String vendorId,
      String resourceId,
      String customerId,
      String customerName,
      String eventName,
      DateTime eventDate,
      double offeredPrice,
      BookingStatus status,
      double? counterOfferPrice,
      String? message,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String vendorId,
      String resourceId,
      String customerId,
      String customerName,
      String eventName,
      DateTime eventDate,
      double offeredPrice,
      BookingStatus status,
      double? counterOfferPrice,
      String? message,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorBookingEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorBookingEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorBookingEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorBookingEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorBookingEntityCopyWith<VendorBookingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorBookingEntityCopyWith<$Res> {
  factory $VendorBookingEntityCopyWith(
    VendorBookingEntity value,
    $Res Function(VendorBookingEntity) then,
  ) = _$VendorBookingEntityCopyWithImpl<$Res, VendorBookingEntity>;
  @useResult
  $Res call({
    String id,
    String vendorId,
    String resourceId,
    String customerId,
    String customerName,
    String eventName,
    DateTime eventDate,
    double offeredPrice,
    BookingStatus status,
    double? counterOfferPrice,
    String? message,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$VendorBookingEntityCopyWithImpl<$Res, $Val extends VendorBookingEntity>
    implements $VendorBookingEntityCopyWith<$Res> {
  _$VendorBookingEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = null,
    Object? resourceId = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? eventName = null,
    Object? eventDate = null,
    Object? offeredPrice = null,
    Object? status = null,
    Object? counterOfferPrice = freezed,
    Object? message = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            vendorId: null == vendorId
                ? _value.vendorId
                : vendorId // ignore: cast_nullable_to_non_nullable
                      as String,
            resourceId: null == resourceId
                ? _value.resourceId
                : resourceId // ignore: cast_nullable_to_non_nullable
                      as String,
            customerId: null == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                      as String,
            customerName: null == customerName
                ? _value.customerName
                : customerName // ignore: cast_nullable_to_non_nullable
                      as String,
            eventName: null == eventName
                ? _value.eventName
                : eventName // ignore: cast_nullable_to_non_nullable
                      as String,
            eventDate: null == eventDate
                ? _value.eventDate
                : eventDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            offeredPrice: null == offeredPrice
                ? _value.offeredPrice
                : offeredPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as BookingStatus,
            counterOfferPrice: freezed == counterOfferPrice
                ? _value.counterOfferPrice
                : counterOfferPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$VendorBookingEntityImplCopyWith<$Res>
    implements $VendorBookingEntityCopyWith<$Res> {
  factory _$$VendorBookingEntityImplCopyWith(
    _$VendorBookingEntityImpl value,
    $Res Function(_$VendorBookingEntityImpl) then,
  ) = __$$VendorBookingEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String vendorId,
    String resourceId,
    String customerId,
    String customerName,
    String eventName,
    DateTime eventDate,
    double offeredPrice,
    BookingStatus status,
    double? counterOfferPrice,
    String? message,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$VendorBookingEntityImplCopyWithImpl<$Res>
    extends _$VendorBookingEntityCopyWithImpl<$Res, _$VendorBookingEntityImpl>
    implements _$$VendorBookingEntityImplCopyWith<$Res> {
  __$$VendorBookingEntityImplCopyWithImpl(
    _$VendorBookingEntityImpl _value,
    $Res Function(_$VendorBookingEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = null,
    Object? resourceId = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? eventName = null,
    Object? eventDate = null,
    Object? offeredPrice = null,
    Object? status = null,
    Object? counterOfferPrice = freezed,
    Object? message = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$VendorBookingEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        vendorId: null == vendorId
            ? _value.vendorId
            : vendorId // ignore: cast_nullable_to_non_nullable
                  as String,
        resourceId: null == resourceId
            ? _value.resourceId
            : resourceId // ignore: cast_nullable_to_non_nullable
                  as String,
        customerId: null == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                  as String,
        customerName: null == customerName
            ? _value.customerName
            : customerName // ignore: cast_nullable_to_non_nullable
                  as String,
        eventName: null == eventName
            ? _value.eventName
            : eventName // ignore: cast_nullable_to_non_nullable
                  as String,
        eventDate: null == eventDate
            ? _value.eventDate
            : eventDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        offeredPrice: null == offeredPrice
            ? _value.offeredPrice
            : offeredPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as BookingStatus,
        counterOfferPrice: freezed == counterOfferPrice
            ? _value.counterOfferPrice
            : counterOfferPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
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
@JsonSerializable()
class _$VendorBookingEntityImpl implements _VendorBookingEntity {
  const _$VendorBookingEntityImpl({
    required this.id,
    required this.vendorId,
    required this.resourceId,
    required this.customerId,
    required this.customerName,
    required this.eventName,
    required this.eventDate,
    required this.offeredPrice,
    required this.status,
    this.counterOfferPrice,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  factory _$VendorBookingEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorBookingEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String vendorId;
  @override
  final String resourceId;
  @override
  final String customerId;
  @override
  final String customerName;
  @override
  final String eventName;
  @override
  final DateTime eventDate;
  @override
  final double offeredPrice;
  @override
  final BookingStatus status;
  @override
  final double? counterOfferPrice;
  @override
  final String? message;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'VendorBookingEntity(id: $id, vendorId: $vendorId, resourceId: $resourceId, customerId: $customerId, customerName: $customerName, eventName: $eventName, eventDate: $eventDate, offeredPrice: $offeredPrice, status: $status, counterOfferPrice: $counterOfferPrice, message: $message, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorBookingEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.offeredPrice, offeredPrice) ||
                other.offeredPrice == offeredPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.counterOfferPrice, counterOfferPrice) ||
                other.counterOfferPrice == counterOfferPrice) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    vendorId,
    resourceId,
    customerId,
    customerName,
    eventName,
    eventDate,
    offeredPrice,
    status,
    counterOfferPrice,
    message,
    createdAt,
    updatedAt,
  );

  /// Create a copy of VendorBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorBookingEntityImplCopyWith<_$VendorBookingEntityImpl> get copyWith =>
      __$$VendorBookingEntityImplCopyWithImpl<_$VendorBookingEntityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String vendorId,
      String resourceId,
      String customerId,
      String customerName,
      String eventName,
      DateTime eventDate,
      double offeredPrice,
      BookingStatus status,
      double? counterOfferPrice,
      String? message,
      DateTime? createdAt,
      DateTime? updatedAt,
    )
    $default,
  ) {
    return $default(
      id,
      vendorId,
      resourceId,
      customerId,
      customerName,
      eventName,
      eventDate,
      offeredPrice,
      status,
      counterOfferPrice,
      message,
      createdAt,
      updatedAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String vendorId,
      String resourceId,
      String customerId,
      String customerName,
      String eventName,
      DateTime eventDate,
      double offeredPrice,
      BookingStatus status,
      double? counterOfferPrice,
      String? message,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      vendorId,
      resourceId,
      customerId,
      customerName,
      eventName,
      eventDate,
      offeredPrice,
      status,
      counterOfferPrice,
      message,
      createdAt,
      updatedAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String vendorId,
      String resourceId,
      String customerId,
      String customerName,
      String eventName,
      DateTime eventDate,
      double offeredPrice,
      BookingStatus status,
      double? counterOfferPrice,
      String? message,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        vendorId,
        resourceId,
        customerId,
        customerName,
        eventName,
        eventDate,
        offeredPrice,
        status,
        counterOfferPrice,
        message,
        createdAt,
        updatedAt,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorBookingEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorBookingEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorBookingEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorBookingEntityImplToJson(this);
  }
}

abstract class _VendorBookingEntity implements VendorBookingEntity {
  const factory _VendorBookingEntity({
    required final String id,
    required final String vendorId,
    required final String resourceId,
    required final String customerId,
    required final String customerName,
    required final String eventName,
    required final DateTime eventDate,
    required final double offeredPrice,
    required final BookingStatus status,
    final double? counterOfferPrice,
    final String? message,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$VendorBookingEntityImpl;

  factory _VendorBookingEntity.fromJson(Map<String, dynamic> json) =
      _$VendorBookingEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get vendorId;
  @override
  String get resourceId;
  @override
  String get customerId;
  @override
  String get customerName;
  @override
  String get eventName;
  @override
  DateTime get eventDate;
  @override
  double get offeredPrice;
  @override
  BookingStatus get status;
  @override
  double? get counterOfferPrice;
  @override
  String? get message;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of VendorBookingEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorBookingEntityImplCopyWith<_$VendorBookingEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
