// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remove_cohost_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RemoveCohostResponse _$RemoveCohostResponseFromJson(Map<String, dynamic> json) {
  return _RemoveCohostResponse.fromJson(json);
}

/// @nodoc
mixin _$RemoveCohostResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool success, String message) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool success, String message)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool success, String message)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RemoveCohostResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RemoveCohostResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RemoveCohostResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this RemoveCohostResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemoveCohostResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoveCohostResponseCopyWith<RemoveCohostResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveCohostResponseCopyWith<$Res> {
  factory $RemoveCohostResponseCopyWith(
    RemoveCohostResponse value,
    $Res Function(RemoveCohostResponse) then,
  ) = _$RemoveCohostResponseCopyWithImpl<$Res, RemoveCohostResponse>;
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class _$RemoveCohostResponseCopyWithImpl<
  $Res,
  $Val extends RemoveCohostResponse
>
    implements $RemoveCohostResponseCopyWith<$Res> {
  _$RemoveCohostResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoveCohostResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? success = null, Object? message = null}) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RemoveCohostResponseImplCopyWith<$Res>
    implements $RemoveCohostResponseCopyWith<$Res> {
  factory _$$RemoveCohostResponseImplCopyWith(
    _$RemoveCohostResponseImpl value,
    $Res Function(_$RemoveCohostResponseImpl) then,
  ) = __$$RemoveCohostResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message});
}

/// @nodoc
class __$$RemoveCohostResponseImplCopyWithImpl<$Res>
    extends _$RemoveCohostResponseCopyWithImpl<$Res, _$RemoveCohostResponseImpl>
    implements _$$RemoveCohostResponseImplCopyWith<$Res> {
  __$$RemoveCohostResponseImplCopyWithImpl(
    _$RemoveCohostResponseImpl _value,
    $Res Function(_$RemoveCohostResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RemoveCohostResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? success = null, Object? message = null}) {
    return _then(
      _$RemoveCohostResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoveCohostResponseImpl implements _RemoveCohostResponse {
  const _$RemoveCohostResponseImpl({
    required this.success,
    required this.message,
  });

  factory _$RemoveCohostResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoveCohostResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;

  @override
  String toString() {
    return 'RemoveCohostResponse(success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveCohostResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message);

  /// Create a copy of RemoveCohostResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveCohostResponseImplCopyWith<_$RemoveCohostResponseImpl>
  get copyWith =>
      __$$RemoveCohostResponseImplCopyWithImpl<_$RemoveCohostResponseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool success, String message) $default,
  ) {
    return $default(success, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool success, String message)? $default,
  ) {
    return $default?.call(success, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool success, String message)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(success, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RemoveCohostResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RemoveCohostResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RemoveCohostResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoveCohostResponseImplToJson(this);
  }
}

abstract class _RemoveCohostResponse implements RemoveCohostResponse {
  const factory _RemoveCohostResponse({
    required final bool success,
    required final String message,
  }) = _$RemoveCohostResponseImpl;

  factory _RemoveCohostResponse.fromJson(Map<String, dynamic> json) =
      _$RemoveCohostResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;

  /// Create a copy of RemoveCohostResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveCohostResponseImplCopyWith<_$RemoveCohostResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
