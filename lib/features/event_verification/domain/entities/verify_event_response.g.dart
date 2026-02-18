// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerifyEventResponseImpl _$$VerifyEventResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$VerifyEventResponseImpl', json, ($checkedConvert) {
      final val = _$VerifyEventResponseImpl(
        success: $checkedConvert('success', (v) => v as bool),
        message: $checkedConvert('message', (v) => v as String),
        verification: $checkedConvert(
          'verification',
          (v) => v == null
              ? null
              : VerificationData.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
        escrowRelease: $checkedConvert(
          'escrowRelease',
          (v) => v == null
              ? null
              : EscrowRelease.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
        status: $checkedConvert(
          'status',
          (v) => v == null
              ? null
              : VerificationStatus.fromJson(
                  Map<String, dynamic>.from(v as Map),
                ),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$VerifyEventResponseImplToJson(
  _$VerifyEventResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  if (instance.verification?.toJson() case final value?) 'verification': value,
  if (instance.escrowRelease?.toJson() case final value?)
    'escrowRelease': value,
  if (instance.status?.toJson() case final value?) 'status': value,
};

_$VerificationDataImpl _$$VerificationDataImplFromJson(Map json) =>
    $checkedCreate(r'_$VerificationDataImpl', json, ($checkedConvert) {
      final val = _$VerificationDataImpl(
        isVerified: $checkedConvert('isVerified', (v) => v as bool),
        verifiedAt: $checkedConvert('verifiedAt', (v) => v as String),
        manualOverride: $checkedConvert('manualOverride', (v) => v as bool?),
      );
      return val;
    });

Map<String, dynamic> _$$VerificationDataImplToJson(
  _$VerificationDataImpl instance,
) => <String, dynamic>{
  'isVerified': instance.isVerified,
  'verifiedAt': instance.verifiedAt,
  if (instance.manualOverride case final value?) 'manualOverride': value,
};

_$EscrowReleaseImpl _$$EscrowReleaseImplFromJson(
  Map json,
) => $checkedCreate(r'_$EscrowReleaseImpl', json, ($checkedConvert) {
  final val = _$EscrowReleaseImpl(
    released: $checkedConvert('released', (v) => (v as num).toInt()),
    totalAmount: $checkedConvert('totalAmount', (v) => (v as num).toDouble()),
    platformFee: $checkedConvert('platformFee', (v) => (v as num).toDouble()),
    netRevenue: $checkedConvert('netRevenue', (v) => (v as num).toDouble()),
    distribution: $checkedConvert(
      'distribution',
      (v) => (v as List<dynamic>)
          .map(
            (e) =>
                RevenueRecipient.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$$EscrowReleaseImplToJson(_$EscrowReleaseImpl instance) =>
    <String, dynamic>{
      'released': instance.released,
      'totalAmount': instance.totalAmount,
      'platformFee': instance.platformFee,
      'netRevenue': instance.netRevenue,
      'distribution': instance.distribution.map((e) => e.toJson()).toList(),
    };

_$RevenueRecipientImpl _$$RevenueRecipientImplFromJson(Map json) =>
    $checkedCreate(r'_$RevenueRecipientImpl', json, ($checkedConvert) {
      final val = _$RevenueRecipientImpl(
        userId: $checkedConvert('userId', (v) => v as String),
        accountType: $checkedConvert('accountType', (v) => v as String),
        share: $checkedConvert('share', (v) => (v as num).toDouble()),
        amount: $checkedConvert('amount', (v) => (v as num).toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$$RevenueRecipientImplToJson(
  _$RevenueRecipientImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'accountType': instance.accountType,
  'share': instance.share,
  'amount': instance.amount,
};

_$VerificationStatusImpl _$$VerificationStatusImplFromJson(Map json) =>
    $checkedCreate(r'_$VerificationStatusImpl', json, ($checkedConvert) {
      final val = _$VerificationStatusImpl(
        eventId: $checkedConvert('eventId', (v) => v as String),
        eventName: $checkedConvert('eventName', (v) => v as String),
        soldTickets: $checkedConvert('soldTickets', (v) => (v as num).toInt()),
        checkedInGuests: $checkedConvert(
          'checkedInGuests',
          (v) => (v as num).toInt(),
        ),
        checkInPercentage: $checkedConvert(
          'checkInPercentage',
          (v) => (v as num).toInt(),
        ),
        threshold: $checkedConvert('threshold', (v) => (v as num).toInt()),
        meetsThreshold: $checkedConvert('meetsThreshold', (v) => v as bool),
        isVerified: $checkedConvert('isVerified', (v) => v as bool),
        canVerify: $checkedConvert('canVerify', (v) => v as bool),
        verifiedAt: $checkedConvert('verifiedAt', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$VerificationStatusImplToJson(
  _$VerificationStatusImpl instance,
) => <String, dynamic>{
  'eventId': instance.eventId,
  'eventName': instance.eventName,
  'soldTickets': instance.soldTickets,
  'checkedInGuests': instance.checkedInGuests,
  'checkInPercentage': instance.checkInPercentage,
  'threshold': instance.threshold,
  'meetsThreshold': instance.meetsThreshold,
  'isVerified': instance.isVerified,
  'canVerify': instance.canVerify,
  if (instance.verifiedAt case final value?) 'verifiedAt': value,
};
