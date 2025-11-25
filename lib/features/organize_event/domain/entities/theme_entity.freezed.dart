// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ThemeEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Color> get gradientColors => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      List<Color> gradientColors,
      String? description,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      List<Color> gradientColors,
      String? description,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      List<Color> gradientColors,
      String? description,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ThemeEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ThemeEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ThemeEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of ThemeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThemeEntityCopyWith<ThemeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEntityCopyWith<$Res> {
  factory $ThemeEntityCopyWith(
    ThemeEntity value,
    $Res Function(ThemeEntity) then,
  ) = _$ThemeEntityCopyWithImpl<$Res, ThemeEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    List<Color> gradientColors,
    String? description,
  });
}

/// @nodoc
class _$ThemeEntityCopyWithImpl<$Res, $Val extends ThemeEntity>
    implements $ThemeEntityCopyWith<$Res> {
  _$ThemeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThemeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? gradientColors = null,
    Object? description = freezed,
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
            gradientColors: null == gradientColors
                ? _value.gradientColors
                : gradientColors // ignore: cast_nullable_to_non_nullable
                      as List<Color>,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThemeEntityImplCopyWith<$Res>
    implements $ThemeEntityCopyWith<$Res> {
  factory _$$ThemeEntityImplCopyWith(
    _$ThemeEntityImpl value,
    $Res Function(_$ThemeEntityImpl) then,
  ) = __$$ThemeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    List<Color> gradientColors,
    String? description,
  });
}

/// @nodoc
class __$$ThemeEntityImplCopyWithImpl<$Res>
    extends _$ThemeEntityCopyWithImpl<$Res, _$ThemeEntityImpl>
    implements _$$ThemeEntityImplCopyWith<$Res> {
  __$$ThemeEntityImplCopyWithImpl(
    _$ThemeEntityImpl _value,
    $Res Function(_$ThemeEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThemeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? gradientColors = null,
    Object? description = freezed,
  }) {
    return _then(
      _$ThemeEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        gradientColors: null == gradientColors
            ? _value._gradientColors
            : gradientColors // ignore: cast_nullable_to_non_nullable
                  as List<Color>,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ThemeEntityImpl implements _ThemeEntity {
  const _$ThemeEntityImpl({
    required this.id,
    required this.name,
    required final List<Color> gradientColors,
    this.description,
  }) : _gradientColors = gradientColors;

  @override
  final String id;
  @override
  final String name;
  final List<Color> _gradientColors;
  @override
  List<Color> get gradientColors {
    if (_gradientColors is EqualUnmodifiableListView) return _gradientColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gradientColors);
  }

  @override
  final String? description;

  @override
  String toString() {
    return 'ThemeEntity(id: $id, name: $name, gradientColors: $gradientColors, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThemeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(
              other._gradientColors,
              _gradientColors,
            ) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_gradientColors),
    description,
  );

  /// Create a copy of ThemeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThemeEntityImplCopyWith<_$ThemeEntityImpl> get copyWith =>
      __$$ThemeEntityImplCopyWithImpl<_$ThemeEntityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      List<Color> gradientColors,
      String? description,
    )
    $default,
  ) {
    return $default(id, name, gradientColors, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      List<Color> gradientColors,
      String? description,
    )?
    $default,
  ) {
    return $default?.call(id, name, gradientColors, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      List<Color> gradientColors,
      String? description,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, gradientColors, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ThemeEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ThemeEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ThemeEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ThemeEntity implements ThemeEntity {
  const factory _ThemeEntity({
    required final String id,
    required final String name,
    required final List<Color> gradientColors,
    final String? description,
  }) = _$ThemeEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  List<Color> get gradientColors;
  @override
  String? get description;

  /// Create a copy of ThemeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThemeEntityImplCopyWith<_$ThemeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
