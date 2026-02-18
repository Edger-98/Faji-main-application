import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/ticket_entity.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/ticket_repository.dart';

/// Get event participants use case
class GetEventParticipantsUseCase {

  GetEventParticipantsUseCase(this.repository);
  final TicketRepository repository;

  Future<Either<Failure, List<TicketEntity>>> call(String eventId) async => await repository.getEventParticipants(eventId);
}
