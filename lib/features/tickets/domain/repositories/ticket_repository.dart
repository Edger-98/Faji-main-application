import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/ticket_entity.dart';

/// Ticket repository interface - domain layer
abstract class TicketRepository {
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
