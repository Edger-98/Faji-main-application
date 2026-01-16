import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/verify_event_response.dart';
import '../repositories/event_verification_repository.dart';

/// Verify Event Use Case
class VerifyEventUseCase {
  final EventVerificationRepository repository;

  VerifyEventUseCase(this.repository);

  Future<Either<Failure, VerifyEventResponse>> call({
    required String eventId,
    bool manualOverride = false,
  }) async {
    return await repository.verifyEvent(
      eventId: eventId,
      manualOverride: manualOverride,
    );
  }
}
