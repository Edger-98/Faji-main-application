/// My Tickets Response Model - matches API spec exactly
class MyTicketsResponseModel {
  MyTicketsResponseModel({
    required this.tickets,
    required this.pagination,
  });

  factory MyTicketsResponseModel.fromJson(Map<String, dynamic> json) {
    final dynamic data = json['data'] ?? json;
    
    return MyTicketsResponseModel(
      tickets: (data['tickets'] as List<dynamic>?)
              ?.map((dynamic e) => TicketWithEventModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          <TicketWithEventModel>[],
      pagination: data['pagination'] != null
          ? PaginationModel.fromJson(data['pagination'] as Map<String, dynamic>)
          : PaginationModel.empty(),
    );
  }

  final List<TicketWithEventModel> tickets;
  final PaginationModel pagination;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'tickets': tickets.map((TicketWithEventModel t) => t.toJson()).toList(),
        'pagination': pagination.toJson(),
      };
}

/// Ticket with Event Model
class TicketWithEventModel {
  TicketWithEventModel({
    required this.ticket,
    required this.event,
  });

  factory TicketWithEventModel.fromJson(Map<String, dynamic> json) {
    // Check if data is already nested (ticket/event structure)
    if (json.containsKey('ticket') && json.containsKey('event')) {
      return TicketWithEventModel(
        ticket: TicketModel.fromJson(json['ticket'] as Map<String, dynamic>),
        event: TicketEventModel.fromJson(json['event'] as Map<String, dynamic>),
      );
    }
    
    // Otherwise, data is flat - extract ticket and event parts
    final Map<String, dynamic>? eventData = json['event'] as Map<String, dynamic>?;
    
    return TicketWithEventModel(
      ticket: TicketModel.fromJson(json),
      event: eventData != null 
          ? TicketEventModel.fromJson(eventData)
          : TicketEventModel.empty(),
    );
  }

  final TicketModel ticket;
  final TicketEventModel event;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ticket': ticket.toJson(),
        'event': event.toJson(),
      };
}

/// Ticket Model
class TicketModel {
  TicketModel({
    required this.id,
    required this.ticketNumber,
    required this.status,
    required this.price,
    required this.currency,
    required this.purchaseDate,
    required this.isUsed,
    this.qrCode,
    this.usedAt,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    // Handle id field - can be String or Map
    final dynamic idValue = json['id'];
    String id = '';
    if (idValue is String) {
      id = idValue;
    } else if (idValue is Map) {
      id = idValue['_id']?.toString() ?? idValue['\$oid']?.toString() ?? '';
    }

    final num? priceValue = json['price'] as num?;
    final num? totalAmountValue = json['totalAmount'] as num?;
    final double price = priceValue?.toDouble() ?? totalAmountValue?.toDouble() ?? 0.0;
    
    // Handle purchaseDate - can be String or Map (empty object)
    final dynamic purchaseDateValue = json['purchaseDate'];
    final dynamic createdAtValue = json['createdAt'];
    String purchaseDate = '';
    if (purchaseDateValue is String) {
      purchaseDate = purchaseDateValue;
    } else if (createdAtValue is String) {
      purchaseDate = createdAtValue;
    }
    
    final bool? isUsedValue = json['isUsed'] as bool?;
    final bool? checkedInValue = json['checkedIn'] as bool?;
    final String? statusValue = json['status'] as String?;
    final bool isUsed = isUsedValue ?? checkedInValue ?? (statusValue == 'used');
    
    // Handle qrCode - ensure it's a string
    final dynamic qrCodeValue = json['qrCode'];
    String? qrCode;
    if (qrCodeValue is String) {
      qrCode = qrCodeValue;
    }
    
    // Handle usedAt - can be String or null
    final dynamic usedAtValue = json['usedAt'] ?? json['checkedInAt'];
    String? usedAt;
    if (usedAtValue is String) {
      usedAt = usedAtValue;
    }
    
    return TicketModel(
      id: id,
      ticketNumber: json['ticketNumber'] as String? ?? '',
      status: statusValue ?? 'valid',
      price: price,
      currency: json['currency'] as String? ?? 'USD',
      purchaseDate: purchaseDate,
      qrCode: qrCode,
      isUsed: isUsed,
      usedAt: usedAt,
    );
  }

  final String id;
  final String ticketNumber;
  final String status;
  final double price;
  final String currency;
  final String purchaseDate;
  final String? qrCode;
  final bool isUsed;
  final String? usedAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'ticketNumber': ticketNumber,
        'status': status,
        'price': price,
        'currency': currency,
        'purchaseDate': purchaseDate,
        'qrCode': qrCode,
        'isUsed': isUsed,
        'usedAt': usedAt,
      };
}

/// Ticket Event Model
class TicketEventModel {
  TicketEventModel({
    required this.id,
    required this.name,
    required this.category,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.host,
    required this.media,
    required this.status,
    this.emoji,
    this.imageUrl,
  });

  factory TicketEventModel.fromJson(Map<String, dynamic> json) {
    final dynamic location = json['location'];
    final dynamic host = json['host'];
    final dynamic media = json['media'];
    final dynamic startDateValue = json['startDate'];
    final dynamic endDateValue = json['endDate'];
    final String? nameValue = json['name'] as String?;
    final String? titleValue = json['title'] as String?;
    final String name = nameValue ?? titleValue ?? '';

    // Parse dates - handle both String and Map (empty object) cases
    String startDate = '';
    if (startDateValue is String) {
      startDate = startDateValue;
    } else if (startDateValue is Map && startDateValue.isNotEmpty) {
      // If it's a map with date fields, try to extract
      startDate = startDateValue.toString();
    }

    String endDate = '';
    if (endDateValue is String) {
      endDate = endDateValue;
    } else if (endDateValue is Map && endDateValue.isNotEmpty) {
      endDate = endDateValue.toString();
    }

    return TicketEventModel(
      id: json['id'] as String? ?? '',
      name: name,
      category: json['category'] as String? ?? '',
      emoji: json['emoji'] as String?,
      startDate: startDate,
      endDate: endDate,
      location: location is Map
          ? LocationModel.fromJson(location as Map<String, dynamic>)
          : LocationModel(address: location?.toString() ?? '', latitude: 0, longitude: 0),
      host: host is Map
          ? HostModel.fromJson(host as Map<String, dynamic>)
          : HostModel(id: '', name: host?.toString() ?? '', email: ''),
      media: media is Map
          ? MediaModel.fromJson(media as Map<String, dynamic>)
          : MediaModel(poster: '', preEventMedia: <String>[]),
      imageUrl: json['imageUrl'] as String?,
      status: json['status'] as String? ?? 'upcoming',
    );
  }

  factory TicketEventModel.empty() => TicketEventModel(
        id: '',
        name: '',
        category: '',
        startDate: '',
        endDate: '',
        location: LocationModel(address: '', latitude: 0, longitude: 0),
        host: HostModel(id: '', name: '', email: ''),
        media: MediaModel(poster: '', preEventMedia: <String>[]),
        status: 'upcoming',
      );

  final String id;
  final String name;
  final String category;
  final String? emoji;
  final String startDate;
  final String endDate;
  final LocationModel location;
  final HostModel host;
  final MediaModel media;
  final String? imageUrl;
  final String status;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'category': category,
        'emoji': emoji,
        'startDate': startDate,
        'endDate': endDate,
        'location': location.toJson(),
        'host': host.toJson(),
        'media': media.toJson(),
        'imageUrl': imageUrl,
        'status': status,
      };
}

/// Location Model
class LocationModel {
  LocationModel({
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        address: json['address'] as String? ?? '',
        latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
        longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      );

  final String address;
  final double latitude;
  final double longitude;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
      };
}

/// Host Model
class HostModel {
  HostModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory HostModel.fromJson(Map<String, dynamic> json) {
    // Handle id field - can be String or Map with buffer
    final dynamic idValue = json['id'];
    String id = '';
    if (idValue is String) {
      id = idValue;
    } else if (idValue is Map) {
      // If it's a map with buffer, try to extract or use empty string
      id = idValue['_id']?.toString() ?? idValue['\$oid']?.toString() ?? '';
    }

    return HostModel(
      id: id,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );
  }

  final String id;
  final String name;
  final String email;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'email': email,
      };
}

/// Media Model
class MediaModel {
  MediaModel({
    required this.poster,
    required this.preEventMedia,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        poster: json['poster'] as String? ?? '',
        preEventMedia: (json['preEventMedia'] as List<dynamic>?)
                ?.map((dynamic e) => e.toString())
                .toList() ??
            <String>[],
      );

  final String poster;
  final List<String> preEventMedia;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'poster': poster,
        'preEventMedia': preEventMedia,
      };
}

/// Pagination Model
class PaginationModel {
  PaginationModel({
    required this.currentPage,
    required this.totalPages,
    required this.totalTickets,
    required this.limit,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      PaginationModel(
        currentPage: json['currentPage'] as int? ?? 1,
        totalPages: json['totalPages'] as int? ?? 1,
        totalTickets: json['totalTickets'] as int? ?? 0,
        limit: json['limit'] as int? ?? 20,
      );

  factory PaginationModel.empty() => PaginationModel(
        currentPage: 1,
        totalPages: 1,
        totalTickets: 0,
        limit: 20,
      );

  final int currentPage;
  final int totalPages;
  final int totalTickets;
  final int limit;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'currentPage': currentPage,
        'totalPages': totalPages,
        'totalTickets': totalTickets,
        'limit': limit,
      };
}
