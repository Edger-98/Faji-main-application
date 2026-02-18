import 'package:fajimobileapp/features/tickets/data/models/my_tickets_response_model.dart';

/// Ticket Details Model - Full ticket information with event and order
class TicketDetailsModel {
  TicketDetailsModel({
    required this.ticket,
    required this.event,
    required this.order,
  });

  factory TicketDetailsModel.fromJson(Map<String, dynamic> json) {
    // Handle both nested and flat response structures
    final dynamic data = json['data'] ?? json;
    
    // Try to parse ticket
    TicketModel ticket;
    if (data is Map && data.containsKey('ticket')) {
      ticket = TicketModel.fromJson(data['ticket'] as Map<String, dynamic>);
    } else if (data is Map) {
      // Flat structure - the data itself is the ticket
      ticket = TicketModel.fromJson(data as Map<String, dynamic>);
    } else {
      throw Exception('Invalid ticket data structure');
    }
    
    // Try to parse event
    TicketEventModel event;
    if (data is Map && data.containsKey('event')) {
      event = TicketEventModel.fromJson(data['event'] as Map<String, dynamic>);
    } else if (json.containsKey('event')) {
      event = TicketEventModel.fromJson(json['event'] as Map<String, dynamic>);
    } else {
      event = TicketEventModel.empty();
    }
    
    // Try to parse order
    OrderModel order;
    if (data is Map && data.containsKey('order')) {
      order = OrderModel.fromJson(data['order'] as Map<String, dynamic>);
    } else if (json.containsKey('order')) {
      order = OrderModel.fromJson(json['order'] as Map<String, dynamic>);
    } else {
      // Create a default order from ticket data
      order = OrderModel(
        orderNumber: ticket.ticketNumber,
        total: ticket.price,
        currency: ticket.currency,
        completedAt: ticket.purchaseDate,
      );
    }
    
    return TicketDetailsModel(
      ticket: ticket,
      event: event,
      order: order,
    );
  }

  final TicketModel ticket;
  final TicketEventModel event;
  final OrderModel order;

  Map<String, dynamic> toJson() => {
        'ticket': ticket.toJson(),
        'event': event.toJson(),
        'order': order.toJson(),
      };
}

/// Order Model
class OrderModel {
  OrderModel({
    required this.orderNumber,
    required this.total,
    required this.currency,
    required this.completedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderNumber: json['orderNumber'] as String? ?? '',
        total: (json['total'] as num?)?.toDouble() ?? 0.0,
        currency: json['currency'] as String? ?? 'USD',
        completedAt: json['completedAt'] as String? ?? '',
      );

  final String orderNumber;
  final double total;
  final String currency;
  final String completedAt;

  Map<String, dynamic> toJson() => {
        'orderNumber': orderNumber,
        'total': total,
        'currency': currency,
        'completedAt': completedAt,
      };
}
