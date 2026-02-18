import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/ticket_entity.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/ticket_repository.dart';

/// Create/Purchase ticket use case
class CreateTicketUseCase {

  CreateTicketUseCase(this.repository);
  final TicketRepository repository;

  Future<Either<Failure, TicketEntity>> call({
    required String userId,
    required String eventId,
    required int ticketId,
    required DateTime purchasedDate,
    required int quantity, required String transactionId, String? promoCode,
  }) async => await repository.createTicket(
      userId: userId,
      eventId: eventId,
      ticketId: ticketId,
      purchasedDate: purchasedDate,
      promoCode: promoCode,
      quantity: quantity,
      transactionId: transactionId,
    );
}
