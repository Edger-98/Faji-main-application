// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_creation_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$EventCreationEntity {
  // Step 0: Event Type
  String? get eventType =>
      throw _privateConstructorUsedError; // Step 1: Event Details
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get category =>
      throw _privateConstructorUsedError; // Added category field
  String? get imageUrl =>
      throw _privateConstructorUsedError; // Cloudinary image URL (replaces poster/theme)
  String? get localImagePath =>
      throw _privateConstructorUsedError; // Local file path before upload
  DateTime? get eventDate => throw _privateConstructorUsedError;
  String? get eventTime => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  int? get totalSeats => throw _privateConstructorUsedError;
  double? get ticketPrice =>
      throw _privateConstructorUsedError; // Step 2: Event Configuration
  int? get expectedGuests => throw _privateConstructorUsedError;
  double? get budget => throw _privateConstructorUsedError;
  bool get enableWishlist => throw _privateConstructorUsedError;
  bool get enableBudgetTracking => throw _privateConstructorUsedError;
  bool get enableCohostMarketplace =>
      throw _privateConstructorUsedError; // Step 3: Location Data
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude =>
      throw _privateConstructorUsedError; // Co-host data (if enabled)
  List<String>? get selectedCohostIds => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String? eventType,
      String? title,
      String? description,
      String? category,
      String? imageUrl,
      String? localImagePath,
      DateTime? eventDate,
      String? eventTime,
      String? location,
      int? totalSeats,
      double? ticketPrice,
      int? expectedGuests,
      double? budget,
      bool enableWishlist,
      bool enableBudgetTracking,
      bool enableCohostMarketplace,
      double? latitude,
      double? longitude,
      List<String>? selectedCohostIds,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String? eventType,
      String? title,
      String? description,
      String? category,
      String? imageUrl,
      String? localImagePath,
      DateTime? eventDate,
      String? eventTime,
      String? location,
      int? totalSeats,
      double? ticketPrice,
      int? expectedGuests,
      double? budget,
      bool enableWishlist,
      bool enableBudgetTracking,
      bool enableCohostMarketplace,
      double? latitude,
      double? longitude,
      List<String>? selectedCohostIds,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String? eventType,
      String? title,
      String? description,
      String? category,
      String? imageUrl,
      String? localImagePath,
      DateTime? eventDate,
      String? eventTime,
      String? location,
      int? totalSeats,
      double? ticketPrice,
      int? expectedGuests,
      double? budget,
      bool enableWishlist,
      bool enableBudgetTracking,
      bool enableCohostMarketplace,
      double? latitude,
      double? longitude,
      List<String>? selectedCohostIds,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EventCreationEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EventCreationEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EventCreationEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of EventCreationEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCreationEntityCopyWith<EventCreationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCreationEntityCopyWith<$Res> {
  factory $EventCreationEntityCopyWith(
    EventCreationEntity value,
    $Res Function(EventCreationEntity) then,
  ) = _$EventCreationEntityCopyWithImpl<$Res, EventCreationEntity>;
  @useResult
  $Res call({
    String? eventType,
    String? title,
    String? description,
    String? category,
    String? imageUrl,
    String? localImagePath,
    DateTime? eventDate,
    String? eventTime,
    String? location,
    int? totalSeats,
    double? ticketPrice,
    int? expectedGuests,
    double? budget,
    bool enableWishlist,
    bool enableBudgetTracking,
    bool enableCohostMarketplace,
    double? latitude,
    double? longitude,
    List<String>? selectedCohostIds,
  });
}

/// @nodoc
class _$EventCreationEntityCopyWithImpl<$Res, $Val extends EventCreationEntity>
    implements $EventCreationEntityCopyWith<$Res> {
  _$EventCreationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventCreationEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? imageUrl = freezed,
    Object? localImagePath = freezed,
    Object? eventDate = freezed,
    Object? eventTime = freezed,
    Object? location = freezed,
    Object? totalSeats = freezed,
    Object? ticketPrice = freezed,
    Object? expectedGuests = freezed,
    Object? budget = freezed,
    Object? enableWishlist = null,
    Object? enableBudgetTracking = null,
    Object? enableCohostMarketplace = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? selectedCohostIds = freezed,
  }) {
    return _then(
      _value.copyWith(
            eventType: freezed == eventType
                ? _value.eventType
                : eventType // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            localImagePath: freezed == localImagePath
                ? _value.localImagePath
                : localImagePath // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventDate: freezed == eventDate
                ? _value.eventDate
                : eventDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            eventTime: freezed == eventTime
                ? _value.eventTime
                : eventTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalSeats: freezed == totalSeats
                ? _value.totalSeats
                : totalSeats // ignore: cast_nullable_to_non_nullable
                      as int?,
            ticketPrice: freezed == ticketPrice
                ? _value.ticketPrice
                : ticketPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            expectedGuests: freezed == expectedGuests
                ? _value.expectedGuests
                : expectedGuests // ignore: cast_nullable_to_non_nullable
                      as int?,
            budget: freezed == budget
                ? _value.budget
                : budget // ignore: cast_nullable_to_non_nullable
                      as double?,
            enableWishlist: null == enableWishlist
                ? _value.enableWishlist
                : enableWishlist // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableBudgetTracking: null == enableBudgetTracking
                ? _value.enableBudgetTracking
                : enableBudgetTracking // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableCohostMarketplace: null == enableCohostMarketplace
                ? _value.enableCohostMarketplace
                : enableCohostMarketplace // ignore: cast_nullable_to_non_nullable
                      as bool,
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double?,
            selectedCohostIds: freezed == selectedCohostIds
                ? _value.selectedCohostIds
                : selectedCohostIds // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventCreationEntityImplCopyWith<$Res>
    implements $EventCreationEntityCopyWith<$Res> {
  factory _$$EventCreationEntityImplCopyWith(
    _$EventCreationEntityImpl value,
    $Res Function(_$EventCreationEntityImpl) then,
  ) = __$$EventCreationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? eventType,
    String? title,
    String? description,
    String? category,
    String? imageUrl,
    String? localImagePath,
    DateTime? eventDate,
    String? eventTime,
    String? location,
    int? totalSeats,
    double? ticketPrice,
    int? expectedGuests,
    double? budget,
    bool enableWishlist,
    bool enableBudgetTracking,
    bool enableCohostMarketplace,
    double? latitude,
    double? longitude,
    List<String>? selectedCohostIds,
  });
}

/// @nodoc
class __$$EventCreationEntityImplCopyWithImpl<$Res>
    extends _$EventCreationEntityCopyWithImpl<$Res, _$EventCreationEntityImpl>
    implements _$$EventCreationEntityImplCopyWith<$Res> {
  __$$EventCreationEntityImplCopyWithImpl(
    _$EventCreationEntityImpl _value,
    $Res Function(_$EventCreationEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventCreationEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventType = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? imageUrl = freezed,
    Object? localImagePath = freezed,
    Object? eventDate = freezed,
    Object? eventTime = freezed,
    Object? location = freezed,
    Object? totalSeats = freezed,
    Object? ticketPrice = freezed,
    Object? expectedGuests = freezed,
    Object? budget = freezed,
    Object? enableWishlist = null,
    Object? enableBudgetTracking = null,
    Object? enableCohostMarketplace = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? selectedCohostIds = freezed,
  }) {
    return _then(
      _$EventCreationEntityImpl(
        eventType: freezed == eventType
            ? _value.eventType
            : eventType // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        localImagePath: freezed == localImagePath
            ? _value.localImagePath
            : localImagePath // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventDate: freezed == eventDate
            ? _value.eventDate
            : eventDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        eventTime: freezed == eventTime
            ? _value.eventTime
            : eventTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalSeats: freezed == totalSeats
            ? _value.totalSeats
            : totalSeats // ignore: cast_nullable_to_non_nullable
                  as int?,
        ticketPrice: freezed == ticketPrice
            ? _value.ticketPrice
            : ticketPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        expectedGuests: freezed == expectedGuests
            ? _value.expectedGuests
            : expectedGuests // ignore: cast_nullable_to_non_nullable
                  as int?,
        budget: freezed == budget
            ? _value.budget
            : budget // ignore: cast_nullable_to_non_nullable
                  as double?,
        enableWishlist: null == enableWishlist
            ? _value.enableWishlist
            : enableWishlist // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableBudgetTracking: null == enableBudgetTracking
            ? _value.enableBudgetTracking
            : enableBudgetTracking // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableCohostMarketplace: null == enableCohostMarketplace
            ? _value.enableCohostMarketplace
            : enableCohostMarketplace // ignore: cast_nullable_to_non_nullable
                  as bool,
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double?,
        selectedCohostIds: freezed == selectedCohostIds
            ? _value._selectedCohostIds
            : selectedCohostIds // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc

class _$EventCreationEntityImpl implements _EventCreationEntity {
  const _$EventCreationEntityImpl({
    this.eventType,
    this.title,
    this.description,
    this.category,
    this.imageUrl,
    this.localImagePath,
    this.eventDate,
    this.eventTime,
    this.location,
    this.totalSeats,
    this.ticketPrice,
    this.expectedGuests,
    this.budget,
    this.enableWishlist = false,
    this.enableBudgetTracking = false,
    this.enableCohostMarketplace = false,
    this.latitude,
    this.longitude,
    final List<String>? selectedCohostIds,
  }) : _selectedCohostIds = selectedCohostIds;

  // Step 0: Event Type
  @override
  final String? eventType;
  // Step 1: Event Details
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? category;
  // Added category field
  @override
  final String? imageUrl;
  // Cloudinary image URL (replaces poster/theme)
  @override
  final String? localImagePath;
  // Local file path before upload
  @override
  final DateTime? eventDate;
  @override
  final String? eventTime;
  @override
  final String? location;
  @override
  final int? totalSeats;
  @override
  final double? ticketPrice;
  // Step 2: Event Configuration
  @override
  final int? expectedGuests;
  @override
  final double? budget;
  @override
  @JsonKey()
  final bool enableWishlist;
  @override
  @JsonKey()
  final bool enableBudgetTracking;
  @override
  @JsonKey()
  final bool enableCohostMarketplace;
  // Step 3: Location Data
  @override
  final double? latitude;
  @override
  final double? longitude;
  // Co-host data (if enabled)
  final List<String>? _selectedCohostIds;
  // Co-host data (if enabled)
  @override
  List<String>? get selectedCohostIds {
    final value = _selectedCohostIds;
    if (value == null) return null;
    if (_selectedCohostIds is EqualUnmodifiableListView)
      return _selectedCohostIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EventCreationEntity(eventType: $eventType, title: $title, description: $description, category: $category, imageUrl: $imageUrl, localImagePath: $localImagePath, eventDate: $eventDate, eventTime: $eventTime, location: $location, totalSeats: $totalSeats, ticketPrice: $ticketPrice, expectedGuests: $expectedGuests, budget: $budget, enableWishlist: $enableWishlist, enableBudgetTracking: $enableBudgetTracking, enableCohostMarketplace: $enableCohostMarketplace, latitude: $latitude, longitude: $longitude, selectedCohostIds: $selectedCohostIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventCreationEntityImpl &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.localImagePath, localImagePath) ||
                other.localImagePath == localImagePath) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.eventTime, eventTime) ||
                other.eventTime == eventTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.totalSeats, totalSeats) ||
                other.totalSeats == totalSeats) &&
            (identical(other.ticketPrice, ticketPrice) ||
                other.ticketPrice == ticketPrice) &&
            (identical(other.expectedGuests, expectedGuests) ||
                other.expectedGuests == expectedGuests) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.enableWishlist, enableWishlist) ||
                other.enableWishlist == enableWishlist) &&
            (identical(other.enableBudgetTracking, enableBudgetTracking) ||
                other.enableBudgetTracking == enableBudgetTracking) &&
            (identical(
                  other.enableCohostMarketplace,
                  enableCohostMarketplace,
                ) ||
                other.enableCohostMarketplace == enableCohostMarketplace) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(
              other._selectedCohostIds,
              _selectedCohostIds,
            ));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    eventType,
    title,
    description,
    category,
    imageUrl,
    localImagePath,
    eventDate,
    eventTime,
    location,
    totalSeats,
    ticketPrice,
    expectedGuests,
    budget,
    enableWishlist,
    enableBudgetTracking,
    enableCohostMarketplace,
    latitude,
    longitude,
    const DeepCollectionEquality().hash(_selectedCohostIds),
  ]);

  /// Create a copy of EventCreationEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventCreationEntityImplCopyWith<_$EventCreationEntityImpl> get copyWith =>
      __$$EventCreationEntityImplCopyWithImpl<_$EventCreationEntityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String? eventType,
      String? title,
      String? description,
      String? category,
      String? imageUrl,
      String? localImagePath,
      DateTime? eventDate,
      String? eventTime,
      String? location,
      int? totalSeats,
      double? ticketPrice,
      int? expectedGuests,
      double? budget,
      bool enableWishlist,
      bool enableBudgetTracking,
      bool enableCohostMarketplace,
      double? latitude,
      double? longitude,
      List<String>? selectedCohostIds,
    )
    $default,
  ) {
    return $default(
      eventType,
      title,
      description,
      category,
      imageUrl,
      localImagePath,
      eventDate,
      eventTime,
      location,
      totalSeats,
      ticketPrice,
      expectedGuests,
      budget,
      enableWishlist,
      enableBudgetTracking,
      enableCohostMarketplace,
      latitude,
      longitude,
      selectedCohostIds,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String? eventType,
      String? title,
      String? description,
      String? category,
      String? imageUrl,
      String? localImagePath,
      DateTime? eventDate,
      String? eventTime,
      String? location,
      int? totalSeats,
      double? ticketPrice,
      int? expectedGuests,
      double? budget,
      bool enableWishlist,
      bool enableBudgetTracking,
      bool enableCohostMarketplace,
      double? latitude,
      double? longitude,
      List<String>? selectedCohostIds,
    )?
    $default,
  ) {
    return $default?.call(
      eventType,
      title,
      description,
      category,
      imageUrl,
      localImagePath,
      eventDate,
      eventTime,
      location,
      totalSeats,
      ticketPrice,
      expectedGuests,
      budget,
      enableWishlist,
      enableBudgetTracking,
      enableCohostMarketplace,
      latitude,
      longitude,
      selectedCohostIds,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String? eventType,
      String? title,
      String? description,
      String? category,
      String? imageUrl,
      String? localImagePath,
      DateTime? eventDate,
      String? eventTime,
      String? location,
      int? totalSeats,
      double? ticketPrice,
      int? expectedGuests,
      double? budget,
      bool enableWishlist,
      bool enableBudgetTracking,
      bool enableCohostMarketplace,
      double? latitude,
      double? longitude,
      List<String>? selectedCohostIds,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        eventType,
        title,
        description,
        category,
        imageUrl,
        localImagePath,
        eventDate,
        eventTime,
        location,
        totalSeats,
        ticketPrice,
        expectedGuests,
        budget,
        enableWishlist,
        enableBudgetTracking,
        enableCohostMarketplace,
        latitude,
        longitude,
        selectedCohostIds,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_EventCreationEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_EventCreationEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_EventCreationEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _EventCreationEntity implements EventCreationEntity {
  const factory _EventCreationEntity({
    final String? eventType,
    final String? title,
    final String? description,
    final String? category,
    final String? imageUrl,
    final String? localImagePath,
    final DateTime? eventDate,
    final String? eventTime,
    final String? location,
    final int? totalSeats,
    final double? ticketPrice,
    final int? expectedGuests,
    final double? budget,
    final bool enableWishlist,
    final bool enableBudgetTracking,
    final bool enableCohostMarketplace,
    final double? latitude,
    final double? longitude,
    final List<String>? selectedCohostIds,
  }) = _$EventCreationEntityImpl;

  // Step 0: Event Type
  @override
  String? get eventType; // Step 1: Event Details
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get category; // Added category field
  @override
  String? get imageUrl; // Cloudinary image URL (replaces poster/theme)
  @override
  String? get localImagePath; // Local file path before upload
  @override
  DateTime? get eventDate;
  @override
  String? get eventTime;
  @override
  String? get location;
  @override
  int? get totalSeats;
  @override
  double? get ticketPrice; // Step 2: Event Configuration
  @override
  int? get expectedGuests;
  @override
  double? get budget;
  @override
  bool get enableWishlist;
  @override
  bool get enableBudgetTracking;
  @override
  bool get enableCohostMarketplace; // Step 3: Location Data
  @override
  double? get latitude;
  @override
  double? get longitude; // Co-host data (if enabled)
  @override
  List<String>? get selectedCohostIds;

  /// Create a copy of EventCreationEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventCreationEntityImplCopyWith<_$EventCreationEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
