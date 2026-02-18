import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/ticket_repository.dart';

/// Validate ticket use case
class ValidateTicketUseCase {

  ValidateTicketUseCase(this.repository);
  final TicketRepository repository;

  Future<Either<Failure, bool>> call({
    required int ticketId,
    required String eventId,
  }) async => await repository.validateTicket(
      ticketId: ticketId,
      eventId: eventId,
    );
}
