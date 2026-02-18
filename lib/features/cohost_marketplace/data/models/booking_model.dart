import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/booking_entity.dart';

/// Data model for booking (API communication)
class BookingModel {

  BookingModel({
    required this.id,
    required this.eventId,
    required this.hostId,
    required this.cohostId,
    required this.resourceId,
    required this.status,
    required this.paymentOption,
    required this.offeredPrice,
    this.agreedPrice,
    this.percentageSplit,
    this.message,
    this.eventDate,
    this.escrowStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['_id'] ?? json['id'] ?? '',
      eventId: json['eventId'] ?? '',
      hostId: json['hostId'] ?? '',
      cohostId: json['cohostId'] ?? json['vendorId'] ?? '',
      resourceId: json['resourceId'] ?? '',
      status: json['status'] ?? 'pending',
      paymentOption: json['paymentOption'] ?? 'upfrontPayment',
      offeredPrice: (json['offeredPrice'] as num?)?.toDouble() ?? 0.0,
      agreedPrice: (json['agreedPrice'] as num?)?.toDouble(),
      percentageSplit: (json['percentageSplit'] as num?)?.toDouble(),
      message: json['message'] as String?,
      eventDate: json['eventDate'] != null 
          ? DateTime.parse(json['eventDate'].toString())
          : null,
      escrowStatus: json['escrowStatus'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'].toString())
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'].toString())
          : null,
    );
  }
  final String id;
  final String eventId;
  final String hostId;
  final String cohostId;
  final String resourceId;
  final String status;
  final String paymentOption;
  final double offeredPrice;
  final double? agreedPrice;
  final double? percentageSplit;
  final String? message;
  final DateTime? eventDate;
  final String? escrowStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Map<String, dynamic> toJson() => {
      'eventId': eventId,
      'cohostId': cohostId,
      'resourceId': resourceId,
      'status': status,
      'paymentOption': paymentOption,
      'offeredPrice': offeredPrice,
      if (agreedPrice != null) 'agreedPrice': agreedPrice,
      if (percentageSplit != null) 'percentageSplit': percentageSplit,
      if (message != null) 'message': message,
      if (eventDate != null) 'eventDate': eventDate!.toIso8601String(),
      if (escrowStatus != null) 'escrowStatus': escrowStatus,
    };

  BookingEntity toEntity() => BookingEntity(
      id: id,
      eventId: eventId,
      hostId: hostId,
      cohostId: cohostId,
      resourceId: resourceId,
      status: _parseBookingStatus(status),
      paymentOption: _parsePaymentOption(paymentOption),
      offeredPrice: offeredPrice,
      agreedPrice: agreedPrice,
      percentageSplit: percentageSplit,
      message: message,
      eventDate: eventDate,
      escrowStatus: escrowStatus != null ? _parseEscrowStatus(escrowStatus!) : null,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

  static BookingStatus _parseBookingStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return BookingStatus.pending;
      case 'accepted':
        return BookingStatus.accepted;
      case 'declined':
        return BookingStatus.declined;
      case 'negotiating':
        return BookingStatus.negotiating;
      case 'confirmed':
        return BookingStatus.confirmed;
      case 'paid':
        return BookingStatus.paid;
      case 'completed':
        return BookingStatus.completed;
      case 'cancelled':
        return BookingStatus.cancelled;
      default:
        return BookingStatus.pending;
    }
  }

  static PaymentOption _parsePaymentOption(String option) {
    switch (option.toLowerCase()) {
      case 'ticketsalessplit':
      case 'ticket_sales_split':
        return PaymentOption.ticketSalesSplit;
      case 'upfrontpayment':
      case 'upfront_payment':
        return PaymentOption.upfrontPayment;
      default:
        return PaymentOption.upfrontPayment;
    }
  }

  static EscrowStatus _parseEscrowStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return EscrowStatus.pending;
      case 'held':
        return EscrowStatus.held;
      case 'released':
        return EscrowStatus.released;
      case 'refunded':
        return EscrowStatus.refunded;
      default:
        return EscrowStatus.pending;
    }
  }
}
