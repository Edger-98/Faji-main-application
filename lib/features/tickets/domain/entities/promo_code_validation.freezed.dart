// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_code_validation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PromoCodeValidation _$PromoCodeValidationFromJson(Map<String, dynamic> json) {
  return _PromoCodeValidation.fromJson(json);
}

/// @nodoc
mixin _$PromoCodeValidation {
  bool get valid => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get discountType => throw _privateConstructorUsedError;
  double? get discountValue => throw _privateConstructorUsedError;
  double? get discountAmount => throw _privateConstructorUsedError;
  String? get expiresAt => throw _privateConstructorUsedError;
  int? get remainingUses => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      bool valid,
      String? code,
      String? discountType,
      double? discountValue,
      double? discountAmount,
      String? expiresAt,
      int? remainingUses,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      bool valid,
      String? code,
      String? discountType,
      double? discountValue,
      double? discountAmount,
      String? expiresAt,
      int? remainingUses,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      bool valid,
      String? code,
      String? discountType,
      double? discountValue,
      double? discountAmount,
      String? expiresAt,
      int? remainingUses,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PromoCodeValidation value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PromoCodeValidation value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PromoCodeValidation value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this PromoCodeValidation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromoCodeValidation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromoCodeValidationCopyWith<PromoCodeValidation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoCodeValidationCopyWith<$Res> {
  factory $PromoCodeValidationCopyWith(
    PromoCodeValidation value,
    $Res Function(PromoCodeValidation) then,
  ) = _$PromoCodeValidationCopyWithImpl<$Res, PromoCodeValidation>;
  @useResult
  $Res call({
    bool valid,
    String? code,
    String? discountType,
    double? discountValue,
    double? discountAmount,
    String? expiresAt,
    int? remainingUses,
  });
}

/// @nodoc
class _$PromoCodeValidationCopyWithImpl<$Res, $Val extends PromoCodeValidation>
    implements $PromoCodeValidationCopyWith<$Res> {
  _$PromoCodeValidationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromoCodeValidation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = null,
    Object? code = freezed,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? discountAmount = freezed,
    Object? expiresAt = freezed,
    Object? remainingUses = freezed,
  }) {
    return _then(
      _value.copyWith(
            valid: null == valid
                ? _value.valid
                : valid // ignore: cast_nullable_to_non_nullable
                      as bool,
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String?,
            discountType: freezed == discountType
                ? _value.discountType
                : discountType // ignore: cast_nullable_to_non_nullable
                      as String?,
            discountValue: freezed == discountValue
                ? _value.discountValue
                : discountValue // ignore: cast_nullable_to_non_nullable
                      as double?,
            discountAmount: freezed == discountAmount
                ? _value.discountAmount
                : discountAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            remainingUses: freezed == remainingUses
                ? _value.remainingUses
                : remainingUses // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PromoCodeValidationImplCopyWith<$Res>
    implements $PromoCodeValidationCopyWith<$Res> {
  factory _$$PromoCodeValidationImplCopyWith(
    _$PromoCodeValidationImpl value,
    $Res Function(_$PromoCodeValidationImpl) then,
  ) = __$$PromoCodeValidationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool valid,
    String? code,
    String? discountType,
    double? discountValue,
    double? discountAmount,
    String? expiresAt,
    int? remainingUses,
  });
}

/// @nodoc
class __$$PromoCodeValidationImplCopyWithImpl<$Res>
    extends _$PromoCodeValidationCopyWithImpl<$Res, _$PromoCodeValidationImpl>
    implements _$$PromoCodeValidationImplCopyWith<$Res> {
  __$$PromoCodeValidationImplCopyWithImpl(
    _$PromoCodeValidationImpl _value,
    $Res Function(_$PromoCodeValidationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PromoCodeValidation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valid = null,
    Object? code = freezed,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? discountAmount = freezed,
    Object? expiresAt = freezed,
    Object? remainingUses = freezed,
  }) {
    return _then(
      _$PromoCodeValidationImpl(
        valid: null == valid
            ? _value.valid
            : valid // ignore: cast_nullable_to_non_nullable
                  as bool,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        discountType: freezed == discountType
            ? _value.discountType
            : discountType // ignore: cast_nullable_to_non_nullable
                  as String?,
        discountValue: freezed == discountValue
            ? _value.discountValue
            : discountValue // ignore: cast_nullable_to_non_nullable
                  as double?,
        discountAmount: freezed == discountAmount
            ? _value.discountAmount
            : discountAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        remainingUses: freezed == remainingUses
            ? _value.remainingUses
            : remainingUses // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PromoCodeValidationImpl implements _PromoCodeValidation {
  const _$PromoCodeValidationImpl({
    required this.valid,
    this.code,
    this.discountType,
    this.discountValue,
    this.discountAmount,
    this.expiresAt,
    this.remainingUses,
  });

  factory _$PromoCodeValidationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromoCodeValidationImplFromJson(json);

  @override
  final bool valid;
  @override
  final String? code;
  @override
  final String? discountType;
  @override
  final double? discountValue;
  @override
  final double? discountAmount;
  @override
  final String? expiresAt;
  @override
  final int? remainingUses;

  @override
  String toString() {
    return 'PromoCodeValidation(valid: $valid, code: $code, discountType: $discountType, discountValue: $discountValue, discountAmount: $discountAmount, expiresAt: $expiresAt, remainingUses: $remainingUses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoCodeValidationImpl &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.remainingUses, remainingUses) ||
                other.remainingUses == remainingUses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    valid,
    code,
    discountType,
    discountValue,
    discountAmount,
    expiresAt,
    remainingUses,
  );

  /// Create a copy of PromoCodeValidation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoCodeValidationImplCopyWith<_$PromoCodeValidationImpl> get copyWith =>
      __$$PromoCodeValidationImplCopyWithImpl<_$PromoCodeValidationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      bool valid,
      String? code,
      String? discountType,
      double? discountValue,
      double? discountAmount,
      String? expiresAt,
      int? remainingUses,
    )
    $default,
  ) {
    return $default(
      valid,
      code,
      discountType,
      discountValue,
      discountAmount,
      expiresAt,
      remainingUses,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      bool valid,
      String? code,
      String? discountType,
      double? discountValue,
      double? discountAmount,
      String? expiresAt,
      int? remainingUses,
    )?
    $default,
  ) {
    return $default?.call(
      valid,
      code,
      discountType,
      discountValue,
      discountAmount,
      expiresAt,
      remainingUses,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      bool valid,
      String? code,
      String? discountType,
      double? discountValue,
      double? discountAmount,
      String? expiresAt,
      int? remainingUses,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        valid,
        code,
        discountType,
        discountValue,
        discountAmount,
        expiresAt,
        remainingUses,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PromoCodeValidation value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PromoCodeValidation value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PromoCodeValidation value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PromoCodeValidationImplToJson(this);
  }
}

abstract class _PromoCodeValidation implements PromoCodeValidation {
  const factory _PromoCodeValidation({
    required final bool valid,
    final String? code,
    final String? discountType,
    final double? discountValue,
    final double? discountAmount,
    final String? expiresAt,
    final int? remainingUses,
  }) = _$PromoCodeValidationImpl;

  factory _PromoCodeValidation.fromJson(Map<String, dynamic> json) =
      _$PromoCodeValidationImpl.fromJson;

  @override
  bool get valid;
  @override
  String? get code;
  @override
  String? get discountType;
  @override
  double? get discountValue;
  @override
  double? get discountAmount;
  @override
  String? get expiresAt;
  @override
  int? get remainingUses;

  /// Create a copy of PromoCodeValidation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromoCodeValidationImplCopyWith<_$PromoCodeValidationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
