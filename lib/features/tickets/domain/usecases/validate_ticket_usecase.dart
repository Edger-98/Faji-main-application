import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/ticket_repository.dart';

/// Validate ticket use case
class ValidateTicketUseCase {
  final TicketRepository repository;

  ValidateTicketUseCase(this.repository);

  Future<Either<Failure, bool>> call({
    required int ticketId,
    required String eventId,
  }) async {
    return await repository.validateTicket(
      ticketId: ticketId,
      eventId: eventId,
    );
  }
}
