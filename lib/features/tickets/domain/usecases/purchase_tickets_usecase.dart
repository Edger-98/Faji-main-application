import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/purchase_ticket_request.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/purchase_ticket_response.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/ticket_repository.dart';

/// Purchase Tickets Use Case
class PurchaseTicketsUseCase {

  PurchaseTicketsUseCase(this.repository);
  final TicketRepository repository;

  Future<Either<Failure, PurchaseTicketResponse>> call(
    PurchaseTicketRequest request,
  ) async => await repository.purchaseTickets(request);
}
