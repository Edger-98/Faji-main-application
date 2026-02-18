// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RegistrationStatus _$RegistrationStatusFromJson(Map<String, dynamic> json) {
  return _RegistrationStatus.fromJson(json);
}

/// @nodoc
mixin _$RegistrationStatus {
  String get status => throw _privateConstructorUsedError;
  bool get isApproved => throw _privateConstructorUsedError;
  bool get documentsUploaded => throw _privateConstructorUsedError;
  bool get portfolioUploaded => throw _privateConstructorUsedError;
  bool get bankDetailsAdded => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String? get rejectionReason => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String status,
      bool isApproved,
      bool documentsUploaded,
      bool portfolioUploaded,
      bool bankDetailsAdded,
      String updatedAt,
      String? rejectionReason,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String status,
      bool isApproved,
      bool documentsUploaded,
      bool portfolioUploaded,
      bool bankDetailsAdded,
      String updatedAt,
      String? rejectionReason,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String status,
      bool isApproved,
      bool documentsUploaded,
      bool portfolioUploaded,
      bool bankDetailsAdded,
      String updatedAt,
      String? rejectionReason,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RegistrationStatus value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RegistrationStatus value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RegistrationStatus value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this RegistrationStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegistrationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationStatusCopyWith<RegistrationStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationStatusCopyWith<$Res> {
  factory $RegistrationStatusCopyWith(
    RegistrationStatus value,
    $Res Function(RegistrationStatus) then,
  ) = _$RegistrationStatusCopyWithImpl<$Res, RegistrationStatus>;
  @useResult
  $Res call({
    String status,
    bool isApproved,
    bool documentsUploaded,
    bool portfolioUploaded,
    bool bankDetailsAdded,
    String updatedAt,
    String? rejectionReason,
  });
}

/// @nodoc
class _$RegistrationStatusCopyWithImpl<$Res, $Val extends RegistrationStatus>
    implements $RegistrationStatusCopyWith<$Res> {
  _$RegistrationStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isApproved = null,
    Object? documentsUploaded = null,
    Object? portfolioUploaded = null,
    Object? bankDetailsAdded = null,
    Object? updatedAt = null,
    Object? rejectionReason = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            isApproved: null == isApproved
                ? _value.isApproved
                : isApproved // ignore: cast_nullable_to_non_nullable
                      as bool,
            documentsUploaded: null == documentsUploaded
                ? _value.documentsUploaded
                : documentsUploaded // ignore: cast_nullable_to_non_nullable
                      as bool,
            portfolioUploaded: null == portfolioUploaded
                ? _value.portfolioUploaded
                : portfolioUploaded // ignore: cast_nullable_to_non_nullable
                      as bool,
            bankDetailsAdded: null == bankDetailsAdded
                ? _value.bankDetailsAdded
                : bankDetailsAdded // ignore: cast_nullable_to_non_nullable
                      as bool,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            rejectionReason: freezed == rejectionReason
                ? _value.rejectionReason
                : rejectionReason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegistrationStatusImplCopyWith<$Res>
    implements $RegistrationStatusCopyWith<$Res> {
  factory _$$RegistrationStatusImplCopyWith(
    _$RegistrationStatusImpl value,
    $Res Function(_$RegistrationStatusImpl) then,
  ) = __$$RegistrationStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String status,
    bool isApproved,
    bool documentsUploaded,
    bool portfolioUploaded,
    bool bankDetailsAdded,
    String updatedAt,
    String? rejectionReason,
  });
}

/// @nodoc
class __$$RegistrationStatusImplCopyWithImpl<$Res>
    extends _$RegistrationStatusCopyWithImpl<$Res, _$RegistrationStatusImpl>
    implements _$$RegistrationStatusImplCopyWith<$Res> {
  __$$RegistrationStatusImplCopyWithImpl(
    _$RegistrationStatusImpl _value,
    $Res Function(_$RegistrationStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegistrationStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? isApproved = null,
    Object? documentsUploaded = null,
    Object? portfolioUploaded = null,
    Object? bankDetailsAdded = null,
    Object? updatedAt = null,
    Object? rejectionReason = freezed,
  }) {
    return _then(
      _$RegistrationStatusImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        isApproved: null == isApproved
            ? _value.isApproved
            : isApproved // ignore: cast_nullable_to_non_nullable
                  as bool,
        documentsUploaded: null == documentsUploaded
            ? _value.documentsUploaded
            : documentsUploaded // ignore: cast_nullable_to_non_nullable
                  as bool,
        portfolioUploaded: null == portfolioUploaded
            ? _value.portfolioUploaded
            : portfolioUploaded // ignore: cast_nullable_to_non_nullable
                  as bool,
        bankDetailsAdded: null == bankDetailsAdded
            ? _value.bankDetailsAdded
            : bankDetailsAdded // ignore: cast_nullable_to_non_nullable
                  as bool,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        rejectionReason: freezed == rejectionReason
            ? _value.rejectionReason
            : rejectionReason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistrationStatusImpl implements _RegistrationStatus {
  const _$RegistrationStatusImpl({
    required this.status,
    required this.isApproved,
    required this.documentsUploaded,
    required this.portfolioUploaded,
    required this.bankDetailsAdded,
    required this.updatedAt,
    this.rejectionReason,
  });

  factory _$RegistrationStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegistrationStatusImplFromJson(json);

  @override
  final String status;
  @override
  final bool isApproved;
  @override
  final bool documentsUploaded;
  @override
  final bool portfolioUploaded;
  @override
  final bool bankDetailsAdded;
  @override
  final String updatedAt;
  @override
  final String? rejectionReason;

  @override
  String toString() {
    return 'RegistrationStatus(status: $status, isApproved: $isApproved, documentsUploaded: $documentsUploaded, portfolioUploaded: $portfolioUploaded, bankDetailsAdded: $bankDetailsAdded, updatedAt: $updatedAt, rejectionReason: $rejectionReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationStatusImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.documentsUploaded, documentsUploaded) ||
                other.documentsUploaded == documentsUploaded) &&
            (identical(other.portfolioUploaded, portfolioUploaded) ||
                other.portfolioUploaded == portfolioUploaded) &&
            (identical(other.bankDetailsAdded, bankDetailsAdded) ||
                other.bankDetailsAdded == bankDetailsAdded) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    isApproved,
    documentsUploaded,
    portfolioUploaded,
    bankDetailsAdded,
    updatedAt,
    rejectionReason,
  );

  /// Create a copy of RegistrationStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationStatusImplCopyWith<_$RegistrationStatusImpl> get copyWith =>
      __$$RegistrationStatusImplCopyWithImpl<_$RegistrationStatusImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String status,
      bool isApproved,
      bool documentsUploaded,
      bool portfolioUploaded,
      bool bankDetailsAdded,
      String updatedAt,
      String? rejectionReason,
    )
    $default,
  ) {
    return $default(
      status,
      isApproved,
      documentsUploaded,
      portfolioUploaded,
      bankDetailsAdded,
      updatedAt,
      rejectionReason,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String status,
      bool isApproved,
      bool documentsUploaded,
      bool portfolioUploaded,
      bool bankDetailsAdded,
      String updatedAt,
      String? rejectionReason,
    )?
    $default,
  ) {
    return $default?.call(
      status,
      isApproved,
      documentsUploaded,
      portfolioUploaded,
      bankDetailsAdded,
      updatedAt,
      rejectionReason,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String status,
      bool isApproved,
      bool documentsUploaded,
      bool portfolioUploaded,
      bool bankDetailsAdded,
      String updatedAt,
      String? rejectionReason,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        status,
        isApproved,
        documentsUploaded,
        portfolioUploaded,
        bankDetailsAdded,
        updatedAt,
        rejectionReason,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RegistrationStatus value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RegistrationStatus value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RegistrationStatus value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrationStatusImplToJson(this);
  }
}

abstract class _RegistrationStatus implements RegistrationStatus {
  const factory _RegistrationStatus({
    required final String status,
    required final bool isApproved,
    required final bool documentsUploaded,
    required final bool portfolioUploaded,
    required final bool bankDetailsAdded,
    required final String updatedAt,
    final String? rejectionReason,
  }) = _$RegistrationStatusImpl;

  factory _RegistrationStatus.fromJson(Map<String, dynamic> json) =
      _$RegistrationStatusImpl.fromJson;

  @override
  String get status;
  @override
  bool get isApproved;
  @override
  bool get documentsUploaded;
  @override
  bool get portfolioUploaded;
  @override
  bool get bankDetailsAdded;
  @override
  String get updatedAt;
  @override
  String? get rejectionReason;

  /// Create a copy of RegistrationStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationStatusImplCopyWith<_$RegistrationStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VendorRegistrationProfile _$VendorRegistrationProfileFromJson(
  Map<String, dynamic> json,
) {
  return _VendorRegistrationProfile.fromJson(json);
}

/// @nodoc
mixin _$VendorRegistrationProfile {
  String get id => throw _privateConstructorUsedError;
  String get businessName => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<String> get documents => throw _privateConstructorUsedError;
  List<String> get portfolio => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  BankDetailsResponse? get bankDetails => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String businessName,
      String category,
      String bio,
      String location,
      String phoneNumber,
      String status,
      List<String> documents,
      List<String> portfolio,
      String createdAt,
      String updatedAt,
      String? website,
      BankDetailsResponse? bankDetails,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String businessName,
      String category,
      String bio,
      String location,
      String phoneNumber,
      String status,
      List<String> documents,
      List<String> portfolio,
      String createdAt,
      String updatedAt,
      String? website,
      BankDetailsResponse? bankDetails,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String businessName,
      String category,
      String bio,
      String location,
      String phoneNumber,
      String status,
      List<String> documents,
      List<String> portfolio,
      String createdAt,
      String updatedAt,
      String? website,
      BankDetailsResponse? bankDetails,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorRegistrationProfile value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorRegistrationProfile value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorRegistrationProfile value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorRegistrationProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorRegistrationProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorRegistrationProfileCopyWith<VendorRegistrationProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorRegistrationProfileCopyWith<$Res> {
  factory $VendorRegistrationProfileCopyWith(
    VendorRegistrationProfile value,
    $Res Function(VendorRegistrationProfile) then,
  ) = _$VendorRegistrationProfileCopyWithImpl<$Res, VendorRegistrationProfile>;
  @useResult
  $Res call({
    String id,
    String businessName,
    String category,
    String bio,
    String location,
    String phoneNumber,
    String status,
    List<String> documents,
    List<String> portfolio,
    String createdAt,
    String updatedAt,
    String? website,
    BankDetailsResponse? bankDetails,
  });

  $BankDetailsResponseCopyWith<$Res>? get bankDetails;
}

/// @nodoc
class _$VendorRegistrationProfileCopyWithImpl<
  $Res,
  $Val extends VendorRegistrationProfile
>
    implements $VendorRegistrationProfileCopyWith<$Res> {
  _$VendorRegistrationProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorRegistrationProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? businessName = null,
    Object? category = null,
    Object? bio = null,
    Object? location = null,
    Object? phoneNumber = null,
    Object? status = null,
    Object? documents = null,
    Object? portfolio = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? website = freezed,
    Object? bankDetails = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            businessName: null == businessName
                ? _value.businessName
                : businessName // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            bio: null == bio
                ? _value.bio
                : bio // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            phoneNumber: null == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            documents: null == documents
                ? _value.documents
                : documents // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            portfolio: null == portfolio
                ? _value.portfolio
                : portfolio // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            website: freezed == website
                ? _value.website
                : website // ignore: cast_nullable_to_non_nullable
                      as String?,
            bankDetails: freezed == bankDetails
                ? _value.bankDetails
                : bankDetails // ignore: cast_nullable_to_non_nullable
                      as BankDetailsResponse?,
          )
          as $Val,
    );
  }

  /// Create a copy of VendorRegistrationProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BankDetailsResponseCopyWith<$Res>? get bankDetails {
    if (_value.bankDetails == null) {
      return null;
    }

    return $BankDetailsResponseCopyWith<$Res>(_value.bankDetails!, (value) {
      return _then(_value.copyWith(bankDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VendorRegistrationProfileImplCopyWith<$Res>
    implements $VendorRegistrationProfileCopyWith<$Res> {
  factory _$$VendorRegistrationProfileImplCopyWith(
    _$VendorRegistrationProfileImpl value,
    $Res Function(_$VendorRegistrationProfileImpl) then,
  ) = __$$VendorRegistrationProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String businessName,
    String category,
    String bio,
    String location,
    String phoneNumber,
    String status,
    List<String> documents,
    List<String> portfolio,
    String createdAt,
    String updatedAt,
    String? website,
    BankDetailsResponse? bankDetails,
  });

  @override
  $BankDetailsResponseCopyWith<$Res>? get bankDetails;
}

/// @nodoc
class __$$VendorRegistrationProfileImplCopyWithImpl<$Res>
    extends
        _$VendorRegistrationProfileCopyWithImpl<
          $Res,
          _$VendorRegistrationProfileImpl
        >
    implements _$$VendorRegistrationProfileImplCopyWith<$Res> {
  __$$VendorRegistrationProfileImplCopyWithImpl(
    _$VendorRegistrationProfileImpl _value,
    $Res Function(_$VendorRegistrationProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorRegistrationProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? businessName = null,
    Object? category = null,
    Object? bio = null,
    Object? location = null,
    Object? phoneNumber = null,
    Object? status = null,
    Object? documents = null,
    Object? portfolio = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? website = freezed,
    Object? bankDetails = freezed,
  }) {
    return _then(
      _$VendorRegistrationProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        businessName: null == businessName
            ? _value.businessName
            : businessName // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        bio: null == bio
            ? _value.bio
            : bio // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        phoneNumber: null == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        documents: null == documents
            ? _value._documents
            : documents // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        portfolio: null == portfolio
            ? _value._portfolio
            : portfolio // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        website: freezed == website
            ? _value.website
            : website // ignore: cast_nullable_to_non_nullable
                  as String?,
        bankDetails: freezed == bankDetails
            ? _value.bankDetails
            : bankDetails // ignore: cast_nullable_to_non_nullable
                  as BankDetailsResponse?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorRegistrationProfileImpl implements _VendorRegistrationProfile {
  const _$VendorRegistrationProfileImpl({
    required this.id,
    required this.businessName,
    required this.category,
    required this.bio,
    required this.location,
    required this.phoneNumber,
    required this.status,
    required final List<String> documents,
    required final List<String> portfolio,
    required this.createdAt,
    required this.updatedAt,
    this.website,
    this.bankDetails,
  }) : _documents = documents,
       _portfolio = portfolio;

  factory _$VendorRegistrationProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorRegistrationProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String businessName;
  @override
  final String category;
  @override
  final String bio;
  @override
  final String location;
  @override
  final String phoneNumber;
  @override
  final String status;
  final List<String> _documents;
  @override
  List<String> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  final List<String> _portfolio;
  @override
  List<String> get portfolio {
    if (_portfolio is EqualUnmodifiableListView) return _portfolio;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_portfolio);
  }

  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final String? website;
  @override
  final BankDetailsResponse? bankDetails;

  @override
  String toString() {
    return 'VendorRegistrationProfile(id: $id, businessName: $businessName, category: $category, bio: $bio, location: $location, phoneNumber: $phoneNumber, status: $status, documents: $documents, portfolio: $portfolio, createdAt: $createdAt, updatedAt: $updatedAt, website: $website, bankDetails: $bankDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorRegistrationProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.businessName, businessName) ||
                other.businessName == businessName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._documents,
              _documents,
            ) &&
            const DeepCollectionEquality().equals(
              other._portfolio,
              _portfolio,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.bankDetails, bankDetails) ||
                other.bankDetails == bankDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    businessName,
    category,
    bio,
    location,
    phoneNumber,
    status,
    const DeepCollectionEquality().hash(_documents),
    const DeepCollectionEquality().hash(_portfolio),
    createdAt,
    updatedAt,
    website,
    bankDetails,
  );

  /// Create a copy of VendorRegistrationProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorRegistrationProfileImplCopyWith<_$VendorRegistrationProfileImpl>
  get copyWith =>
      __$$VendorRegistrationProfileImplCopyWithImpl<
        _$VendorRegistrationProfileImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String businessName,
      String category,
      String bio,
      String location,
      String phoneNumber,
      String status,
      List<String> documents,
      List<String> portfolio,
      String createdAt,
      String updatedAt,
      String? website,
      BankDetailsResponse? bankDetails,
    )
    $default,
  ) {
    return $default(
      id,
      businessName,
      category,
      bio,
      location,
      phoneNumber,
      status,
      documents,
      portfolio,
      createdAt,
      updatedAt,
      website,
      bankDetails,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String businessName,
      String category,
      String bio,
      String location,
      String phoneNumber,
      String status,
      List<String> documents,
      List<String> portfolio,
      String createdAt,
      String updatedAt,
      String? website,
      BankDetailsResponse? bankDetails,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      businessName,
      category,
      bio,
      location,
      phoneNumber,
      status,
      documents,
      portfolio,
      createdAt,
      updatedAt,
      website,
      bankDetails,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String businessName,
      String category,
      String bio,
      String location,
      String phoneNumber,
      String status,
      List<String> documents,
      List<String> portfolio,
      String createdAt,
      String updatedAt,
      String? website,
      BankDetailsResponse? bankDetails,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        businessName,
        category,
        bio,
        location,
        phoneNumber,
        status,
        documents,
        portfolio,
        createdAt,
        updatedAt,
        website,
        bankDetails,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorRegistrationProfile value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorRegistrationProfile value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorRegistrationProfile value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorRegistrationProfileImplToJson(this);
  }
}

abstract class _VendorRegistrationProfile implements VendorRegistrationProfile {
  const factory _VendorRegistrationProfile({
    required final String id,
    required final String businessName,
    required final String category,
    required final String bio,
    required final String location,
    required final String phoneNumber,
    required final String status,
    required final List<String> documents,
    required final List<String> portfolio,
    required final String createdAt,
    required final String updatedAt,
    final String? website,
    final BankDetailsResponse? bankDetails,
  }) = _$VendorRegistrationProfileImpl;

  factory _VendorRegistrationProfile.fromJson(Map<String, dynamic> json) =
      _$VendorRegistrationProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get businessName;
  @override
  String get category;
  @override
  String get bio;
  @override
  String get location;
  @override
  String get phoneNumber;
  @override
  String get status;
  @override
  List<String> get documents;
  @override
  List<String> get portfolio;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  String? get website;
  @override
  BankDetailsResponse? get bankDetails;

  /// Create a copy of VendorRegistrationProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorRegistrationProfileImplCopyWith<_$VendorRegistrationProfileImpl>
  get copyWith => throw _privateConstructorUsedError;
}
