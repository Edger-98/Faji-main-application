// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthTokenEntity {
  String get token => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String token, String userId, String email, String role)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String token, String userId, String email, String role)?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String token, String userId, String email, String role)?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthTokenEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthTokenEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthTokenEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of AuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthTokenEntityCopyWith<AuthTokenEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenEntityCopyWith<$Res> {
  factory $AuthTokenEntityCopyWith(
    AuthTokenEntity value,
    $Res Function(AuthTokenEntity) then,
  ) = _$AuthTokenEntityCopyWithImpl<$Res, AuthTokenEntity>;
  @useResult
  $Res call({String token, String userId, String email, String role});
}

/// @nodoc
class _$AuthTokenEntityCopyWithImpl<$Res, $Val extends AuthTokenEntity>
    implements $AuthTokenEntityCopyWith<$Res> {
  _$AuthTokenEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? userId = null,
    Object? email = null,
    Object? role = null,
  }) {
    return _then(
      _value.copyWith(
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$AuthTokenEntityImplCopyWith<$Res>
    implements $AuthTokenEntityCopyWith<$Res> {
  factory _$$AuthTokenEntityImplCopyWith(
    _$AuthTokenEntityImpl value,
    $Res Function(_$AuthTokenEntityImpl) then,
  ) = __$$AuthTokenEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, String userId, String email, String role});
}

/// @nodoc
class __$$AuthTokenEntityImplCopyWithImpl<$Res>
    extends _$AuthTokenEntityCopyWithImpl<$Res, _$AuthTokenEntityImpl>
    implements _$$AuthTokenEntityImplCopyWith<$Res> {
  __$$AuthTokenEntityImplCopyWithImpl(
    _$AuthTokenEntityImpl _value,
    $Res Function(_$AuthTokenEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? userId = null,
    Object? email = null,
    Object? role = null,
  }) {
    return _then(
      _$AuthTokenEntityImpl(
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthTokenEntityImpl implements _AuthTokenEntity {
  const _$AuthTokenEntityImpl({
    required this.token,
    required this.userId,
    required this.email,
    required this.role,
  });

  @override
  final String token;
  @override
  final String userId;
  @override
  final String email;
  @override
  final String role;

  @override
  String toString() {
    return 'AuthTokenEntity(token: $token, userId: $userId, email: $email, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthTokenEntityImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, userId, email, role);

  /// Create a copy of AuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthTokenEntityImplCopyWith<_$AuthTokenEntityImpl> get copyWith =>
      __$$AuthTokenEntityImplCopyWithImpl<_$AuthTokenEntityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String token, String userId, String email, String role)
    $default,
  ) {
    return $default(token, userId, email, role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String token, String userId, String email, String role)?
    $default,
  ) {
    return $default?.call(token, userId, email, role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String token, String userId, String email, String role)?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(token, userId, email, role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthTokenEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthTokenEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthTokenEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _AuthTokenEntity implements AuthTokenEntity {
  const factory _AuthTokenEntity({
    required final String token,
    required final String userId,
    required final String email,
    required final String role,
  }) = _$AuthTokenEntityImpl;

  @override
  String get token;
  @override
  String get userId;
  @override
  String get email;
  @override
  String get role;

  /// Create a copy of AuthTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthTokenEntityImplCopyWith<_$AuthTokenEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
