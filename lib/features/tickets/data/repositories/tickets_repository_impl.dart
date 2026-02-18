import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/data/datasources/tickets_remote_datasource.dart';
import 'package:fajimobileapp/features/tickets/data/models/my_tickets_response_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/purchase_status_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/ticket_details_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/upcoming_events_model.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/tickets_repository.dart';

class TicketsRepositoryImpl implements TicketsRepository {
  TicketsRepositoryImpl(this._remoteDataSource);

  final TicketsRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, MyTicketsResponseModel>> getMyTickets({
    String status = 'all',
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final result = await _remoteDataSource.getMyTickets(
        status: status,
        page: page,
        limit: limit,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpcomingEventsResponseModel>> getUpcomingEvents({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final result = await _remoteDataSource.getUpcomingEvents(
        page: page,
        limit: limit,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpcomingEventsResponseModel>> getPastEvents({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final result = await _remoteDataSource.getPastEvents(
        page: page,
        limit: limit,
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PurchaseStatusModel>> checkPurchaseStatus(
    String eventId,
  ) async {
    try {
      final result = await _remoteDataSource.checkPurchaseStatus(eventId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TicketDetailsModel>> getTicketDetails(
    String ticketId,
  ) async {
    try {
      print('🔄 Repository: Fetching ticket details for ID: $ticketId');
      final result = await _remoteDataSource.getTicketDetails(ticketId);
      print('✅ Repository: Ticket details fetched successfully');
      return Right(result);
    } catch (e, stackTrace) {
      print('❌ Repository: Error fetching ticket details: $e');
      print('Stack trace: $stackTrace');
      
      String errorMessage = 'Failed to load ticket details';
      if (e.toString().contains('type \'Null\'')) {
        errorMessage = 'Ticket data is incomplete or malformed';
      } else if (e.toString().contains('404')) {
        errorMessage = 'Ticket not found';
      } else if (e.toString().contains('SocketException')) {
        errorMessage = 'Network error. Please check your connection';
      }
      
      return Left(ServerFailure(message: errorMessage));
    }
  }
}
