// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CategoryEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String icon,
      String? description,
      bool isActive,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String icon,
      String? description,
      bool isActive,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String icon,
      String? description,
      bool isActive,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CategoryEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CategoryEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CategoryEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryEntityCopyWith<CategoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEntityCopyWith<$Res> {
  factory $CategoryEntityCopyWith(
    CategoryEntity value,
    $Res Function(CategoryEntity) then,
  ) = _$CategoryEntityCopyWithImpl<$Res, CategoryEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    String icon,
    String? description,
    bool isActive,
  });
}

/// @nodoc
class _$CategoryEntityCopyWithImpl<$Res, $Val extends CategoryEntity>
    implements $CategoryEntityCopyWith<$Res> {
  _$CategoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? description = freezed,
    Object? isActive = null,
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
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryEntityImplCopyWith<$Res>
    implements $CategoryEntityCopyWith<$Res> {
  factory _$$CategoryEntityImplCopyWith(
    _$CategoryEntityImpl value,
    $Res Function(_$CategoryEntityImpl) then,
  ) = __$$CategoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String icon,
    String? description,
    bool isActive,
  });
}

/// @nodoc
class __$$CategoryEntityImplCopyWithImpl<$Res>
    extends _$CategoryEntityCopyWithImpl<$Res, _$CategoryEntityImpl>
    implements _$$CategoryEntityImplCopyWith<$Res> {
  __$$CategoryEntityImplCopyWithImpl(
    _$CategoryEntityImpl _value,
    $Res Function(_$CategoryEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? description = freezed,
    Object? isActive = null,
  }) {
    return _then(
      _$CategoryEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$CategoryEntityImpl implements _CategoryEntity {
  const _$CategoryEntityImpl({
    required this.id,
    required this.name,
    required this.icon,
    this.description,
    this.isActive = true,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String icon;
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'CategoryEntity(id: $id, name: $name, icon: $icon, description: $description, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, icon, description, isActive);

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryEntityImplCopyWith<_$CategoryEntityImpl> get copyWith =>
      __$$CategoryEntityImplCopyWithImpl<_$CategoryEntityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String icon,
      String? description,
      bool isActive,
    )
    $default,
  ) {
    return $default(id, name, icon, description, isActive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String icon,
      String? description,
      bool isActive,
    )?
    $default,
  ) {
    return $default?.call(id, name, icon, description, isActive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String icon,
      String? description,
      bool isActive,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, icon, description, isActive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CategoryEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CategoryEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CategoryEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _CategoryEntity implements CategoryEntity {
  const factory _CategoryEntity({
    required final String id,
    required final String name,
    required final String icon,
    final String? description,
    final bool isActive,
  }) = _$CategoryEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get icon;
  @override
  String? get description;
  @override
  bool get isActive;

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryEntityImplCopyWith<_$CategoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
