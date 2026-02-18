import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/check_in_request.dart';
import 'package:fajimobileapp/features/tickets/domain/repositories/ticket_repository.dart';

/// Check-In Guest Use Case
class CheckInGuestUseCase {

  CheckInGuestUseCase(this.repository);
  final TicketRepository repository;

  Future<Either<Failure, CheckInResponse>> call(
    CheckInRequest request,
  ) async => await repository.checkInGuest(request);
}
