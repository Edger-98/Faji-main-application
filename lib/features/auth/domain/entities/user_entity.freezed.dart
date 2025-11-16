// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserEntity {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNo => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  bool get pushNotificationsEnabled => throw _privateConstructorUsedError;
  String? get expoPushToken => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String email,
      String phoneNo,
      String firstName,
      String lastName,
      String role,
      String? image,
      bool pushNotificationsEnabled,
      String? expoPushToken,
      DateTime? createdAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String email,
      String phoneNo,
      String firstName,
      String lastName,
      String role,
      String? image,
      bool pushNotificationsEnabled,
      String? expoPushToken,
      DateTime? createdAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String email,
      String phoneNo,
      String firstName,
      String lastName,
      String role,
      String? image,
      bool pushNotificationsEnabled,
      String? expoPushToken,
      DateTime? createdAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
    UserEntity value,
    $Res Function(UserEntity) then,
  ) = _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call({
    String id,
    String email,
    String phoneNo,
    String firstName,
    String lastName,
    String role,
    String? image,
    bool pushNotificationsEnabled,
    String? expoPushToken,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? phoneNo = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? role = null,
    Object? image = freezed,
    Object? pushNotificationsEnabled = null,
    Object? expoPushToken = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            phoneNo: null == phoneNo
                ? _value.phoneNo
                : phoneNo // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            pushNotificationsEnabled: null == pushNotificationsEnabled
                ? _value.pushNotificationsEnabled
                : pushNotificationsEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            expoPushToken: freezed == expoPushToken
                ? _value.expoPushToken
                : expoPushToken // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
    _$UserEntityImpl value,
    $Res Function(_$UserEntityImpl) then,
  ) = __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String email,
    String phoneNo,
    String firstName,
    String lastName,
    String role,
    String? image,
    bool pushNotificationsEnabled,
    String? expoPushToken,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
    _$UserEntityImpl _value,
    $Res Function(_$UserEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? phoneNo = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? role = null,
    Object? image = freezed,
    Object? pushNotificationsEnabled = null,
    Object? expoPushToken = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$UserEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneNo: null == phoneNo
            ? _value.phoneNo
            : phoneNo // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        pushNotificationsEnabled: null == pushNotificationsEnabled
            ? _value.pushNotificationsEnabled
            : pushNotificationsEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        expoPushToken: freezed == expoPushToken
            ? _value.expoPushToken
            : expoPushToken // ignore: cast_nullable_to_non_nullable
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

class _$UserEntityImpl extends _UserEntity {
  const _$UserEntityImpl({
    required this.id,
    required this.email,
    required this.phoneNo,
    required this.firstName,
    required this.lastName,
    required this.role,
    this.image,
    required this.pushNotificationsEnabled,
    this.expoPushToken,
    this.createdAt,
  }) : super._();

  @override
  final String id;
  @override
  final String email;
  @override
  final String phoneNo;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String role;
  @override
  final String? image;
  @override
  final bool pushNotificationsEnabled;
  @override
  final String? expoPushToken;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'UserEntity(id: $id, email: $email, phoneNo: $phoneNo, firstName: $firstName, lastName: $lastName, role: $role, image: $image, pushNotificationsEnabled: $pushNotificationsEnabled, expoPushToken: $expoPushToken, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(
                  other.pushNotificationsEnabled,
                  pushNotificationsEnabled,
                ) ||
                other.pushNotificationsEnabled == pushNotificationsEnabled) &&
            (identical(other.expoPushToken, expoPushToken) ||
                other.expoPushToken == expoPushToken) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    phoneNo,
    firstName,
    lastName,
    role,
    image,
    pushNotificationsEnabled,
    expoPushToken,
    createdAt,
  );

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String email,
      String phoneNo,
      String firstName,
      String lastName,
      String role,
      String? image,
      bool pushNotificationsEnabled,
      String? expoPushToken,
      DateTime? createdAt,
    )
    $default,
  ) {
    return $default(
      id,
      email,
      phoneNo,
      firstName,
      lastName,
      role,
      image,
      pushNotificationsEnabled,
      expoPushToken,
      createdAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String email,
      String phoneNo,
      String firstName,
      String lastName,
      String role,
      String? image,
      bool pushNotificationsEnabled,
      String? expoPushToken,
      DateTime? createdAt,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      email,
      phoneNo,
      firstName,
      lastName,
      role,
      image,
      pushNotificationsEnabled,
      expoPushToken,
      createdAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String email,
      String phoneNo,
      String firstName,
      String lastName,
      String role,
      String? image,
      bool pushNotificationsEnabled,
      String? expoPushToken,
      DateTime? createdAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        email,
        phoneNo,
        firstName,
        lastName,
        role,
        image,
        pushNotificationsEnabled,
        expoPushToken,
        createdAt,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _UserEntity extends UserEntity {
  const factory _UserEntity({
    required final String id,
    required final String email,
    required final String phoneNo,
    required final String firstName,
    required final String lastName,
    required final String role,
    final String? image,
    required final bool pushNotificationsEnabled,
    final String? expoPushToken,
    final DateTime? createdAt,
  }) = _$UserEntityImpl;
  const _UserEntity._() : super._();

  @override
  String get id;
  @override
  String get email;
  @override
  String get phoneNo;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get role;
  @override
  String? get image;
  @override
  bool get pushNotificationsEnabled;
  @override
  String? get expoPushToken;
  @override
  DateTime? get createdAt;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
