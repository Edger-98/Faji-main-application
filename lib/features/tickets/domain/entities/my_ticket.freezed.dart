// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MyTicket _$MyTicketFromJson(Map<String, dynamic> json) {
  return _MyTicket.fromJson(json);
}

/// @nodoc
mixin _$MyTicket {
  String get id => throw _privateConstructorUsedError;
  String get ticketNumber => throw _privateConstructorUsedError;
  TicketEvent get event => throw _privateConstructorUsedError;
  String get qrCode => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get purchaseDate => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  bool get checkedIn => throw _privateConstructorUsedError;
  String? get checkedInAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String ticketNumber,
      TicketEvent event,
      String qrCode,
      String status,
      String purchaseDate,
      double price,
      bool checkedIn,
      String? checkedInAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String ticketNumber,
      TicketEvent event,
      String qrCode,
      String status,
      String purchaseDate,
      double price,
      bool checkedIn,
      String? checkedInAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String ticketNumber,
      TicketEvent event,
      String qrCode,
      String status,
      String purchaseDate,
      double price,
      bool checkedIn,
      String? checkedInAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MyTicket value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MyTicket value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MyTicket value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this MyTicket to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyTicket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyTicketCopyWith<MyTicket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTicketCopyWith<$Res> {
  factory $MyTicketCopyWith(MyTicket value, $Res Function(MyTicket) then) =
      _$MyTicketCopyWithImpl<$Res, MyTicket>;
  @useResult
  $Res call({
    String id,
    String ticketNumber,
    TicketEvent event,
    String qrCode,
    String status,
    String purchaseDate,
    double price,
    bool checkedIn,
    String? checkedInAt,
  });

  $TicketEventCopyWith<$Res> get event;
}

/// @nodoc
class _$MyTicketCopyWithImpl<$Res, $Val extends MyTicket>
    implements $MyTicketCopyWith<$Res> {
  _$MyTicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyTicket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketNumber = null,
    Object? event = null,
    Object? qrCode = null,
    Object? status = null,
    Object? purchaseDate = null,
    Object? price = null,
    Object? checkedIn = null,
    Object? checkedInAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            ticketNumber: null == ticketNumber
                ? _value.ticketNumber
                : ticketNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            event: null == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                      as TicketEvent,
            qrCode: null == qrCode
                ? _value.qrCode
                : qrCode // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            purchaseDate: null == purchaseDate
                ? _value.purchaseDate
                : purchaseDate // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            checkedIn: null == checkedIn
                ? _value.checkedIn
                : checkedIn // ignore: cast_nullable_to_non_nullable
                      as bool,
            checkedInAt: freezed == checkedInAt
                ? _value.checkedInAt
                : checkedInAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of MyTicket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketEventCopyWith<$Res> get event {
    return $TicketEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyTicketImplCopyWith<$Res>
    implements $MyTicketCopyWith<$Res> {
  factory _$$MyTicketImplCopyWith(
    _$MyTicketImpl value,
    $Res Function(_$MyTicketImpl) then,
  ) = __$$MyTicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String ticketNumber,
    TicketEvent event,
    String qrCode,
    String status,
    String purchaseDate,
    double price,
    bool checkedIn,
    String? checkedInAt,
  });

  @override
  $TicketEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$MyTicketImplCopyWithImpl<$Res>
    extends _$MyTicketCopyWithImpl<$Res, _$MyTicketImpl>
    implements _$$MyTicketImplCopyWith<$Res> {
  __$$MyTicketImplCopyWithImpl(
    _$MyTicketImpl _value,
    $Res Function(_$MyTicketImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyTicket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketNumber = null,
    Object? event = null,
    Object? qrCode = null,
    Object? status = null,
    Object? purchaseDate = null,
    Object? price = null,
    Object? checkedIn = null,
    Object? checkedInAt = freezed,
  }) {
    return _then(
      _$MyTicketImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        ticketNumber: null == ticketNumber
            ? _value.ticketNumber
            : ticketNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        event: null == event
            ? _value.event
            : event // ignore: cast_nullable_to_non_nullable
                  as TicketEvent,
        qrCode: null == qrCode
            ? _value.qrCode
            : qrCode // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        purchaseDate: null == purchaseDate
            ? _value.purchaseDate
            : purchaseDate // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        checkedIn: null == checkedIn
            ? _value.checkedIn
            : checkedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        checkedInAt: freezed == checkedInAt
            ? _value.checkedInAt
            : checkedInAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MyTicketImpl implements _MyTicket {
  const _$MyTicketImpl({
    required this.id,
    required this.ticketNumber,
    required this.event,
    required this.qrCode,
    required this.status,
    required this.purchaseDate,
    required this.price,
    required this.checkedIn,
    this.checkedInAt,
  });

  factory _$MyTicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyTicketImplFromJson(json);

  @override
  final String id;
  @override
  final String ticketNumber;
  @override
  final TicketEvent event;
  @override
  final String qrCode;
  @override
  final String status;
  @override
  final String purchaseDate;
  @override
  final double price;
  @override
  final bool checkedIn;
  @override
  final String? checkedInAt;

  @override
  String toString() {
    return 'MyTicket(id: $id, ticketNumber: $ticketNumber, event: $event, qrCode: $qrCode, status: $status, purchaseDate: $purchaseDate, price: $price, checkedIn: $checkedIn, checkedInAt: $checkedInAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTicketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ticketNumber, ticketNumber) ||
                other.ticketNumber == ticketNumber) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.checkedIn, checkedIn) ||
                other.checkedIn == checkedIn) &&
            (identical(other.checkedInAt, checkedInAt) ||
                other.checkedInAt == checkedInAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    ticketNumber,
    event,
    qrCode,
    status,
    purchaseDate,
    price,
    checkedIn,
    checkedInAt,
  );

  /// Create a copy of MyTicket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyTicketImplCopyWith<_$MyTicketImpl> get copyWith =>
      __$$MyTicketImplCopyWithImpl<_$MyTicketImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String ticketNumber,
      TicketEvent event,
      String qrCode,
      String status,
      String purchaseDate,
      double price,
      bool checkedIn,
      String? checkedInAt,
    )
    $default,
  ) {
    return $default(
      id,
      ticketNumber,
      event,
      qrCode,
      status,
      purchaseDate,
      price,
      checkedIn,
      checkedInAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String ticketNumber,
      TicketEvent event,
      String qrCode,
      String status,
      String purchaseDate,
      double price,
      bool checkedIn,
      String? checkedInAt,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      ticketNumber,
      event,
      qrCode,
      status,
      purchaseDate,
      price,
      checkedIn,
      checkedInAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String ticketNumber,
      TicketEvent event,
      String qrCode,
      String status,
      String purchaseDate,
      double price,
      bool checkedIn,
      String? checkedInAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        ticketNumber,
        event,
        qrCode,
        status,
        purchaseDate,
        price,
        checkedIn,
        checkedInAt,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MyTicket value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MyTicket value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MyTicket value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MyTicketImplToJson(this);
  }
}

abstract class _MyTicket implements MyTicket {
  const factory _MyTicket({
    required final String id,
    required final String ticketNumber,
    required final TicketEvent event,
    required final String qrCode,
    required final String status,
    required final String purchaseDate,
    required final double price,
    required final bool checkedIn,
    final String? checkedInAt,
  }) = _$MyTicketImpl;

  factory _MyTicket.fromJson(Map<String, dynamic> json) =
      _$MyTicketImpl.fromJson;

  @override
  String get id;
  @override
  String get ticketNumber;
  @override
  TicketEvent get event;
  @override
  String get qrCode;
  @override
  String get status;
  @override
  String get purchaseDate;
  @override
  double get price;
  @override
  bool get checkedIn;
  @override
  String? get checkedInAt;

  /// Create a copy of MyTicket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyTicketImplCopyWith<_$MyTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TicketEvent _$TicketEventFromJson(Map<String, dynamic> json) {
  return _TicketEvent.fromJson(json);
}

/// @nodoc
mixin _$TicketEvent {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String startDate,
      String location,
      String? imageUrl,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String startDate,
      String location,
      String? imageUrl,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String startDate,
      String location,
      String? imageUrl,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TicketEvent value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TicketEvent value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TicketEvent value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this TicketEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketEventCopyWith<TicketEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketEventCopyWith<$Res> {
  factory $TicketEventCopyWith(
    TicketEvent value,
    $Res Function(TicketEvent) then,
  ) = _$TicketEventCopyWithImpl<$Res, TicketEvent>;
  @useResult
  $Res call({
    String id,
    String name,
    String startDate,
    String location,
    String? imageUrl,
  });
}

/// @nodoc
class _$TicketEventCopyWithImpl<$Res, $Val extends TicketEvent>
    implements $TicketEventCopyWith<$Res> {
  _$TicketEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? location = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TicketEventImplCopyWith<$Res>
    implements $TicketEventCopyWith<$Res> {
  factory _$$TicketEventImplCopyWith(
    _$TicketEventImpl value,
    $Res Function(_$TicketEventImpl) then,
  ) = __$$TicketEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String startDate,
    String location,
    String? imageUrl,
  });
}

/// @nodoc
class __$$TicketEventImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$TicketEventImpl>
    implements _$$TicketEventImplCopyWith<$Res> {
  __$$TicketEventImplCopyWithImpl(
    _$TicketEventImpl _value,
    $Res Function(_$TicketEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? location = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$TicketEventImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketEventImpl implements _TicketEvent {
  const _$TicketEventImpl({
    required this.id,
    required this.name,
    required this.startDate,
    required this.location,
    this.imageUrl,
  });

  factory _$TicketEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketEventImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String startDate;
  @override
  final String location;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'TicketEvent(id: $id, name: $name, startDate: $startDate, location: $location, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, startDate, location, imageUrl);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketEventImplCopyWith<_$TicketEventImpl> get copyWith =>
      __$$TicketEventImplCopyWithImpl<_$TicketEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String startDate,
      String location,
      String? imageUrl,
    )
    $default,
  ) {
    return $default(id, name, startDate, location, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String startDate,
      String location,
      String? imageUrl,
    )?
    $default,
  ) {
    return $default?.call(id, name, startDate, location, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String startDate,
      String location,
      String? imageUrl,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, startDate, location, imageUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TicketEvent value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TicketEvent value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TicketEvent value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketEventImplToJson(this);
  }
}

abstract class _TicketEvent implements TicketEvent {
  const factory _TicketEvent({
    required final String id,
    required final String name,
    required final String startDate,
    required final String location,
    final String? imageUrl,
  }) = _$TicketEventImpl;

  factory _TicketEvent.fromJson(Map<String, dynamic> json) =
      _$TicketEventImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get startDate;
  @override
  String get location;
  @override
  String? get imageUrl;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketEventImplCopyWith<_$TicketEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MyTicketsResponse _$MyTicketsResponseFromJson(Map<String, dynamic> json) {
  return _MyTicketsResponse.fromJson(json);
}

/// @nodoc
mixin _$MyTicketsResponse {
  List<MyTicket> get tickets => throw _privateConstructorUsedError;
  PaginationData get pagination => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MyTicket> tickets, PaginationData pagination)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MyTicket> tickets, PaginationData pagination)?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MyTicket> tickets, PaginationData pagination)?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MyTicketsResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MyTicketsResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MyTicketsResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this MyTicketsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyTicketsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyTicketsResponseCopyWith<MyTicketsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTicketsResponseCopyWith<$Res> {
  factory $MyTicketsResponseCopyWith(
    MyTicketsResponse value,
    $Res Function(MyTicketsResponse) then,
  ) = _$MyTicketsResponseCopyWithImpl<$Res, MyTicketsResponse>;
  @useResult
  $Res call({List<MyTicket> tickets, PaginationData pagination});

  $PaginationDataCopyWith<$Res> get pagination;
}

/// @nodoc
class _$MyTicketsResponseCopyWithImpl<$Res, $Val extends MyTicketsResponse>
    implements $MyTicketsResponseCopyWith<$Res> {
  _$MyTicketsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyTicketsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tickets = null, Object? pagination = null}) {
    return _then(
      _value.copyWith(
            tickets: null == tickets
                ? _value.tickets
                : tickets // ignore: cast_nullable_to_non_nullable
                      as List<MyTicket>,
            pagination: null == pagination
                ? _value.pagination
                : pagination // ignore: cast_nullable_to_non_nullable
                      as PaginationData,
          )
          as $Val,
    );
  }

  /// Create a copy of MyTicketsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationDataCopyWith<$Res> get pagination {
    return $PaginationDataCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyTicketsResponseImplCopyWith<$Res>
    implements $MyTicketsResponseCopyWith<$Res> {
  factory _$$MyTicketsResponseImplCopyWith(
    _$MyTicketsResponseImpl value,
    $Res Function(_$MyTicketsResponseImpl) then,
  ) = __$$MyTicketsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MyTicket> tickets, PaginationData pagination});

  @override
  $PaginationDataCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$MyTicketsResponseImplCopyWithImpl<$Res>
    extends _$MyTicketsResponseCopyWithImpl<$Res, _$MyTicketsResponseImpl>
    implements _$$MyTicketsResponseImplCopyWith<$Res> {
  __$$MyTicketsResponseImplCopyWithImpl(
    _$MyTicketsResponseImpl _value,
    $Res Function(_$MyTicketsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MyTicketsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tickets = null, Object? pagination = null}) {
    return _then(
      _$MyTicketsResponseImpl(
        tickets: null == tickets
            ? _value._tickets
            : tickets // ignore: cast_nullable_to_non_nullable
                  as List<MyTicket>,
        pagination: null == pagination
            ? _value.pagination
            : pagination // ignore: cast_nullable_to_non_nullable
                  as PaginationData,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MyTicketsResponseImpl implements _MyTicketsResponse {
  const _$MyTicketsResponseImpl({
    required final List<MyTicket> tickets,
    required this.pagination,
  }) : _tickets = tickets;

  factory _$MyTicketsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyTicketsResponseImplFromJson(json);

  final List<MyTicket> _tickets;
  @override
  List<MyTicket> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  @override
  final PaginationData pagination;

  @override
  String toString() {
    return 'MyTicketsResponse(tickets: $tickets, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTicketsResponseImpl &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_tickets),
    pagination,
  );

  /// Create a copy of MyTicketsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyTicketsResponseImplCopyWith<_$MyTicketsResponseImpl> get copyWith =>
      __$$MyTicketsResponseImplCopyWithImpl<_$MyTicketsResponseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<MyTicket> tickets, PaginationData pagination)
    $default,
  ) {
    return $default(tickets, pagination);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<MyTicket> tickets, PaginationData pagination)?
    $default,
  ) {
    return $default?.call(tickets, pagination);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<MyTicket> tickets, PaginationData pagination)?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(tickets, pagination);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_MyTicketsResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MyTicketsResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MyTicketsResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MyTicketsResponseImplToJson(this);
  }
}

abstract class _MyTicketsResponse implements MyTicketsResponse {
  const factory _MyTicketsResponse({
    required final List<MyTicket> tickets,
    required final PaginationData pagination,
  }) = _$MyTicketsResponseImpl;

  factory _MyTicketsResponse.fromJson(Map<String, dynamic> json) =
      _$MyTicketsResponseImpl.fromJson;

  @override
  List<MyTicket> get tickets;
  @override
  PaginationData get pagination;

  /// Create a copy of MyTicketsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyTicketsResponseImplCopyWith<_$MyTicketsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationData _$PaginationDataFromJson(Map<String, dynamic> json) {
  return _PaginationData.fromJson(json);
}

/// @nodoc
mixin _$PaginationData {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int page, int limit, int total, int pages) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int page, int limit, int total, int pages)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int page, int limit, int total, int pages)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PaginationData value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PaginationData value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PaginationData value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this PaginationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationDataCopyWith<PaginationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationDataCopyWith<$Res> {
  factory $PaginationDataCopyWith(
    PaginationData value,
    $Res Function(PaginationData) then,
  ) = _$PaginationDataCopyWithImpl<$Res, PaginationData>;
  @useResult
  $Res call({int page, int limit, int total, int pages});
}

/// @nodoc
class _$PaginationDataCopyWithImpl<$Res, $Val extends PaginationData>
    implements $PaginationDataCopyWith<$Res> {
  _$PaginationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? pages = null,
  }) {
    return _then(
      _value.copyWith(
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            pages: null == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaginationDataImplCopyWith<$Res>
    implements $PaginationDataCopyWith<$Res> {
  factory _$$PaginationDataImplCopyWith(
    _$PaginationDataImpl value,
    $Res Function(_$PaginationDataImpl) then,
  ) = __$$PaginationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int limit, int total, int pages});
}

/// @nodoc
class __$$PaginationDataImplCopyWithImpl<$Res>
    extends _$PaginationDataCopyWithImpl<$Res, _$PaginationDataImpl>
    implements _$$PaginationDataImplCopyWith<$Res> {
  __$$PaginationDataImplCopyWithImpl(
    _$PaginationDataImpl _value,
    $Res Function(_$PaginationDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? pages = null,
  }) {
    return _then(
      _$PaginationDataImpl(
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        pages: null == pages
            ? _value.pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationDataImpl implements _PaginationData {
  const _$PaginationDataImpl({
    required this.page,
    required this.limit,
    required this.total,
    required this.pages,
  });

  factory _$PaginationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationDataImplFromJson(json);

  @override
  final int page;
  @override
  final int limit;
  @override
  final int total;
  @override
  final int pages;

  @override
  String toString() {
    return 'PaginationData(page: $page, limit: $limit, total: $total, pages: $pages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationDataImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, limit, total, pages);

  /// Create a copy of PaginationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationDataImplCopyWith<_$PaginationDataImpl> get copyWith =>
      __$$PaginationDataImplCopyWithImpl<_$PaginationDataImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int page, int limit, int total, int pages) $default,
  ) {
    return $default(page, limit, total, pages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int page, int limit, int total, int pages)? $default,
  ) {
    return $default?.call(page, limit, total, pages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int page, int limit, int total, int pages)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(page, limit, total, pages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PaginationData value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PaginationData value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PaginationData value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationDataImplToJson(this);
  }
}

abstract class _PaginationData implements PaginationData {
  const factory _PaginationData({
    required final int page,
    required final int limit,
    required final int total,
    required final int pages,
  }) = _$PaginationDataImpl;

  factory _PaginationData.fromJson(Map<String, dynamic> json) =
      _$PaginationDataImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;
  @override
  int get total;
  @override
  int get pages;

  /// Create a copy of PaginationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationDataImplCopyWith<_$PaginationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
