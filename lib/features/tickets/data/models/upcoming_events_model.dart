import 'package:fajimobileapp/features/tickets/data/models/my_tickets_response_model.dart';

/// Upcoming Events Response Model
class UpcomingEventsResponseModel {
  UpcomingEventsResponseModel({
    required this.events,
    required this.pagination,
  });

  factory UpcomingEventsResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? json;
    
    return UpcomingEventsResponseModel(
      events: (data['events'] as List<dynamic>?)
              ?.map((e) => EventWithTicketsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      pagination: EventPaginationModel.fromJson(
        data['pagination'] as Map<String, dynamic>? ?? {},
      ),
    );
  }

  final List<EventWithTicketsModel> events;
  final EventPaginationModel pagination;

  Map<String, dynamic> toJson() => {
        'events': events.map((e) => e.toJson()).toList(),
        'pagination': pagination.toJson(),
      };
}

/// Event with Tickets Model
class EventWithTicketsModel {
  EventWithTicketsModel({
    required this.id,
    required this.name,
    required this.category,
    this.emoji,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.host,
    required this.stats,
    required this.media,
    this.imageUrl,
    required this.ticketing,
    required this.myTickets,
    required this.hasPurchased,
  });

  factory EventWithTicketsModel.fromJson(Map<String, dynamic> json) {
    final location = json['location'];
    final host = json['host'];
    final stats = json['stats'];
    final media = json['media'];
    final ticketing = json['ticketing'];
    final myTickets = json['myTickets'];

    return EventWithTicketsModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      category: json['category'] as String? ?? '',
      emoji: json['emoji'] as String?,
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
      location: location is Map
          ? LocationModel.fromJson(location as Map<String, dynamic>)
          : LocationModel(address: '', latitude: 0, longitude: 0),
      host: host is Map
          ? EventHostModel.fromJson(host as Map<String, dynamic>)
          : EventHostModel(id: '', name: ''),
      stats: stats is Map
          ? StatsModel.fromJson(stats as Map<String, dynamic>)
          : StatsModel(expectedGuests: 0, confirmedGuests: 0),
      media: media is Map
          ? MediaModel.fromJson(media as Map<String, dynamic>)
          : MediaModel(poster: '', preEventMedia: []),
      imageUrl: json['imageUrl'] as String?,
      ticketing: ticketing is Map
          ? TicketingModel.fromJson(ticketing as Map<String, dynamic>)
          : TicketingModel(
              enabled: false,
              price: 0,
              currency: 'USD',
              currencySymbol: '\$',
              isFree: true,
              isSoldOut: false,
            ),
      myTickets: myTickets is Map
          ? MyTicketsInfoModel.fromJson(myTickets as Map<String, dynamic>)
          : MyTicketsInfoModel(count: 0, tickets: []),
      hasPurchased: json['hasPurchased'] as bool? ?? false,
    );
  }

  final String id;
  final String name;
  final String category;
  final String? emoji;
  final String startDate;
  final String endDate;
  final LocationModel location;
  final EventHostModel host;
  final StatsModel stats;
  final MediaModel media;
  final String? imageUrl;
  final TicketingModel ticketing;
  final MyTicketsInfoModel myTickets;
  final bool hasPurchased;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'emoji': emoji,
        'startDate': startDate,
        'endDate': endDate,
        'location': location.toJson(),
        'host': host.toJson(),
        'stats': stats.toJson(),
        'media': media.toJson(),
        'imageUrl': imageUrl,
        'ticketing': ticketing.toJson(),
        'myTickets': myTickets.toJson(),
        'hasPurchased': hasPurchased,
      };
}

/// Event Host Model (simplified)
class EventHostModel {
  EventHostModel({
    required this.id,
    required this.name,
  });

  factory EventHostModel.fromJson(Map<String, dynamic> json) => EventHostModel(
        id: json['id'] as String? ?? '',
        name: json['name'] as String? ?? '',
      );

  final String id;
  final String name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

/// Stats Model
class StatsModel {
  StatsModel({
    required this.expectedGuests,
    required this.confirmedGuests,
  });

  factory StatsModel.fromJson(Map<String, dynamic> json) => StatsModel(
        expectedGuests: json['expectedGuests'] as int? ?? 0,
        confirmedGuests: json['confirmedGuests'] as int? ?? 0,
      );

  final int expectedGuests;
  final int confirmedGuests;

  Map<String, dynamic> toJson() => {
        'expectedGuests': expectedGuests,
        'confirmedGuests': confirmedGuests,
      };
}

/// Ticketing Model
class TicketingModel {
  TicketingModel({
    required this.enabled,
    required this.price,
    required this.currency,
    required this.currencySymbol,
    required this.isFree,
    required this.isSoldOut,
  });

  factory TicketingModel.fromJson(Map<String, dynamic> json) => TicketingModel(
        enabled: json['enabled'] as bool? ?? false,
        price: (json['price'] as num?)?.toDouble() ?? 0.0,
        currency: json['currency'] as String? ?? 'USD',
        currencySymbol: json['currencySymbol'] as String? ?? '\$',
        isFree: json['isFree'] as bool? ?? true,
        isSoldOut: json['isSoldOut'] as bool? ?? false,
      );

  final bool enabled;
  final double price;
  final String currency;
  final String currencySymbol;
  final bool isFree;
  final bool isSoldOut;

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
        'price': price,
        'currency': currency,
        'currencySymbol': currencySymbol,
        'isFree': isFree,
        'isSoldOut': isSoldOut,
      };
}

/// My Tickets Info Model
class MyTicketsInfoModel {
  MyTicketsInfoModel({
    required this.count,
    required this.tickets,
  });

  factory MyTicketsInfoModel.fromJson(Map<String, dynamic> json) =>
      MyTicketsInfoModel(
        count: json['count'] as int? ?? 0,
        tickets: (json['tickets'] as List<dynamic>?)
                ?.map((e) => TicketSummaryModel.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      );

  final int count;
  final List<TicketSummaryModel> tickets;

  Map<String, dynamic> toJson() => {
        'count': count,
        'tickets': tickets.map((t) => t.toJson()).toList(),
      };
}

/// Ticket Summary Model
class TicketSummaryModel {
  TicketSummaryModel({
    required this.id,
    required this.ticketNumber,
    required this.status,
  });

  factory TicketSummaryModel.fromJson(Map<String, dynamic> json) =>
      TicketSummaryModel(
        id: json['id'] as String? ?? '',
        ticketNumber: json['ticketNumber'] as String? ?? '',
        status: json['status'] as String? ?? 'valid',
      );

  final String id;
  final String ticketNumber;
  final String status;

  Map<String, dynamic> toJson() => {
        'id': id,
        'ticketNumber': ticketNumber,
        'status': status,
      };
}

/// Event Pagination Model
class EventPaginationModel {
  EventPaginationModel({
    required this.currentPage,
    required this.totalPages,
    required this.totalEvents,
    required this.limit,
  });

  factory EventPaginationModel.fromJson(Map<String, dynamic> json) =>
      EventPaginationModel(
        currentPage: json['currentPage'] as int? ?? 1,
        totalPages: json['totalPages'] as int? ?? 1,
        totalEvents: json['totalEvents'] as int? ?? 0,
        limit: json['limit'] as int? ?? 20,
      );

  final int currentPage;
  final int totalPages;
  final int totalEvents;
  final int limit;

  Map<String, dynamic> toJson() => {
        'currentPage': currentPage,
        'totalPages': totalPages,
        'totalEvents': totalEvents,
        'limit': limit,
      };
}
