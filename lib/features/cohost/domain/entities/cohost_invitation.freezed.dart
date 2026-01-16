// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cohost_invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CohostInvitation _$CohostInvitationFromJson(Map<String, dynamic> json) {
  return _CohostInvitation.fromJson(json);
}

/// @nodoc
mixin _$CohostInvitation {
  String get id => throw _privateConstructorUsedError;
  CohostEvent get event => throw _privateConstructorUsedError;
  CohostUser get host => throw _privateConstructorUsedError;
  double get revenueShare => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get expiresAt => throw _privateConstructorUsedError;
  String? get respondedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      CohostEvent event,
      CohostUser host,
      double revenueShare,
      String status,
      String? message,
      String createdAt,
      String expiresAt,
      String? respondedAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      CohostEvent event,
      CohostUser host,
      double revenueShare,
      String status,
      String? message,
      String createdAt,
      String expiresAt,
      String? respondedAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      CohostEvent event,
      CohostUser host,
      double revenueShare,
      String status,
      String? message,
      String createdAt,
      String expiresAt,
      String? respondedAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostInvitation value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostInvitation value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostInvitation value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this CohostInvitation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CohostInvitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CohostInvitationCopyWith<CohostInvitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CohostInvitationCopyWith<$Res> {
  factory $CohostInvitationCopyWith(
    CohostInvitation value,
    $Res Function(CohostInvitation) then,
  ) = _$CohostInvitationCopyWithImpl<$Res, CohostInvitation>;
  @useResult
  $Res call({
    String id,
    CohostEvent event,
    CohostUser host,
    double revenueShare,
    String status,
    String? message,
    String createdAt,
    String expiresAt,
    String? respondedAt,
  });

  $CohostEventCopyWith<$Res> get event;
  $CohostUserCopyWith<$Res> get host;
}

/// @nodoc
class _$CohostInvitationCopyWithImpl<$Res, $Val extends CohostInvitation>
    implements $CohostInvitationCopyWith<$Res> {
  _$CohostInvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CohostInvitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? event = null,
    Object? host = null,
    Object? revenueShare = null,
    Object? status = null,
    Object? message = freezed,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? respondedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            event: null == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                      as CohostEvent,
            host: null == host
                ? _value.host
                : host // ignore: cast_nullable_to_non_nullable
                      as CohostUser,
            revenueShare: null == revenueShare
                ? _value.revenueShare
                : revenueShare // ignore: cast_nullable_to_non_nullable
                      as double,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as String,
            respondedAt: freezed == respondedAt
                ? _value.respondedAt
                : respondedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of CohostInvitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CohostEventCopyWith<$Res> get event {
    return $CohostEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }

  /// Create a copy of CohostInvitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CohostUserCopyWith<$Res> get host {
    return $CohostUserCopyWith<$Res>(_value.host, (value) {
      return _then(_value.copyWith(host: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CohostInvitationImplCopyWith<$Res>
    implements $CohostInvitationCopyWith<$Res> {
  factory _$$CohostInvitationImplCopyWith(
    _$CohostInvitationImpl value,
    $Res Function(_$CohostInvitationImpl) then,
  ) = __$$CohostInvitationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    CohostEvent event,
    CohostUser host,
    double revenueShare,
    String status,
    String? message,
    String createdAt,
    String expiresAt,
    String? respondedAt,
  });

  @override
  $CohostEventCopyWith<$Res> get event;
  @override
  $CohostUserCopyWith<$Res> get host;
}

/// @nodoc
class __$$CohostInvitationImplCopyWithImpl<$Res>
    extends _$CohostInvitationCopyWithImpl<$Res, _$CohostInvitationImpl>
    implements _$$CohostInvitationImplCopyWith<$Res> {
  __$$CohostInvitationImplCopyWithImpl(
    _$CohostInvitationImpl _value,
    $Res Function(_$CohostInvitationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CohostInvitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? event = null,
    Object? host = null,
    Object? revenueShare = null,
    Object? status = null,
    Object? message = freezed,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? respondedAt = freezed,
  }) {
    return _then(
      _$CohostInvitationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        event: null == event
            ? _value.event
            : event // ignore: cast_nullable_to_non_nullable
                  as CohostEvent,
        host: null == host
            ? _value.host
            : host // ignore: cast_nullable_to_non_nullable
                  as CohostUser,
        revenueShare: null == revenueShare
            ? _value.revenueShare
            : revenueShare // ignore: cast_nullable_to_non_nullable
                  as double,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as String,
        respondedAt: freezed == respondedAt
            ? _value.respondedAt
            : respondedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CohostInvitationImpl implements _CohostInvitation {
  const _$CohostInvitationImpl({
    required this.id,
    required this.event,
    required this.host,
    required this.revenueShare,
    required this.status,
    this.message,
    required this.createdAt,
    required this.expiresAt,
    this.respondedAt,
  });

  factory _$CohostInvitationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CohostInvitationImplFromJson(json);

  @override
  final String id;
  @override
  final CohostEvent event;
  @override
  final CohostUser host;
  @override
  final double revenueShare;
  @override
  final String status;
  @override
  final String? message;
  @override
  final String createdAt;
  @override
  final String expiresAt;
  @override
  final String? respondedAt;

  @override
  String toString() {
    return 'CohostInvitation(id: $id, event: $event, host: $host, revenueShare: $revenueShare, status: $status, message: $message, createdAt: $createdAt, expiresAt: $expiresAt, respondedAt: $respondedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CohostInvitationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.revenueShare, revenueShare) ||
                other.revenueShare == revenueShare) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    event,
    host,
    revenueShare,
    status,
    message,
    createdAt,
    expiresAt,
    respondedAt,
  );

  /// Create a copy of CohostInvitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CohostInvitationImplCopyWith<_$CohostInvitationImpl> get copyWith =>
      __$$CohostInvitationImplCopyWithImpl<_$CohostInvitationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      CohostEvent event,
      CohostUser host,
      double revenueShare,
      String status,
      String? message,
      String createdAt,
      String expiresAt,
      String? respondedAt,
    )
    $default,
  ) {
    return $default(
      id,
      event,
      host,
      revenueShare,
      status,
      message,
      createdAt,
      expiresAt,
      respondedAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      CohostEvent event,
      CohostUser host,
      double revenueShare,
      String status,
      String? message,
      String createdAt,
      String expiresAt,
      String? respondedAt,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      event,
      host,
      revenueShare,
      status,
      message,
      createdAt,
      expiresAt,
      respondedAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      CohostEvent event,
      CohostUser host,
      double revenueShare,
      String status,
      String? message,
      String createdAt,
      String expiresAt,
      String? respondedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        event,
        host,
        revenueShare,
        status,
        message,
        createdAt,
        expiresAt,
        respondedAt,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostInvitation value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostInvitation value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostInvitation value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CohostInvitationImplToJson(this);
  }
}

abstract class _CohostInvitation implements CohostInvitation {
  const factory _CohostInvitation({
    required final String id,
    required final CohostEvent event,
    required final CohostUser host,
    required final double revenueShare,
    required final String status,
    final String? message,
    required final String createdAt,
    required final String expiresAt,
    final String? respondedAt,
  }) = _$CohostInvitationImpl;

  factory _CohostInvitation.fromJson(Map<String, dynamic> json) =
      _$CohostInvitationImpl.fromJson;

  @override
  String get id;
  @override
  CohostEvent get event;
  @override
  CohostUser get host;
  @override
  double get revenueShare;
  @override
  String get status;
  @override
  String? get message;
  @override
  String get createdAt;
  @override
  String get expiresAt;
  @override
  String? get respondedAt;

  /// Create a copy of CohostInvitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CohostInvitationImplCopyWith<_$CohostInvitationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CohostEvent _$CohostEventFromJson(Map<String, dynamic> json) {
  return _CohostEvent.fromJson(json);
}

/// @nodoc
mixin _$CohostEvent {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String startDate, String? imageUrl)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String startDate,
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
      String? imageUrl,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostEvent value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostEvent value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostEvent value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this CohostEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CohostEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CohostEventCopyWith<CohostEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CohostEventCopyWith<$Res> {
  factory $CohostEventCopyWith(
    CohostEvent value,
    $Res Function(CohostEvent) then,
  ) = _$CohostEventCopyWithImpl<$Res, CohostEvent>;
  @useResult
  $Res call({String id, String name, String startDate, String? imageUrl});
}

/// @nodoc
class _$CohostEventCopyWithImpl<$Res, $Val extends CohostEvent>
    implements $CohostEventCopyWith<$Res> {
  _$CohostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CohostEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
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
abstract class _$$CohostEventImplCopyWith<$Res>
    implements $CohostEventCopyWith<$Res> {
  factory _$$CohostEventImplCopyWith(
    _$CohostEventImpl value,
    $Res Function(_$CohostEventImpl) then,
  ) = __$$CohostEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String startDate, String? imageUrl});
}

/// @nodoc
class __$$CohostEventImplCopyWithImpl<$Res>
    extends _$CohostEventCopyWithImpl<$Res, _$CohostEventImpl>
    implements _$$CohostEventImplCopyWith<$Res> {
  __$$CohostEventImplCopyWithImpl(
    _$CohostEventImpl _value,
    $Res Function(_$CohostEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CohostEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$CohostEventImpl(
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
class _$CohostEventImpl implements _CohostEvent {
  const _$CohostEventImpl({
    required this.id,
    required this.name,
    required this.startDate,
    this.imageUrl,
  });

  factory _$CohostEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$CohostEventImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String startDate;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'CohostEvent(id: $id, name: $name, startDate: $startDate, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CohostEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, startDate, imageUrl);

  /// Create a copy of CohostEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CohostEventImplCopyWith<_$CohostEventImpl> get copyWith =>
      __$$CohostEventImplCopyWithImpl<_$CohostEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String startDate, String? imageUrl)
    $default,
  ) {
    return $default(id, name, startDate, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String startDate,
      String? imageUrl,
    )?
    $default,
  ) {
    return $default?.call(id, name, startDate, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String startDate,
      String? imageUrl,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, startDate, imageUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostEvent value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostEvent value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostEvent value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CohostEventImplToJson(this);
  }
}

abstract class _CohostEvent implements CohostEvent {
  const factory _CohostEvent({
    required final String id,
    required final String name,
    required final String startDate,
    final String? imageUrl,
  }) = _$CohostEventImpl;

  factory _CohostEvent.fromJson(Map<String, dynamic> json) =
      _$CohostEventImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get startDate;
  @override
  String? get imageUrl;

  /// Create a copy of CohostEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CohostEventImplCopyWith<_$CohostEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CohostUser _$CohostUserFromJson(Map<String, dynamic> json) {
  return _CohostUser.fromJson(json);
}

/// @nodoc
mixin _$CohostUser {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String? avatar) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, String? avatar)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, String? avatar)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostUser value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostUser value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostUser value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this CohostUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CohostUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CohostUserCopyWith<CohostUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CohostUserCopyWith<$Res> {
  factory $CohostUserCopyWith(
    CohostUser value,
    $Res Function(CohostUser) then,
  ) = _$CohostUserCopyWithImpl<$Res, CohostUser>;
  @useResult
  $Res call({String id, String name, String? avatar});
}

/// @nodoc
class _$CohostUserCopyWithImpl<$Res, $Val extends CohostUser>
    implements $CohostUserCopyWith<$Res> {
  _$CohostUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CohostUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = freezed,
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
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CohostUserImplCopyWith<$Res>
    implements $CohostUserCopyWith<$Res> {
  factory _$$CohostUserImplCopyWith(
    _$CohostUserImpl value,
    $Res Function(_$CohostUserImpl) then,
  ) = __$$CohostUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? avatar});
}

/// @nodoc
class __$$CohostUserImplCopyWithImpl<$Res>
    extends _$CohostUserCopyWithImpl<$Res, _$CohostUserImpl>
    implements _$$CohostUserImplCopyWith<$Res> {
  __$$CohostUserImplCopyWithImpl(
    _$CohostUserImpl _value,
    $Res Function(_$CohostUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CohostUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = freezed,
  }) {
    return _then(
      _$CohostUserImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CohostUserImpl implements _CohostUser {
  const _$CohostUserImpl({required this.id, required this.name, this.avatar});

  factory _$CohostUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$CohostUserImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'CohostUser(id: $id, name: $name, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CohostUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar);

  /// Create a copy of CohostUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CohostUserImplCopyWith<_$CohostUserImpl> get copyWith =>
      __$$CohostUserImplCopyWithImpl<_$CohostUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String? avatar) $default,
  ) {
    return $default(id, name, avatar);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, String? avatar)? $default,
  ) {
    return $default?.call(id, name, avatar);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, String? avatar)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, avatar);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostUser value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostUser value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostUser value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CohostUserImplToJson(this);
  }
}

abstract class _CohostUser implements CohostUser {
  const factory _CohostUser({
    required final String id,
    required final String name,
    final String? avatar,
  }) = _$CohostUserImpl;

  factory _CohostUser.fromJson(Map<String, dynamic> json) =
      _$CohostUserImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get avatar;

  /// Create a copy of CohostUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CohostUserImplCopyWith<_$CohostUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CohostInvitationsResponse _$CohostInvitationsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CohostInvitationsResponse.fromJson(json);
}

/// @nodoc
mixin _$CohostInvitationsResponse {
  List<CohostInvitation> get invitations => throw _privateConstructorUsedError;
  PaginationData get pagination => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      List<CohostInvitation> invitations,
      PaginationData pagination,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      List<CohostInvitation> invitations,
      PaginationData pagination,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      List<CohostInvitation> invitations,
      PaginationData pagination,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostInvitationsResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostInvitationsResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostInvitationsResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this CohostInvitationsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CohostInvitationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CohostInvitationsResponseCopyWith<CohostInvitationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CohostInvitationsResponseCopyWith<$Res> {
  factory $CohostInvitationsResponseCopyWith(
    CohostInvitationsResponse value,
    $Res Function(CohostInvitationsResponse) then,
  ) = _$CohostInvitationsResponseCopyWithImpl<$Res, CohostInvitationsResponse>;
  @useResult
  $Res call({List<CohostInvitation> invitations, PaginationData pagination});

  $PaginationDataCopyWith<$Res> get pagination;
}

/// @nodoc
class _$CohostInvitationsResponseCopyWithImpl<
  $Res,
  $Val extends CohostInvitationsResponse
>
    implements $CohostInvitationsResponseCopyWith<$Res> {
  _$CohostInvitationsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CohostInvitationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? invitations = null, Object? pagination = null}) {
    return _then(
      _value.copyWith(
            invitations: null == invitations
                ? _value.invitations
                : invitations // ignore: cast_nullable_to_non_nullable
                      as List<CohostInvitation>,
            pagination: null == pagination
                ? _value.pagination
                : pagination // ignore: cast_nullable_to_non_nullable
                      as PaginationData,
          )
          as $Val,
    );
  }

  /// Create a copy of CohostInvitationsResponse
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
abstract class _$$CohostInvitationsResponseImplCopyWith<$Res>
    implements $CohostInvitationsResponseCopyWith<$Res> {
  factory _$$CohostInvitationsResponseImplCopyWith(
    _$CohostInvitationsResponseImpl value,
    $Res Function(_$CohostInvitationsResponseImpl) then,
  ) = __$$CohostInvitationsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CohostInvitation> invitations, PaginationData pagination});

  @override
  $PaginationDataCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$CohostInvitationsResponseImplCopyWithImpl<$Res>
    extends
        _$CohostInvitationsResponseCopyWithImpl<
          $Res,
          _$CohostInvitationsResponseImpl
        >
    implements _$$CohostInvitationsResponseImplCopyWith<$Res> {
  __$$CohostInvitationsResponseImplCopyWithImpl(
    _$CohostInvitationsResponseImpl _value,
    $Res Function(_$CohostInvitationsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CohostInvitationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? invitations = null, Object? pagination = null}) {
    return _then(
      _$CohostInvitationsResponseImpl(
        invitations: null == invitations
            ? _value._invitations
            : invitations // ignore: cast_nullable_to_non_nullable
                  as List<CohostInvitation>,
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
class _$CohostInvitationsResponseImpl implements _CohostInvitationsResponse {
  const _$CohostInvitationsResponseImpl({
    required final List<CohostInvitation> invitations,
    required this.pagination,
  }) : _invitations = invitations;

  factory _$CohostInvitationsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CohostInvitationsResponseImplFromJson(json);

  final List<CohostInvitation> _invitations;
  @override
  List<CohostInvitation> get invitations {
    if (_invitations is EqualUnmodifiableListView) return _invitations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invitations);
  }

  @override
  final PaginationData pagination;

  @override
  String toString() {
    return 'CohostInvitationsResponse(invitations: $invitations, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CohostInvitationsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._invitations,
              _invitations,
            ) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_invitations),
    pagination,
  );

  /// Create a copy of CohostInvitationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CohostInvitationsResponseImplCopyWith<_$CohostInvitationsResponseImpl>
  get copyWith =>
      __$$CohostInvitationsResponseImplCopyWithImpl<
        _$CohostInvitationsResponseImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      List<CohostInvitation> invitations,
      PaginationData pagination,
    )
    $default,
  ) {
    return $default(invitations, pagination);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      List<CohostInvitation> invitations,
      PaginationData pagination,
    )?
    $default,
  ) {
    return $default?.call(invitations, pagination);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      List<CohostInvitation> invitations,
      PaginationData pagination,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(invitations, pagination);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostInvitationsResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostInvitationsResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostInvitationsResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CohostInvitationsResponseImplToJson(this);
  }
}

abstract class _CohostInvitationsResponse implements CohostInvitationsResponse {
  const factory _CohostInvitationsResponse({
    required final List<CohostInvitation> invitations,
    required final PaginationData pagination,
  }) = _$CohostInvitationsResponseImpl;

  factory _CohostInvitationsResponse.fromJson(Map<String, dynamic> json) =
      _$CohostInvitationsResponseImpl.fromJson;

  @override
  List<CohostInvitation> get invitations;
  @override
  PaginationData get pagination;

  /// Create a copy of CohostInvitationsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CohostInvitationsResponseImplCopyWith<_$CohostInvitationsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
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
