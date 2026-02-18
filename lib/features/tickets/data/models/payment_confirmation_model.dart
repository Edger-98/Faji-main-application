import 'package:fajimobileapp/features/tickets/domain/entities/my_ticket.dart';

/// Payment Confirmation Response Model
class PaymentConfirmationModel {
  PaymentConfirmationModel({
    required this.success,
    required this.message,
    required this.tickets,
    required this.order,
  });

  factory PaymentConfirmationModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? json;
    
    return PaymentConfirmationModel(
      success: data['success'] as bool? ?? true,
      message: data['message'] as String? ?? 'Payment successful',
      tickets: (data['tickets'] as List<dynamic>?)
              ?.map((e) => MyTicket.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      order: data['order'] as Map<String, dynamic>? ?? {},
    );
  }

  final bool success;
  final String message;
  final List<MyTicket> tickets;
  final Map<String, dynamic> order;

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'tickets': tickets.map((t) => t.toJson()).toList(),
        'order': order,
      };
}
