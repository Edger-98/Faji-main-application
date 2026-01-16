import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/check_in_request.dart';
import '../entities/my_ticket.dart';
import '../entities/promo_code_validation.dart';
import '../entities/purchase_ticket_request.dart';
import '../entities/purchase_ticket_response.dart';
import '../entities/ticket_entity.dart';

/// Ticket repository interface - domain layer
abstract class TicketRepository {
  // ========== NEW API METHODS ==========
  
  /// Purchase tickets
  Future<Either<Failure, PurchaseTicketResponse>> purchaseTickets(
    PurchaseTicketRequest request,
  );

  /// Validate promo code
  Future<Either<Failure, PromoCodeValidation>> validatePromoCode({
    required String eventId,
    required String promoCode,
    double? amount,
  });

  /// Get my tickets
  Future<Either<Failure, MyTicketsResponse>> getMyTickets({
    String? status,
    int page = 1,
    int limit = 20,
  });

  /// Check-in guest
  Future<Either<Failure, CheckInResponse>> checkInGuest(
    CheckInRequest request,
  );

  // ========== OLD METHODS (Keep for backward compatibility) ==========

  /// Get all tickets
  Future<Either<Failure, List<TicketEntity>>> getAllTickets();

  /// Get ticket by ID
  Future<Either<Failure, TicketEntity>> getTicketById(String id);

  /// Get user's purchased tickets
  Future<Either<Failure, List<TicketEntity>>> getPurchasedTickets(String userId);

  /// Get event participants
  Future<Either<Failure, List<TicketEntity>>> getEventParticipants(String eventId);

  /// Get total tickets sold for an event
  Future<Either<Failure, int>> getTotalTicketsSold(String eventId);

  /// Get users by event ID
  Future<Either<Failure, List<String>>> getUsersByEventId(String eventId);

  /// Filter tickets
  Future<Either<Failure, List<TicketEntity>>> filterTickets({
    required String filter,
    required String value,
  });

  /// Create/Purchase ticket
  Future<Either<Failure, TicketEntity>> createTicket({
    required String userId,
    required String eventId,
    required int ticketId,
    required DateTime purchasedDate,
    String? promoCode,
    required int quantity,
    required String transactionId,
  });

  /// Validate ticket
  Future<Either<Failure, bool>> validateTicket({
    required int ticketId,
    required String eventId,
  });

  /// Check-in attendee
  Future<Either<Failure, bool>> checkInAttendee({
    required int ticketId,
    required String eventId,
  });
}
