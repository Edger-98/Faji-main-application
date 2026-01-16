// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VendorDocument _$VendorDocumentFromJson(Map<String, dynamic> json) {
  return _VendorDocument.fromJson(json);
}

/// @nodoc
mixin _$VendorDocument {
  String get id => throw _privateConstructorUsedError;
  String get documentType => throw _privateConstructorUsedError;
  String get documentUrl => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get uploadedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String documentType,
      String documentUrl,
      String status,
      String uploadedAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String documentType,
      String documentUrl,
      String status,
      String uploadedAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String documentType,
      String documentUrl,
      String status,
      String uploadedAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorDocument value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorDocument value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorDocument value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorDocument to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorDocumentCopyWith<VendorDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorDocumentCopyWith<$Res> {
  factory $VendorDocumentCopyWith(
    VendorDocument value,
    $Res Function(VendorDocument) then,
  ) = _$VendorDocumentCopyWithImpl<$Res, VendorDocument>;
  @useResult
  $Res call({
    String id,
    String documentType,
    String documentUrl,
    String status,
    String uploadedAt,
  });
}

/// @nodoc
class _$VendorDocumentCopyWithImpl<$Res, $Val extends VendorDocument>
    implements $VendorDocumentCopyWith<$Res> {
  _$VendorDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentType = null,
    Object? documentUrl = null,
    Object? status = null,
    Object? uploadedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            documentType: null == documentType
                ? _value.documentType
                : documentType // ignore: cast_nullable_to_non_nullable
                      as String,
            documentUrl: null == documentUrl
                ? _value.documentUrl
                : documentUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            uploadedAt: null == uploadedAt
                ? _value.uploadedAt
                : uploadedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VendorDocumentImplCopyWith<$Res>
    implements $VendorDocumentCopyWith<$Res> {
  factory _$$VendorDocumentImplCopyWith(
    _$VendorDocumentImpl value,
    $Res Function(_$VendorDocumentImpl) then,
  ) = __$$VendorDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String documentType,
    String documentUrl,
    String status,
    String uploadedAt,
  });
}

/// @nodoc
class __$$VendorDocumentImplCopyWithImpl<$Res>
    extends _$VendorDocumentCopyWithImpl<$Res, _$VendorDocumentImpl>
    implements _$$VendorDocumentImplCopyWith<$Res> {
  __$$VendorDocumentImplCopyWithImpl(
    _$VendorDocumentImpl _value,
    $Res Function(_$VendorDocumentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentType = null,
    Object? documentUrl = null,
    Object? status = null,
    Object? uploadedAt = null,
  }) {
    return _then(
      _$VendorDocumentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        documentType: null == documentType
            ? _value.documentType
            : documentType // ignore: cast_nullable_to_non_nullable
                  as String,
        documentUrl: null == documentUrl
            ? _value.documentUrl
            : documentUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        uploadedAt: null == uploadedAt
            ? _value.uploadedAt
            : uploadedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorDocumentImpl implements _VendorDocument {
  const _$VendorDocumentImpl({
    required this.id,
    required this.documentType,
    required this.documentUrl,
    required this.status,
    required this.uploadedAt,
  });

  factory _$VendorDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorDocumentImplFromJson(json);

  @override
  final String id;
  @override
  final String documentType;
  @override
  final String documentUrl;
  @override
  final String status;
  @override
  final String uploadedAt;

  @override
  String toString() {
    return 'VendorDocument(id: $id, documentType: $documentType, documentUrl: $documentUrl, status: $status, uploadedAt: $uploadedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorDocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.documentUrl, documentUrl) ||
                other.documentUrl == documentUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    documentType,
    documentUrl,
    status,
    uploadedAt,
  );

  /// Create a copy of VendorDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorDocumentImplCopyWith<_$VendorDocumentImpl> get copyWith =>
      __$$VendorDocumentImplCopyWithImpl<_$VendorDocumentImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String documentType,
      String documentUrl,
      String status,
      String uploadedAt,
    )
    $default,
  ) {
    return $default(id, documentType, documentUrl, status, uploadedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String documentType,
      String documentUrl,
      String status,
      String uploadedAt,
    )?
    $default,
  ) {
    return $default?.call(id, documentType, documentUrl, status, uploadedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String documentType,
      String documentUrl,
      String status,
      String uploadedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, documentType, documentUrl, status, uploadedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorDocument value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorDocument value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorDocument value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorDocumentImplToJson(this);
  }
}

abstract class _VendorDocument implements VendorDocument {
  const factory _VendorDocument({
    required final String id,
    required final String documentType,
    required final String documentUrl,
    required final String status,
    required final String uploadedAt,
  }) = _$VendorDocumentImpl;

  factory _VendorDocument.fromJson(Map<String, dynamic> json) =
      _$VendorDocumentImpl.fromJson;

  @override
  String get id;
  @override
  String get documentType;
  @override
  String get documentUrl;
  @override
  String get status;
  @override
  String get uploadedAt;

  /// Create a copy of VendorDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorDocumentImplCopyWith<_$VendorDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadDocumentRequest _$UploadDocumentRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UploadDocumentRequest.fromJson(json);
}

/// @nodoc
mixin _$UploadDocumentRequest {
  String get documentType => throw _privateConstructorUsedError;
  String get documentUrl => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String documentType, String documentUrl) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String documentType, String documentUrl)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String documentType, String documentUrl)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UploadDocumentRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UploadDocumentRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UploadDocumentRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this UploadDocumentRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadDocumentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadDocumentRequestCopyWith<UploadDocumentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadDocumentRequestCopyWith<$Res> {
  factory $UploadDocumentRequestCopyWith(
    UploadDocumentRequest value,
    $Res Function(UploadDocumentRequest) then,
  ) = _$UploadDocumentRequestCopyWithImpl<$Res, UploadDocumentRequest>;
  @useResult
  $Res call({String documentType, String documentUrl});
}

/// @nodoc
class _$UploadDocumentRequestCopyWithImpl<
  $Res,
  $Val extends UploadDocumentRequest
>
    implements $UploadDocumentRequestCopyWith<$Res> {
  _$UploadDocumentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadDocumentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? documentType = null, Object? documentUrl = null}) {
    return _then(
      _value.copyWith(
            documentType: null == documentType
                ? _value.documentType
                : documentType // ignore: cast_nullable_to_non_nullable
                      as String,
            documentUrl: null == documentUrl
                ? _value.documentUrl
                : documentUrl // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UploadDocumentRequestImplCopyWith<$Res>
    implements $UploadDocumentRequestCopyWith<$Res> {
  factory _$$UploadDocumentRequestImplCopyWith(
    _$UploadDocumentRequestImpl value,
    $Res Function(_$UploadDocumentRequestImpl) then,
  ) = __$$UploadDocumentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String documentType, String documentUrl});
}

/// @nodoc
class __$$UploadDocumentRequestImplCopyWithImpl<$Res>
    extends
        _$UploadDocumentRequestCopyWithImpl<$Res, _$UploadDocumentRequestImpl>
    implements _$$UploadDocumentRequestImplCopyWith<$Res> {
  __$$UploadDocumentRequestImplCopyWithImpl(
    _$UploadDocumentRequestImpl _value,
    $Res Function(_$UploadDocumentRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UploadDocumentRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? documentType = null, Object? documentUrl = null}) {
    return _then(
      _$UploadDocumentRequestImpl(
        documentType: null == documentType
            ? _value.documentType
            : documentType // ignore: cast_nullable_to_non_nullable
                  as String,
        documentUrl: null == documentUrl
            ? _value.documentUrl
            : documentUrl // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadDocumentRequestImpl implements _UploadDocumentRequest {
  const _$UploadDocumentRequestImpl({
    required this.documentType,
    required this.documentUrl,
  });

  factory _$UploadDocumentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadDocumentRequestImplFromJson(json);

  @override
  final String documentType;
  @override
  final String documentUrl;

  @override
  String toString() {
    return 'UploadDocumentRequest(documentType: $documentType, documentUrl: $documentUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadDocumentRequestImpl &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.documentUrl, documentUrl) ||
                other.documentUrl == documentUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, documentType, documentUrl);

  /// Create a copy of UploadDocumentRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadDocumentRequestImplCopyWith<_$UploadDocumentRequestImpl>
  get copyWith =>
      __$$UploadDocumentRequestImplCopyWithImpl<_$UploadDocumentRequestImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String documentType, String documentUrl) $default,
  ) {
    return $default(documentType, documentUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String documentType, String documentUrl)? $default,
  ) {
    return $default?.call(documentType, documentUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String documentType, String documentUrl)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(documentType, documentUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UploadDocumentRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UploadDocumentRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UploadDocumentRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadDocumentRequestImplToJson(this);
  }
}

abstract class _UploadDocumentRequest implements UploadDocumentRequest {
  const factory _UploadDocumentRequest({
    required final String documentType,
    required final String documentUrl,
  }) = _$UploadDocumentRequestImpl;

  factory _UploadDocumentRequest.fromJson(Map<String, dynamic> json) =
      _$UploadDocumentRequestImpl.fromJson;

  @override
  String get documentType;
  @override
  String get documentUrl;

  /// Create a copy of UploadDocumentRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadDocumentRequestImplCopyWith<_$UploadDocumentRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
