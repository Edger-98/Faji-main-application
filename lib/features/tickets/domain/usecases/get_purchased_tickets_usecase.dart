import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/ticket_entity.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/ticket_repository.dart';

/// Get user's purchased tickets use case
class GetPurchasedTicketsUseCase {

  GetPurchasedTicketsUseCase(this.repository);
  final TicketRepository repository;

  Future<Either<Failure, List<TicketEntity>>> call(String userId) async => await repository.getPurchasedTickets(userId);
}
