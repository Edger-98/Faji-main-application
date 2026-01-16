// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefundResponseImpl _$$RefundResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$RefundResponseImpl', json, ($checkedConvert) {
      final val = _$RefundResponseImpl(
        success: $checkedConvert('success', (v) => v as bool),
        message: $checkedConvert('message', (v) => v as String),
        refundResult: $checkedConvert(
          'refundResult',
          (v) => RefundResult.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$RefundResponseImplToJson(
  _$RefundResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'refundResult': instance.refundResult.toJson(),
};

_$RefundResultImpl _$$RefundResultImplFromJson(Map json) => $checkedCreate(
  r'_$RefundResultImpl',
  json,
  ($checkedConvert) {
    final val = _$RefundResultImpl(
      refunded: $checkedConvert('refunded', (v) => (v as num).toInt()),
      totalAmount: $checkedConvert('totalAmount', (v) => (v as num).toDouble()),
      refunds: $checkedConvert(
        'refunds',
        (v) => (v as List<dynamic>)
            .map(
              (e) => RefundDetail.fromJson(Map<String, dynamic>.from(e as Map)),
            )
            .toList(),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$$RefundResultImplToJson(_$RefundResultImpl instance) =>
    <String, dynamic>{
      'refunded': instance.refunded,
      'totalAmount': instance.totalAmount,
      'refunds': instance.refunds.map((e) => e.toJson()).toList(),
    };

_$RefundDetailImpl _$$RefundDetailImplFromJson(Map json) =>
    $checkedCreate(r'_$RefundDetailImpl', json, ($checkedConvert) {
      final val = _$RefundDetailImpl(
        userId: $checkedConvert('userId', (v) => v as String),
        amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
        orderId: $checkedConvert('orderId', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$RefundDetailImplToJson(_$RefundDetailImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'amount': instance.amount,
      'orderId': instance.orderId,
    };
