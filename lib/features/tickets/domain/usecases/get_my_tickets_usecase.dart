import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/my_ticket.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/ticket_repository.dart';

/// Get My Tickets Use Case
class GetMyTicketsUseCase {

  GetMyTicketsUseCase(this.repository);
  final TicketRepository repository;

  Future<Either<Failure, MyTicketsResponse>> call({
    String? status,
    int page = 1,
    int limit = 20,
  }) async => await repository.getMyTickets(
      status: status,
      page: page,
      limit: limit,
    );
}
