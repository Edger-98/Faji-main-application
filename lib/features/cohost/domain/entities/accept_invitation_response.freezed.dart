// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accept_invitation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AcceptInvitationResponse _$AcceptInvitationResponseFromJson(
  Map<String, dynamic> json,
) {
  return _AcceptInvitationResponse.fromJson(json);
}

/// @nodoc
mixin _$AcceptInvitationResponse {
  String get invitationId => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  AcceptedCohost get cohost => throw _privateConstructorUsedError;
  String get acceptedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String invitationId,
      String eventId,
      String status,
      AcceptedCohost cohost,
      String acceptedAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String invitationId,
      String eventId,
      String status,
      AcceptedCohost cohost,
      String acceptedAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String invitationId,
      String eventId,
      String status,
      AcceptedCohost cohost,
      String acceptedAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AcceptInvitationResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AcceptInvitationResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AcceptInvitationResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this AcceptInvitationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AcceptInvitationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AcceptInvitationResponseCopyWith<AcceptInvitationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptInvitationResponseCopyWith<$Res> {
  factory $AcceptInvitationResponseCopyWith(
    AcceptInvitationResponse value,
    $Res Function(AcceptInvitationResponse) then,
  ) = _$AcceptInvitationResponseCopyWithImpl<$Res, AcceptInvitationResponse>;
  @useResult
  $Res call({
    String invitationId,
    String eventId,
    String status,
    AcceptedCohost cohost,
    String acceptedAt,
  });

  $AcceptedCohostCopyWith<$Res> get cohost;
}

/// @nodoc
class _$AcceptInvitationResponseCopyWithImpl<
  $Res,
  $Val extends AcceptInvitationResponse
>
    implements $AcceptInvitationResponseCopyWith<$Res> {
  _$AcceptInvitationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AcceptInvitationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationId = null,
    Object? eventId = null,
    Object? status = null,
    Object? cohost = null,
    Object? acceptedAt = null,
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
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            cohost: null == cohost
                ? _value.cohost
                : cohost // ignore: cast_nullable_to_non_nullable
                      as AcceptedCohost,
            acceptedAt: null == acceptedAt
                ? _value.acceptedAt
                : acceptedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of AcceptInvitationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AcceptedCohostCopyWith<$Res> get cohost {
    return $AcceptedCohostCopyWith<$Res>(_value.cohost, (value) {
      return _then(_value.copyWith(cohost: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AcceptInvitationResponseImplCopyWith<$Res>
    implements $AcceptInvitationResponseCopyWith<$Res> {
  factory _$$AcceptInvitationResponseImplCopyWith(
    _$AcceptInvitationResponseImpl value,
    $Res Function(_$AcceptInvitationResponseImpl) then,
  ) = __$$AcceptInvitationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String invitationId,
    String eventId,
    String status,
    AcceptedCohost cohost,
    String acceptedAt,
  });

  @override
  $AcceptedCohostCopyWith<$Res> get cohost;
}

/// @nodoc
class __$$AcceptInvitationResponseImplCopyWithImpl<$Res>
    extends
        _$AcceptInvitationResponseCopyWithImpl<
          $Res,
          _$AcceptInvitationResponseImpl
        >
    implements _$$AcceptInvitationResponseImplCopyWith<$Res> {
  __$$AcceptInvitationResponseImplCopyWithImpl(
    _$AcceptInvitationResponseImpl _value,
    $Res Function(_$AcceptInvitationResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AcceptInvitationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationId = null,
    Object? eventId = null,
    Object? status = null,
    Object? cohost = null,
    Object? acceptedAt = null,
  }) {
    return _then(
      _$AcceptInvitationResponseImpl(
        invitationId: null == invitationId
            ? _value.invitationId
            : invitationId // ignore: cast_nullable_to_non_nullable
                  as String,
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        cohost: null == cohost
            ? _value.cohost
            : cohost // ignore: cast_nullable_to_non_nullable
                  as AcceptedCohost,
        acceptedAt: null == acceptedAt
            ? _value.acceptedAt
            : acceptedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AcceptInvitationResponseImpl implements _AcceptInvitationResponse {
  const _$AcceptInvitationResponseImpl({
    required this.invitationId,
    required this.eventId,
    required this.status,
    required this.cohost,
    required this.acceptedAt,
  });

  factory _$AcceptInvitationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AcceptInvitationResponseImplFromJson(json);

  @override
  final String invitationId;
  @override
  final String eventId;
  @override
  final String status;
  @override
  final AcceptedCohost cohost;
  @override
  final String acceptedAt;

  @override
  String toString() {
    return 'AcceptInvitationResponse(invitationId: $invitationId, eventId: $eventId, status: $status, cohost: $cohost, acceptedAt: $acceptedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptInvitationResponseImpl &&
            (identical(other.invitationId, invitationId) ||
                other.invitationId == invitationId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cohost, cohost) || other.cohost == cohost) &&
            (identical(other.acceptedAt, acceptedAt) ||
                other.acceptedAt == acceptedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    invitationId,
    eventId,
    status,
    cohost,
    acceptedAt,
  );

  /// Create a copy of AcceptInvitationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptInvitationResponseImplCopyWith<_$AcceptInvitationResponseImpl>
  get copyWith =>
      __$$AcceptInvitationResponseImplCopyWithImpl<
        _$AcceptInvitationResponseImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String invitationId,
      String eventId,
      String status,
      AcceptedCohost cohost,
      String acceptedAt,
    )
    $default,
  ) {
    return $default(invitationId, eventId, status, cohost, acceptedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String invitationId,
      String eventId,
      String status,
      AcceptedCohost cohost,
      String acceptedAt,
    )?
    $default,
  ) {
    return $default?.call(invitationId, eventId, status, cohost, acceptedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String invitationId,
      String eventId,
      String status,
      AcceptedCohost cohost,
      String acceptedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(invitationId, eventId, status, cohost, acceptedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AcceptInvitationResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AcceptInvitationResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AcceptInvitationResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AcceptInvitationResponseImplToJson(this);
  }
}

abstract class _AcceptInvitationResponse implements AcceptInvitationResponse {
  const factory _AcceptInvitationResponse({
    required final String invitationId,
    required final String eventId,
    required final String status,
    required final AcceptedCohost cohost,
    required final String acceptedAt,
  }) = _$AcceptInvitationResponseImpl;

  factory _AcceptInvitationResponse.fromJson(Map<String, dynamic> json) =
      _$AcceptInvitationResponseImpl.fromJson;

  @override
  String get invitationId;
  @override
  String get eventId;
  @override
  String get status;
  @override
  AcceptedCohost get cohost;
  @override
  String get acceptedAt;

  /// Create a copy of AcceptInvitationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcceptInvitationResponseImplCopyWith<_$AcceptInvitationResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

AcceptedCohost _$AcceptedCohostFromJson(Map<String, dynamic> json) {
  return _AcceptedCohost.fromJson(json);
}

/// @nodoc
mixin _$AcceptedCohost {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get revenueShare => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, double revenueShare, String role)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, double revenueShare, String role)?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, double revenueShare, String role)?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AcceptedCohost value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AcceptedCohost value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AcceptedCohost value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this AcceptedCohost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AcceptedCohost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AcceptedCohostCopyWith<AcceptedCohost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptedCohostCopyWith<$Res> {
  factory $AcceptedCohostCopyWith(
    AcceptedCohost value,
    $Res Function(AcceptedCohost) then,
  ) = _$AcceptedCohostCopyWithImpl<$Res, AcceptedCohost>;
  @useResult
  $Res call({String id, String name, double revenueShare, String role});
}

/// @nodoc
class _$AcceptedCohostCopyWithImpl<$Res, $Val extends AcceptedCohost>
    implements $AcceptedCohostCopyWith<$Res> {
  _$AcceptedCohostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AcceptedCohost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? revenueShare = null,
    Object? role = null,
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
            revenueShare: null == revenueShare
                ? _value.revenueShare
                : revenueShare // ignore: cast_nullable_to_non_nullable
                      as double,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AcceptedCohostImplCopyWith<$Res>
    implements $AcceptedCohostCopyWith<$Res> {
  factory _$$AcceptedCohostImplCopyWith(
    _$AcceptedCohostImpl value,
    $Res Function(_$AcceptedCohostImpl) then,
  ) = __$$AcceptedCohostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, double revenueShare, String role});
}

/// @nodoc
class __$$AcceptedCohostImplCopyWithImpl<$Res>
    extends _$AcceptedCohostCopyWithImpl<$Res, _$AcceptedCohostImpl>
    implements _$$AcceptedCohostImplCopyWith<$Res> {
  __$$AcceptedCohostImplCopyWithImpl(
    _$AcceptedCohostImpl _value,
    $Res Function(_$AcceptedCohostImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AcceptedCohost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? revenueShare = null,
    Object? role = null,
  }) {
    return _then(
      _$AcceptedCohostImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        revenueShare: null == revenueShare
            ? _value.revenueShare
            : revenueShare // ignore: cast_nullable_to_non_nullable
                  as double,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AcceptedCohostImpl implements _AcceptedCohost {
  const _$AcceptedCohostImpl({
    required this.id,
    required this.name,
    required this.revenueShare,
    required this.role,
  });

  factory _$AcceptedCohostImpl.fromJson(Map<String, dynamic> json) =>
      _$$AcceptedCohostImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double revenueShare;
  @override
  final String role;

  @override
  String toString() {
    return 'AcceptedCohost(id: $id, name: $name, revenueShare: $revenueShare, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptedCohostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.revenueShare, revenueShare) ||
                other.revenueShare == revenueShare) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, revenueShare, role);

  /// Create a copy of AcceptedCohost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptedCohostImplCopyWith<_$AcceptedCohostImpl> get copyWith =>
      __$$AcceptedCohostImplCopyWithImpl<_$AcceptedCohostImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, double revenueShare, String role)
    $default,
  ) {
    return $default(id, name, revenueShare, role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, double revenueShare, String role)?
    $default,
  ) {
    return $default?.call(id, name, revenueShare, role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, double revenueShare, String role)?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, revenueShare, role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AcceptedCohost value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AcceptedCohost value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AcceptedCohost value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AcceptedCohostImplToJson(this);
  }
}

abstract class _AcceptedCohost implements AcceptedCohost {
  const factory _AcceptedCohost({
    required final String id,
    required final String name,
    required final double revenueShare,
    required final String role,
  }) = _$AcceptedCohostImpl;

  factory _AcceptedCohost.fromJson(Map<String, dynamic> json) =
      _$AcceptedCohostImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get revenueShare;
  @override
  String get role;

  /// Create a copy of AcceptedCohost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcceptedCohostImplCopyWith<_$AcceptedCohostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeclineInvitationRequest _$DeclineInvitationRequestFromJson(
  Map<String, dynamic> json,
) {
  return _DeclineInvitationRequest.fromJson(json);
}

/// @nodoc
mixin _$DeclineInvitationRequest {
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
    TResult Function(_DeclineInvitationRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeclineInvitationRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeclineInvitationRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this DeclineInvitationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeclineInvitationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeclineInvitationRequestCopyWith<DeclineInvitationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeclineInvitationRequestCopyWith<$Res> {
  factory $DeclineInvitationRequestCopyWith(
    DeclineInvitationRequest value,
    $Res Function(DeclineInvitationRequest) then,
  ) = _$DeclineInvitationRequestCopyWithImpl<$Res, DeclineInvitationRequest>;
  @useResult
  $Res call({String? reason});
}

/// @nodoc
class _$DeclineInvitationRequestCopyWithImpl<
  $Res,
  $Val extends DeclineInvitationRequest
>
    implements $DeclineInvitationRequestCopyWith<$Res> {
  _$DeclineInvitationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeclineInvitationRequest
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
abstract class _$$DeclineInvitationRequestImplCopyWith<$Res>
    implements $DeclineInvitationRequestCopyWith<$Res> {
  factory _$$DeclineInvitationRequestImplCopyWith(
    _$DeclineInvitationRequestImpl value,
    $Res Function(_$DeclineInvitationRequestImpl) then,
  ) = __$$DeclineInvitationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? reason});
}

/// @nodoc
class __$$DeclineInvitationRequestImplCopyWithImpl<$Res>
    extends
        _$DeclineInvitationRequestCopyWithImpl<
          $Res,
          _$DeclineInvitationRequestImpl
        >
    implements _$$DeclineInvitationRequestImplCopyWith<$Res> {
  __$$DeclineInvitationRequestImplCopyWithImpl(
    _$DeclineInvitationRequestImpl _value,
    $Res Function(_$DeclineInvitationRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeclineInvitationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? reason = freezed}) {
    return _then(
      _$DeclineInvitationRequestImpl(
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
class _$DeclineInvitationRequestImpl implements _DeclineInvitationRequest {
  const _$DeclineInvitationRequestImpl({this.reason});

  factory _$DeclineInvitationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeclineInvitationRequestImplFromJson(json);

  @override
  final String? reason;

  @override
  String toString() {
    return 'DeclineInvitationRequest(reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeclineInvitationRequestImpl &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reason);

  /// Create a copy of DeclineInvitationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeclineInvitationRequestImplCopyWith<_$DeclineInvitationRequestImpl>
  get copyWith =>
      __$$DeclineInvitationRequestImplCopyWithImpl<
        _$DeclineInvitationRequestImpl
      >(this, _$identity);

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
    TResult Function(_DeclineInvitationRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeclineInvitationRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeclineInvitationRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeclineInvitationRequestImplToJson(this);
  }
}

abstract class _DeclineInvitationRequest implements DeclineInvitationRequest {
  const factory _DeclineInvitationRequest({final String? reason}) =
      _$DeclineInvitationRequestImpl;

  factory _DeclineInvitationRequest.fromJson(Map<String, dynamic> json) =
      _$DeclineInvitationRequestImpl.fromJson;

  @override
  String? get reason;

  /// Create a copy of DeclineInvitationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeclineInvitationRequestImplCopyWith<_$DeclineInvitationRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DeclineInvitationResponse _$DeclineInvitationResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DeclineInvitationResponse.fromJson(json);
}

/// @nodoc
mixin _$DeclineInvitationResponse {
  String get invitationId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get declinedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String invitationId, String status, String declinedAt)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String invitationId, String status, String declinedAt)?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String invitationId, String status, String declinedAt)?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeclineInvitationResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeclineInvitationResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeclineInvitationResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this DeclineInvitationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeclineInvitationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeclineInvitationResponseCopyWith<DeclineInvitationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeclineInvitationResponseCopyWith<$Res> {
  factory $DeclineInvitationResponseCopyWith(
    DeclineInvitationResponse value,
    $Res Function(DeclineInvitationResponse) then,
  ) = _$DeclineInvitationResponseCopyWithImpl<$Res, DeclineInvitationResponse>;
  @useResult
  $Res call({String invitationId, String status, String declinedAt});
}

/// @nodoc
class _$DeclineInvitationResponseCopyWithImpl<
  $Res,
  $Val extends DeclineInvitationResponse
>
    implements $DeclineInvitationResponseCopyWith<$Res> {
  _$DeclineInvitationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeclineInvitationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationId = null,
    Object? status = null,
    Object? declinedAt = null,
  }) {
    return _then(
      _value.copyWith(
            invitationId: null == invitationId
                ? _value.invitationId
                : invitationId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            declinedAt: null == declinedAt
                ? _value.declinedAt
                : declinedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeclineInvitationResponseImplCopyWith<$Res>
    implements $DeclineInvitationResponseCopyWith<$Res> {
  factory _$$DeclineInvitationResponseImplCopyWith(
    _$DeclineInvitationResponseImpl value,
    $Res Function(_$DeclineInvitationResponseImpl) then,
  ) = __$$DeclineInvitationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String invitationId, String status, String declinedAt});
}

/// @nodoc
class __$$DeclineInvitationResponseImplCopyWithImpl<$Res>
    extends
        _$DeclineInvitationResponseCopyWithImpl<
          $Res,
          _$DeclineInvitationResponseImpl
        >
    implements _$$DeclineInvitationResponseImplCopyWith<$Res> {
  __$$DeclineInvitationResponseImplCopyWithImpl(
    _$DeclineInvitationResponseImpl _value,
    $Res Function(_$DeclineInvitationResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DeclineInvitationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invitationId = null,
    Object? status = null,
    Object? declinedAt = null,
  }) {
    return _then(
      _$DeclineInvitationResponseImpl(
        invitationId: null == invitationId
            ? _value.invitationId
            : invitationId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        declinedAt: null == declinedAt
            ? _value.declinedAt
            : declinedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeclineInvitationResponseImpl implements _DeclineInvitationResponse {
  const _$DeclineInvitationResponseImpl({
    required this.invitationId,
    required this.status,
    required this.declinedAt,
  });

  factory _$DeclineInvitationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeclineInvitationResponseImplFromJson(json);

  @override
  final String invitationId;
  @override
  final String status;
  @override
  final String declinedAt;

  @override
  String toString() {
    return 'DeclineInvitationResponse(invitationId: $invitationId, status: $status, declinedAt: $declinedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeclineInvitationResponseImpl &&
            (identical(other.invitationId, invitationId) ||
                other.invitationId == invitationId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.declinedAt, declinedAt) ||
                other.declinedAt == declinedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, invitationId, status, declinedAt);

  /// Create a copy of DeclineInvitationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeclineInvitationResponseImplCopyWith<_$DeclineInvitationResponseImpl>
  get copyWith =>
      __$$DeclineInvitationResponseImplCopyWithImpl<
        _$DeclineInvitationResponseImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String invitationId, String status, String declinedAt)
    $default,
  ) {
    return $default(invitationId, status, declinedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String invitationId, String status, String declinedAt)?
    $default,
  ) {
    return $default?.call(invitationId, status, declinedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String invitationId, String status, String declinedAt)?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(invitationId, status, declinedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeclineInvitationResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DeclineInvitationResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeclineInvitationResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeclineInvitationResponseImplToJson(this);
  }
}

abstract class _DeclineInvitationResponse implements DeclineInvitationResponse {
  const factory _DeclineInvitationResponse({
    required final String invitationId,
    required final String status,
    required final String declinedAt,
  }) = _$DeclineInvitationResponseImpl;

  factory _DeclineInvitationResponse.fromJson(Map<String, dynamic> json) =
      _$DeclineInvitationResponseImpl.fromJson;

  @override
  String get invitationId;
  @override
  String get status;
  @override
  String get declinedAt;

  /// Create a copy of DeclineInvitationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeclineInvitationResponseImplCopyWith<_$DeclineInvitationResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
