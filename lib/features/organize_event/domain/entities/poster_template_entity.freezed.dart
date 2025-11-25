// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poster_template_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PosterTemplateEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get previewUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String previewUrl,
      String? description,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String previewUrl,
      String? description,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String previewUrl,
      String? description,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PosterTemplateEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PosterTemplateEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PosterTemplateEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of PosterTemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PosterTemplateEntityCopyWith<PosterTemplateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosterTemplateEntityCopyWith<$Res> {
  factory $PosterTemplateEntityCopyWith(
    PosterTemplateEntity value,
    $Res Function(PosterTemplateEntity) then,
  ) = _$PosterTemplateEntityCopyWithImpl<$Res, PosterTemplateEntity>;
  @useResult
  $Res call({String id, String name, String previewUrl, String? description});
}

/// @nodoc
class _$PosterTemplateEntityCopyWithImpl<
  $Res,
  $Val extends PosterTemplateEntity
>
    implements $PosterTemplateEntityCopyWith<$Res> {
  _$PosterTemplateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PosterTemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? previewUrl = null,
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
            previewUrl: null == previewUrl
                ? _value.previewUrl
                : previewUrl // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$PosterTemplateEntityImplCopyWith<$Res>
    implements $PosterTemplateEntityCopyWith<$Res> {
  factory _$$PosterTemplateEntityImplCopyWith(
    _$PosterTemplateEntityImpl value,
    $Res Function(_$PosterTemplateEntityImpl) then,
  ) = __$$PosterTemplateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String previewUrl, String? description});
}

/// @nodoc
class __$$PosterTemplateEntityImplCopyWithImpl<$Res>
    extends _$PosterTemplateEntityCopyWithImpl<$Res, _$PosterTemplateEntityImpl>
    implements _$$PosterTemplateEntityImplCopyWith<$Res> {
  __$$PosterTemplateEntityImplCopyWithImpl(
    _$PosterTemplateEntityImpl _value,
    $Res Function(_$PosterTemplateEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PosterTemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? previewUrl = null,
    Object? description = freezed,
  }) {
    return _then(
      _$PosterTemplateEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        previewUrl: null == previewUrl
            ? _value.previewUrl
            : previewUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$PosterTemplateEntityImpl implements _PosterTemplateEntity {
  const _$PosterTemplateEntityImpl({
    required this.id,
    required this.name,
    required this.previewUrl,
    this.description,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String previewUrl;
  @override
  final String? description;

  @override
  String toString() {
    return 'PosterTemplateEntity(id: $id, name: $name, previewUrl: $previewUrl, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosterTemplateEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, previewUrl, description);

  /// Create a copy of PosterTemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PosterTemplateEntityImplCopyWith<_$PosterTemplateEntityImpl>
  get copyWith =>
      __$$PosterTemplateEntityImplCopyWithImpl<_$PosterTemplateEntityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String previewUrl,
      String? description,
    )
    $default,
  ) {
    return $default(id, name, previewUrl, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String previewUrl,
      String? description,
    )?
    $default,
  ) {
    return $default?.call(id, name, previewUrl, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String previewUrl,
      String? description,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, previewUrl, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PosterTemplateEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PosterTemplateEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PosterTemplateEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _PosterTemplateEntity implements PosterTemplateEntity {
  const factory _PosterTemplateEntity({
    required final String id,
    required final String name,
    required final String previewUrl,
    final String? description,
  }) = _$PosterTemplateEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get previewUrl;
  @override
  String? get description;

  /// Create a copy of PosterTemplateEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PosterTemplateEntityImplCopyWith<_$PosterTemplateEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}
