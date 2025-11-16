import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/ticket_entity.dart';
import '../repositories/ticket_repository.dart';

/// Create/Purchase ticket use case
class CreateTicketUseCase {
  final TicketRepository repository;

  CreateTicketUseCase(this.repository);

  Future<Either<Failure, TicketEntity>> call({
    required String userId,
    required String eventId,
    required int ticketId,
    required DateTime purchasedDate,
    String? promoCode,
    required int quantity,
    required String transactionId,
  }) async {
    return await repository.createTicket(
      userId: userId,
      eventId: eventId,
      ticketId: ticketId,
      purchasedDate: purchasedDate,
      promoCode: promoCode,
      quantity: quantity,
      transactionId: transactionId,
    );
  }
}
