// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_event_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VerifyEventResponse _$VerifyEventResponseFromJson(Map<String, dynamic> json) {
  return _VerifyEventResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyEventResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  VerificationData? get verification => throw _privateConstructorUsedError;
  EscrowRelease? get escrowRelease => throw _privateConstructorUsedError;
  VerificationStatus? get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      bool success,
      String message,
      VerificationData? verification,
      EscrowRelease? escrowRelease,
      VerificationStatus? status,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      bool success,
      String message,
      VerificationData? verification,
      EscrowRelease? escrowRelease,
      VerificationStatus? status,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      bool success,
      String message,
      VerificationData? verification,
      EscrowRelease? escrowRelease,
      VerificationStatus? status,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VerifyEventResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VerifyEventResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VerifyEventResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VerifyEventResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyEventResponseCopyWith<VerifyEventResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyEventResponseCopyWith<$Res> {
  factory $VerifyEventResponseCopyWith(
    VerifyEventResponse value,
    $Res Function(VerifyEventResponse) then,
  ) = _$VerifyEventResponseCopyWithImpl<$Res, VerifyEventResponse>;
  @useResult
  $Res call({
    bool success,
    String message,
    VerificationData? verification,
    EscrowRelease? escrowRelease,
    VerificationStatus? status,
  });

  $VerificationDataCopyWith<$Res>? get verification;
  $EscrowReleaseCopyWith<$Res>? get escrowRelease;
  $VerificationStatusCopyWith<$Res>? get status;
}

/// @nodoc
class _$VerifyEventResponseCopyWithImpl<$Res, $Val extends VerifyEventResponse>
    implements $VerifyEventResponseCopyWith<$Res> {
  _$VerifyEventResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? verification = freezed,
    Object? escrowRelease = freezed,
    Object? status = freezed,
  }) {
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
            verification: freezed == verification
                ? _value.verification
                : verification // ignore: cast_nullable_to_non_nullable
                      as VerificationData?,
            escrowRelease: freezed == escrowRelease
                ? _value.escrowRelease
                : escrowRelease // ignore: cast_nullable_to_non_nullable
                      as EscrowRelease?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as VerificationStatus?,
          )
          as $Val,
    );
  }

  /// Create a copy of VerifyEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerificationDataCopyWith<$Res>? get verification {
    if (_value.verification == null) {
      return null;
    }

    return $VerificationDataCopyWith<$Res>(_value.verification!, (value) {
      return _then(_value.copyWith(verification: value) as $Val);
    });
  }

  /// Create a copy of VerifyEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EscrowReleaseCopyWith<$Res>? get escrowRelease {
    if (_value.escrowRelease == null) {
      return null;
    }

    return $EscrowReleaseCopyWith<$Res>(_value.escrowRelease!, (value) {
      return _then(_value.copyWith(escrowRelease: value) as $Val);
    });
  }

  /// Create a copy of VerifyEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerificationStatusCopyWith<$Res>? get status {
    if (_value.status == null) {
      return null;
    }

    return $VerificationStatusCopyWith<$Res>(_value.status!, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerifyEventResponseImplCopyWith<$Res>
    implements $VerifyEventResponseCopyWith<$Res> {
  factory _$$VerifyEventResponseImplCopyWith(
    _$VerifyEventResponseImpl value,
    $Res Function(_$VerifyEventResponseImpl) then,
  ) = __$$VerifyEventResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    String message,
    VerificationData? verification,
    EscrowRelease? escrowRelease,
    VerificationStatus? status,
  });

  @override
  $VerificationDataCopyWith<$Res>? get verification;
  @override
  $EscrowReleaseCopyWith<$Res>? get escrowRelease;
  @override
  $VerificationStatusCopyWith<$Res>? get status;
}

/// @nodoc
class __$$VerifyEventResponseImplCopyWithImpl<$Res>
    extends _$VerifyEventResponseCopyWithImpl<$Res, _$VerifyEventResponseImpl>
    implements _$$VerifyEventResponseImplCopyWith<$Res> {
  __$$VerifyEventResponseImplCopyWithImpl(
    _$VerifyEventResponseImpl _value,
    $Res Function(_$VerifyEventResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerifyEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? verification = freezed,
    Object? escrowRelease = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _$VerifyEventResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        verification: freezed == verification
            ? _value.verification
            : verification // ignore: cast_nullable_to_non_nullable
                  as VerificationData?,
        escrowRelease: freezed == escrowRelease
            ? _value.escrowRelease
            : escrowRelease // ignore: cast_nullable_to_non_nullable
                  as EscrowRelease?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as VerificationStatus?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyEventResponseImpl implements _VerifyEventResponse {
  const _$VerifyEventResponseImpl({
    required this.success,
    required this.message,
    this.verification,
    this.escrowRelease,
    this.status,
  });

  factory _$VerifyEventResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyEventResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final VerificationData? verification;
  @override
  final EscrowRelease? escrowRelease;
  @override
  final VerificationStatus? status;

  @override
  String toString() {
    return 'VerifyEventResponse(success: $success, message: $message, verification: $verification, escrowRelease: $escrowRelease, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyEventResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.verification, verification) ||
                other.verification == verification) &&
            (identical(other.escrowRelease, escrowRelease) ||
                other.escrowRelease == escrowRelease) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    message,
    verification,
    escrowRelease,
    status,
  );

  /// Create a copy of VerifyEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyEventResponseImplCopyWith<_$VerifyEventResponseImpl> get copyWith =>
      __$$VerifyEventResponseImplCopyWithImpl<_$VerifyEventResponseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      bool success,
      String message,
      VerificationData? verification,
      EscrowRelease? escrowRelease,
      VerificationStatus? status,
    )
    $default,
  ) {
    return $default(success, message, verification, escrowRelease, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      bool success,
      String message,
      VerificationData? verification,
      EscrowRelease? escrowRelease,
      VerificationStatus? status,
    )?
    $default,
  ) {
    return $default?.call(
      success,
      message,
      verification,
      escrowRelease,
      status,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      bool success,
      String message,
      VerificationData? verification,
      EscrowRelease? escrowRelease,
      VerificationStatus? status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(success, message, verification, escrowRelease, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VerifyEventResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VerifyEventResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VerifyEventResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyEventResponseImplToJson(this);
  }
}

abstract class _VerifyEventResponse implements VerifyEventResponse {
  const factory _VerifyEventResponse({
    required final bool success,
    required final String message,
    final VerificationData? verification,
    final EscrowRelease? escrowRelease,
    final VerificationStatus? status,
  }) = _$VerifyEventResponseImpl;

  factory _VerifyEventResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyEventResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  VerificationData? get verification;
  @override
  EscrowRelease? get escrowRelease;
  @override
  VerificationStatus? get status;

  /// Create a copy of VerifyEventResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyEventResponseImplCopyWith<_$VerifyEventResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerificationData _$VerificationDataFromJson(Map<String, dynamic> json) {
  return _VerificationData.fromJson(json);
}

/// @nodoc
mixin _$VerificationData {
  bool get isVerified => throw _privateConstructorUsedError;
  String get verifiedAt => throw _privateConstructorUsedError;
  bool? get manualOverride => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool isVerified, String verifiedAt, bool? manualOverride)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool isVerified, String verifiedAt, bool? manualOverride)?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool isVerified, String verifiedAt, bool? manualOverride)?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VerificationData value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VerificationData value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VerificationData value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VerificationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerificationDataCopyWith<VerificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationDataCopyWith<$Res> {
  factory $VerificationDataCopyWith(
    VerificationData value,
    $Res Function(VerificationData) then,
  ) = _$VerificationDataCopyWithImpl<$Res, VerificationData>;
  @useResult
  $Res call({bool isVerified, String verifiedAt, bool? manualOverride});
}

/// @nodoc
class _$VerificationDataCopyWithImpl<$Res, $Val extends VerificationData>
    implements $VerificationDataCopyWith<$Res> {
  _$VerificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVerified = null,
    Object? verifiedAt = null,
    Object? manualOverride = freezed,
  }) {
    return _then(
      _value.copyWith(
            isVerified: null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            verifiedAt: null == verifiedAt
                ? _value.verifiedAt
                : verifiedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            manualOverride: freezed == manualOverride
                ? _value.manualOverride
                : manualOverride // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerificationDataImplCopyWith<$Res>
    implements $VerificationDataCopyWith<$Res> {
  factory _$$VerificationDataImplCopyWith(
    _$VerificationDataImpl value,
    $Res Function(_$VerificationDataImpl) then,
  ) = __$$VerificationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isVerified, String verifiedAt, bool? manualOverride});
}

/// @nodoc
class __$$VerificationDataImplCopyWithImpl<$Res>
    extends _$VerificationDataCopyWithImpl<$Res, _$VerificationDataImpl>
    implements _$$VerificationDataImplCopyWith<$Res> {
  __$$VerificationDataImplCopyWithImpl(
    _$VerificationDataImpl _value,
    $Res Function(_$VerificationDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVerified = null,
    Object? verifiedAt = null,
    Object? manualOverride = freezed,
  }) {
    return _then(
      _$VerificationDataImpl(
        isVerified: null == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        verifiedAt: null == verifiedAt
            ? _value.verifiedAt
            : verifiedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        manualOverride: freezed == manualOverride
            ? _value.manualOverride
            : manualOverride // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationDataImpl implements _VerificationData {
  const _$VerificationDataImpl({
    required this.isVerified,
    required this.verifiedAt,
    this.manualOverride,
  });

  factory _$VerificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationDataImplFromJson(json);

  @override
  final bool isVerified;
  @override
  final String verifiedAt;
  @override
  final bool? manualOverride;

  @override
  String toString() {
    return 'VerificationData(isVerified: $isVerified, verifiedAt: $verifiedAt, manualOverride: $manualOverride)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationDataImpl &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.manualOverride, manualOverride) ||
                other.manualOverride == manualOverride));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isVerified, verifiedAt, manualOverride);

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationDataImplCopyWith<_$VerificationDataImpl> get copyWith =>
      __$$VerificationDataImplCopyWithImpl<_$VerificationDataImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(bool isVerified, String verifiedAt, bool? manualOverride)
    $default,
  ) {
    return $default(isVerified, verifiedAt, manualOverride);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(bool isVerified, String verifiedAt, bool? manualOverride)?
    $default,
  ) {
    return $default?.call(isVerified, verifiedAt, manualOverride);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(bool isVerified, String verifiedAt, bool? manualOverride)?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(isVerified, verifiedAt, manualOverride);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VerificationData value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VerificationData value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VerificationData value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationDataImplToJson(this);
  }
}

abstract class _VerificationData implements VerificationData {
  const factory _VerificationData({
    required final bool isVerified,
    required final String verifiedAt,
    final bool? manualOverride,
  }) = _$VerificationDataImpl;

  factory _VerificationData.fromJson(Map<String, dynamic> json) =
      _$VerificationDataImpl.fromJson;

  @override
  bool get isVerified;
  @override
  String get verifiedAt;
  @override
  bool? get manualOverride;

  /// Create a copy of VerificationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationDataImplCopyWith<_$VerificationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EscrowRelease _$EscrowReleaseFromJson(Map<String, dynamic> json) {
  return _EscrowRelease.fromJson(json);
}

/// @nodoc
mixin _$EscrowRelease {
  int get released => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  double get platformFee => throw _privateConstructorUsedError;
  double get netRevenue => throw _privateConstructorUsedError;
  List<RevenueRecipient> get distribution => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int released,
      double totalAmount,
      double platformFee,
      double netRevenue,
      List<RevenueRecipient> distribution,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int released,
      double totalAmount,
      double platformFee,
      double netRevenue,
      List<RevenueRecipient> distribution,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int released,
      double totalAmount,
      double platformFee,
      double netRevenue,
      List<RevenueRecipient> distribution,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EscrowRelease value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EscrowRelease value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EscrowRelease value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this EscrowRelease to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EscrowRelease
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EscrowReleaseCopyWith<EscrowRelease> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EscrowReleaseCopyWith<$Res> {
  factory $EscrowReleaseCopyWith(
    EscrowRelease value,
    $Res Function(EscrowRelease) then,
  ) = _$EscrowReleaseCopyWithImpl<$Res, EscrowRelease>;
  @useResult
  $Res call({
    int released,
    double totalAmount,
    double platformFee,
    double netRevenue,
    List<RevenueRecipient> distribution,
  });
}

/// @nodoc
class _$EscrowReleaseCopyWithImpl<$Res, $Val extends EscrowRelease>
    implements $EscrowReleaseCopyWith<$Res> {
  _$EscrowReleaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EscrowRelease
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? released = null,
    Object? totalAmount = null,
    Object? platformFee = null,
    Object? netRevenue = null,
    Object? distribution = null,
  }) {
    return _then(
      _value.copyWith(
            released: null == released
                ? _value.released
                : released // ignore: cast_nullable_to_non_nullable
                      as int,
            totalAmount: null == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            platformFee: null == platformFee
                ? _value.platformFee
                : platformFee // ignore: cast_nullable_to_non_nullable
                      as double,
            netRevenue: null == netRevenue
                ? _value.netRevenue
                : netRevenue // ignore: cast_nullable_to_non_nullable
                      as double,
            distribution: null == distribution
                ? _value.distribution
                : distribution // ignore: cast_nullable_to_non_nullable
                      as List<RevenueRecipient>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EscrowReleaseImplCopyWith<$Res>
    implements $EscrowReleaseCopyWith<$Res> {
  factory _$$EscrowReleaseImplCopyWith(
    _$EscrowReleaseImpl value,
    $Res Function(_$EscrowReleaseImpl) then,
  ) = __$$EscrowReleaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int released,
    double totalAmount,
    double platformFee,
    double netRevenue,
    List<RevenueRecipient> distribution,
  });
}

/// @nodoc
class __$$EscrowReleaseImplCopyWithImpl<$Res>
    extends _$EscrowReleaseCopyWithImpl<$Res, _$EscrowReleaseImpl>
    implements _$$EscrowReleaseImplCopyWith<$Res> {
  __$$EscrowReleaseImplCopyWithImpl(
    _$EscrowReleaseImpl _value,
    $Res Function(_$EscrowReleaseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EscrowRelease
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? released = null,
    Object? totalAmount = null,
    Object? platformFee = null,
    Object? netRevenue = null,
    Object? distribution = null,
  }) {
    return _then(
      _$EscrowReleaseImpl(
        released: null == released
            ? _value.released
            : released // ignore: cast_nullable_to_non_nullable
                  as int,
        totalAmount: null == totalAmount
            ? _value.totalAmount
            : totalAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        platformFee: null == platformFee
            ? _value.platformFee
            : platformFee // ignore: cast_nullable_to_non_nullable
                  as double,
        netRevenue: null == netRevenue
            ? _value.netRevenue
            : netRevenue // ignore: cast_nullable_to_non_nullable
                  as double,
        distribution: null == distribution
            ? _value._distribution
            : distribution // ignore: cast_nullable_to_non_nullable
                  as List<RevenueRecipient>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EscrowReleaseImpl implements _EscrowRelease {
  const _$EscrowReleaseImpl({
    required this.released,
    required this.totalAmount,
    required this.platformFee,
    required this.netRevenue,
    required final List<RevenueRecipient> distribution,
  }) : _distribution = distribution;

  factory _$EscrowReleaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EscrowReleaseImplFromJson(json);

  @override
  final int released;
  @override
  final double totalAmount;
  @override
  final double platformFee;
  @override
  final double netRevenue;
  final List<RevenueRecipient> _distribution;
  @override
  List<RevenueRecipient> get distribution {
    if (_distribution is EqualUnmodifiableListView) return _distribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_distribution);
  }

  @override
  String toString() {
    return 'EscrowRelease(released: $released, totalAmount: $totalAmount, platformFee: $platformFee, netRevenue: $netRevenue, distribution: $distribution)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EscrowReleaseImpl &&
            (identical(other.released, released) ||
                other.released == released) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.platformFee, platformFee) ||
                other.platformFee == platformFee) &&
            (identical(other.netRevenue, netRevenue) ||
                other.netRevenue == netRevenue) &&
            const DeepCollectionEquality().equals(
              other._distribution,
              _distribution,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    released,
    totalAmount,
    platformFee,
    netRevenue,
    const DeepCollectionEquality().hash(_distribution),
  );

  /// Create a copy of EscrowRelease
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EscrowReleaseImplCopyWith<_$EscrowReleaseImpl> get copyWith =>
      __$$EscrowReleaseImplCopyWithImpl<_$EscrowReleaseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      int released,
      double totalAmount,
      double platformFee,
      double netRevenue,
      List<RevenueRecipient> distribution,
    )
    $default,
  ) {
    return $default(
      released,
      totalAmount,
      platformFee,
      netRevenue,
      distribution,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int released,
      double totalAmount,
      double platformFee,
      double netRevenue,
      List<RevenueRecipient> distribution,
    )?
    $default,
  ) {
    return $default?.call(
      released,
      totalAmount,
      platformFee,
      netRevenue,
      distribution,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int released,
      double totalAmount,
      double platformFee,
      double netRevenue,
      List<RevenueRecipient> distribution,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        released,
        totalAmount,
        platformFee,
        netRevenue,
        distribution,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EscrowRelease value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EscrowRelease value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EscrowRelease value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EscrowReleaseImplToJson(this);
  }
}

abstract class _EscrowRelease implements EscrowRelease {
  const factory _EscrowRelease({
    required final int released,
    required final double totalAmount,
    required final double platformFee,
    required final double netRevenue,
    required final List<RevenueRecipient> distribution,
  }) = _$EscrowReleaseImpl;

  factory _EscrowRelease.fromJson(Map<String, dynamic> json) =
      _$EscrowReleaseImpl.fromJson;

  @override
  int get released;
  @override
  double get totalAmount;
  @override
  double get platformFee;
  @override
  double get netRevenue;
  @override
  List<RevenueRecipient> get distribution;

  /// Create a copy of EscrowRelease
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EscrowReleaseImplCopyWith<_$EscrowReleaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RevenueRecipient _$RevenueRecipientFromJson(Map<String, dynamic> json) {
  return _RevenueRecipient.fromJson(json);
}

/// @nodoc
mixin _$RevenueRecipient {
  String get userId => throw _privateConstructorUsedError;
  String get accountType => throw _privateConstructorUsedError;
  double get share => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String userId,
      String accountType,
      double share,
      double amount,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String userId,
      String accountType,
      double share,
      double amount,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String userId,
      String accountType,
      double share,
      double amount,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RevenueRecipient value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RevenueRecipient value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RevenueRecipient value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this RevenueRecipient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RevenueRecipient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RevenueRecipientCopyWith<RevenueRecipient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RevenueRecipientCopyWith<$Res> {
  factory $RevenueRecipientCopyWith(
    RevenueRecipient value,
    $Res Function(RevenueRecipient) then,
  ) = _$RevenueRecipientCopyWithImpl<$Res, RevenueRecipient>;
  @useResult
  $Res call({String userId, String accountType, double share, double amount});
}

/// @nodoc
class _$RevenueRecipientCopyWithImpl<$Res, $Val extends RevenueRecipient>
    implements $RevenueRecipientCopyWith<$Res> {
  _$RevenueRecipientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RevenueRecipient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? accountType = null,
    Object? share = null,
    Object? amount = null,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            accountType: null == accountType
                ? _value.accountType
                : accountType // ignore: cast_nullable_to_non_nullable
                      as String,
            share: null == share
                ? _value.share
                : share // ignore: cast_nullable_to_non_nullable
                      as double,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RevenueRecipientImplCopyWith<$Res>
    implements $RevenueRecipientCopyWith<$Res> {
  factory _$$RevenueRecipientImplCopyWith(
    _$RevenueRecipientImpl value,
    $Res Function(_$RevenueRecipientImpl) then,
  ) = __$$RevenueRecipientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String accountType, double share, double amount});
}

/// @nodoc
class __$$RevenueRecipientImplCopyWithImpl<$Res>
    extends _$RevenueRecipientCopyWithImpl<$Res, _$RevenueRecipientImpl>
    implements _$$RevenueRecipientImplCopyWith<$Res> {
  __$$RevenueRecipientImplCopyWithImpl(
    _$RevenueRecipientImpl _value,
    $Res Function(_$RevenueRecipientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RevenueRecipient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? accountType = null,
    Object? share = null,
    Object? amount = null,
  }) {
    return _then(
      _$RevenueRecipientImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        accountType: null == accountType
            ? _value.accountType
            : accountType // ignore: cast_nullable_to_non_nullable
                  as String,
        share: null == share
            ? _value.share
            : share // ignore: cast_nullable_to_non_nullable
                  as double,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RevenueRecipientImpl implements _RevenueRecipient {
  const _$RevenueRecipientImpl({
    required this.userId,
    required this.accountType,
    required this.share,
    required this.amount,
  });

  factory _$RevenueRecipientImpl.fromJson(Map<String, dynamic> json) =>
      _$$RevenueRecipientImplFromJson(json);

  @override
  final String userId;
  @override
  final String accountType;
  @override
  final double share;
  @override
  final double amount;

  @override
  String toString() {
    return 'RevenueRecipient(userId: $userId, accountType: $accountType, share: $share, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RevenueRecipientImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.share, share) || other.share == share) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, accountType, share, amount);

  /// Create a copy of RevenueRecipient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RevenueRecipientImplCopyWith<_$RevenueRecipientImpl> get copyWith =>
      __$$RevenueRecipientImplCopyWithImpl<_$RevenueRecipientImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String userId,
      String accountType,
      double share,
      double amount,
    )
    $default,
  ) {
    return $default(userId, accountType, share, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String userId,
      String accountType,
      double share,
      double amount,
    )?
    $default,
  ) {
    return $default?.call(userId, accountType, share, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String userId,
      String accountType,
      double share,
      double amount,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(userId, accountType, share, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RevenueRecipient value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RevenueRecipient value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RevenueRecipient value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RevenueRecipientImplToJson(this);
  }
}

abstract class _RevenueRecipient implements RevenueRecipient {
  const factory _RevenueRecipient({
    required final String userId,
    required final String accountType,
    required final double share,
    required final double amount,
  }) = _$RevenueRecipientImpl;

  factory _RevenueRecipient.fromJson(Map<String, dynamic> json) =
      _$RevenueRecipientImpl.fromJson;

  @override
  String get userId;
  @override
  String get accountType;
  @override
  double get share;
  @override
  double get amount;

  /// Create a copy of RevenueRecipient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RevenueRecipientImplCopyWith<_$RevenueRecipientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerificationStatus _$VerificationStatusFromJson(Map<String, dynamic> json) {
  return _VerificationStatus.fromJson(json);
}

/// @nodoc
mixin _$VerificationStatus {
  String get eventId => throw _privateConstructorUsedError;
  String get eventName => throw _privateConstructorUsedError;
  int get soldTickets => throw _privateConstructorUsedError;
  int get checkedInGuests => throw _privateConstructorUsedError;
  int get checkInPercentage => throw _privateConstructorUsedError;
  int get threshold => throw _privateConstructorUsedError;
  bool get meetsThreshold => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  bool get canVerify => throw _privateConstructorUsedError;
  String? get verifiedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String eventId,
      String eventName,
      int soldTickets,
      int checkedInGuests,
      int checkInPercentage,
      int threshold,
      bool meetsThreshold,
      bool isVerified,
      bool canVerify,
      String? verifiedAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String eventId,
      String eventName,
      int soldTickets,
      int checkedInGuests,
      int checkInPercentage,
      int threshold,
      bool meetsThreshold,
      bool isVerified,
      bool canVerify,
      String? verifiedAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String eventId,
      String eventName,
      int soldTickets,
      int checkedInGuests,
      int checkInPercentage,
      int threshold,
      bool meetsThreshold,
      bool isVerified,
      bool canVerify,
      String? verifiedAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VerificationStatus value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VerificationStatus value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VerificationStatus value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VerificationStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerificationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerificationStatusCopyWith<VerificationStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationStatusCopyWith<$Res> {
  factory $VerificationStatusCopyWith(
    VerificationStatus value,
    $Res Function(VerificationStatus) then,
  ) = _$VerificationStatusCopyWithImpl<$Res, VerificationStatus>;
  @useResult
  $Res call({
    String eventId,
    String eventName,
    int soldTickets,
    int checkedInGuests,
    int checkInPercentage,
    int threshold,
    bool meetsThreshold,
    bool isVerified,
    bool canVerify,
    String? verifiedAt,
  });
}

/// @nodoc
class _$VerificationStatusCopyWithImpl<$Res, $Val extends VerificationStatus>
    implements $VerificationStatusCopyWith<$Res> {
  _$VerificationStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventName = null,
    Object? soldTickets = null,
    Object? checkedInGuests = null,
    Object? checkInPercentage = null,
    Object? threshold = null,
    Object? meetsThreshold = null,
    Object? isVerified = null,
    Object? canVerify = null,
    Object? verifiedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            eventId: null == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String,
            eventName: null == eventName
                ? _value.eventName
                : eventName // ignore: cast_nullable_to_non_nullable
                      as String,
            soldTickets: null == soldTickets
                ? _value.soldTickets
                : soldTickets // ignore: cast_nullable_to_non_nullable
                      as int,
            checkedInGuests: null == checkedInGuests
                ? _value.checkedInGuests
                : checkedInGuests // ignore: cast_nullable_to_non_nullable
                      as int,
            checkInPercentage: null == checkInPercentage
                ? _value.checkInPercentage
                : checkInPercentage // ignore: cast_nullable_to_non_nullable
                      as int,
            threshold: null == threshold
                ? _value.threshold
                : threshold // ignore: cast_nullable_to_non_nullable
                      as int,
            meetsThreshold: null == meetsThreshold
                ? _value.meetsThreshold
                : meetsThreshold // ignore: cast_nullable_to_non_nullable
                      as bool,
            isVerified: null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            canVerify: null == canVerify
                ? _value.canVerify
                : canVerify // ignore: cast_nullable_to_non_nullable
                      as bool,
            verifiedAt: freezed == verifiedAt
                ? _value.verifiedAt
                : verifiedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VerificationStatusImplCopyWith<$Res>
    implements $VerificationStatusCopyWith<$Res> {
  factory _$$VerificationStatusImplCopyWith(
    _$VerificationStatusImpl value,
    $Res Function(_$VerificationStatusImpl) then,
  ) = __$$VerificationStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String eventId,
    String eventName,
    int soldTickets,
    int checkedInGuests,
    int checkInPercentage,
    int threshold,
    bool meetsThreshold,
    bool isVerified,
    bool canVerify,
    String? verifiedAt,
  });
}

/// @nodoc
class __$$VerificationStatusImplCopyWithImpl<$Res>
    extends _$VerificationStatusCopyWithImpl<$Res, _$VerificationStatusImpl>
    implements _$$VerificationStatusImplCopyWith<$Res> {
  __$$VerificationStatusImplCopyWithImpl(
    _$VerificationStatusImpl _value,
    $Res Function(_$VerificationStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VerificationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventName = null,
    Object? soldTickets = null,
    Object? checkedInGuests = null,
    Object? checkInPercentage = null,
    Object? threshold = null,
    Object? meetsThreshold = null,
    Object? isVerified = null,
    Object? canVerify = null,
    Object? verifiedAt = freezed,
  }) {
    return _then(
      _$VerificationStatusImpl(
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String,
        eventName: null == eventName
            ? _value.eventName
            : eventName // ignore: cast_nullable_to_non_nullable
                  as String,
        soldTickets: null == soldTickets
            ? _value.soldTickets
            : soldTickets // ignore: cast_nullable_to_non_nullable
                  as int,
        checkedInGuests: null == checkedInGuests
            ? _value.checkedInGuests
            : checkedInGuests // ignore: cast_nullable_to_non_nullable
                  as int,
        checkInPercentage: null == checkInPercentage
            ? _value.checkInPercentage
            : checkInPercentage // ignore: cast_nullable_to_non_nullable
                  as int,
        threshold: null == threshold
            ? _value.threshold
            : threshold // ignore: cast_nullable_to_non_nullable
                  as int,
        meetsThreshold: null == meetsThreshold
            ? _value.meetsThreshold
            : meetsThreshold // ignore: cast_nullable_to_non_nullable
                  as bool,
        isVerified: null == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        canVerify: null == canVerify
            ? _value.canVerify
            : canVerify // ignore: cast_nullable_to_non_nullable
                  as bool,
        verifiedAt: freezed == verifiedAt
            ? _value.verifiedAt
            : verifiedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationStatusImpl implements _VerificationStatus {
  const _$VerificationStatusImpl({
    required this.eventId,
    required this.eventName,
    required this.soldTickets,
    required this.checkedInGuests,
    required this.checkInPercentage,
    required this.threshold,
    required this.meetsThreshold,
    required this.isVerified,
    required this.canVerify,
    this.verifiedAt,
  });

  factory _$VerificationStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationStatusImplFromJson(json);

  @override
  final String eventId;
  @override
  final String eventName;
  @override
  final int soldTickets;
  @override
  final int checkedInGuests;
  @override
  final int checkInPercentage;
  @override
  final int threshold;
  @override
  final bool meetsThreshold;
  @override
  final bool isVerified;
  @override
  final bool canVerify;
  @override
  final String? verifiedAt;

  @override
  String toString() {
    return 'VerificationStatus(eventId: $eventId, eventName: $eventName, soldTickets: $soldTickets, checkedInGuests: $checkedInGuests, checkInPercentage: $checkInPercentage, threshold: $threshold, meetsThreshold: $meetsThreshold, isVerified: $isVerified, canVerify: $canVerify, verifiedAt: $verifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationStatusImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.soldTickets, soldTickets) ||
                other.soldTickets == soldTickets) &&
            (identical(other.checkedInGuests, checkedInGuests) ||
                other.checkedInGuests == checkedInGuests) &&
            (identical(other.checkInPercentage, checkInPercentage) ||
                other.checkInPercentage == checkInPercentage) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.meetsThreshold, meetsThreshold) ||
                other.meetsThreshold == meetsThreshold) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.canVerify, canVerify) ||
                other.canVerify == canVerify) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    eventId,
    eventName,
    soldTickets,
    checkedInGuests,
    checkInPercentage,
    threshold,
    meetsThreshold,
    isVerified,
    canVerify,
    verifiedAt,
  );

  /// Create a copy of VerificationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationStatusImplCopyWith<_$VerificationStatusImpl> get copyWith =>
      __$$VerificationStatusImplCopyWithImpl<_$VerificationStatusImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String eventId,
      String eventName,
      int soldTickets,
      int checkedInGuests,
      int checkInPercentage,
      int threshold,
      bool meetsThreshold,
      bool isVerified,
      bool canVerify,
      String? verifiedAt,
    )
    $default,
  ) {
    return $default(
      eventId,
      eventName,
      soldTickets,
      checkedInGuests,
      checkInPercentage,
      threshold,
      meetsThreshold,
      isVerified,
      canVerify,
      verifiedAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String eventId,
      String eventName,
      int soldTickets,
      int checkedInGuests,
      int checkInPercentage,
      int threshold,
      bool meetsThreshold,
      bool isVerified,
      bool canVerify,
      String? verifiedAt,
    )?
    $default,
  ) {
    return $default?.call(
      eventId,
      eventName,
      soldTickets,
      checkedInGuests,
      checkInPercentage,
      threshold,
      meetsThreshold,
      isVerified,
      canVerify,
      verifiedAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String eventId,
      String eventName,
      int soldTickets,
      int checkedInGuests,
      int checkInPercentage,
      int threshold,
      bool meetsThreshold,
      bool isVerified,
      bool canVerify,
      String? verifiedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        eventId,
        eventName,
        soldTickets,
        checkedInGuests,
        checkInPercentage,
        threshold,
        meetsThreshold,
        isVerified,
        canVerify,
        verifiedAt,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VerificationStatus value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VerificationStatus value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VerificationStatus value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationStatusImplToJson(this);
  }
}

abstract class _VerificationStatus implements VerificationStatus {
  const factory _VerificationStatus({
    required final String eventId,
    required final String eventName,
    required final int soldTickets,
    required final int checkedInGuests,
    required final int checkInPercentage,
    required final int threshold,
    required final bool meetsThreshold,
    required final bool isVerified,
    required final bool canVerify,
    final String? verifiedAt,
  }) = _$VerificationStatusImpl;

  factory _VerificationStatus.fromJson(Map<String, dynamic> json) =
      _$VerificationStatusImpl.fromJson;

  @override
  String get eventId;
  @override
  String get eventName;
  @override
  int get soldTickets;
  @override
  int get checkedInGuests;
  @override
  int get checkInPercentage;
  @override
  int get threshold;
  @override
  bool get meetsThreshold;
  @override
  bool get isVerified;
  @override
  bool get canVerify;
  @override
  String? get verifiedAt;

  /// Create a copy of VerificationStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationStatusImplCopyWith<_$VerificationStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
