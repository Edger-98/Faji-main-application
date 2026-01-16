// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earnings_breakdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EarningsBreakdownImpl _$$EarningsBreakdownImplFromJson(Map json) =>
    $checkedCreate(r'_$EarningsBreakdownImpl', json, ($checkedConvert) {
      final val = _$EarningsBreakdownImpl(
        totalEarnings: $checkedConvert(
          'totalEarnings',
          (v) => (v as num).toDouble(),
        ),
        availableBalance: $checkedConvert(
          'availableBalance',
          (v) => (v as num).toDouble(),
        ),
        pendingBalance: $checkedConvert(
          'pendingBalance',
          (v) => (v as num).toDouble(),
        ),
        escrowBalance: $checkedConvert(
          'escrowBalance',
          (v) => (v as num).toDouble(),
        ),
        currency: $checkedConvert('currency', (v) => v as String),
        breakdown: $checkedConvert(
          'breakdown',
          (v) => Map<String, dynamic>.from(v as Map),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$EarningsBreakdownImplToJson(
  _$EarningsBreakdownImpl instance,
) => <String, dynamic>{
  'totalEarnings': instance.totalEarnings,
  'availableBalance': instance.availableBalance,
  'pendingBalance': instance.pendingBalance,
  'escrowBalance': instance.escrowBalance,
  'currency': instance.currency,
  'breakdown': instance.breakdown,
};

_$EarningsSummaryImpl _$$EarningsSummaryImplFromJson(
  Map json,
) => $checkedCreate(r'_$EarningsSummaryImpl', json, ($checkedConvert) {
  final val = _$EarningsSummaryImpl(
    totalEarnings: $checkedConvert(
      'totalEarnings',
      (v) => (v as num).toDouble(),
    ),
    ticketSales: $checkedConvert('ticketSales', (v) => (v as num).toDouble()),
    cohostEarnings: $checkedConvert(
      'cohostEarnings',
      (v) => (v as num).toDouble(),
    ),
    vendorEarnings: $checkedConvert(
      'vendorEarnings',
      (v) => (v as num).toDouble(),
    ),
    platformFees: $checkedConvert('platformFees', (v) => (v as num).toDouble()),
  );
  return val;
});

Map<String, dynamic> _$$EarningsSummaryImplToJson(
  _$EarningsSummaryImpl instance,
) => <String, dynamic>{
  'totalEarnings': instance.totalEarnings,
  'ticketSales': instance.ticketSales,
  'cohostEarnings': instance.cohostEarnings,
  'vendorEarnings': instance.vendorEarnings,
  'platformFees': instance.platformFees,
};

_$EarningsSourceImpl _$$EarningsSourceImplFromJson(Map json) =>
    $checkedCreate(r'_$EarningsSourceImpl', json, ($checkedConvert) {
      final val = _$EarningsSourceImpl(
        eventId: $checkedConvert('eventId', (v) => v as String),
        eventName: $checkedConvert('eventName', (v) => v as String),
        type: $checkedConvert('type', (v) => v as String),
        amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
        date: $checkedConvert('date', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$EarningsSourceImplToJson(
  _$EarningsSourceImpl instance,
) => <String, dynamic>{
  'eventId': instance.eventId,
  'eventName': instance.eventName,
  'type': instance.type,
  'amount': instance.amount,
  'date': instance.date,
};
