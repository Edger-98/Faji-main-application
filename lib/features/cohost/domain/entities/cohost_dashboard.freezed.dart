// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cohost_dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CohostDashboard _$CohostDashboardFromJson(Map<String, dynamic> json) {
  return _CohostDashboard.fromJson(json);
}

/// @nodoc
mixin _$CohostDashboard {
  DashboardEvent get event => throw _privateConstructorUsedError;
  DashboardRole get role => throw _privateConstructorUsedError;
  DashboardEarnings get earnings => throw _privateConstructorUsedError;
  DashboardStats get stats => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      DashboardEvent event,
      DashboardRole role,
      DashboardEarnings earnings,
      DashboardStats stats,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      DashboardEvent event,
      DashboardRole role,
      DashboardEarnings earnings,
      DashboardStats stats,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      DashboardEvent event,
      DashboardRole role,
      DashboardEarnings earnings,
      DashboardStats stats,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostDashboard value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostDashboard value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostDashboard value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this CohostDashboard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CohostDashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CohostDashboardCopyWith<CohostDashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CohostDashboardCopyWith<$Res> {
  factory $CohostDashboardCopyWith(
    CohostDashboard value,
    $Res Function(CohostDashboard) then,
  ) = _$CohostDashboardCopyWithImpl<$Res, CohostDashboard>;
  @useResult
  $Res call({
    DashboardEvent event,
    DashboardRole role,
    DashboardEarnings earnings,
    DashboardStats stats,
  });

  $DashboardEventCopyWith<$Res> get event;
  $DashboardRoleCopyWith<$Res> get role;
  $DashboardEarningsCopyWith<$Res> get earnings;
  $DashboardStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$CohostDashboardCopyWithImpl<$Res, $Val extends CohostDashboard>
    implements $CohostDashboardCopyWith<$Res> {
  _$CohostDashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CohostDashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? role = null,
    Object? earnings = null,
    Object? stats = null,
  }) {
    return _then(
      _value.copyWith(
            event: null == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                      as DashboardEvent,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as DashboardRole,
            earnings: null == earnings
                ? _value.earnings
                : earnings // ignore: cast_nullable_to_non_nullable
                      as DashboardEarnings,
            stats: null == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                      as DashboardStats,
          )
          as $Val,
    );
  }

  /// Create a copy of CohostDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardEventCopyWith<$Res> get event {
    return $DashboardEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }

  /// Create a copy of CohostDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardRoleCopyWith<$Res> get role {
    return $DashboardRoleCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }

  /// Create a copy of CohostDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardEarningsCopyWith<$Res> get earnings {
    return $DashboardEarningsCopyWith<$Res>(_value.earnings, (value) {
      return _then(_value.copyWith(earnings: value) as $Val);
    });
  }

  /// Create a copy of CohostDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardStatsCopyWith<$Res> get stats {
    return $DashboardStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CohostDashboardImplCopyWith<$Res>
    implements $CohostDashboardCopyWith<$Res> {
  factory _$$CohostDashboardImplCopyWith(
    _$CohostDashboardImpl value,
    $Res Function(_$CohostDashboardImpl) then,
  ) = __$$CohostDashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DashboardEvent event,
    DashboardRole role,
    DashboardEarnings earnings,
    DashboardStats stats,
  });

  @override
  $DashboardEventCopyWith<$Res> get event;
  @override
  $DashboardRoleCopyWith<$Res> get role;
  @override
  $DashboardEarningsCopyWith<$Res> get earnings;
  @override
  $DashboardStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$CohostDashboardImplCopyWithImpl<$Res>
    extends _$CohostDashboardCopyWithImpl<$Res, _$CohostDashboardImpl>
    implements _$$CohostDashboardImplCopyWith<$Res> {
  __$$CohostDashboardImplCopyWithImpl(
    _$CohostDashboardImpl _value,
    $Res Function(_$CohostDashboardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CohostDashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? role = null,
    Object? earnings = null,
    Object? stats = null,
  }) {
    return _then(
      _$CohostDashboardImpl(
        event: null == event
            ? _value.event
            : event // ignore: cast_nullable_to_non_nullable
                  as DashboardEvent,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as DashboardRole,
        earnings: null == earnings
            ? _value.earnings
            : earnings // ignore: cast_nullable_to_non_nullable
                  as DashboardEarnings,
        stats: null == stats
            ? _value.stats
            : stats // ignore: cast_nullable_to_non_nullable
                  as DashboardStats,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CohostDashboardImpl implements _CohostDashboard {
  const _$CohostDashboardImpl({
    required this.event,
    required this.role,
    required this.earnings,
    required this.stats,
  });

  factory _$CohostDashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$CohostDashboardImplFromJson(json);

  @override
  final DashboardEvent event;
  @override
  final DashboardRole role;
  @override
  final DashboardEarnings earnings;
  @override
  final DashboardStats stats;

  @override
  String toString() {
    return 'CohostDashboard(event: $event, role: $role, earnings: $earnings, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CohostDashboardImpl &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.earnings, earnings) ||
                other.earnings == earnings) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, event, role, earnings, stats);

  /// Create a copy of CohostDashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CohostDashboardImplCopyWith<_$CohostDashboardImpl> get copyWith =>
      __$$CohostDashboardImplCopyWithImpl<_$CohostDashboardImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      DashboardEvent event,
      DashboardRole role,
      DashboardEarnings earnings,
      DashboardStats stats,
    )
    $default,
  ) {
    return $default(event, role, earnings, stats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      DashboardEvent event,
      DashboardRole role,
      DashboardEarnings earnings,
      DashboardStats stats,
    )?
    $default,
  ) {
    return $default?.call(event, role, earnings, stats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      DashboardEvent event,
      DashboardRole role,
      DashboardEarnings earnings,
      DashboardStats stats,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(event, role, earnings, stats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CohostDashboard value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CohostDashboard value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CohostDashboard value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CohostDashboardImplToJson(this);
  }
}

abstract class _CohostDashboard implements CohostDashboard {
  const factory _CohostDashboard({
    required final DashboardEvent event,
    required final DashboardRole role,
    required final DashboardEarnings earnings,
    required final DashboardStats stats,
  }) = _$CohostDashboardImpl;

  factory _CohostDashboard.fromJson(Map<String, dynamic> json) =
      _$CohostDashboardImpl.fromJson;

  @override
  DashboardEvent get event;
  @override
  DashboardRole get role;
  @override
  DashboardEarnings get earnings;
  @override
  DashboardStats get stats;

  /// Create a copy of CohostDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CohostDashboardImplCopyWith<_$CohostDashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardEvent _$DashboardEventFromJson(Map<String, dynamic> json) {
  return _DashboardEvent.fromJson(json);
}

/// @nodoc
mixin _$DashboardEvent {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get startDate => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String startDate, String? imageUrl)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String startDate,
      String? imageUrl,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String startDate,
      String? imageUrl,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DashboardEvent value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DashboardEvent value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DashboardEvent value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this DashboardEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardEventCopyWith<DashboardEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
    DashboardEvent value,
    $Res Function(DashboardEvent) then,
  ) = _$DashboardEventCopyWithImpl<$Res, DashboardEvent>;
  @useResult
  $Res call({String id, String name, String startDate, String? imageUrl});
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res, $Val extends DashboardEvent>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? imageUrl = freezed,
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
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardEventImplCopyWith<$Res>
    implements $DashboardEventCopyWith<$Res> {
  factory _$$DashboardEventImplCopyWith(
    _$DashboardEventImpl value,
    $Res Function(_$DashboardEventImpl) then,
  ) = __$$DashboardEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String startDate, String? imageUrl});
}

/// @nodoc
class __$$DashboardEventImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$DashboardEventImpl>
    implements _$$DashboardEventImplCopyWith<$Res> {
  __$$DashboardEventImplCopyWithImpl(
    _$DashboardEventImpl _value,
    $Res Function(_$DashboardEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startDate = null,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$DashboardEventImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardEventImpl implements _DashboardEvent {
  const _$DashboardEventImpl({
    required this.id,
    required this.name,
    required this.startDate,
    this.imageUrl,
  });

  factory _$DashboardEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardEventImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String startDate;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'DashboardEvent(id: $id, name: $name, startDate: $startDate, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, startDate, imageUrl);

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardEventImplCopyWith<_$DashboardEventImpl> get copyWith =>
      __$$DashboardEventImplCopyWithImpl<_$DashboardEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, String startDate, String? imageUrl)
    $default,
  ) {
    return $default(id, name, startDate, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String startDate,
      String? imageUrl,
    )?
    $default,
  ) {
    return $default?.call(id, name, startDate, imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String startDate,
      String? imageUrl,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, startDate, imageUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DashboardEvent value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DashboardEvent value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DashboardEvent value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardEventImplToJson(this);
  }
}

abstract class _DashboardEvent implements DashboardEvent {
  const factory _DashboardEvent({
    required final String id,
    required final String name,
    required final String startDate,
    final String? imageUrl,
  }) = _$DashboardEventImpl;

  factory _DashboardEvent.fromJson(Map<String, dynamic> json) =
      _$DashboardEventImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get startDate;
  @override
  String? get imageUrl;

  /// Create a copy of DashboardEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardEventImplCopyWith<_$DashboardEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardRole _$DashboardRoleFromJson(Map<String, dynamic> json) {
  return _DashboardRole.fromJson(json);
}

/// @nodoc
mixin _$DashboardRole {
  String get title => throw _privateConstructorUsedError;
  double get revenueShare => throw _privateConstructorUsedError;
  DashboardPermissions get permissions => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String title,
      double revenueShare,
      DashboardPermissions permissions,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String title,
      double revenueShare,
      DashboardPermissions permissions,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String title,
      double revenueShare,
      DashboardPermissions permissions,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DashboardRole value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DashboardRole value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DashboardRole value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this DashboardRole to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardRoleCopyWith<DashboardRole> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardRoleCopyWith<$Res> {
  factory $DashboardRoleCopyWith(
    DashboardRole value,
    $Res Function(DashboardRole) then,
  ) = _$DashboardRoleCopyWithImpl<$Res, DashboardRole>;
  @useResult
  $Res call({
    String title,
    double revenueShare,
    DashboardPermissions permissions,
  });

  $DashboardPermissionsCopyWith<$Res> get permissions;
}

/// @nodoc
class _$DashboardRoleCopyWithImpl<$Res, $Val extends DashboardRole>
    implements $DashboardRoleCopyWith<$Res> {
  _$DashboardRoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? revenueShare = null,
    Object? permissions = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            revenueShare: null == revenueShare
                ? _value.revenueShare
                : revenueShare // ignore: cast_nullable_to_non_nullable
                      as double,
            permissions: null == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as DashboardPermissions,
          )
          as $Val,
    );
  }

  /// Create a copy of DashboardRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardPermissionsCopyWith<$Res> get permissions {
    return $DashboardPermissionsCopyWith<$Res>(_value.permissions, (value) {
      return _then(_value.copyWith(permissions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardRoleImplCopyWith<$Res>
    implements $DashboardRoleCopyWith<$Res> {
  factory _$$DashboardRoleImplCopyWith(
    _$DashboardRoleImpl value,
    $Res Function(_$DashboardRoleImpl) then,
  ) = __$$DashboardRoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    double revenueShare,
    DashboardPermissions permissions,
  });

  @override
  $DashboardPermissionsCopyWith<$Res> get permissions;
}

/// @nodoc
class __$$DashboardRoleImplCopyWithImpl<$Res>
    extends _$DashboardRoleCopyWithImpl<$Res, _$DashboardRoleImpl>
    implements _$$DashboardRoleImplCopyWith<$Res> {
  __$$DashboardRoleImplCopyWithImpl(
    _$DashboardRoleImpl _value,
    $Res Function(_$DashboardRoleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? revenueShare = null,
    Object? permissions = null,
  }) {
    return _then(
      _$DashboardRoleImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        revenueShare: null == revenueShare
            ? _value.revenueShare
            : revenueShare // ignore: cast_nullable_to_non_nullable
                  as double,
        permissions: null == permissions
            ? _value.permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as DashboardPermissions,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardRoleImpl implements _DashboardRole {
  const _$DashboardRoleImpl({
    required this.title,
    required this.revenueShare,
    required this.permissions,
  });

  factory _$DashboardRoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardRoleImplFromJson(json);

  @override
  final String title;
  @override
  final double revenueShare;
  @override
  final DashboardPermissions permissions;

  @override
  String toString() {
    return 'DashboardRole(title: $title, revenueShare: $revenueShare, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardRoleImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.revenueShare, revenueShare) ||
                other.revenueShare == revenueShare) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, revenueShare, permissions);

  /// Create a copy of DashboardRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardRoleImplCopyWith<_$DashboardRoleImpl> get copyWith =>
      __$$DashboardRoleImplCopyWithImpl<_$DashboardRoleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String title,
      double revenueShare,
      DashboardPermissions permissions,
    )
    $default,
  ) {
    return $default(title, revenueShare, permissions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String title,
      double revenueShare,
      DashboardPermissions permissions,
    )?
    $default,
  ) {
    return $default?.call(title, revenueShare, permissions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String title,
      double revenueShare,
      DashboardPermissions permissions,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(title, revenueShare, permissions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DashboardRole value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DashboardRole value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DashboardRole value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardRoleImplToJson(this);
  }
}

abstract class _DashboardRole implements DashboardRole {
  const factory _DashboardRole({
    required final String title,
    required final double revenueShare,
    required final DashboardPermissions permissions,
  }) = _$DashboardRoleImpl;

  factory _DashboardRole.fromJson(Map<String, dynamic> json) =
      _$DashboardRoleImpl.fromJson;

  @override
  String get title;
  @override
  double get revenueShare;
  @override
  DashboardPermissions get permissions;

  /// Create a copy of DashboardRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardRoleImplCopyWith<_$DashboardRoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardPermissions _$DashboardPermissionsFromJson(Map<String, dynamic> json) {
  return _DashboardPermissions.fromJson(json);
}

/// @nodoc
mixin _$DashboardPermissions {
  bool get canEditEvent => throw _privateConstructorUsedError;
  bool get canViewGuests => throw _privateConstructorUsedError;
  bool get canViewFinancials => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      bool canEditEvent,
      bool canViewGuests,
      bool canViewFinancials,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      bool canEditEvent,
      bool canViewGuests,
      bool canViewFinancials,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      bool canEditEvent,
      bool canViewGuests,
      bool canViewFinancials,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DashboardPermissions value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DashboardPermissions value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DashboardPermissions value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this DashboardPermissions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardPermissionsCopyWith<DashboardPermissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardPermissionsCopyWith<$Res> {
  factory $DashboardPermissionsCopyWith(
    DashboardPermissions value,
    $Res Function(DashboardPermissions) then,
  ) = _$DashboardPermissionsCopyWithImpl<$Res, DashboardPermissions>;
  @useResult
  $Res call({bool canEditEvent, bool canViewGuests, bool canViewFinancials});
}

/// @nodoc
class _$DashboardPermissionsCopyWithImpl<
  $Res,
  $Val extends DashboardPermissions
>
    implements $DashboardPermissionsCopyWith<$Res> {
  _$DashboardPermissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canEditEvent = null,
    Object? canViewGuests = null,
    Object? canViewFinancials = null,
  }) {
    return _then(
      _value.copyWith(
            canEditEvent: null == canEditEvent
                ? _value.canEditEvent
                : canEditEvent // ignore: cast_nullable_to_non_nullable
                      as bool,
            canViewGuests: null == canViewGuests
                ? _value.canViewGuests
                : canViewGuests // ignore: cast_nullable_to_non_nullable
                      as bool,
            canViewFinancials: null == canViewFinancials
                ? _value.canViewFinancials
                : canViewFinancials // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardPermissionsImplCopyWith<$Res>
    implements $DashboardPermissionsCopyWith<$Res> {
  factory _$$DashboardPermissionsImplCopyWith(
    _$DashboardPermissionsImpl value,
    $Res Function(_$DashboardPermissionsImpl) then,
  ) = __$$DashboardPermissionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool canEditEvent, bool canViewGuests, bool canViewFinancials});
}

/// @nodoc
class __$$DashboardPermissionsImplCopyWithImpl<$Res>
    extends _$DashboardPermissionsCopyWithImpl<$Res, _$DashboardPermissionsImpl>
    implements _$$DashboardPermissionsImplCopyWith<$Res> {
  __$$DashboardPermissionsImplCopyWithImpl(
    _$DashboardPermissionsImpl _value,
    $Res Function(_$DashboardPermissionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canEditEvent = null,
    Object? canViewGuests = null,
    Object? canViewFinancials = null,
  }) {
    return _then(
      _$DashboardPermissionsImpl(
        canEditEvent: null == canEditEvent
            ? _value.canEditEvent
            : canEditEvent // ignore: cast_nullable_to_non_nullable
                  as bool,
        canViewGuests: null == canViewGuests
            ? _value.canViewGuests
            : canViewGuests // ignore: cast_nullable_to_non_nullable
                  as bool,
        canViewFinancials: null == canViewFinancials
            ? _value.canViewFinancials
            : canViewFinancials // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardPermissionsImpl implements _DashboardPermissions {
  const _$DashboardPermissionsImpl({
    required this.canEditEvent,
    required this.canViewGuests,
    required this.canViewFinancials,
  });

  factory _$DashboardPermissionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardPermissionsImplFromJson(json);

  @override
  final bool canEditEvent;
  @override
  final bool canViewGuests;
  @override
  final bool canViewFinancials;

  @override
  String toString() {
    return 'DashboardPermissions(canEditEvent: $canEditEvent, canViewGuests: $canViewGuests, canViewFinancials: $canViewFinancials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardPermissionsImpl &&
            (identical(other.canEditEvent, canEditEvent) ||
                other.canEditEvent == canEditEvent) &&
            (identical(other.canViewGuests, canViewGuests) ||
                other.canViewGuests == canViewGuests) &&
            (identical(other.canViewFinancials, canViewFinancials) ||
                other.canViewFinancials == canViewFinancials));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, canEditEvent, canViewGuests, canViewFinancials);

  /// Create a copy of DashboardPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardPermissionsImplCopyWith<_$DashboardPermissionsImpl>
  get copyWith =>
      __$$DashboardPermissionsImplCopyWithImpl<_$DashboardPermissionsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      bool canEditEvent,
      bool canViewGuests,
      bool canViewFinancials,
    )
    $default,
  ) {
    return $default(canEditEvent, canViewGuests, canViewFinancials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      bool canEditEvent,
      bool canViewGuests,
      bool canViewFinancials,
    )?
    $default,
  ) {
    return $default?.call(canEditEvent, canViewGuests, canViewFinancials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      bool canEditEvent,
      bool canViewGuests,
      bool canViewFinancials,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(canEditEvent, canViewGuests, canViewFinancials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DashboardPermissions value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DashboardPermissions value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DashboardPermissions value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardPermissionsImplToJson(this);
  }
}

abstract class _DashboardPermissions implements DashboardPermissions {
  const factory _DashboardPermissions({
    required final bool canEditEvent,
    required final bool canViewGuests,
    required final bool canViewFinancials,
  }) = _$DashboardPermissionsImpl;

  factory _DashboardPermissions.fromJson(Map<String, dynamic> json) =
      _$DashboardPermissionsImpl.fromJson;

  @override
  bool get canEditEvent;
  @override
  bool get canViewGuests;
  @override
  bool get canViewFinancials;

  /// Create a copy of DashboardPermissions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardPermissionsImplCopyWith<_$DashboardPermissionsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DashboardEarnings _$DashboardEarningsFromJson(Map<String, dynamic> json) {
  return _DashboardEarnings.fromJson(json);
}

/// @nodoc
mixin _$DashboardEarnings {
  double get total => throw _privateConstructorUsedError;
  double get pending => throw _privateConstructorUsedError;
  double get paid => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double total, double pending, double paid, String currency)
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double total,
      double pending,
      double paid,
      String currency,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double total,
      double pending,
      double paid,
      String currency,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DashboardEarnings value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DashboardEarnings value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DashboardEarnings value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this DashboardEarnings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardEarnings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardEarningsCopyWith<DashboardEarnings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEarningsCopyWith<$Res> {
  factory $DashboardEarningsCopyWith(
    DashboardEarnings value,
    $Res Function(DashboardEarnings) then,
  ) = _$DashboardEarningsCopyWithImpl<$Res, DashboardEarnings>;
  @useResult
  $Res call({double total, double pending, double paid, String currency});
}

/// @nodoc
class _$DashboardEarningsCopyWithImpl<$Res, $Val extends DashboardEarnings>
    implements $DashboardEarningsCopyWith<$Res> {
  _$DashboardEarningsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardEarnings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? pending = null,
    Object? paid = null,
    Object? currency = null,
  }) {
    return _then(
      _value.copyWith(
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            pending: null == pending
                ? _value.pending
                : pending // ignore: cast_nullable_to_non_nullable
                      as double,
            paid: null == paid
                ? _value.paid
                : paid // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardEarningsImplCopyWith<$Res>
    implements $DashboardEarningsCopyWith<$Res> {
  factory _$$DashboardEarningsImplCopyWith(
    _$DashboardEarningsImpl value,
    $Res Function(_$DashboardEarningsImpl) then,
  ) = __$$DashboardEarningsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double total, double pending, double paid, String currency});
}

/// @nodoc
class __$$DashboardEarningsImplCopyWithImpl<$Res>
    extends _$DashboardEarningsCopyWithImpl<$Res, _$DashboardEarningsImpl>
    implements _$$DashboardEarningsImplCopyWith<$Res> {
  __$$DashboardEarningsImplCopyWithImpl(
    _$DashboardEarningsImpl _value,
    $Res Function(_$DashboardEarningsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardEarnings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? pending = null,
    Object? paid = null,
    Object? currency = null,
  }) {
    return _then(
      _$DashboardEarningsImpl(
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        pending: null == pending
            ? _value.pending
            : pending // ignore: cast_nullable_to_non_nullable
                  as double,
        paid: null == paid
            ? _value.paid
            : paid // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardEarningsImpl implements _DashboardEarnings {
  const _$DashboardEarningsImpl({
    required this.total,
    required this.pending,
    required this.paid,
    required this.currency,
  });

  factory _$DashboardEarningsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardEarningsImplFromJson(json);

  @override
  final double total;
  @override
  final double pending;
  @override
  final double paid;
  @override
  final String currency;

  @override
  String toString() {
    return 'DashboardEarnings(total: $total, pending: $pending, paid: $paid, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardEarningsImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, pending, paid, currency);

  /// Create a copy of DashboardEarnings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardEarningsImplCopyWith<_$DashboardEarningsImpl> get copyWith =>
      __$$DashboardEarningsImplCopyWithImpl<_$DashboardEarningsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double total, double pending, double paid, String currency)
    $default,
  ) {
    return $default(total, pending, paid, currency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double total,
      double pending,
      double paid,
      String currency,
    )?
    $default,
  ) {
    return $default?.call(total, pending, paid, currency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double total,
      double pending,
      double paid,
      String currency,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(total, pending, paid, currency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DashboardEarnings value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DashboardEarnings value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DashboardEarnings value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardEarningsImplToJson(this);
  }
}

abstract class _DashboardEarnings implements DashboardEarnings {
  const factory _DashboardEarnings({
    required final double total,
    required final double pending,
    required final double paid,
    required final String currency,
  }) = _$DashboardEarningsImpl;

  factory _DashboardEarnings.fromJson(Map<String, dynamic> json) =
      _$DashboardEarningsImpl.fromJson;

  @override
  double get total;
  @override
  double get pending;
  @override
  double get paid;
  @override
  String get currency;

  /// Create a copy of DashboardEarnings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardEarningsImplCopyWith<_$DashboardEarningsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardStats _$DashboardStatsFromJson(Map<String, dynamic> json) {
  return _DashboardStats.fromJson(json);
}

/// @nodoc
mixin _$DashboardStats {
  double get totalRevenue => throw _privateConstructorUsedError;
  double get yourShare => throw _privateConstructorUsedError;
  int get ticketsSold => throw _privateConstructorUsedError;
  int get guestsCheckedIn => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      double totalRevenue,
      double yourShare,
      int ticketsSold,
      int guestsCheckedIn,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double totalRevenue,
      double yourShare,
      int ticketsSold,
      int guestsCheckedIn,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double totalRevenue,
      double yourShare,
      int ticketsSold,
      int guestsCheckedIn,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DashboardStats value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DashboardStats value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DashboardStats value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this DashboardStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardStatsCopyWith<DashboardStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatsCopyWith<$Res> {
  factory $DashboardStatsCopyWith(
    DashboardStats value,
    $Res Function(DashboardStats) then,
  ) = _$DashboardStatsCopyWithImpl<$Res, DashboardStats>;
  @useResult
  $Res call({
    double totalRevenue,
    double yourShare,
    int ticketsSold,
    int guestsCheckedIn,
  });
}

/// @nodoc
class _$DashboardStatsCopyWithImpl<$Res, $Val extends DashboardStats>
    implements $DashboardStatsCopyWith<$Res> {
  _$DashboardStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRevenue = null,
    Object? yourShare = null,
    Object? ticketsSold = null,
    Object? guestsCheckedIn = null,
  }) {
    return _then(
      _value.copyWith(
            totalRevenue: null == totalRevenue
                ? _value.totalRevenue
                : totalRevenue // ignore: cast_nullable_to_non_nullable
                      as double,
            yourShare: null == yourShare
                ? _value.yourShare
                : yourShare // ignore: cast_nullable_to_non_nullable
                      as double,
            ticketsSold: null == ticketsSold
                ? _value.ticketsSold
                : ticketsSold // ignore: cast_nullable_to_non_nullable
                      as int,
            guestsCheckedIn: null == guestsCheckedIn
                ? _value.guestsCheckedIn
                : guestsCheckedIn // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardStatsImplCopyWith<$Res>
    implements $DashboardStatsCopyWith<$Res> {
  factory _$$DashboardStatsImplCopyWith(
    _$DashboardStatsImpl value,
    $Res Function(_$DashboardStatsImpl) then,
  ) = __$$DashboardStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double totalRevenue,
    double yourShare,
    int ticketsSold,
    int guestsCheckedIn,
  });
}

/// @nodoc
class __$$DashboardStatsImplCopyWithImpl<$Res>
    extends _$DashboardStatsCopyWithImpl<$Res, _$DashboardStatsImpl>
    implements _$$DashboardStatsImplCopyWith<$Res> {
  __$$DashboardStatsImplCopyWithImpl(
    _$DashboardStatsImpl _value,
    $Res Function(_$DashboardStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRevenue = null,
    Object? yourShare = null,
    Object? ticketsSold = null,
    Object? guestsCheckedIn = null,
  }) {
    return _then(
      _$DashboardStatsImpl(
        totalRevenue: null == totalRevenue
            ? _value.totalRevenue
            : totalRevenue // ignore: cast_nullable_to_non_nullable
                  as double,
        yourShare: null == yourShare
            ? _value.yourShare
            : yourShare // ignore: cast_nullable_to_non_nullable
                  as double,
        ticketsSold: null == ticketsSold
            ? _value.ticketsSold
            : ticketsSold // ignore: cast_nullable_to_non_nullable
                  as int,
        guestsCheckedIn: null == guestsCheckedIn
            ? _value.guestsCheckedIn
            : guestsCheckedIn // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardStatsImpl implements _DashboardStats {
  const _$DashboardStatsImpl({
    required this.totalRevenue,
    required this.yourShare,
    required this.ticketsSold,
    required this.guestsCheckedIn,
  });

  factory _$DashboardStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardStatsImplFromJson(json);

  @override
  final double totalRevenue;
  @override
  final double yourShare;
  @override
  final int ticketsSold;
  @override
  final int guestsCheckedIn;

  @override
  String toString() {
    return 'DashboardStats(totalRevenue: $totalRevenue, yourShare: $yourShare, ticketsSold: $ticketsSold, guestsCheckedIn: $guestsCheckedIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatsImpl &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.yourShare, yourShare) ||
                other.yourShare == yourShare) &&
            (identical(other.ticketsSold, ticketsSold) ||
                other.ticketsSold == ticketsSold) &&
            (identical(other.guestsCheckedIn, guestsCheckedIn) ||
                other.guestsCheckedIn == guestsCheckedIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalRevenue,
    yourShare,
    ticketsSold,
    guestsCheckedIn,
  );

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      __$$DashboardStatsImplCopyWithImpl<_$DashboardStatsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      double totalRevenue,
      double yourShare,
      int ticketsSold,
      int guestsCheckedIn,
    )
    $default,
  ) {
    return $default(totalRevenue, yourShare, ticketsSold, guestsCheckedIn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      double totalRevenue,
      double yourShare,
      int ticketsSold,
      int guestsCheckedIn,
    )?
    $default,
  ) {
    return $default?.call(
      totalRevenue,
      yourShare,
      ticketsSold,
      guestsCheckedIn,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      double totalRevenue,
      double yourShare,
      int ticketsSold,
      int guestsCheckedIn,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(totalRevenue, yourShare, ticketsSold, guestsCheckedIn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DashboardStats value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_DashboardStats value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DashboardStats value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardStatsImplToJson(this);
  }
}

abstract class _DashboardStats implements DashboardStats {
  const factory _DashboardStats({
    required final double totalRevenue,
    required final double yourShare,
    required final int ticketsSold,
    required final int guestsCheckedIn,
  }) = _$DashboardStatsImpl;

  factory _DashboardStats.fromJson(Map<String, dynamic> json) =
      _$DashboardStatsImpl.fromJson;

  @override
  double get totalRevenue;
  @override
  double get yourShare;
  @override
  int get ticketsSold;
  @override
  int get guestsCheckedIn;

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
