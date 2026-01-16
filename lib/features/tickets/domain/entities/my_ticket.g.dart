// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyTicketImpl _$$MyTicketImplFromJson(Map json) =>
    $checkedCreate(r'_$MyTicketImpl', json, ($checkedConvert) {
      final val = _$MyTicketImpl(
        id: $checkedConvert('id', (v) => v as String),
        ticketNumber: $checkedConvert('ticketNumber', (v) => v as String),
        event: $checkedConvert(
          'event',
          (v) => TicketEvent.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
        qrCode: $checkedConvert('qrCode', (v) => v as String),
        status: $checkedConvert('status', (v) => v as String),
        purchaseDate: $checkedConvert('purchaseDate', (v) => v as String),
        price: $checkedConvert('price', (v) => (v as num).toDouble()),
        checkedIn: $checkedConvert('checkedIn', (v) => v as bool),
        checkedInAt: $checkedConvert('checkedInAt', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$MyTicketImplToJson(_$MyTicketImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ticketNumber': instance.ticketNumber,
      'event': instance.event.toJson(),
      'qrCode': instance.qrCode,
      'status': instance.status,
      'purchaseDate': instance.purchaseDate,
      'price': instance.price,
      'checkedIn': instance.checkedIn,
      if (instance.checkedInAt case final value?) 'checkedInAt': value,
    };

_$TicketEventImpl _$$TicketEventImplFromJson(Map json) =>
    $checkedCreate(r'_$TicketEventImpl', json, ($checkedConvert) {
      final val = _$TicketEventImpl(
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        startDate: $checkedConvert('startDate', (v) => v as String),
        location: $checkedConvert('location', (v) => v as String),
        imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$$TicketEventImplToJson(_$TicketEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startDate': instance.startDate,
      'location': instance.location,
      if (instance.imageUrl case final value?) 'imageUrl': value,
    };

_$MyTicketsResponseImpl _$$MyTicketsResponseImplFromJson(Map json) =>
    $checkedCreate(r'_$MyTicketsResponseImpl', json, ($checkedConvert) {
      final val = _$MyTicketsResponseImpl(
        tickets: $checkedConvert(
          'tickets',
          (v) => (v as List<dynamic>)
              .map(
                (e) => MyTicket.fromJson(Map<String, dynamic>.from(e as Map)),
              )
              .toList(),
        ),
        pagination: $checkedConvert(
          'pagination',
          (v) => PaginationData.fromJson(Map<String, dynamic>.from(v as Map)),
        ),
      );
      return val;
    });

Map<String, dynamic> _$$MyTicketsResponseImplToJson(
  _$MyTicketsResponseImpl instance,
) => <String, dynamic>{
  'tickets': instance.tickets.map((e) => e.toJson()).toList(),
  'pagination': instance.pagination.toJson(),
};

_$PaginationDataImpl _$$PaginationDataImplFromJson(Map json) =>
    $checkedCreate(r'_$PaginationDataImpl', json, ($checkedConvert) {
      final val = _$PaginationDataImpl(
        page: $checkedConvert('page', (v) => (v as num).toInt()),
        limit: $checkedConvert('limit', (v) => (v as num).toInt()),
        total: $checkedConvert('total', (v) => (v as num).toInt()),
        pages: $checkedConvert('pages', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$$PaginationDataImplToJson(
  _$PaginationDataImpl instance,
) => <String, dynamic>{
  'page': instance.page,
  'limit': instance.limit,
  'total': instance.total,
  'pages': instance.pages,
};
