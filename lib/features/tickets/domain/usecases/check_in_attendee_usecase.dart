import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/ticket_repository.dart';

/// Check-in attendee use case
class CheckInAttendeeUseCase {
  final TicketRepository repository;

  CheckInAttendeeUseCase(this.repository);

  Future<Either<Failure, bool>> call({
    required int ticketId,
    required String eventId,
  }) async {
    return await repository.checkInAttendee(
      ticketId: ticketId,
      eventId: eventId,
    );
  }
}
