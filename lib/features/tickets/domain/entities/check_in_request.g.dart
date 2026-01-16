// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckInRequestImpl _$$CheckInRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$CheckInRequestImpl', json, ($checkedConvert) {
      final val = _$CheckInRequestImpl(
        ticketId: $checkedConvert('ticketId', (v) => v as String),
        eventId: $checkedConvert('eventId', (v) => v as String),
        location: $checkedConvert(
          'location',
          (v) => v == null
              ? null
              : LocationData.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$CheckInRequestImplToJson(
  _$CheckInRequestImpl instance,
) => <String, dynamic>{
  'ticketId': instance.ticketId,
  'eventId': instance.eventId,
  if (instance.location?.toJson() case final value?) 'location': value,
};

_$LocationDataImpl _$$LocationDataImplFromJson(Map json) =>
    $checkedCreate(r'_$LocationDataImpl', json, ($checkedConvert) {
      final val = _$LocationDataImpl(
        latitude: $checkedConvert('latitude', (v) => (v as num).toDouble()),
        longitude: $checkedConvert('longitude', (v) => (v as num).toDouble()),
        accuracy: $checkedConvert('accuracy', (v) => (v as num?)?.toDouble()),
      );
      return val;
    });

Map<String, dynamic> _$$LocationDataImplToJson(_$LocationDataImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      if (instance.accuracy case final value?) 'accuracy': value,
    };

_$CheckInResponseImpl _$$CheckInResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$CheckInResponseImpl', json, ($checkedConvert) {
      final val = _$CheckInResponseImpl(
        checkedIn: $checkedConvert('checkedIn', (v) => v as bool),
        checkedInAt: $checkedConvert('checkedInAt', (v) => v as String),
        eventVerification: $checkedConvert(
          'eventVerification',
          (v) =>
              EventVerification.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$CheckInResponseImplToJson(
  _$CheckInResponseImpl instance,
) => <String, dynamic>{
  'checkedIn': instance.checkedIn,
  'checkedInAt': instance.checkedInAt,
  'eventVerification': instance.eventVerification.toJson(),
};

_$EventVerificationImpl _$$EventVerificationImplFromJson(Map json) =>
    $checkedCreate(r'_$EventVerificationImpl', json, ($checkedConvert) {
      final val = _$EventVerificationImpl(
        checkInPercentage: $checkedConvert(
          'checkInPercentage',
          (v) => (v as num).toInt(),
        ),
        isVerified: $checkedConvert('isVerified', (v) => v as bool),
        verifiedAt: $checkedConvert('verifiedAt', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$EventVerificationImplToJson(
  _$EventVerificationImpl instance,
) => <String, dynamic>{
  'checkInPercentage': instance.checkInPercentage,
  'isVerified': instance.isVerified,
  if (instance.verifiedAt case final value?) 'verifiedAt': value,
};
