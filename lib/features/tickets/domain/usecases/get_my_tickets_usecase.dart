import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/my_ticket.dart';
import '../repositories/ticket_repository.dart';

/// Get My Tickets Use Case
class GetMyTicketsUseCase {
  final TicketRepository repository;

  GetMyTicketsUseCase(this.repository);

  Future<Either<Failure, MyTicketsResponse>> call({
    String? status,
    int page = 1,
    int limit = 20,
  }) async {
    return await repository.getMyTickets(
      status: status,
      page: page,
      limit: limit,
    );
  }
}
