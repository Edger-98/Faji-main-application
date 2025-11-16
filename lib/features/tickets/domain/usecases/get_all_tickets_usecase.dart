import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/ticket_entity.dart';
import '../repositories/ticket_repository.dart';

/// Get all tickets use case
class GetAllTicketsUseCase {
  final TicketRepository repository;

  GetAllTicketsUseCase(this.repository);

  Future<Either<Failure, List<TicketEntity>>> call() async {
    return await repository.getAllTickets();
  }
}
