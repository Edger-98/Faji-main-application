// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CheckInRequest _$CheckInRequestFromJson(Map<String, dynamic> json) {
  return _CheckInRequest.fromJson(json);
}

/// @nodoc
mixin _$CheckInRequest {
  String get ticketId => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  LocationData? get location => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String ticketId, String eventId, LocationData? location)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String ticketId, String eventId, LocationData? location)?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String ticketId, String eventId, LocationData? location)?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CheckInRequest value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CheckInRequest value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CheckInRequest value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this CheckInRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInRequestCopyWith<CheckInRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInRequestCopyWith<$Res> {
  factory $CheckInRequestCopyWith(
    CheckInRequest value,
    $Res Function(CheckInRequest) then,
  ) = _$CheckInRequestCopyWithImpl<$Res, CheckInRequest>;
  @useResult
  $Res call({String ticketId, String eventId, LocationData? location});

  $LocationDataCopyWith<$Res>? get location;
}

/// @nodoc
class _$CheckInRequestCopyWithImpl<$Res, $Val extends CheckInRequest>
    implements $CheckInRequestCopyWith<$Res> {
  _$CheckInRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketId = null,
    Object? eventId = null,
    Object? location = freezed,
  }) {
    return _then(
      _value.copyWith(
            ticketId: null == ticketId
                ? _value.ticketId
                : ticketId // ignore: cast_nullable_to_non_nullable
                      as String,
            eventId: null == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as LocationData?,
          )
          as $Val,
    );
  }

  /// Create a copy of CheckInRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDataCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationDataCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckInRequestImplCopyWith<$Res>
    implements $CheckInRequestCopyWith<$Res> {
  factory _$$CheckInRequestImplCopyWith(
    _$CheckInRequestImpl value,
    $Res Function(_$CheckInRequestImpl) then,
  ) = __$$CheckInRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ticketId, String eventId, LocationData? location});

  @override
  $LocationDataCopyWith<$Res>? get location;
}

/// @nodoc
class __$$CheckInRequestImplCopyWithImpl<$Res>
    extends _$CheckInRequestCopyWithImpl<$Res, _$CheckInRequestImpl>
    implements _$$CheckInRequestImplCopyWith<$Res> {
  __$$CheckInRequestImplCopyWithImpl(
    _$CheckInRequestImpl _value,
    $Res Function(_$CheckInRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketId = null,
    Object? eventId = null,
    Object? location = freezed,
  }) {
    return _then(
      _$CheckInRequestImpl(
        ticketId: null == ticketId
            ? _value.ticketId
            : ticketId // ignore: cast_nullable_to_non_nullable
                  as String,
        eventId: null == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as LocationData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInRequestImpl implements _CheckInRequest {
  const _$CheckInRequestImpl({
    required this.ticketId,
    required this.eventId,
    this.location,
  });

  factory _$CheckInRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInRequestImplFromJson(json);

  @override
  final String ticketId;
  @override
  final String eventId;
  @override
  final LocationData? location;

  @override
  String toString() {
    return 'CheckInRequest(ticketId: $ticketId, eventId: $eventId, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInRequestImpl &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ticketId, eventId, location);

  /// Create a copy of CheckInRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInRequestImplCopyWith<_$CheckInRequestImpl> get copyWith =>
      __$$CheckInRequestImplCopyWithImpl<_$CheckInRequestImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String ticketId, String eventId, LocationData? location)
    $default,
  ) {
    return $default(ticketId, eventId, location);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String ticketId, String eventId, LocationData? location)?
    $default,
  ) {
    return $default?.call(ticketId, eventId, location);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String ticketId, String eventId, LocationData? location)?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(ticketId, eventId, location);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CheckInRequest value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CheckInRequest value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CheckInRequest value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInRequestImplToJson(this);
  }
}

abstract class _CheckInRequest implements CheckInRequest {
  const factory _CheckInRequest({
    required final String ticketId,
    required final String eventId,
    final LocationData? location,
  }) = _$CheckInRequestImpl;

  factory _CheckInRequest.fromJson(Map<String, dynamic> json) =
      _$CheckInRequestImpl.fromJson;

  @override
  String get ticketId;
  @override
  String get eventId;
  @override
  LocationData? get location;

  /// Create a copy of CheckInRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInRequestImplCopyWith<_$CheckInRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationData _$LocationDataFromJson(Map<String, dynamic> json) {
  return _LocationData.fromJson(json);
}

/// @nodoc
mixin _$LocationData {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double latitude, double longitude, double? accuracy)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double latitude, double longitude, double? accuracy)?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double latitude, double longitude, double? accuracy)?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LocationData value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocationData value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocationData value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this LocationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationDataCopyWith<LocationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDataCopyWith<$Res> {
  factory $LocationDataCopyWith(
    LocationData value,
    $Res Function(LocationData) then,
  ) = _$LocationDataCopyWithImpl<$Res, LocationData>;
  @useResult
  $Res call({double latitude, double longitude, double? accuracy});
}

/// @nodoc
class _$LocationDataCopyWithImpl<$Res, $Val extends LocationData>
    implements $LocationDataCopyWith<$Res> {
  _$LocationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracy = freezed,
  }) {
    return _then(
      _value.copyWith(
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            accuracy: freezed == accuracy
                ? _value.accuracy
                : accuracy // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocationDataImplCopyWith<$Res>
    implements $LocationDataCopyWith<$Res> {
  factory _$$LocationDataImplCopyWith(
    _$LocationDataImpl value,
    $Res Function(_$LocationDataImpl) then,
  ) = __$$LocationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude, double? accuracy});
}

/// @nodoc
class __$$LocationDataImplCopyWithImpl<$Res>
    extends _$LocationDataCopyWithImpl<$Res, _$LocationDataImpl>
    implements _$$LocationDataImplCopyWith<$Res> {
  __$$LocationDataImplCopyWithImpl(
    _$LocationDataImpl _value,
    $Res Function(_$LocationDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? accuracy = freezed,
  }) {
    return _then(
      _$LocationDataImpl(
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        accuracy: freezed == accuracy
            ? _value.accuracy
            : accuracy // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationDataImpl implements _LocationData {
  const _$LocationDataImpl({
    required this.latitude,
    required this.longitude,
    this.accuracy,
  });

  factory _$LocationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationDataImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double? accuracy;

  @override
  String toString() {
    return 'LocationData(latitude: $latitude, longitude: $longitude, accuracy: $accuracy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDataImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, accuracy);

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationDataImplCopyWith<_$LocationDataImpl> get copyWith =>
      __$$LocationDataImplCopyWithImpl<_$LocationDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double latitude, double longitude, double? accuracy)
    $default,
  ) {
    return $default(latitude, longitude, accuracy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double latitude, double longitude, double? accuracy)?
    $default,
  ) {
    return $default?.call(latitude, longitude, accuracy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double latitude, double longitude, double? accuracy)?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(latitude, longitude, accuracy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LocationData value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocationData value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocationData value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationDataImplToJson(this);
  }
}

abstract class _LocationData implements LocationData {
  const factory _LocationData({
    required final double latitude,
    required final double longitude,
    final double? accuracy,
  }) = _$LocationDataImpl;

  factory _LocationData.fromJson(Map<String, dynamic> json) =
      _$LocationDataImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double? get accuracy;

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationDataImplCopyWith<_$LocationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckInResponse _$CheckInResponseFromJson(Map<String, dynamic> json) {
  return _CheckInResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckInResponse {
  bool get checkedIn => throw _privateConstructorUsedError;
  String get checkedInAt => throw _privateConstructorUsedError;
  EventVerification get eventVerification => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      bool checkedIn,
      String checkedInAt,
      EventVerification eventVerification,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      bool checkedIn,
      String checkedInAt,
      EventVerification eventVerification,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      bool checkedIn,
      String checkedInAt,
      EventVerification eventVerification,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CheckInResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CheckInResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CheckInResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this CheckInResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInResponseCopyWith<CheckInResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInResponseCopyWith<$Res> {
  factory $CheckInResponseCopyWith(
    CheckInResponse value,
    $Res Function(CheckInResponse) then,
  ) = _$CheckInResponseCopyWithImpl<$Res, CheckInResponse>;
  @useResult
  $Res call({
    bool checkedIn,
    String checkedInAt,
    EventVerification eventVerification,
  });

  $EventVerificationCopyWith<$Res> get eventVerification;
}

/// @nodoc
class _$CheckInResponseCopyWithImpl<$Res, $Val extends CheckInResponse>
    implements $CheckInResponseCopyWith<$Res> {
  _$CheckInResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkedIn = null,
    Object? checkedInAt = null,
    Object? eventVerification = null,
  }) {
    return _then(
      _value.copyWith(
            checkedIn: null == checkedIn
                ? _value.checkedIn
                : checkedIn // ignore: cast_nullable_to_non_nullable
                      as bool,
            checkedInAt: null == checkedInAt
                ? _value.checkedInAt
                : checkedInAt // ignore: cast_nullable_to_non_nullable
                      as String,
            eventVerification: null == eventVerification
                ? _value.eventVerification
                : eventVerification // ignore: cast_nullable_to_non_nullable
                      as EventVerification,
          )
          as $Val,
    );
  }

  /// Create a copy of CheckInResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventVerificationCopyWith<$Res> get eventVerification {
    return $EventVerificationCopyWith<$Res>(_value.eventVerification, (value) {
      return _then(_value.copyWith(eventVerification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckInResponseImplCopyWith<$Res>
    implements $CheckInResponseCopyWith<$Res> {
  factory _$$CheckInResponseImplCopyWith(
    _$CheckInResponseImpl value,
    $Res Function(_$CheckInResponseImpl) then,
  ) = __$$CheckInResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool checkedIn,
    String checkedInAt,
    EventVerification eventVerification,
  });

  @override
  $EventVerificationCopyWith<$Res> get eventVerification;
}

/// @nodoc
class __$$CheckInResponseImplCopyWithImpl<$Res>
    extends _$CheckInResponseCopyWithImpl<$Res, _$CheckInResponseImpl>
    implements _$$CheckInResponseImplCopyWith<$Res> {
  __$$CheckInResponseImplCopyWithImpl(
    _$CheckInResponseImpl _value,
    $Res Function(_$CheckInResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkedIn = null,
    Object? checkedInAt = null,
    Object? eventVerification = null,
  }) {
    return _then(
      _$CheckInResponseImpl(
        checkedIn: null == checkedIn
            ? _value.checkedIn
            : checkedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        checkedInAt: null == checkedInAt
            ? _value.checkedInAt
            : checkedInAt // ignore: cast_nullable_to_non_nullable
                  as String,
        eventVerification: null == eventVerification
            ? _value.eventVerification
            : eventVerification // ignore: cast_nullable_to_non_nullable
                  as EventVerification,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInResponseImpl implements _CheckInResponse {
  const _$CheckInResponseImpl({
    required this.checkedIn,
    required this.checkedInAt,
    required this.eventVerification,
  });

  factory _$CheckInResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInResponseImplFromJson(json);

  @override
  final bool checkedIn;
  @override
  final String checkedInAt;
  @override
  final EventVerification eventVerification;

  @override
  String toString() {
    return 'CheckInResponse(checkedIn: $checkedIn, checkedInAt: $checkedInAt, eventVerification: $eventVerification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInResponseImpl &&
            (identical(other.checkedIn, checkedIn) ||
                other.checkedIn == checkedIn) &&
            (identical(other.checkedInAt, checkedInAt) ||
                other.checkedInAt == checkedInAt) &&
            (identical(other.eventVerification, eventVerification) ||
                other.eventVerification == eventVerification));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, checkedIn, checkedInAt, eventVerification);

  /// Create a copy of CheckInResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInResponseImplCopyWith<_$CheckInResponseImpl> get copyWith =>
      __$$CheckInResponseImplCopyWithImpl<_$CheckInResponseImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      bool checkedIn,
      String checkedInAt,
      EventVerification eventVerification,
    )
    $default,
  ) {
    return $default(checkedIn, checkedInAt, eventVerification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      bool checkedIn,
      String checkedInAt,
      EventVerification eventVerification,
    )?
    $default,
  ) {
    return $default?.call(checkedIn, checkedInAt, eventVerification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      bool checkedIn,
      String checkedInAt,
      EventVerification eventVerification,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(checkedIn, checkedInAt, eventVerification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CheckInResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CheckInResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CheckInResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInResponseImplToJson(this);
  }
}

abstract class _CheckInResponse implements CheckInResponse {
  const factory _CheckInResponse({
    required final bool checkedIn,
    required final String checkedInAt,
    required final EventVerification eventVerification,
  }) = _$CheckInResponseImpl;

  factory _CheckInResponse.fromJson(Map<String, dynamic> json) =
      _$CheckInResponseImpl.fromJson;

  @override
  bool get checkedIn;
  @override
  String get checkedInAt;
  @override
  EventVerification get eventVerification;

  /// Create a copy of CheckInResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInResponseImplCopyWith<_$CheckInResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventVerification _$EventVerificationFromJson(Map<String, dynamic> json) {
  return _EventVerification.fromJson(json);
}

/// @nodoc
mixin _$EventVerification {
  int get checkInPercentage => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  String? get verifiedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int checkInPercentage, bool isVerified, String? verifiedAt)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int checkInPercentage,
      bool isVerified,
      String? verifiedAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int checkInPercentage,
      bool isVerified,
      String? verifiedAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EventVerification value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EventVerification value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EventVerification value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this EventVerification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventVerification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventVerificationCopyWith<EventVerification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventVerificationCopyWith<$Res> {
  factory $EventVerificationCopyWith(
    EventVerification value,
    $Res Function(EventVerification) then,
  ) = _$EventVerificationCopyWithImpl<$Res, EventVerification>;
  @useResult
  $Res call({int checkInPercentage, bool isVerified, String? verifiedAt});
}

/// @nodoc
class _$EventVerificationCopyWithImpl<$Res, $Val extends EventVerification>
    implements $EventVerificationCopyWith<$Res> {
  _$EventVerificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventVerification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkInPercentage = null,
    Object? isVerified = null,
    Object? verifiedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            checkInPercentage: null == checkInPercentage
                ? _value.checkInPercentage
                : checkInPercentage // ignore: cast_nullable_to_non_nullable
                      as int,
            isVerified: null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
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
abstract class _$$EventVerificationImplCopyWith<$Res>
    implements $EventVerificationCopyWith<$Res> {
  factory _$$EventVerificationImplCopyWith(
    _$EventVerificationImpl value,
    $Res Function(_$EventVerificationImpl) then,
  ) = __$$EventVerificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int checkInPercentage, bool isVerified, String? verifiedAt});
}

/// @nodoc
class __$$EventVerificationImplCopyWithImpl<$Res>
    extends _$EventVerificationCopyWithImpl<$Res, _$EventVerificationImpl>
    implements _$$EventVerificationImplCopyWith<$Res> {
  __$$EventVerificationImplCopyWithImpl(
    _$EventVerificationImpl _value,
    $Res Function(_$EventVerificationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventVerification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkInPercentage = null,
    Object? isVerified = null,
    Object? verifiedAt = freezed,
  }) {
    return _then(
      _$EventVerificationImpl(
        checkInPercentage: null == checkInPercentage
            ? _value.checkInPercentage
            : checkInPercentage // ignore: cast_nullable_to_non_nullable
                  as int,
        isVerified: null == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
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
class _$EventVerificationImpl implements _EventVerification {
  const _$EventVerificationImpl({
    required this.checkInPercentage,
    required this.isVerified,
    this.verifiedAt,
  });

  factory _$EventVerificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventVerificationImplFromJson(json);

  @override
  final int checkInPercentage;
  @override
  final bool isVerified;
  @override
  final String? verifiedAt;

  @override
  String toString() {
    return 'EventVerification(checkInPercentage: $checkInPercentage, isVerified: $isVerified, verifiedAt: $verifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventVerificationImpl &&
            (identical(other.checkInPercentage, checkInPercentage) ||
                other.checkInPercentage == checkInPercentage) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, checkInPercentage, isVerified, verifiedAt);

  /// Create a copy of EventVerification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventVerificationImplCopyWith<_$EventVerificationImpl> get copyWith =>
      __$$EventVerificationImplCopyWithImpl<_$EventVerificationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int checkInPercentage, bool isVerified, String? verifiedAt)
    $default,
  ) {
    return $default(checkInPercentage, isVerified, verifiedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      int checkInPercentage,
      bool isVerified,
      String? verifiedAt,
    )?
    $default,
  ) {
    return $default?.call(checkInPercentage, isVerified, verifiedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      int checkInPercentage,
      bool isVerified,
      String? verifiedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(checkInPercentage, isVerified, verifiedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EventVerification value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EventVerification value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EventVerification value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EventVerificationImplToJson(this);
  }
}

abstract class _EventVerification implements EventVerification {
  const factory _EventVerification({
    required final int checkInPercentage,
    required final bool isVerified,
    final String? verifiedAt,
  }) = _$EventVerificationImpl;

  factory _EventVerification.fromJson(Map<String, dynamic> json) =
      _$EventVerificationImpl.fromJson;

  @override
  int get checkInPercentage;
  @override
  bool get isVerified;
  @override
  String? get verifiedAt;

  /// Create a copy of EventVerification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventVerificationImplCopyWith<_$EventVerificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
