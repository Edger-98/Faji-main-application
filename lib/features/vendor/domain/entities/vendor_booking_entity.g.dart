// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_booking_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VendorBookingEntityImpl _$$VendorBookingEntityImplFromJson(
  Map json,
) => $checkedCreate(r'_$VendorBookingEntityImpl', json, ($checkedConvert) {
  final val = _$VendorBookingEntityImpl(
    id: $checkedConvert('id', (v) => v as String),
    vendorId: $checkedConvert('vendorId', (v) => v as String),
    resourceId: $checkedConvert('resourceId', (v) => v as String),
    customerId: $checkedConvert('customerId', (v) => v as String),
    customerName: $checkedConvert('customerName', (v) => v as String),
    eventName: $checkedConvert('eventName', (v) => v as String),
    eventDate: $checkedConvert('eventDate', (v) => DateTime.parse(v as String)),
    offeredPrice: $checkedConvert('offeredPrice', (v) => (v as num).toDouble()),
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$BookingStatusEnumMap, v),
    ),
    counterOfferPrice: $checkedConvert(
      'counterOfferPrice',
      (v) => (v as num?)?.toDouble(),
    ),
    message: $checkedConvert('message', (v) => v as String?),
    createdAt: $checkedConvert(
      'createdAt',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
    updatedAt: $checkedConvert(
      'updatedAt',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
  );
  return val;
});

Map<String, dynamic> _$$VendorBookingEntityImplToJson(
  _$VendorBookingEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'vendorId': instance.vendorId,
  'resourceId': instance.resourceId,
  'customerId': instance.customerId,
  'customerName': instance.customerName,
  'eventName': instance.eventName,
  'eventDate': instance.eventDate.toIso8601String(),
  'offeredPrice': instance.offeredPrice,
  'status': _$BookingStatusEnumMap[instance.status]!,
  if (instance.counterOfferPrice case final value?) 'counterOfferPrice': value,
  if (instance.message case final value?) 'message': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updatedAt': value,
};

const _$BookingStatusEnumMap = {
  BookingStatus.pending: 'pending',
  BookingStatus.accepted: 'accepted',
  BookingStatus.declined: 'declined',
  BookingStatus.counterOffer: 'counterOffer',
  BookingStatus.completed: 'completed',
  BookingStatus.cancelled: 'cancelled',
};
