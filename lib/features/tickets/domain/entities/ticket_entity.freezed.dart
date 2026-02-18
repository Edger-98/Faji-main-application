// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TicketEntity {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  int get ticketId => throw _privateConstructorUsedError;
  DateTime get purchasedDate => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get transactionId => throw _privateConstructorUsedError;
  String? get promoCode => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String eventId,
      int ticketId,
      DateTime purchasedDate,
      int quantity,
      String transactionId,
      String? promoCode,
      DateTime? createdAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String userId,
      String eventId,
      int ticketId,
      DateTime purchasedDate,
      int quantity,
      String transactionId,
      String? promoCode,
      DateTime? createdAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String eventId,
      int ticketId,
      DateTime purchasedDate,
      int quantity,
      String transactionId,
      String? promoCode,
      DateTime? createdAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TicketEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TicketEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TicketEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of TicketEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketEntityCopyWith<TicketEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketEntityCopyWith<$Res> {
  factory $TicketEntityCopyWith(
    TicketEntity value,
    $Res Function(TicketEntity) then,
  ) = _$TicketEntityCopyWithImpl<$Res, TicketEntity>;
  @useResult
  $Res call({
    String id,
    String userId,
    String eventId,
    int ticketId,
    DateTime purchasedDate,
    int quantity,
    String transactionId,
    String? promoCode,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$TicketEntityCopyWithImpl<$Res, $Val extends TicketEntity>
    implements $TicketEntityCopyWith<$Res> {
  _$TicketEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? eventId = null,
    Object? ticketId = null,
    Object? purchasedDate = null,
    Object? quantity = null,
    Object? transactionId = null,
    Object? promoCode = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            eventId: null == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String,
            ticketId: null == ticketId
                ? _value.ticketId
                : ticketId // ignore: cast_nullable_to_non_nullable
                      as int,
            purchasedDate: null == purchasedDate
                ? _value.purchasedDate
                : purchasedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
            transactionId: null == transactionId
                ? _value.transactionId
                : transactionId // ignore: cast_nullable_to_non_nullable
                      as String,
            promoCode: freezed == promoCode
                ? _value.promoCode
                : promoCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TicketEntityImplCopyWith<$Res>
    implements $TicketEntityCopyWith<$Res> {
  factory _$$TicketEntityImplCopyWith(
    _$TicketEntityImpl value,
    $Res Function(_$TicketEntityImpl) then,
  ) = __$$TicketEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String eventId,
    int ticketId,
    DateTime purchasedDate,
    int quantity,
    String transactionId,
    String? promoCode,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$TicketEntityImplCopyWithImpl<$Res>
    extends _$TicketEntityCopyWithImpl<$Res, _$TicketEntityImpl>
    implements _$$TicketEntityImplCopyWith<$Res> {
  __$$TicketEntityImplCopyWithImpl(
    _$TicketEntityImpl _value,
    $Res Function(_$TicketEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? eventId = null,
    Object? ticketId = null,
    Object? purchasedDate = null,
    Object? quantity = null,
    Object? transactionId = null,
    Object? promoCode = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$TicketEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String,
        ticketId: null == ticketId
            ? _value.ticketId
            : ticketId // ignore: cast_nullable_to_non_nullable
                  as int,
        purchasedDate: null == purchasedDate
            ? _value.purchasedDate
            : purchasedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
        transactionId: null == transactionId
            ? _value.transactionId
            : transactionId // ignore: cast_nullable_to_non_nullable
                  as String,
        promoCode: freezed == promoCode
            ? _value.promoCode
            : promoCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$TicketEntityImpl extends _TicketEntity {
  const _$TicketEntityImpl({
    required this.id,
    required this.userId,
    required this.eventId,
    required this.ticketId,
    required this.purchasedDate,
    required this.quantity,
    required this.transactionId,
    this.promoCode,
    this.createdAt,
  }) : super._();

  @override
  final String id;
  @override
  final String userId;
  @override
  final String eventId;
  @override
  final int ticketId;
  @override
  final DateTime purchasedDate;
  @override
  final int quantity;
  @override
  final String transactionId;
  @override
  final String? promoCode;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'TicketEntity(id: $id, userId: $userId, eventId: $eventId, ticketId: $ticketId, purchasedDate: $purchasedDate, quantity: $quantity, transactionId: $transactionId, promoCode: $promoCode, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.purchasedDate, purchasedDate) ||
                other.purchasedDate == purchasedDate) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    eventId,
    ticketId,
    purchasedDate,
    quantity,
    transactionId,
    promoCode,
    createdAt,
  );

  /// Create a copy of TicketEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketEntityImplCopyWith<_$TicketEntityImpl> get copyWith =>
      __$$TicketEntityImplCopyWithImpl<_$TicketEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String eventId,
      int ticketId,
      DateTime purchasedDate,
      int quantity,
      String transactionId,
      String? promoCode,
      DateTime? createdAt,
    )
    $default,
  ) {
    return $default(
      id,
      userId,
      eventId,
      ticketId,
      purchasedDate,
      quantity,
      transactionId,
      promoCode,
      createdAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String userId,
      String eventId,
      int ticketId,
      DateTime purchasedDate,
      int quantity,
      String transactionId,
      String? promoCode,
      DateTime? createdAt,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      userId,
      eventId,
      ticketId,
      purchasedDate,
      quantity,
      transactionId,
      promoCode,
      createdAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String userId,
      String eventId,
      int ticketId,
      DateTime purchasedDate,
      int quantity,
      String transactionId,
      String? promoCode,
      DateTime? createdAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        userId,
        eventId,
        ticketId,
        purchasedDate,
        quantity,
        transactionId,
        promoCode,
        createdAt,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TicketEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TicketEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TicketEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _TicketEntity extends TicketEntity {
  const factory _TicketEntity({
    required final String id,
    required final String userId,
    required final String eventId,
    required final int ticketId,
    required final DateTime purchasedDate,
    required final int quantity,
    required final String transactionId,
    final String? promoCode,
    final DateTime? createdAt,
  }) = _$TicketEntityImpl;
  const _TicketEntity._() : super._();

  @override
  String get id;
  @override
  String get userId;
  @override
  String get eventId;
  @override
  int get ticketId;
  @override
  DateTime get purchasedDate;
  @override
  int get quantity;
  @override
  String get transactionId;
  @override
  String? get promoCode;
  @override
  DateTime? get createdAt;

  /// Create a copy of TicketEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketEntityImplCopyWith<_$TicketEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
