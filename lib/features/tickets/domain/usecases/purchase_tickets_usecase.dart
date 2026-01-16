import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/purchase_ticket_request.dart';
import '../entities/purchase_ticket_response.dart';
import '../repositories/ticket_repository.dart';

/// Purchase Tickets Use Case
class PurchaseTicketsUseCase {
  final TicketRepository repository;

  PurchaseTicketsUseCase(this.repository);

  Future<Either<Failure, PurchaseTicketResponse>> call(
    PurchaseTicketRequest request,
  ) async {
    return await repository.purchaseTickets(request);
  }
}
