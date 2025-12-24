// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_resource_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VendorResourceEntity _$VendorResourceEntityFromJson(Map<String, dynamic> json) {
  return _VendorResourceEntity.fromJson(json);
}

/// @nodoc
mixin _$VendorResourceEntity {
  String get id => throw _privateConstructorUsedError;
  String get vendorId => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  int get bookingCount => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String vendorId,
      String category,
      String title,
      String description,
      double price,
      List<String>? images,
      bool isAvailable,
      int bookingCount,
      DateTime? createdAt,
      DateTime? updatedAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String vendorId,
      String category,
      String title,
      String description,
      double price,
      List<String>? images,
      bool isAvailable,
      int bookingCount,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String vendorId,
      String category,
      String title,
      String description,
      double price,
      List<String>? images,
      bool isAvailable,
      int bookingCount,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorResourceEntity value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorResourceEntity value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorResourceEntity value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this VendorResourceEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VendorResourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorResourceEntityCopyWith<VendorResourceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorResourceEntityCopyWith<$Res> {
  factory $VendorResourceEntityCopyWith(
    VendorResourceEntity value,
    $Res Function(VendorResourceEntity) then,
  ) = _$VendorResourceEntityCopyWithImpl<$Res, VendorResourceEntity>;
  @useResult
  $Res call({
    String id,
    String vendorId,
    String category,
    String title,
    String description,
    double price,
    List<String>? images,
    bool isAvailable,
    int bookingCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$VendorResourceEntityCopyWithImpl<
  $Res,
  $Val extends VendorResourceEntity
>
    implements $VendorResourceEntityCopyWith<$Res> {
  _$VendorResourceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VendorResourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? images = freezed,
    Object? isAvailable = null,
    Object? bookingCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            vendorId: null == vendorId
                ? _value.vendorId
                : vendorId // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            images: freezed == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            bookingCount: null == bookingCount
                ? _value.bookingCount
                : bookingCount // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VendorResourceEntityImplCopyWith<$Res>
    implements $VendorResourceEntityCopyWith<$Res> {
  factory _$$VendorResourceEntityImplCopyWith(
    _$VendorResourceEntityImpl value,
    $Res Function(_$VendorResourceEntityImpl) then,
  ) = __$$VendorResourceEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String vendorId,
    String category,
    String title,
    String description,
    double price,
    List<String>? images,
    bool isAvailable,
    int bookingCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$VendorResourceEntityImplCopyWithImpl<$Res>
    extends _$VendorResourceEntityCopyWithImpl<$Res, _$VendorResourceEntityImpl>
    implements _$$VendorResourceEntityImplCopyWith<$Res> {
  __$$VendorResourceEntityImplCopyWithImpl(
    _$VendorResourceEntityImpl _value,
    $Res Function(_$VendorResourceEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VendorResourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vendorId = null,
    Object? category = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? images = freezed,
    Object? isAvailable = null,
    Object? bookingCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$VendorResourceEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        vendorId: null == vendorId
            ? _value.vendorId
            : vendorId // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        images: freezed == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        bookingCount: null == bookingCount
            ? _value.bookingCount
            : bookingCount // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorResourceEntityImpl implements _VendorResourceEntity {
  const _$VendorResourceEntityImpl({
    required this.id,
    required this.vendorId,
    required this.category,
    required this.title,
    required this.description,
    required this.price,
    final List<String>? images,
    this.isAvailable = true,
    this.bookingCount = 0,
    this.createdAt,
    this.updatedAt,
  }) : _images = images;

  factory _$VendorResourceEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorResourceEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String vendorId;
  @override
  final String category;
  @override
  final String title;
  @override
  final String description;
  @override
  final double price;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isAvailable;
  @override
  @JsonKey()
  final int bookingCount;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'VendorResourceEntity(id: $id, vendorId: $vendorId, category: $category, title: $title, description: $description, price: $price, images: $images, isAvailable: $isAvailable, bookingCount: $bookingCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorResourceEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.bookingCount, bookingCount) ||
                other.bookingCount == bookingCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    vendorId,
    category,
    title,
    description,
    price,
    const DeepCollectionEquality().hash(_images),
    isAvailable,
    bookingCount,
    createdAt,
    updatedAt,
  );

  /// Create a copy of VendorResourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorResourceEntityImplCopyWith<_$VendorResourceEntityImpl>
  get copyWith =>
      __$$VendorResourceEntityImplCopyWithImpl<_$VendorResourceEntityImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String vendorId,
      String category,
      String title,
      String description,
      double price,
      List<String>? images,
      bool isAvailable,
      int bookingCount,
      DateTime? createdAt,
      DateTime? updatedAt,
    )
    $default,
  ) {
    return $default(
      id,
      vendorId,
      category,
      title,
      description,
      price,
      images,
      isAvailable,
      bookingCount,
      createdAt,
      updatedAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String vendorId,
      String category,
      String title,
      String description,
      double price,
      List<String>? images,
      bool isAvailable,
      int bookingCount,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      vendorId,
      category,
      title,
      description,
      price,
      images,
      isAvailable,
      bookingCount,
      createdAt,
      updatedAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String vendorId,
      String category,
      String title,
      String description,
      double price,
      List<String>? images,
      bool isAvailable,
      int bookingCount,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        vendorId,
        category,
        title,
        description,
        price,
        images,
        isAvailable,
        bookingCount,
        createdAt,
        updatedAt,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VendorResourceEntity value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VendorResourceEntity value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VendorResourceEntity value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorResourceEntityImplToJson(this);
  }
}

abstract class _VendorResourceEntity implements VendorResourceEntity {
  const factory _VendorResourceEntity({
    required final String id,
    required final String vendorId,
    required final String category,
    required final String title,
    required final String description,
    required final double price,
    final List<String>? images,
    final bool isAvailable,
    final int bookingCount,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$VendorResourceEntityImpl;

  factory _VendorResourceEntity.fromJson(Map<String, dynamic> json) =
      _$VendorResourceEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get vendorId;
  @override
  String get category;
  @override
  String get title;
  @override
  String get description;
  @override
  double get price;
  @override
  List<String>? get images;
  @override
  bool get isAvailable;
  @override
  int get bookingCount;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of VendorResourceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorResourceEntityImplCopyWith<_$VendorResourceEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}
