import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/check_in_request.dart';
import '../repositories/ticket_repository.dart';

/// Check-In Guest Use Case
class CheckInGuestUseCase {
  final TicketRepository repository;

  CheckInGuestUseCase(this.repository);

  Future<Either<Failure, CheckInResponse>> call(
    CheckInRequest request,
  ) async {
    return await repository.checkInGuest(request);
  }
}
