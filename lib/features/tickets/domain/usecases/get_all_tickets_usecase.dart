import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/ticket_entity.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/ticket_repository.dart';

/// Get all tickets use case
class GetAllTicketsUseCase {

  GetAllTicketsUseCase(this.repository);
  final TicketRepository repository;

  Future<Either<Failure, List<TicketEntity>>> call() async => await repository.getAllTickets();
}
