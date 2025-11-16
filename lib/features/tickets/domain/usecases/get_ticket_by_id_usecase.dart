import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/ticket_entity.dart';
import '../repositories/ticket_repository.dart';

/// Get ticket by ID use case
class GetTicketByIdUseCase {
  final TicketRepository repository;

  GetTicketByIdUseCase(this.repository);

  Future<Either<Failure, TicketEntity>> call(String id) async {
    return await repository.getTicketById(id);
  }
}
