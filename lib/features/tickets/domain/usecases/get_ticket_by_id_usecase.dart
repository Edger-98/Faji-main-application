import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/ticket_entity.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/ticket_repository.dart';

/// Get ticket by ID use case
class GetTicketByIdUseCase {

  GetTicketByIdUseCase(this.repository);
  final TicketRepository repository;

  Future<Either<Failure, TicketEntity>> call(String id) async => await repository.getTicketById(id);
}
