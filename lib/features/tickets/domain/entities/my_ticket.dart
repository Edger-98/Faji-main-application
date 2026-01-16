import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_ticket.freezed.dart';
part 'my_ticket.g.dart';

/// My Ticket - matches API spec
@freezed
class MyTicket with _$MyTicket {
  const factory MyTicket({
    required String id,
    required String ticketNumber,
    required TicketEvent event,
    required String qrCode,
    required String status,
    required String purchaseDate,
    required double price,
    required bool checkedIn,
    String? checkedInAt,
  }) = _MyTicket;

  factory MyTicket.fromJson(Map<String, dynamic> json) =>
      _$MyTicketFromJson(json);
}

@freezed
class TicketEvent with _$TicketEvent {
  const factory TicketEvent({
    required String id,
    required String name,
    required String startDate,
    required String location,
    String? imageUrl,
  }) = _TicketEvent;

  factory TicketEvent.fromJson(Map<String, dynamic> json) =>
      _$TicketEventFromJson(json);
}

@freezed
class MyTicketsResponse with _$MyTicketsResponse {
  const factory MyTicketsResponse({
    required List<MyTicket> tickets,
    required PaginationData pagination,
  }) = _MyTicketsResponse;

  factory MyTicketsResponse.fromJson(Map<String, dynamic> json) =>
      _$MyTicketsResponseFromJson(json);
}

@freezed
class PaginationData with _$PaginationData {
  const factory PaginationData({
    required int page,
    required int limit,
    required int total,
    required int pages,
  }) = _PaginationData;

  factory PaginationData.fromJson(Map<String, dynamic> json) =>
      _$PaginationDataFromJson(json);
}
