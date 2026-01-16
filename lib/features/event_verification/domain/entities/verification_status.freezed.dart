// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

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
  String? get verifiedAt => throw _privateConstructorUsedError;
  bool get canVerify => throw _privateConstructorUsedError;
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
      String? verifiedAt,
      bool canVerify,
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
      String? verifiedAt,
      bool canVerify,
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
      String? verifiedAt,
      bool canVerify,
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
    String? verifiedAt,
    bool canVerify,
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
    Object? verifiedAt = freezed,
    Object? canVerify = null,
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
            verifiedAt: freezed == verifiedAt
                ? _value.verifiedAt
                : verifiedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            canVerify: null == canVerify
                ? _value.canVerify
                : canVerify // ignore: cast_nullable_to_non_nullable
                      as bool,
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
    String? verifiedAt,
    bool canVerify,
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
    Object? verifiedAt = freezed,
    Object? canVerify = null,
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
        verifiedAt: freezed == verifiedAt
            ? _value.verifiedAt
            : verifiedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        canVerify: null == canVerify
            ? _value.canVerify
            : canVerify // ignore: cast_nullable_to_non_nullable
                  as bool,
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
    this.verifiedAt,
    required this.canVerify,
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
  final String? verifiedAt;
  @override
  final bool canVerify;

  @override
  String toString() {
    return 'VerificationStatus(eventId: $eventId, eventName: $eventName, soldTickets: $soldTickets, checkedInGuests: $checkedInGuests, checkInPercentage: $checkInPercentage, threshold: $threshold, meetsThreshold: $meetsThreshold, isVerified: $isVerified, verifiedAt: $verifiedAt, canVerify: $canVerify)';
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
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.canVerify, canVerify) ||
                other.canVerify == canVerify));
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
    verifiedAt,
    canVerify,
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
      String? verifiedAt,
      bool canVerify,
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
      verifiedAt,
      canVerify,
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
      String? verifiedAt,
      bool canVerify,
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
      verifiedAt,
      canVerify,
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
      String? verifiedAt,
      bool canVerify,
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
        verifiedAt,
        canVerify,
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
    final String? verifiedAt,
    required final bool canVerify,
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
  String? get verifiedAt;
  @override
  bool get canVerify;

  /// Create a copy of VerificationStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerificationStatusImplCopyWith<_$VerificationStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
