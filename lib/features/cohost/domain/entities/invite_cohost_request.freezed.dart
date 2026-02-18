// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_cohost_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InviteCohostRequest _$InviteCohostRequestFromJson(Map<String, dynamic> json) {
  return _InviteCohostRequest.fromJson(json);
}

/// @nodoc
mixin _$InviteCohostRequest {
  String get userId => throw _privateConstructorUsedError;
  double get revenueShare => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String userId, double revenueShare, String? message)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String userId, double revenueShare, String? message)?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String userId, double revenueShare, String? message)?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InviteCohostRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InviteCohostRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InviteCohostRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this InviteCohostRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InviteCohostRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InviteCohostRequestCopyWith<InviteCohostRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InviteCohostRequestCopyWith<$Res> {
  factory $InviteCohostRequestCopyWith(
    InviteCohostRequest value,
    $Res Function(InviteCohostRequest) then,
  ) = _$InviteCohostRequestCopyWithImpl<$Res, InviteCohostRequest>;
  @useResult
  $Res call({String userId, double revenueShare, String? message});
}

/// @nodoc
class _$InviteCohostRequestCopyWithImpl<$Res, $Val extends InviteCohostRequest>
    implements $InviteCohostRequestCopyWith<$Res> {
  _$InviteCohostRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InviteCohostRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? revenueShare = null,
    Object? message = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            revenueShare: null == revenueShare
                ? _value.revenueShare
                : revenueShare // ignore: cast_nullable_to_non_nullable
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
abstract class _$$InviteCohostRequestImplCopyWith<$Res>
    implements $InviteCohostRequestCopyWith<$Res> {
  factory _$$InviteCohostRequestImplCopyWith(
    _$InviteCohostRequestImpl value,
    $Res Function(_$InviteCohostRequestImpl) then,
  ) = __$$InviteCohostRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, double revenueShare, String? message});
}

/// @nodoc
class __$$InviteCohostRequestImplCopyWithImpl<$Res>
    extends _$InviteCohostRequestCopyWithImpl<$Res, _$InviteCohostRequestImpl>
    implements _$$InviteCohostRequestImplCopyWith<$Res> {
  __$$InviteCohostRequestImplCopyWithImpl(
    _$InviteCohostRequestImpl _value,
    $Res Function(_$InviteCohostRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InviteCohostRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? revenueShare = null,
    Object? message = freezed,
  }) {
    return _then(
      _$InviteCohostRequestImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        revenueShare: null == revenueShare
            ? _value.revenueShare
            : revenueShare // ignore: cast_nullable_to_non_nullable
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
class _$InviteCohostRequestImpl implements _InviteCohostRequest {
  const _$InviteCohostRequestImpl({
    required this.userId,
    required this.revenueShare,
    this.message,
  });

  factory _$InviteCohostRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$InviteCohostRequestImplFromJson(json);

  @override
  final String userId;
  @override
  final double revenueShare;
  @override
  final String? message;

  @override
  String toString() {
    return 'InviteCohostRequest(userId: $userId, revenueShare: $revenueShare, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InviteCohostRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.revenueShare, revenueShare) ||
                other.revenueShare == revenueShare) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, revenueShare, message);

  /// Create a copy of InviteCohostRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InviteCohostRequestImplCopyWith<_$InviteCohostRequestImpl> get copyWith =>
      __$$InviteCohostRequestImplCopyWithImpl<_$InviteCohostRequestImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String userId, double revenueShare, String? message)
    $default,
  ) {
    return $default(userId, revenueShare, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String userId, double revenueShare, String? message)?
    $default,
  ) {
    return $default?.call(userId, revenueShare, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String userId, double revenueShare, String? message)?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(userId, revenueShare, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InviteCohostRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InviteCohostRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InviteCohostRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InviteCohostRequestImplToJson(this);
  }
}

abstract class _InviteCohostRequest implements InviteCohostRequest {
  const factory _InviteCohostRequest({
    required final String userId,
    required final double revenueShare,
    final String? message,
  }) = _$InviteCohostRequestImpl;

  factory _InviteCohostRequest.fromJson(Map<String, dynamic> json) =
      _$InviteCohostRequestImpl.fromJson;

  @override
  String get userId;
  @override
  double get revenueShare;
  @override
  String? get message;

  /// Create a copy of InviteCohostRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InviteCohostRequestImplCopyWith<_$InviteCohostRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InviteCohostResponse _$InviteCohostResponseFromJson(Map<String, dynamic> json) {
  return _InviteCohostResponse.fromJson(json);
}

/// @nodoc
mixin _$InviteCohostResponse {
  String get invitationId => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get eventName => throw _privateConstructorUsedError;
  InviteHost get host => throw _privateConstructorUsedError;
  InviteInvitee get invitee => throw _privateConstructorUsedError;
  double get revenueShare => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get expiresAt => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String invitationId,
      String eventId,
      String eventName,
      InviteHost host,
      InviteInvitee invitee,
      double revenueShare,
      String status,
      String createdAt,
      String expiresAt,
      String? message,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String invitationId,
      String eventId,
      String eventName,
      InviteHost host,
      InviteInvitee invitee,
      double revenueShare,
      String status,
      String createdAt,
      String expiresAt,
      String? message,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String invitationId,
      String eventId,
      String eventName,
      InviteHost host,
      InviteInvitee invitee,
      double revenueShare,
      String status,
      String createdAt,
      String expiresAt,
      String? message,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InviteCohostResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InviteCohostResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InviteCohostResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this InviteCohostResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InviteCohostResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InviteCohostResponseCopyWith<InviteCohostResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InviteCohostResponseCopyWith<$Res> {
  factory $InviteCohostResponseCopyWith(
    InviteCohostResponse value,
    $Res Function(InviteCohostResponse) then,
  ) = _$InviteCohostResponseCopyWithImpl<$Res, InviteCohostResponse>;
  @useResult
  $Res call({
    String invitationId,
    String eventId,
    String eventName,
    InviteHost host,
    InviteInvitee invitee,
    double revenueShare,
    String status,
    String createdAt,
    String expiresAt,
    String? message,
  });

  $InviteHostCopyWith<$Res> get host;
  $InviteInviteeCopyWith<$Res> get invitee;
}

/// @nodoc
class _$InviteCohostResponseCopyWithImpl<
  $Res,
  $Val extends InviteCohostResponse
>
    implements $InviteCohostResponseCopyWith<$Res> {
  _$InviteCohostResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InviteCohostResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationId = null,
    Object? eventId = null,
    Object? eventName = null,
    Object? host = null,
    Object? invitee = null,
    Object? revenueShare = null,
    Object? status = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? message = freezed,
  }) {
    return _then(
      _value.copyWith(
            invitationId: null == invitationId
                ? _value.invitationId
                : invitationId // ignore: cast_nullable_to_non_nullable
                      as String,
            eventId: null == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String,
            eventName: null == eventName
                ? _value.eventName
                : eventName // ignore: cast_nullable_to_non_nullable
                      as String,
            host: null == host
                ? _value.host
                : host // ignore: cast_nullable_to_non_nullable
                      as InviteHost,
            invitee: null == invitee
                ? _value.invitee
                : invitee // ignore: cast_nullable_to_non_nullable
                      as InviteInvitee,
            revenueShare: null == revenueShare
                ? _value.revenueShare
                : revenueShare // ignore: cast_nullable_to_non_nullable
                      as double,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as String,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of InviteCohostResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteHostCopyWith<$Res> get host {
    return $InviteHostCopyWith<$Res>(_value.host, (value) {
      return _then(_value.copyWith(host: value) as $Val);
    });
  }

  /// Create a copy of InviteCohostResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteInviteeCopyWith<$Res> get invitee {
    return $InviteInviteeCopyWith<$Res>(_value.invitee, (value) {
      return _then(_value.copyWith(invitee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InviteCohostResponseImplCopyWith<$Res>
    implements $InviteCohostResponseCopyWith<$Res> {
  factory _$$InviteCohostResponseImplCopyWith(
    _$InviteCohostResponseImpl value,
    $Res Function(_$InviteCohostResponseImpl) then,
  ) = __$$InviteCohostResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String invitationId,
    String eventId,
    String eventName,
    InviteHost host,
    InviteInvitee invitee,
    double revenueShare,
    String status,
    String createdAt,
    String expiresAt,
    String? message,
  });

  @override
  $InviteHostCopyWith<$Res> get host;
  @override
  $InviteInviteeCopyWith<$Res> get invitee;
}

/// @nodoc
class __$$InviteCohostResponseImplCopyWithImpl<$Res>
    extends _$InviteCohostResponseCopyWithImpl<$Res, _$InviteCohostResponseImpl>
    implements _$$InviteCohostResponseImplCopyWith<$Res> {
  __$$InviteCohostResponseImplCopyWithImpl(
    _$InviteCohostResponseImpl _value,
    $Res Function(_$InviteCohostResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InviteCohostResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationId = null,
    Object? eventId = null,
    Object? eventName = null,
    Object? host = null,
    Object? invitee = null,
    Object? revenueShare = null,
    Object? status = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? message = freezed,
  }) {
    return _then(
      _$InviteCohostResponseImpl(
        invitationId: null == invitationId
            ? _value.invitationId
            : invitationId // ignore: cast_nullable_to_non_nullable
                  as String,
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String,
        eventName: null == eventName
            ? _value.eventName
            : eventName // ignore: cast_nullable_to_non_nullable
                  as String,
        host: null == host
            ? _value.host
            : host // ignore: cast_nullable_to_non_nullable
                  as InviteHost,
        invitee: null == invitee
            ? _value.invitee
            : invitee // ignore: cast_nullable_to_non_nullable
                  as InviteInvitee,
        revenueShare: null == revenueShare
            ? _value.revenueShare
            : revenueShare // ignore: cast_nullable_to_non_nullable
                  as double,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$InviteCohostResponseImpl implements _InviteCohostResponse {
  const _$InviteCohostResponseImpl({
    required this.invitationId,
    required this.eventId,
    required this.eventName,
    required this.host,
    required this.invitee,
    required this.revenueShare,
    required this.status,
    required this.createdAt,
    required this.expiresAt,
    this.message,
  });

  factory _$InviteCohostResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$InviteCohostResponseImplFromJson(json);

  @override
  final String invitationId;
  @override
  final String eventId;
  @override
  final String eventName;
  @override
  final InviteHost host;
  @override
  final InviteInvitee invitee;
  @override
  final double revenueShare;
  @override
  final String status;
  @override
  final String createdAt;
  @override
  final String expiresAt;
  @override
  final String? message;

  @override
  String toString() {
    return 'InviteCohostResponse(invitationId: $invitationId, eventId: $eventId, eventName: $eventName, host: $host, invitee: $invitee, revenueShare: $revenueShare, status: $status, createdAt: $createdAt, expiresAt: $expiresAt, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InviteCohostResponseImpl &&
            (identical(other.invitationId, invitationId) ||
                other.invitationId == invitationId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.invitee, invitee) || other.invitee == invitee) &&
            (identical(other.revenueShare, revenueShare) ||
                other.revenueShare == revenueShare) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    invitationId,
    eventId,
    eventName,
    host,
    invitee,
    revenueShare,
    status,
    createdAt,
    expiresAt,
    message,
  );

  /// Create a copy of InviteCohostResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InviteCohostResponseImplCopyWith<_$InviteCohostResponseImpl>
  get copyWith =>
      __$$InviteCohostResponseImplCopyWithImpl<_$InviteCohostResponseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String invitationId,
      String eventId,
      String eventName,
      InviteHost host,
      InviteInvitee invitee,
      double revenueShare,
      String status,
      String createdAt,
      String expiresAt,
      String? message,
    )
    $default,
  ) {
    return $default(
      invitationId,
      eventId,
      eventName,
      host,
      invitee,
      revenueShare,
      status,
      createdAt,
      expiresAt,
      message,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String invitationId,
      String eventId,
      String eventName,
      InviteHost host,
      InviteInvitee invitee,
      double revenueShare,
      String status,
      String createdAt,
      String expiresAt,
      String? message,
    )?
    $default,
  ) {
    return $default?.call(
      invitationId,
      eventId,
      eventName,
      host,
      invitee,
      revenueShare,
      status,
      createdAt,
      expiresAt,
      message,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String invitationId,
      String eventId,
      String eventName,
      InviteHost host,
      InviteInvitee invitee,
      double revenueShare,
      String status,
      String createdAt,
      String expiresAt,
      String? message,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        invitationId,
        eventId,
        eventName,
        host,
        invitee,
        revenueShare,
        status,
        createdAt,
        expiresAt,
        message,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InviteCohostResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InviteCohostResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InviteCohostResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InviteCohostResponseImplToJson(this);
  }
}

abstract class _InviteCohostResponse implements InviteCohostResponse {
  const factory _InviteCohostResponse({
    required final String invitationId,
    required final String eventId,
    required final String eventName,
    required final InviteHost host,
    required final InviteInvitee invitee,
    required final double revenueShare,
    required final String status,
    required final String createdAt,
    required final String expiresAt,
    final String? message,
  }) = _$InviteCohostResponseImpl;

  factory _InviteCohostResponse.fromJson(Map<String, dynamic> json) =
      _$InviteCohostResponseImpl.fromJson;

  @override
  String get invitationId;
  @override
  String get eventId;
  @override
  String get eventName;
  @override
  InviteHost get host;
  @override
  InviteInvitee get invitee;
  @override
  double get revenueShare;
  @override
  String get status;
  @override
  String get createdAt;
  @override
  String get expiresAt;
  @override
  String? get message;

  /// Create a copy of InviteCohostResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InviteCohostResponseImplCopyWith<_$InviteCohostResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

InviteHost _$InviteHostFromJson(Map<String, dynamic> json) {
  return _InviteHost.fromJson(json);
}

/// @nodoc
mixin _$InviteHost {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InviteHost value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InviteHost value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InviteHost value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this InviteHost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InviteHost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InviteHostCopyWith<InviteHost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InviteHostCopyWith<$Res> {
  factory $InviteHostCopyWith(
    InviteHost value,
    $Res Function(InviteHost) then,
  ) = _$InviteHostCopyWithImpl<$Res, InviteHost>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$InviteHostCopyWithImpl<$Res, $Val extends InviteHost>
    implements $InviteHostCopyWith<$Res> {
  _$InviteHostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InviteHost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InviteHostImplCopyWith<$Res>
    implements $InviteHostCopyWith<$Res> {
  factory _$$InviteHostImplCopyWith(
    _$InviteHostImpl value,
    $Res Function(_$InviteHostImpl) then,
  ) = __$$InviteHostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$InviteHostImplCopyWithImpl<$Res>
    extends _$InviteHostCopyWithImpl<$Res, _$InviteHostImpl>
    implements _$$InviteHostImplCopyWith<$Res> {
  __$$InviteHostImplCopyWithImpl(
    _$InviteHostImpl _value,
    $Res Function(_$InviteHostImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InviteHost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$InviteHostImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InviteHostImpl implements _InviteHost {
  const _$InviteHostImpl({required this.id, required this.name});

  factory _$InviteHostImpl.fromJson(Map<String, dynamic> json) =>
      _$$InviteHostImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'InviteHost(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InviteHostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of InviteHost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InviteHostImplCopyWith<_$InviteHostImpl> get copyWith =>
      __$$InviteHostImplCopyWithImpl<_$InviteHostImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name) $default,
  ) {
    return $default(id, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name)? $default,
  ) {
    return $default?.call(id, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InviteHost value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InviteHost value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InviteHost value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InviteHostImplToJson(this);
  }
}

abstract class _InviteHost implements InviteHost {
  const factory _InviteHost({
    required final String id,
    required final String name,
  }) = _$InviteHostImpl;

  factory _InviteHost.fromJson(Map<String, dynamic> json) =
      _$InviteHostImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of InviteHost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InviteHostImplCopyWith<_$InviteHostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InviteInvitee _$InviteInviteeFromJson(Map<String, dynamic> json) {
  return _InviteInvitee.fromJson(json);
}

/// @nodoc
mixin _$InviteInvitee {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String email) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, String email)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, String email)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InviteInvitee value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InviteInvitee value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InviteInvitee value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this InviteInvitee to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InviteInvitee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InviteInviteeCopyWith<InviteInvitee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InviteInviteeCopyWith<$Res> {
  factory $InviteInviteeCopyWith(
    InviteInvitee value,
    $Res Function(InviteInvitee) then,
  ) = _$InviteInviteeCopyWithImpl<$Res, InviteInvitee>;
  @useResult
  $Res call({String id, String name, String email});
}

/// @nodoc
class _$InviteInviteeCopyWithImpl<$Res, $Val extends InviteInvitee>
    implements $InviteInviteeCopyWith<$Res> {
  _$InviteInviteeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InviteInvitee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? email = null}) {
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
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InviteInviteeImplCopyWith<$Res>
    implements $InviteInviteeCopyWith<$Res> {
  factory _$$InviteInviteeImplCopyWith(
    _$InviteInviteeImpl value,
    $Res Function(_$InviteInviteeImpl) then,
  ) = __$$InviteInviteeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String email});
}

/// @nodoc
class __$$InviteInviteeImplCopyWithImpl<$Res>
    extends _$InviteInviteeCopyWithImpl<$Res, _$InviteInviteeImpl>
    implements _$$InviteInviteeImplCopyWith<$Res> {
  __$$InviteInviteeImplCopyWithImpl(
    _$InviteInviteeImpl _value,
    $Res Function(_$InviteInviteeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InviteInvitee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? email = null}) {
    return _then(
      _$InviteInviteeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InviteInviteeImpl implements _InviteInvitee {
  const _$InviteInviteeImpl({
    required this.id,
    required this.name,
    required this.email,
  });

  factory _$InviteInviteeImpl.fromJson(Map<String, dynamic> json) =>
      _$$InviteInviteeImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'InviteInvitee(id: $id, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InviteInviteeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email);

  /// Create a copy of InviteInvitee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InviteInviteeImplCopyWith<_$InviteInviteeImpl> get copyWith =>
      __$$InviteInviteeImplCopyWithImpl<_$InviteInviteeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String email) $default,
  ) {
    return $default(id, name, email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, String email)? $default,
  ) {
    return $default?.call(id, name, email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, String email)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InviteInvitee value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InviteInvitee value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InviteInvitee value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InviteInviteeImplToJson(this);
  }
}

abstract class _InviteInvitee implements InviteInvitee {
  const factory _InviteInvitee({
    required final String id,
    required final String name,
    required final String email,
  }) = _$InviteInviteeImpl;

  factory _InviteInvitee.fromJson(Map<String, dynamic> json) =
      _$InviteInviteeImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;

  /// Create a copy of InviteInvitee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InviteInviteeImplCopyWith<_$InviteInviteeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
