// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VendorStatus _$VendorStatusFromJson(Map<String, dynamic> json) {
  return _VendorStatus.fromJson(json);
}

/// @nodoc
mixin _$VendorStatus {
  bool get isVendor => throw _privateConstructorUsedError;
  bool get hasVendorAccount => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  String? get verificationStatus => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<String>? get categories => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      bool isVendor,
      bool hasVendorAccount,
      String? vendorId,
      String? verificationStatus,
      bool isVerified,
      bool isActive,
      String? name,
      List<String>? categories,
      String? message,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      bool isVendor,
      bool hasVendorAccount,
      String? vendorId,
      String? verificationStatus,
      bool isVerified,
      bool isActive,
      String? name,
      List<String>? categories,
      String? message,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      bool isVendor,
      bool hasVendorAccount,
      String? vendorId,
      String? verificationStatus,
      bool isVerified,
      bool isActive,
      String? name,
      List<String>? categories,
      String? message,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorStatus value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorStatus value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorStatus value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorStatusCopyWith<VendorStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorStatusCopyWith<$Res> {
  factory $VendorStatusCopyWith(
    VendorStatus value,
    $Res Function(VendorStatus) then,
  ) = _$VendorStatusCopyWithImpl<$Res, VendorStatus>;
  @useResult
  $Res call({
    bool isVendor,
    bool hasVendorAccount,
    String? vendorId,
    String? verificationStatus,
    bool isVerified,
    bool isActive,
    String? name,
    List<String>? categories,
    String? message,
  });
}

/// @nodoc
class _$VendorStatusCopyWithImpl<$Res, $Val extends VendorStatus>
    implements $VendorStatusCopyWith<$Res> {
  _$VendorStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVendor = null,
    Object? hasVendorAccount = null,
    Object? vendorId = freezed,
    Object? verificationStatus = freezed,
    Object? isVerified = null,
    Object? isActive = null,
    Object? name = freezed,
    Object? categories = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _value.copyWith(
            isVendor: null == isVendor
                ? _value.isVendor
                : isVendor // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasVendorAccount: null == hasVendorAccount
                ? _value.hasVendorAccount
                : hasVendorAccount // ignore: cast_nullable_to_non_nullable
                      as bool,
            vendorId: freezed == vendorId
                ? _value.vendorId
                : vendorId // ignore: cast_nullable_to_non_nullable
                      as String?,
            verificationStatus: freezed == verificationStatus
                ? _value.verificationStatus
                : verificationStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            isVerified: null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            categories: freezed == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            message: freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VendorStatusImplCopyWith<$Res>
    implements $VendorStatusCopyWith<$Res> {
  factory _$$VendorStatusImplCopyWith(
    _$VendorStatusImpl value,
    $Res Function(_$VendorStatusImpl) then,
  ) = __$$VendorStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isVendor,
    bool hasVendorAccount,
    String? vendorId,
    String? verificationStatus,
    bool isVerified,
    bool isActive,
    String? name,
    List<String>? categories,
    String? message,
  });
}

/// @nodoc
class __$$VendorStatusImplCopyWithImpl<$Res>
    extends _$VendorStatusCopyWithImpl<$Res, _$VendorStatusImpl>
    implements _$$VendorStatusImplCopyWith<$Res> {
  __$$VendorStatusImplCopyWithImpl(
    _$VendorStatusImpl _value,
    $Res Function(_$VendorStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVendor = null,
    Object? hasVendorAccount = null,
    Object? vendorId = freezed,
    Object? verificationStatus = freezed,
    Object? isVerified = null,
    Object? isActive = null,
    Object? name = freezed,
    Object? categories = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _$VendorStatusImpl(
        isVendor: null == isVendor
            ? _value.isVendor
            : isVendor // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasVendorAccount: null == hasVendorAccount
            ? _value.hasVendorAccount
            : hasVendorAccount // ignore: cast_nullable_to_non_nullable
                  as bool,
        vendorId: freezed == vendorId
            ? _value.vendorId
            : vendorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        verificationStatus: freezed == verificationStatus
            ? _value.verificationStatus
            : verificationStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        isVerified: null == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        categories: freezed == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        message: freezed == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorStatusImpl implements _VendorStatus {
  const _$VendorStatusImpl({
    required this.isVendor,
    required this.hasVendorAccount,
    this.vendorId,
    this.verificationStatus,
    this.isVerified = false,
    this.isActive = false,
    this.name,
    final List<String>? categories,
    this.message,
  }) : _categories = categories;

  factory _$VendorStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorStatusImplFromJson(json);

  @override
  final bool isVendor;
  @override
  final bool hasVendorAccount;
  @override
  final String? vendorId;
  @override
  final String? verificationStatus;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final String? name;
  final List<String>? _categories;
  @override
  List<String>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'VendorStatus(isVendor: $isVendor, hasVendorAccount: $hasVendorAccount, vendorId: $vendorId, verificationStatus: $verificationStatus, isVerified: $isVerified, isActive: $isActive, name: $name, categories: $categories, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorStatusImpl &&
            (identical(other.isVendor, isVendor) ||
                other.isVendor == isVendor) &&
            (identical(other.hasVendorAccount, hasVendorAccount) ||
                other.hasVendorAccount == hasVendorAccount) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.verificationStatus, verificationStatus) ||
                other.verificationStatus == verificationStatus) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isVendor,
    hasVendorAccount,
    vendorId,
    verificationStatus,
    isVerified,
    isActive,
    name,
    const DeepCollectionEquality().hash(_categories),
    message,
  );

  /// Create a copy of VendorStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorStatusImplCopyWith<_$VendorStatusImpl> get copyWith =>
      __$$VendorStatusImplCopyWithImpl<_$VendorStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      bool isVendor,
      bool hasVendorAccount,
      String? vendorId,
      String? verificationStatus,
      bool isVerified,
      bool isActive,
      String? name,
      List<String>? categories,
      String? message,
    )
    $default,
  ) {
    return $default(
      isVendor,
      hasVendorAccount,
      vendorId,
      verificationStatus,
      isVerified,
      isActive,
      name,
      categories,
      message,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      bool isVendor,
      bool hasVendorAccount,
      String? vendorId,
      String? verificationStatus,
      bool isVerified,
      bool isActive,
      String? name,
      List<String>? categories,
      String? message,
    )?
    $default,
  ) {
    return $default?.call(
      isVendor,
      hasVendorAccount,
      vendorId,
      verificationStatus,
      isVerified,
      isActive,
      name,
      categories,
      message,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      bool isVendor,
      bool hasVendorAccount,
      String? vendorId,
      String? verificationStatus,
      bool isVerified,
      bool isActive,
      String? name,
      List<String>? categories,
      String? message,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        isVendor,
        hasVendorAccount,
        vendorId,
        verificationStatus,
        isVerified,
        isActive,
        name,
        categories,
        message,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorStatus value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorStatus value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorStatus value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorStatusImplToJson(this);
  }
}

abstract class _VendorStatus implements VendorStatus {
  const factory _VendorStatus({
    required final bool isVendor,
    required final bool hasVendorAccount,
    final String? vendorId,
    final String? verificationStatus,
    final bool isVerified,
    final bool isActive,
    final String? name,
    final List<String>? categories,
    final String? message,
  }) = _$VendorStatusImpl;

  factory _VendorStatus.fromJson(Map<String, dynamic> json) =
      _$VendorStatusImpl.fromJson;

  @override
  bool get isVendor;
  @override
  bool get hasVendorAccount;
  @override
  String? get vendorId;
  @override
  String? get verificationStatus;
  @override
  bool get isVerified;
  @override
  bool get isActive;
  @override
  String? get name;
  @override
  List<String>? get categories;
  @override
  String? get message;

  /// Create a copy of VendorStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorStatusImplCopyWith<_$VendorStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
