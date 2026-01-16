// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingImpl _$$BookingImplFromJson(Map json) =>
    $checkedCreate(r'_$BookingImpl', json, ($checkedConvert) {
      final val = _$BookingImpl(
        id: $checkedConvert('id', (v) => v as String),
        eventId: $checkedConvert('eventId', (v) => v as String),
        eventName: $checkedConvert('eventName', (v) => v as String?),
        hostId: $checkedConvert('hostId', (v) => v as String),
        hostName: $checkedConvert('hostName', (v) => v as String?),
        vendorId: $checkedConvert('vendorId', (v) => v as String),
        vendorName: $checkedConvert('vendorName', (v) => v as String?),
        resourceId: $checkedConvert('resourceId', (v) => v as String),
        resourceTitle: $checkedConvert('resourceTitle', (v) => v as String?),
        status: $checkedConvert('status', (v) => v as String),
        paymentOption: $checkedConvert('paymentOption', (v) => v as String),
        offeredPrice: $checkedConvert(
          'offeredPrice',
          (v) => (v as num?)?.toDouble(),
        ),
        agreedPrice: $checkedConvert(
          'agreedPrice',
          (v) => (v as num?)?.toDouble(),
        ),
        percentageSplit: $checkedConvert(
          'percentageSplit',
          (v) => (v as num?)?.toDouble(),
        ),
        message: $checkedConvert('message', (v) => v as String?),
        eventDate: $checkedConvert('eventDate', (v) => v as String?),
        escrowStatus: $checkedConvert('escrowStatus', (v) => v as String?),
        createdAt: $checkedConvert('createdAt', (v) => v as String),
        updatedAt: $checkedConvert('updatedAt', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$$BookingImplToJson(_$BookingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventId': instance.eventId,
      if (instance.eventName case final value?) 'eventName': value,
      'hostId': instance.hostId,
      if (instance.hostName case final value?) 'hostName': value,
      'vendorId': instance.vendorId,
      if (instance.vendorName case final value?) 'vendorName': value,
      'resourceId': instance.resourceId,
      if (instance.resourceTitle case final value?) 'resourceTitle': value,
      'status': instance.status,
      'paymentOption': instance.paymentOption,
      if (instance.offeredPrice case final value?) 'offeredPrice': value,
      if (instance.agreedPrice case final value?) 'agreedPrice': value,
      if (instance.percentageSplit case final value?) 'percentageSplit': value,
      if (instance.message case final value?) 'message': value,
      if (instance.eventDate case final value?) 'eventDate': value,
      if (instance.escrowStatus case final value?) 'escrowStatus': value,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$CreateBookingRequestImpl _$$CreateBookingRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$CreateBookingRequestImpl', json, ($checkedConvert) {
      final val = _$CreateBookingRequestImpl(
        eventId: $checkedConvert('eventId', (v) => v as String),
        vendorId: $checkedConvert('vendorId', (v) => v as String),
        resourceId: $checkedConvert('resourceId', (v) => v as String),
        paymentOption: $checkedConvert('paymentOption', (v) => v as String),
        offeredPrice: $checkedConvert(
          'offeredPrice',
          (v) => (v as num?)?.toDouble(),
        ),
        percentageSplit: $checkedConvert(
          'percentageSplit',
          (v) => (v as num?)?.toDouble(),
        ),
        message: $checkedConvert('message', (v) => v as String?),
        eventDate: $checkedConvert('eventDate', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$CreateBookingRequestImplToJson(
  _$CreateBookingRequestImpl instance,
) => <String, dynamic>{
  'eventId': instance.eventId,
  'vendorId': instance.vendorId,
  'resourceId': instance.resourceId,
  'paymentOption': instance.paymentOption,
  if (instance.offeredPrice case final value?) 'offeredPrice': value,
  if (instance.percentageSplit case final value?) 'percentageSplit': value,
  if (instance.message case final value?) 'message': value,
  if (instance.eventDate case final value?) 'eventDate': value,
};

_$BookingsResponseImpl _$$BookingsResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$BookingsResponseImpl', json, ($checkedConvert) {
      final val = _$BookingsResponseImpl(
        bookings: $checkedConvert(
          'bookings',
          (v) => (v as List<dynamic>)
              .map((e) => Booking.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$BookingsResponseImplToJson(
  _$BookingsResponseImpl instance,
) => <String, dynamic>{
  'bookings': instance.bookings.map((e) => e.toJson()).toList(),
};

_$AcceptBookingRequestImpl _$$AcceptBookingRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$AcceptBookingRequestImpl', json, ($checkedConvert) {
      final val = _$AcceptBookingRequestImpl(
        agreedPrice: $checkedConvert(
          'agreedPrice',
          (v) => (v as num?)?.toDouble(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$AcceptBookingRequestImplToJson(
  _$AcceptBookingRequestImpl instance,
) => <String, dynamic>{
  if (instance.agreedPrice case final value?) 'agreedPrice': value,
};

_$DeclineBookingRequestImpl _$$DeclineBookingRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$DeclineBookingRequestImpl', json, ($checkedConvert) {
      final val = _$DeclineBookingRequestImpl(
        reason: $checkedConvert('reason', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$DeclineBookingRequestImplToJson(
  _$DeclineBookingRequestImpl instance,
) => <String, dynamic>{if (instance.reason case final value?) 'reason': value};

_$UpdateBookingRequestImpl _$$UpdateBookingRequestImplFromJson(Map json) =>
    $checkedCreate(r'_$UpdateBookingRequestImpl', json, ($checkedConvert) {
      final val = _$UpdateBookingRequestImpl(
        status: $checkedConvert('status', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$UpdateBookingRequestImplToJson(
  _$UpdateBookingRequestImpl instance,
) => <String, dynamic>{if (instance.status case final value?) 'status': value};
