import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/ticket_entity.dart';
import '../repositories/ticket_repository.dart';

/// Get event participants use case
class GetEventParticipantsUseCase {
  final TicketRepository repository;

  GetEventParticipantsUseCase(this.repository);

  Future<Either<Failure, List<TicketEntity>>> call(String eventId) async {
    return await repository.getEventParticipants(eventId);
  }
}
