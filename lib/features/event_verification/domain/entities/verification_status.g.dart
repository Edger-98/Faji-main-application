// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
