// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WalletTransaction _$WalletTransactionFromJson(Map<String, dynamic> json) {
  return _WalletTransaction.fromJson(json);
}

/// @nodoc
mixin _$WalletTransaction {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String type,
      double amount,
      String currency,
      String description,
      String status,
      String reference,
      String createdAt,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String type,
      double amount,
      String currency,
      String description,
      String status,
      String reference,
      String createdAt,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String type,
      double amount,
      String currency,
      String description,
      String status,
      String reference,
      String createdAt,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WalletTransaction value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WalletTransaction value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WalletTransaction value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this WalletTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletTransactionCopyWith<WalletTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransactionCopyWith<$Res> {
  factory $WalletTransactionCopyWith(
    WalletTransaction value,
    $Res Function(WalletTransaction) then,
  ) = _$WalletTransactionCopyWithImpl<$Res, WalletTransaction>;
  @useResult
  $Res call({
    String id,
    String type,
    double amount,
    String currency,
    String description,
    String status,
    String reference,
    String createdAt,
  });
}

/// @nodoc
class _$WalletTransactionCopyWithImpl<$Res, $Val extends WalletTransaction>
    implements $WalletTransactionCopyWith<$Res> {
  _$WalletTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? currency = null,
    Object? description = null,
    Object? status = null,
    Object? reference = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            reference: null == reference
                ? _value.reference
                : reference // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WalletTransactionImplCopyWith<$Res>
    implements $WalletTransactionCopyWith<$Res> {
  factory _$$WalletTransactionImplCopyWith(
    _$WalletTransactionImpl value,
    $Res Function(_$WalletTransactionImpl) then,
  ) = __$$WalletTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String type,
    double amount,
    String currency,
    String description,
    String status,
    String reference,
    String createdAt,
  });
}

/// @nodoc
class __$$WalletTransactionImplCopyWithImpl<$Res>
    extends _$WalletTransactionCopyWithImpl<$Res, _$WalletTransactionImpl>
    implements _$$WalletTransactionImplCopyWith<$Res> {
  __$$WalletTransactionImplCopyWithImpl(
    _$WalletTransactionImpl _value,
    $Res Function(_$WalletTransactionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? currency = null,
    Object? description = null,
    Object? status = null,
    Object? reference = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$WalletTransactionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        reference: null == reference
            ? _value.reference
            : reference // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletTransactionImpl implements _WalletTransaction {
  const _$WalletTransactionImpl({
    required this.id,
    required this.type,
    required this.amount,
    required this.currency,
    required this.description,
    required this.status,
    required this.reference,
    required this.createdAt,
  });

  factory _$WalletTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final String description;
  @override
  final String status;
  @override
  final String reference;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'WalletTransaction(id: $id, type: $type, amount: $amount, currency: $currency, description: $description, status: $status, reference: $reference, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    amount,
    currency,
    description,
    status,
    reference,
    createdAt,
  );

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTransactionImplCopyWith<_$WalletTransactionImpl> get copyWith =>
      __$$WalletTransactionImplCopyWithImpl<_$WalletTransactionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String type,
      double amount,
      String currency,
      String description,
      String status,
      String reference,
      String createdAt,
    )
    $default,
  ) {
    return $default(
      id,
      type,
      amount,
      currency,
      description,
      status,
      reference,
      createdAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String type,
      double amount,
      String currency,
      String description,
      String status,
      String reference,
      String createdAt,
    )?
    $default,
  ) {
    return $default?.call(
      id,
      type,
      amount,
      currency,
      description,
      status,
      reference,
      createdAt,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String type,
      double amount,
      String currency,
      String description,
      String status,
      String reference,
      String createdAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
        id,
        type,
        amount,
        currency,
        description,
        status,
        reference,
        createdAt,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WalletTransaction value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WalletTransaction value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WalletTransaction value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletTransactionImplToJson(this);
  }
}

abstract class _WalletTransaction implements WalletTransaction {
  const factory _WalletTransaction({
    required final String id,
    required final String type,
    required final double amount,
    required final String currency,
    required final String description,
    required final String status,
    required final String reference,
    required final String createdAt,
  }) = _$WalletTransactionImpl;

  factory _WalletTransaction.fromJson(Map<String, dynamic> json) =
      _$WalletTransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  double get amount;
  @override
  String get currency;
  @override
  String get description;
  @override
  String get status;
  @override
  String get reference;
  @override
  String get createdAt;

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletTransactionImplCopyWith<_$WalletTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletTransactionsResponse _$WalletTransactionsResponseFromJson(
  Map<String, dynamic> json,
) {
  return _WalletTransactionsResponse.fromJson(json);
}

/// @nodoc
mixin _$WalletTransactionsResponse {
  List<WalletTransaction> get transactions =>
      throw _privateConstructorUsedError;
  TransactionPagination get pagination => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      List<WalletTransaction> transactions,
      TransactionPagination pagination,
    )
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      List<WalletTransaction> transactions,
      TransactionPagination pagination,
    )?
    $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      List<WalletTransaction> transactions,
      TransactionPagination pagination,
    )?
    $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WalletTransactionsResponse value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WalletTransactionsResponse value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WalletTransactionsResponse value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this WalletTransactionsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletTransactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletTransactionsResponseCopyWith<WalletTransactionsResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransactionsResponseCopyWith<$Res> {
  factory $WalletTransactionsResponseCopyWith(
    WalletTransactionsResponse value,
    $Res Function(WalletTransactionsResponse) then,
  ) =
      _$WalletTransactionsResponseCopyWithImpl<
        $Res,
        WalletTransactionsResponse
      >;
  @useResult
  $Res call({
    List<WalletTransaction> transactions,
    TransactionPagination pagination,
  });

  $TransactionPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$WalletTransactionsResponseCopyWithImpl<
  $Res,
  $Val extends WalletTransactionsResponse
>
    implements $WalletTransactionsResponseCopyWith<$Res> {
  _$WalletTransactionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletTransactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? transactions = null, Object? pagination = null}) {
    return _then(
      _value.copyWith(
            transactions: null == transactions
                ? _value.transactions
                : transactions // ignore: cast_nullable_to_non_nullable
                      as List<WalletTransaction>,
            pagination: null == pagination
                ? _value.pagination
                : pagination // ignore: cast_nullable_to_non_nullable
                      as TransactionPagination,
          )
          as $Val,
    );
  }

  /// Create a copy of WalletTransactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionPaginationCopyWith<$Res> get pagination {
    return $TransactionPaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalletTransactionsResponseImplCopyWith<$Res>
    implements $WalletTransactionsResponseCopyWith<$Res> {
  factory _$$WalletTransactionsResponseImplCopyWith(
    _$WalletTransactionsResponseImpl value,
    $Res Function(_$WalletTransactionsResponseImpl) then,
  ) = __$$WalletTransactionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<WalletTransaction> transactions,
    TransactionPagination pagination,
  });

  @override
  $TransactionPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$WalletTransactionsResponseImplCopyWithImpl<$Res>
    extends
        _$WalletTransactionsResponseCopyWithImpl<
          $Res,
          _$WalletTransactionsResponseImpl
        >
    implements _$$WalletTransactionsResponseImplCopyWith<$Res> {
  __$$WalletTransactionsResponseImplCopyWithImpl(
    _$WalletTransactionsResponseImpl _value,
    $Res Function(_$WalletTransactionsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WalletTransactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? transactions = null, Object? pagination = null}) {
    return _then(
      _$WalletTransactionsResponseImpl(
        transactions: null == transactions
            ? _value._transactions
            : transactions // ignore: cast_nullable_to_non_nullable
                  as List<WalletTransaction>,
        pagination: null == pagination
            ? _value.pagination
            : pagination // ignore: cast_nullable_to_non_nullable
                  as TransactionPagination,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletTransactionsResponseImpl implements _WalletTransactionsResponse {
  const _$WalletTransactionsResponseImpl({
    required final List<WalletTransaction> transactions,
    required this.pagination,
  }) : _transactions = transactions;

  factory _$WalletTransactionsResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$WalletTransactionsResponseImplFromJson(json);

  final List<WalletTransaction> _transactions;
  @override
  List<WalletTransaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final TransactionPagination pagination;

  @override
  String toString() {
    return 'WalletTransactionsResponse(transactions: $transactions, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTransactionsResponseImpl &&
            const DeepCollectionEquality().equals(
              other._transactions,
              _transactions,
            ) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_transactions),
    pagination,
  );

  /// Create a copy of WalletTransactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTransactionsResponseImplCopyWith<_$WalletTransactionsResponseImpl>
  get copyWith =>
      __$$WalletTransactionsResponseImplCopyWithImpl<
        _$WalletTransactionsResponseImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      List<WalletTransaction> transactions,
      TransactionPagination pagination,
    )
    $default,
  ) {
    return $default(transactions, pagination);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      List<WalletTransaction> transactions,
      TransactionPagination pagination,
    )?
    $default,
  ) {
    return $default?.call(transactions, pagination);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      List<WalletTransaction> transactions,
      TransactionPagination pagination,
    )?
    $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(transactions, pagination);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WalletTransactionsResponse value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WalletTransactionsResponse value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WalletTransactionsResponse value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletTransactionsResponseImplToJson(this);
  }
}

abstract class _WalletTransactionsResponse
    implements WalletTransactionsResponse {
  const factory _WalletTransactionsResponse({
    required final List<WalletTransaction> transactions,
    required final TransactionPagination pagination,
  }) = _$WalletTransactionsResponseImpl;

  factory _WalletTransactionsResponse.fromJson(Map<String, dynamic> json) =
      _$WalletTransactionsResponseImpl.fromJson;

  @override
  List<WalletTransaction> get transactions;
  @override
  TransactionPagination get pagination;

  /// Create a copy of WalletTransactionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletTransactionsResponseImplCopyWith<_$WalletTransactionsResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TransactionPagination _$TransactionPaginationFromJson(
  Map<String, dynamic> json,
) {
  return _TransactionPagination.fromJson(json);
}

/// @nodoc
mixin _$TransactionPagination {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int page, int limit, int total, int pages) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int page, int limit, int total, int pages)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int page, int limit, int total, int pages)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TransactionPagination value) $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TransactionPagination value)? $default,
  ) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TransactionPagination value)? $default, {
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this TransactionPagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionPaginationCopyWith<TransactionPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionPaginationCopyWith<$Res> {
  factory $TransactionPaginationCopyWith(
    TransactionPagination value,
    $Res Function(TransactionPagination) then,
  ) = _$TransactionPaginationCopyWithImpl<$Res, TransactionPagination>;
  @useResult
  $Res call({int page, int limit, int total, int pages});
}

/// @nodoc
class _$TransactionPaginationCopyWithImpl<
  $Res,
  $Val extends TransactionPagination
>
    implements $TransactionPaginationCopyWith<$Res> {
  _$TransactionPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? pages = null,
  }) {
    return _then(
      _value.copyWith(
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            pages: null == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TransactionPaginationImplCopyWith<$Res>
    implements $TransactionPaginationCopyWith<$Res> {
  factory _$$TransactionPaginationImplCopyWith(
    _$TransactionPaginationImpl value,
    $Res Function(_$TransactionPaginationImpl) then,
  ) = __$$TransactionPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int limit, int total, int pages});
}

/// @nodoc
class __$$TransactionPaginationImplCopyWithImpl<$Res>
    extends
        _$TransactionPaginationCopyWithImpl<$Res, _$TransactionPaginationImpl>
    implements _$$TransactionPaginationImplCopyWith<$Res> {
  __$$TransactionPaginationImplCopyWithImpl(
    _$TransactionPaginationImpl _value,
    $Res Function(_$TransactionPaginationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransactionPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? pages = null,
  }) {
    return _then(
      _$TransactionPaginationImpl(
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        pages: null == pages
            ? _value.pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionPaginationImpl implements _TransactionPagination {
  const _$TransactionPaginationImpl({
    required this.page,
    required this.limit,
    required this.total,
    required this.pages,
  });

  factory _$TransactionPaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionPaginationImplFromJson(json);

  @override
  final int page;
  @override
  final int limit;
  @override
  final int total;
  @override
  final int pages;

  @override
  String toString() {
    return 'TransactionPagination(page: $page, limit: $limit, total: $total, pages: $pages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionPaginationImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, limit, total, pages);

  /// Create a copy of TransactionPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionPaginationImplCopyWith<_$TransactionPaginationImpl>
  get copyWith =>
      __$$TransactionPaginationImplCopyWithImpl<_$TransactionPaginationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int page, int limit, int total, int pages) $default,
  ) {
    return $default(page, limit, total, pages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int page, int limit, int total, int pages)? $default,
  ) {
    return $default?.call(page, limit, total, pages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int page, int limit, int total, int pages)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(page, limit, total, pages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TransactionPagination value) $default,
  ) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TransactionPagination value)? $default,
  ) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TransactionPagination value)? $default, {
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionPaginationImplToJson(this);
  }
}

abstract class _TransactionPagination implements TransactionPagination {
  const factory _TransactionPagination({
    required final int page,
    required final int limit,
    required final int total,
    required final int pages,
  }) = _$TransactionPaginationImpl;

  factory _TransactionPagination.fromJson(Map<String, dynamic> json) =
      _$TransactionPaginationImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;
  @override
  int get total;
  @override
  int get pages;

  /// Create a copy of TransactionPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionPaginationImplCopyWith<_$TransactionPaginationImpl>
  get copyWith => throw _privateConstructorUsedError;
}
