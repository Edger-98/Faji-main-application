import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/data/models/my_tickets_response_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/purchase_status_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/ticket_details_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/upcoming_events_model.dart';

abstract class TicketsRepository {
  Future<Either<Failure, MyTicketsResponseModel>> getMyTickets({
    String status = 'all',
    int page = 1,
    int limit = 20,
  });

  Future<Either<Failure, UpcomingEventsResponseModel>> getUpcomingEvents({
    int page = 1,
    int limit = 20,
  });

  Future<Either<Failure, UpcomingEventsResponseModel>> getPastEvents({
    int page = 1,
    int limit = 20,
  });

  Future<Either<Failure, PurchaseStatusModel>> checkPurchaseStatus(
    String eventId,
  );

  Future<Either<Failure, TicketDetailsModel>> getTicketDetails(
    String ticketId,
  );
}
