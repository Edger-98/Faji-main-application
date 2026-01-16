// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cohost.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Cohost _$CohostFromJson(Map<String, dynamic> json) {
  return _Cohost.fromJson(json);
}

/// @nodoc
mixin _$Cohost {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  double get revenueShare => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get joinedAt => throw _privateConstructorUsedError;
  double get earnings => throw _privateConstructorUsedError;
  CohostPermissions get permissions => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String email,
      String? avatar,
      double revenueShare,
      String role,
      String joinedAt,
      double earnings,
      CohostPermissions permissions,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String email,
      String? avatar,
      double revenueShare,
      String role,
      String joinedAt,
      double earnings,
      CohostPermissions permissions,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String email,
      String? avatar,
      double revenueShare,
      String role,
      String joinedAt,
      double earnings,
      CohostPermissions permissions,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Cohost value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Cohost value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Cohost value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this Cohost to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Cohost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CohostCopyWith<Cohost> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CohostCopyWith<$Res> {
  factory $CohostCopyWith(Cohost value, $Res Function(Cohost) then) =
      _$CohostCopyWithImpl<$Res, Cohost>;
  @useResult
  $Res call({
    String id,
    String name,
    String email,
    String? avatar,
    double revenueShare,
    String role,
    String joinedAt,
    double earnings,
    CohostPermissions permissions,
  });

  $CohostPermissionsCopyWith<$Res> get permissions;
}

/// @nodoc
class _$CohostCopyWithImpl<$Res, $Val extends Cohost>
    implements $CohostCopyWith<$Res> {
  _$CohostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Cohost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? avatar = freezed,
    Object? revenueShare = null,
    Object? role = null,
    Object? joinedAt = null,
    Object? earnings = null,
    Object? permissions = null,
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
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            revenueShare: null == revenueShare
                ? _value.revenueShare
                : revenueShare // ignore: cast_nullable_to_non_nullable
                      as double,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            joinedAt: null == joinedAt
                ? _value.joinedAt
                : joinedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            earnings: null == earnings
                ? _value.earnings
                : earnings // ignore: cast_nullable_to_non_nullable
                      as double,
            permissions: null == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as CohostPermissions,
          )
          as $Val,
    );
  }

  /// Create a copy of Cohost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CohostPermissionsCopyWith<$Res> get permissions {
    return $CohostPermissionsCopyWith<$Res>(_value.permissions, (value) {
      return _then(_value.copyWith(permissions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CohostImplCopyWith<$Res> implements $CohostCopyWith<$Res> {
  factory _$$CohostImplCopyWith(
    _$CohostImpl value,
    $Res Function(_$CohostImpl) then,
  ) = __$$CohostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String email,
    String? avatar,
    double revenueShare,
    String role,
    String joinedAt,
    double earnings,
    CohostPermissions permissions,
  });

  @override
  $CohostPermissionsCopyWith<$Res> get permissions;
}

/// @nodoc
class __$$CohostImplCopyWithImpl<$Res>
    extends _$CohostCopyWithImpl<$Res, _$CohostImpl>
    implements _$$CohostImplCopyWith<$Res> {
  __$$CohostImplCopyWithImpl(
    _$CohostImpl _value,
    $Res Function(_$CohostImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Cohost
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? avatar = freezed,
    Object? revenueShare = null,
    Object? role = null,
    Object? joinedAt = null,
    Object? earnings = null,
    Object? permissions = null,
  }) {
    return _then(
      _$CohostImpl(
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
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        revenueShare: null == revenueShare
            ? _value.revenueShare
            : revenueShare // ignore: cast_nullable_to_non_nullable
                  as double,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        joinedAt: null == joinedAt
            ? _value.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        earnings: null == earnings
            ? _value.earnings
            : earnings // ignore: cast_nullable_to_non_nullable
                  as double,
        permissions: null == permissions
            ? _value.permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as CohostPermissions,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CohostImpl implements _Cohost {
  const _$CohostImpl({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    required this.revenueShare,
    required this.role,
    required this.joinedAt,
    required this.earnings,
    required this.permissions,
  });

  factory _$CohostImpl.fromJson(Map<String, dynamic> json) =>
      _$$CohostImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? avatar;
  @override
  final double revenueShare;
  @override
  final String role;
  @override
  final String joinedAt;
  @override
  final double earnings;
  @override
  final CohostPermissions permissions;

  @override
  String toString() {
    return 'Cohost(id: $id, name: $name, email: $email, avatar: $avatar, revenueShare: $revenueShare, role: $role, joinedAt: $joinedAt, earnings: $earnings, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CohostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.revenueShare, revenueShare) ||
                other.revenueShare == revenueShare) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.earnings, earnings) ||
                other.earnings == earnings) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    email,
    avatar,
    revenueShare,
    role,
    joinedAt,
    earnings,
    permissions,
  );

  /// Create a copy of Cohost
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CohostImplCopyWith<_$CohostImpl> get copyWith =>
      __$$CohostImplCopyWithImpl<_$CohostImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String email,
      String? avatar,
      double revenueShare,
      String role,
      String joinedAt,
      double earnings,
      CohostPermissions permissions,
    )
    $default,
  ) {
    return $default(
      id,
      name,
      email,
      avatar,
      revenueShare,
      role,
      joinedAt,
      earnings,
      permissions,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String email,
      String? avatar,
      double revenueShare,
      String role,
      String joinedAt,
      double earnings,
      CohostPermissions permissions,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      name,
      email,
      avatar,
      revenueShare,
      role,
      joinedAt,
      earnings,
      permissions,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String email,
      String? avatar,
      double revenueShare,
      String role,
      String joinedAt,
      double earnings,
      CohostPermissions permissions,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        name,
        email,
        avatar,
        revenueShare,
        role,
        joinedAt,
        earnings,
        permissions,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Cohost value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Cohost value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Cohost value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CohostImplToJson(this);
  }
}

abstract class _Cohost implements Cohost {
  const factory _Cohost({
    required final String id,
    required final String name,
    required final String email,
    final String? avatar,
    required final double revenueShare,
    required final String role,
    required final String joinedAt,
    required final double earnings,
    required final CohostPermissions permissions,
  }) = _$CohostImpl;

  factory _Cohost.fromJson(Map<String, dynamic> json) = _$CohostImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get avatar;
  @override
  double get revenueShare;
  @override
  String get role;
  @override
  String get joinedAt;
  @override
  double get earnings;
  @override
  CohostPermissions get permissions;

  /// Create a copy of Cohost
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CohostImplCopyWith<_$CohostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CohostPermissions _$CohostPermissionsFromJson(Map<String, dynamic> json) {
  return _CohostPermissions.fromJson(json);
}

/// @nodoc
mixin _$CohostPermissions {
  bool get canEditEvent => throw _privateConstructorUsedError;
  bool get canViewGuests => throw _privateConstructorUsedError;
  bool get canViewFinancials => throw _privateConstructorUsedError;
  bool get canInviteGuests => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      bool canEditEvent,
      bool canViewGuests,
      bool canViewFinancials,
      bool canInviteGuests,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      bool canEditEvent,
      bool canViewGuests,
      bool canViewFinancials,
      bool canInviteGuests,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      bool canEditEvent,
      bool canViewGuests,
      bool canViewFinancials,
      bool canInviteGuests,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostPermissions value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostPermissions value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostPermissions value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this CohostPermissions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CohostPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CohostPermissionsCopyWith<CohostPermissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CohostPermissionsCopyWith<$Res> {
  factory $CohostPermissionsCopyWith(
    CohostPermissions value,
    $Res Function(CohostPermissions) then,
  ) = _$CohostPermissionsCopyWithImpl<$Res, CohostPermissions>;
  @useResult
  $Res call({
    bool canEditEvent,
    bool canViewGuests,
    bool canViewFinancials,
    bool canInviteGuests,
  });
}

/// @nodoc
class _$CohostPermissionsCopyWithImpl<$Res, $Val extends CohostPermissions>
    implements $CohostPermissionsCopyWith<$Res> {
  _$CohostPermissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CohostPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canEditEvent = null,
    Object? canViewGuests = null,
    Object? canViewFinancials = null,
    Object? canInviteGuests = null,
  }) {
    return _then(
      _value.copyWith(
            canEditEvent: null == canEditEvent
                ? _value.canEditEvent
                : canEditEvent // ignore: cast_nullable_to_non_nullable
                      as bool,
            canViewGuests: null == canViewGuests
                ? _value.canViewGuests
                : canViewGuests // ignore: cast_nullable_to_non_nullable
                      as bool,
            canViewFinancials: null == canViewFinancials
                ? _value.canViewFinancials
                : canViewFinancials // ignore: cast_nullable_to_non_nullable
                      as bool,
            canInviteGuests: null == canInviteGuests
                ? _value.canInviteGuests
                : canInviteGuests // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CohostPermissionsImplCopyWith<$Res>
    implements $CohostPermissionsCopyWith<$Res> {
  factory _$$CohostPermissionsImplCopyWith(
    _$CohostPermissionsImpl value,
    $Res Function(_$CohostPermissionsImpl) then,
  ) = __$$CohostPermissionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool canEditEvent,
    bool canViewGuests,
    bool canViewFinancials,
    bool canInviteGuests,
  });
}

/// @nodoc
class __$$CohostPermissionsImplCopyWithImpl<$Res>
    extends _$CohostPermissionsCopyWithImpl<$Res, _$CohostPermissionsImpl>
    implements _$$CohostPermissionsImplCopyWith<$Res> {
  __$$CohostPermissionsImplCopyWithImpl(
    _$CohostPermissionsImpl _value,
    $Res Function(_$CohostPermissionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CohostPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canEditEvent = null,
    Object? canViewGuests = null,
    Object? canViewFinancials = null,
    Object? canInviteGuests = null,
  }) {
    return _then(
      _$CohostPermissionsImpl(
        canEditEvent: null == canEditEvent
            ? _value.canEditEvent
            : canEditEvent // ignore: cast_nullable_to_non_nullable
                  as bool,
        canViewGuests: null == canViewGuests
            ? _value.canViewGuests
            : canViewGuests // ignore: cast_nullable_to_non_nullable
                  as bool,
        canViewFinancials: null == canViewFinancials
            ? _value.canViewFinancials
            : canViewFinancials // ignore: cast_nullable_to_non_nullable
                  as bool,
        canInviteGuests: null == canInviteGuests
            ? _value.canInviteGuests
            : canInviteGuests // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CohostPermissionsImpl implements _CohostPermissions {
  const _$CohostPermissionsImpl({
    required this.canEditEvent,
    required this.canViewGuests,
    required this.canViewFinancials,
    required this.canInviteGuests,
  });

  factory _$CohostPermissionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CohostPermissionsImplFromJson(json);

  @override
  final bool canEditEvent;
  @override
  final bool canViewGuests;
  @override
  final bool canViewFinancials;
  @override
  final bool canInviteGuests;

  @override
  String toString() {
    return 'CohostPermissions(canEditEvent: $canEditEvent, canViewGuests: $canViewGuests, canViewFinancials: $canViewFinancials, canInviteGuests: $canInviteGuests)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CohostPermissionsImpl &&
            (identical(other.canEditEvent, canEditEvent) ||
                other.canEditEvent == canEditEvent) &&
            (identical(other.canViewGuests, canViewGuests) ||
                other.canViewGuests == canViewGuests) &&
            (identical(other.canViewFinancials, canViewFinancials) ||
                other.canViewFinancials == canViewFinancials) &&
            (identical(other.canInviteGuests, canInviteGuests) ||
                other.canInviteGuests == canInviteGuests));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    canEditEvent,
    canViewGuests,
    canViewFinancials,
    canInviteGuests,
  );

  /// Create a copy of CohostPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CohostPermissionsImplCopyWith<_$CohostPermissionsImpl> get copyWith =>
      __$$CohostPermissionsImplCopyWithImpl<_$CohostPermissionsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      bool canEditEvent,
      bool canViewGuests,
      bool canViewFinancials,
      bool canInviteGuests,
    )
    $default,
  ) {
    return $default(
      canEditEvent,
      canViewGuests,
      canViewFinancials,
      canInviteGuests,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      bool canEditEvent,
      bool canViewGuests,
      bool canViewFinancials,
      bool canInviteGuests,
    )?
    $default,
  ) {
    return $default?.call(
      canEditEvent,
      canViewGuests,
      canViewFinancials,
      canInviteGuests,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      bool canEditEvent,
      bool canViewGuests,
      bool canViewFinancials,
      bool canInviteGuests,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        canEditEvent,
        canViewGuests,
        canViewFinancials,
        canInviteGuests,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostPermissions value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostPermissions value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostPermissions value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CohostPermissionsImplToJson(this);
  }
}

abstract class _CohostPermissions implements CohostPermissions {
  const factory _CohostPermissions({
    required final bool canEditEvent,
    required final bool canViewGuests,
    required final bool canViewFinancials,
    required final bool canInviteGuests,
  }) = _$CohostPermissionsImpl;

  factory _CohostPermissions.fromJson(Map<String, dynamic> json) =
      _$CohostPermissionsImpl.fromJson;

  @override
  bool get canEditEvent;
  @override
  bool get canViewGuests;
  @override
  bool get canViewFinancials;
  @override
  bool get canInviteGuests;

  /// Create a copy of CohostPermissions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CohostPermissionsImplCopyWith<_$CohostPermissionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventCohostsResponse _$EventCohostsResponseFromJson(Map<String, dynamic> json) {
  return _EventCohostsResponse.fromJson(json);
}

/// @nodoc
mixin _$EventCohostsResponse {
  List<Cohost> get cohosts => throw _privateConstructorUsedError;
  double get totalRevenueShared => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Cohost> cohosts, double totalRevenueShared) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Cohost> cohosts, double totalRevenueShared)?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Cohost> cohosts, double totalRevenueShared)?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EventCohostsResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EventCohostsResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EventCohostsResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this EventCohostsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventCohostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCohostsResponseCopyWith<EventCohostsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCohostsResponseCopyWith<$Res> {
  factory $EventCohostsResponseCopyWith(
    EventCohostsResponse value,
    $Res Function(EventCohostsResponse) then,
  ) = _$EventCohostsResponseCopyWithImpl<$Res, EventCohostsResponse>;
  @useResult
  $Res call({List<Cohost> cohosts, double totalRevenueShared});
}

/// @nodoc
class _$EventCohostsResponseCopyWithImpl<
  $Res,
  $Val extends EventCohostsResponse
>
    implements $EventCohostsResponseCopyWith<$Res> {
  _$EventCohostsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventCohostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cohosts = null, Object? totalRevenueShared = null}) {
    return _then(
      _value.copyWith(
            cohosts: null == cohosts
                ? _value.cohosts
                : cohosts // ignore: cast_nullable_to_non_nullable
                      as List<Cohost>,
            totalRevenueShared: null == totalRevenueShared
                ? _value.totalRevenueShared
                : totalRevenueShared // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventCohostsResponseImplCopyWith<$Res>
    implements $EventCohostsResponseCopyWith<$Res> {
  factory _$$EventCohostsResponseImplCopyWith(
    _$EventCohostsResponseImpl value,
    $Res Function(_$EventCohostsResponseImpl) then,
  ) = __$$EventCohostsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Cohost> cohosts, double totalRevenueShared});
}

/// @nodoc
class __$$EventCohostsResponseImplCopyWithImpl<$Res>
    extends _$EventCohostsResponseCopyWithImpl<$Res, _$EventCohostsResponseImpl>
    implements _$$EventCohostsResponseImplCopyWith<$Res> {
  __$$EventCohostsResponseImplCopyWithImpl(
    _$EventCohostsResponseImpl _value,
    $Res Function(_$EventCohostsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventCohostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? cohosts = null, Object? totalRevenueShared = null}) {
    return _then(
      _$EventCohostsResponseImpl(
        cohosts: null == cohosts
            ? _value._cohosts
            : cohosts // ignore: cast_nullable_to_non_nullable
                  as List<Cohost>,
        totalRevenueShared: null == totalRevenueShared
            ? _value.totalRevenueShared
            : totalRevenueShared // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventCohostsResponseImpl implements _EventCohostsResponse {
  const _$EventCohostsResponseImpl({
    required final List<Cohost> cohosts,
    required this.totalRevenueShared,
  }) : _cohosts = cohosts;

  factory _$EventCohostsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventCohostsResponseImplFromJson(json);

  final List<Cohost> _cohosts;
  @override
  List<Cohost> get cohosts {
    if (_cohosts is EqualUnmodifiableListView) return _cohosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cohosts);
  }

  @override
  final double totalRevenueShared;

  @override
  String toString() {
    return 'EventCohostsResponse(cohosts: $cohosts, totalRevenueShared: $totalRevenueShared)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventCohostsResponseImpl &&
            const DeepCollectionEquality().equals(other._cohosts, _cohosts) &&
            (identical(other.totalRevenueShared, totalRevenueShared) ||
                other.totalRevenueShared == totalRevenueShared));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_cohosts),
    totalRevenueShared,
  );

  /// Create a copy of EventCohostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventCohostsResponseImplCopyWith<_$EventCohostsResponseImpl>
  get copyWith =>
      __$$EventCohostsResponseImplCopyWithImpl<_$EventCohostsResponseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Cohost> cohosts, double totalRevenueShared) $default,
  ) {
    return $default(cohosts, totalRevenueShared);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Cohost> cohosts, double totalRevenueShared)?
    $default,
  ) {
    return $default?.call(cohosts, totalRevenueShared);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Cohost> cohosts, double totalRevenueShared)?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(cohosts, totalRevenueShared);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EventCohostsResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EventCohostsResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EventCohostsResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventCohostsResponseImplToJson(this);
  }
}

abstract class _EventCohostsResponse implements EventCohostsResponse {
  const factory _EventCohostsResponse({
    required final List<Cohost> cohosts,
    required final double totalRevenueShared,
  }) = _$EventCohostsResponseImpl;

  factory _EventCohostsResponse.fromJson(Map<String, dynamic> json) =
      _$EventCohostsResponseImpl.fromJson;

  @override
  List<Cohost> get cohosts;
  @override
  double get totalRevenueShared;

  /// Create a copy of EventCohostsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventCohostsResponseImplCopyWith<_$EventCohostsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
