import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/ticket_entity.dart';
import '../repositories/ticket_repository.dart';

/// Get user's purchased tickets use case
class GetPurchasedTicketsUseCase {
  final TicketRepository repository;

  GetPurchasedTicketsUseCase(this.repository);

  Future<Either<Failure, List<TicketEntity>>> call(String userId) async {
    return await repository.getPurchasedTickets(userId);
  }
}
