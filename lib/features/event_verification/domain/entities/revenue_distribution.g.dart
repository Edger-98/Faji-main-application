// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revenue_distribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RevenueDistributionImpl _$$RevenueDistributionImplFromJson(Map json) =>
    $checkedCreate(r'_$RevenueDistributionImpl', json, ($checkedConvert) {
      final val = _$RevenueDistributionImpl(
        host: $checkedConvert(
          'host',
          (v) => HostRevenue.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
        cohosts: $checkedConvert(
          'cohosts',
          (v) => (v as List<dynamic>)
              .map(
                (e) =>
                    CohostRevenue.fromJson(Map<String, dynamic>.from(e as Map)),
              )
              .toList(),
        ),
        summary: $checkedConvert(
          'summary',
          (v) => RevenueSummary.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$RevenueDistributionImplToJson(
  _$RevenueDistributionImpl instance,
) => <String, dynamic>{
  'host': instance.host.toJson(),
  'cohosts': instance.cohosts.map((e) => e.toJson()).toList(),
  'summary': instance.summary.toJson(),
};

_$HostRevenueImpl _$$HostRevenueImplFromJson(Map json) =>
    $checkedCreate(r'_$HostRevenueImpl', json, ($checkedConvert) {
      final val = _$HostRevenueImpl(
        userId: $checkedConvert('userId', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        share: $checkedConvert('share', (v) => (v as num).toDouble()),
        amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$$HostRevenueImplToJson(_$HostRevenueImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'share': instance.share,
      'amount': instance.amount,
    };

_$CohostRevenueImpl _$$CohostRevenueImplFromJson(Map json) =>
    $checkedCreate(r'_$CohostRevenueImpl', json, ($checkedConvert) {
      final val = _$CohostRevenueImpl(
        userId: $checkedConvert('userId', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        share: $checkedConvert('share', (v) => (v as num).toDouble()),
        amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$$CohostRevenueImplToJson(_$CohostRevenueImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'share': instance.share,
      'amount': instance.amount,
    };

_$RevenueSummaryImpl _$$RevenueSummaryImplFromJson(
  Map json,
) => $checkedCreate(r'_$RevenueSummaryImpl', json, ($checkedConvert) {
  final val = _$RevenueSummaryImpl(
    totalRevenue: $checkedConvert('totalRevenue', (v) => (v as num).toDouble()),
    platformFee: $checkedConvert('platformFee', (v) => (v as num).toDouble()),
    netRevenue: $checkedConvert('netRevenue', (v) => (v as num).toDouble()),
    hostAmount: $checkedConvert('hostAmount', (v) => (v as num).toDouble()),
    cohostAmount: $checkedConvert('cohostAmount', (v) => (v as num).toDouble()),
  );
  return val;
});

Map<String, dynamic> _$$RevenueSummaryImplToJson(
  _$RevenueSummaryImpl instance,
) => <String, dynamic>{
  'totalRevenue': instance.totalRevenue,
  'platformFee': instance.platformFee,
  'netRevenue': instance.netRevenue,
  'hostAmount': instance.hostAmount,
  'cohostAmount': instance.cohostAmount,
};
