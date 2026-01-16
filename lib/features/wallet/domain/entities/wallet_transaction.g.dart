// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletTransactionImpl _$$WalletTransactionImplFromJson(Map json) =>
    $checkedCreate(r'_$WalletTransactionImpl', json, ($checkedConvert) {
      final val = _$WalletTransactionImpl(
        id: $checkedConvert('id', (v) => v as String),
        type: $checkedConvert('type', (v) => v as String),
        amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
        currency: $checkedConvert('currency', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
        status: $checkedConvert('status', (v) => v as String),
        reference: $checkedConvert('reference', (v) => v as String),
        createdAt: $checkedConvert('createdAt', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$WalletTransactionImplToJson(
  _$WalletTransactionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'amount': instance.amount,
  'currency': instance.currency,
  'description': instance.description,
  'status': instance.status,
  'reference': instance.reference,
  'createdAt': instance.createdAt,
};

_$WalletTransactionsResponseImpl _$$WalletTransactionsResponseImplFromJson(
  Map json,
) => $checkedCreate(r'_$WalletTransactionsResponseImpl', json, (
  $checkedConvert,
) {
  final val = _$WalletTransactionsResponseImpl(
    transactions: $checkedConvert(
      'transactions',
      (v) => (v as List<dynamic>)
          .map(
            (e) =>
                WalletTransaction.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList(),
    ),
    pagination: $checkedConvert(
      'pagination',
      (v) =>
          TransactionPagination.fromJson(Map<String, dynamic>.from(v as Map)),
    ),
  );
  return val;
});

Map<String, dynamic> _$$WalletTransactionsResponseImplToJson(
  _$WalletTransactionsResponseImpl instance,
) => <String, dynamic>{
  'transactions': instance.transactions.map((e) => e.toJson()).toList(),
  'pagination': instance.pagination.toJson(),
};

_$TransactionPaginationImpl _$$TransactionPaginationImplFromJson(Map json) =>
    $checkedCreate(r'_$TransactionPaginationImpl', json, ($checkedConvert) {
      final val = _$TransactionPaginationImpl(
        page: $checkedConvert('page', (v) => (v as num).toInt()),
        limit: $checkedConvert('limit', (v) => (v as num).toInt()),
        total: $checkedConvert('total', (v) => (v as num).toInt()),
        pages: $checkedConvert('pages', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$$TransactionPaginationImplToJson(
  _$TransactionPaginationImpl instance,
) => <String, dynamic>{
  'page': instance.page,
  'limit': instance.limit,
  'total': instance.total,
  'pages': instance.pages,
};
