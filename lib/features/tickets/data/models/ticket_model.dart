import 'dart:convert';

import '../../domain/entities/ticket_entity.dart';

TicketModel ticketModelFromJson(String str) =>
    TicketModel.fromJson(json.decode(str) as Map<String, dynamic>);

String ticketModelToJson(TicketModel data) => json.encode(data.toJson());

class TicketModel {
  final String id;
  final String userId;
  final String eventId;
  final int ticketId;
  final DateTime purchasedDate;
  final String? promoCode;
  final int quantity;
  final String transactionId;
  final DateTime? createdAt;

  TicketModel({
    required this.id,
    required this.userId,
    required this.eventId,
    required this.ticketId,
    required this.purchasedDate,
    this.promoCode,
    required this.quantity,
    required this.transactionId,
    this.createdAt,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        id: json['_id'] as String? ?? json['id'] as String? ?? '',
        userId: json['userId'] as String? ?? '',
        eventId: json['eventId'] as String? ?? '',
        ticketId: json['ticketId'] as int? ?? 0,
        purchasedDate: json['purchasedDate'] != null
            ? DateTime.parse(json['purchasedDate'] as String)
            : DateTime.now(),
        promoCode: json['promoCode'] as String?,
        quantity: json['quantity'] as int? ?? 1,
        transactionId: json['transactionId'] as String? ?? '',
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'] as String)
            : null,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': userId,
        'eventId': eventId,
        'ticketId': ticketId,
        'purchasedDate': purchasedDate.toIso8601String(),
        if (promoCode != null) 'promoCode': promoCode,
        'quantity': quantity,
        'transactionId': transactionId,
        if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
      };

  /// Convert to entity
  TicketEntity toEntity() {
    return TicketEntity(
      id: id,
      userId: userId,
      eventId: eventId,
      ticketId: ticketId,
      purchasedDate: purchasedDate,
      promoCode: promoCode,
      quantity: quantity,
      transactionId: transactionId,
      createdAt: createdAt,
    );
  }

  /// Create from entity
  factory TicketModel.fromEntity(TicketEntity entity) {
    return TicketModel(
      id: entity.id,
      userId: entity.userId,
      eventId: entity.eventId,
      ticketId: entity.ticketId,
      purchasedDate: entity.purchasedDate,
      promoCode: entity.promoCode,
      quantity: entity.quantity,
      transactionId: entity.transactionId,
      createdAt: entity.createdAt,
    );
  }
}
