// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_portfolio.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VendorPortfolio _$VendorPortfolioFromJson(Map<String, dynamic> json) {
  return _VendorPortfolio.fromJson(json);
}

/// @nodoc
mixin _$VendorPortfolio {
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get uploadedAt => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String imageUrl,
      String uploadedAt,
      String? caption,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String imageUrl,
      String uploadedAt,
      String? caption,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String imageUrl,
      String uploadedAt,
      String? caption,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorPortfolio value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorPortfolio value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorPortfolio value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorPortfolio to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorPortfolio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorPortfolioCopyWith<VendorPortfolio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorPortfolioCopyWith<$Res> {
  factory $VendorPortfolioCopyWith(
    VendorPortfolio value,
    $Res Function(VendorPortfolio) then,
  ) = _$VendorPortfolioCopyWithImpl<$Res, VendorPortfolio>;
  @useResult
  $Res call({String id, String imageUrl, String uploadedAt, String? caption});
}

/// @nodoc
class _$VendorPortfolioCopyWithImpl<$Res, $Val extends VendorPortfolio>
    implements $VendorPortfolioCopyWith<$Res> {
  _$VendorPortfolioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorPortfolio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? uploadedAt = null,
    Object? caption = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            uploadedAt: null == uploadedAt
                ? _value.uploadedAt
                : uploadedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            caption: freezed == caption
                ? _value.caption
                : caption // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VendorPortfolioImplCopyWith<$Res>
    implements $VendorPortfolioCopyWith<$Res> {
  factory _$$VendorPortfolioImplCopyWith(
    _$VendorPortfolioImpl value,
    $Res Function(_$VendorPortfolioImpl) then,
  ) = __$$VendorPortfolioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String imageUrl, String uploadedAt, String? caption});
}

/// @nodoc
class __$$VendorPortfolioImplCopyWithImpl<$Res>
    extends _$VendorPortfolioCopyWithImpl<$Res, _$VendorPortfolioImpl>
    implements _$$VendorPortfolioImplCopyWith<$Res> {
  __$$VendorPortfolioImplCopyWithImpl(
    _$VendorPortfolioImpl _value,
    $Res Function(_$VendorPortfolioImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorPortfolio
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? uploadedAt = null,
    Object? caption = freezed,
  }) {
    return _then(
      _$VendorPortfolioImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        uploadedAt: null == uploadedAt
            ? _value.uploadedAt
            : uploadedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        caption: freezed == caption
            ? _value.caption
            : caption // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorPortfolioImpl implements _VendorPortfolio {
  const _$VendorPortfolioImpl({
    required this.id,
    required this.imageUrl,
    required this.uploadedAt,
    this.caption,
  });

  factory _$VendorPortfolioImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorPortfolioImplFromJson(json);

  @override
  final String id;
  @override
  final String imageUrl;
  @override
  final String uploadedAt;
  @override
  final String? caption;

  @override
  String toString() {
    return 'VendorPortfolio(id: $id, imageUrl: $imageUrl, uploadedAt: $uploadedAt, caption: $caption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorPortfolioImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt) &&
            (identical(other.caption, caption) || other.caption == caption));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, imageUrl, uploadedAt, caption);

  /// Create a copy of VendorPortfolio
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorPortfolioImplCopyWith<_$VendorPortfolioImpl> get copyWith =>
      __$$VendorPortfolioImplCopyWithImpl<_$VendorPortfolioImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String imageUrl,
      String uploadedAt,
      String? caption,
    )
    $default,
  ) {
    return $default(id, imageUrl, uploadedAt, caption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String imageUrl,
      String uploadedAt,
      String? caption,
    )?
    $default,
  ) {
    return $default?.call(id, imageUrl, uploadedAt, caption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String imageUrl,
      String uploadedAt,
      String? caption,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, imageUrl, uploadedAt, caption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorPortfolio value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorPortfolio value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorPortfolio value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorPortfolioImplToJson(this);
  }
}

abstract class _VendorPortfolio implements VendorPortfolio {
  const factory _VendorPortfolio({
    required final String id,
    required final String imageUrl,
    required final String uploadedAt,
    final String? caption,
  }) = _$VendorPortfolioImpl;

  factory _VendorPortfolio.fromJson(Map<String, dynamic> json) =
      _$VendorPortfolioImpl.fromJson;

  @override
  String get id;
  @override
  String get imageUrl;
  @override
  String get uploadedAt;
  @override
  String? get caption;

  /// Create a copy of VendorPortfolio
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorPortfolioImplCopyWith<_$VendorPortfolioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadPortfolioRequest _$UploadPortfolioRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UploadPortfolioRequest.fromJson(json);
}

/// @nodoc
mixin _$UploadPortfolioRequest {
  String get imageUrl => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String imageUrl, String? caption) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String imageUrl, String? caption)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String imageUrl, String? caption)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UploadPortfolioRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UploadPortfolioRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UploadPortfolioRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this UploadPortfolioRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadPortfolioRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadPortfolioRequestCopyWith<UploadPortfolioRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadPortfolioRequestCopyWith<$Res> {
  factory $UploadPortfolioRequestCopyWith(
    UploadPortfolioRequest value,
    $Res Function(UploadPortfolioRequest) then,
  ) = _$UploadPortfolioRequestCopyWithImpl<$Res, UploadPortfolioRequest>;
  @useResult
  $Res call({String imageUrl, String? caption});
}

/// @nodoc
class _$UploadPortfolioRequestCopyWithImpl<
  $Res,
  $Val extends UploadPortfolioRequest
>
    implements $UploadPortfolioRequestCopyWith<$Res> {
  _$UploadPortfolioRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadPortfolioRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? imageUrl = null, Object? caption = freezed}) {
    return _then(
      _value.copyWith(
            imageUrl: null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            caption: freezed == caption
                ? _value.caption
                : caption // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UploadPortfolioRequestImplCopyWith<$Res>
    implements $UploadPortfolioRequestCopyWith<$Res> {
  factory _$$UploadPortfolioRequestImplCopyWith(
    _$UploadPortfolioRequestImpl value,
    $Res Function(_$UploadPortfolioRequestImpl) then,
  ) = __$$UploadPortfolioRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageUrl, String? caption});
}

/// @nodoc
class __$$UploadPortfolioRequestImplCopyWithImpl<$Res>
    extends
        _$UploadPortfolioRequestCopyWithImpl<$Res, _$UploadPortfolioRequestImpl>
    implements _$$UploadPortfolioRequestImplCopyWith<$Res> {
  __$$UploadPortfolioRequestImplCopyWithImpl(
    _$UploadPortfolioRequestImpl _value,
    $Res Function(_$UploadPortfolioRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UploadPortfolioRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? imageUrl = null, Object? caption = freezed}) {
    return _then(
      _$UploadPortfolioRequestImpl(
        imageUrl: null == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        caption: freezed == caption
            ? _value.caption
            : caption // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadPortfolioRequestImpl implements _UploadPortfolioRequest {
  const _$UploadPortfolioRequestImpl({required this.imageUrl, this.caption});

  factory _$UploadPortfolioRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadPortfolioRequestImplFromJson(json);

  @override
  final String imageUrl;
  @override
  final String? caption;

  @override
  String toString() {
    return 'UploadPortfolioRequest(imageUrl: $imageUrl, caption: $caption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadPortfolioRequestImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.caption, caption) || other.caption == caption));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, caption);

  /// Create a copy of UploadPortfolioRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadPortfolioRequestImplCopyWith<_$UploadPortfolioRequestImpl>
  get copyWith =>
      __$$UploadPortfolioRequestImplCopyWithImpl<_$UploadPortfolioRequestImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String imageUrl, String? caption) $default,
  ) {
    return $default(imageUrl, caption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String imageUrl, String? caption)? $default,
  ) {
    return $default?.call(imageUrl, caption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String imageUrl, String? caption)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(imageUrl, caption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UploadPortfolioRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UploadPortfolioRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UploadPortfolioRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadPortfolioRequestImplToJson(this);
  }
}

abstract class _UploadPortfolioRequest implements UploadPortfolioRequest {
  const factory _UploadPortfolioRequest({
    required final String imageUrl,
    final String? caption,
  }) = _$UploadPortfolioRequestImpl;

  factory _UploadPortfolioRequest.fromJson(Map<String, dynamic> json) =
      _$UploadPortfolioRequestImpl.fromJson;

  @override
  String get imageUrl;
  @override
  String? get caption;

  /// Create a copy of UploadPortfolioRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadPortfolioRequestImplCopyWith<_$UploadPortfolioRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
