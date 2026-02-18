/// Purchase Status Model - Check if user purchased tickets for an event
class PurchaseStatusModel {
  PurchaseStatusModel({
    required this.hasPurchased,
    required this.ticketCount,
    required this.tickets,
  });

  factory PurchaseStatusModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? json;
    
    return PurchaseStatusModel(
      hasPurchased: data['hasPurchased'] as bool? ?? false,
      ticketCount: data['ticketCount'] as int? ?? 0,
      tickets: (data['tickets'] as List<dynamic>?)
              ?.map((e) => PurchasedTicketSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  final bool hasPurchased;
  final int ticketCount;
  final List<PurchasedTicketSummary> tickets;

  Map<String, dynamic> toJson() => {
        'hasPurchased': hasPurchased,
        'ticketCount': ticketCount,
        'tickets': tickets.map((t) => t.toJson()).toList(),
      };
}

/// Purchased Ticket Summary
class PurchasedTicketSummary {
  PurchasedTicketSummary({
    required this.id,
    required this.ticketNumber,
    required this.status,
    required this.purchaseDate,
  });

  factory PurchasedTicketSummary.fromJson(Map<String, dynamic> json) =>
      PurchasedTicketSummary(
        id: json['id'] as String? ?? '',
        ticketNumber: json['ticketNumber'] as String? ?? '',
        status: json['status'] as String? ?? 'valid',
        purchaseDate: json['purchaseDate'] as String? ?? '',
      );

  final String id;
  final String ticketNumber;
  final String status;
  final String purchaseDate;

  Map<String, dynamic> toJson() => {
        'id': id,
        'ticketNumber': ticketNumber,
        'status': status,
        'purchaseDate': purchaseDate,
      };
}
