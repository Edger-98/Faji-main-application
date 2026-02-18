import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/verify_event_response.dart';
import 'package:fajimobileapp/features/event_verification/domain/repositories/event_verification_repository.dart';

/// Verify Event Use Case
class VerifyEventUseCase {

  VerifyEventUseCase(this.repository);
  final EventVerificationRepository repository;

  Future<Either<Failure, VerifyEventResponse>> call({
    required String eventId,
    bool manualOverride = false,
  }) async => await repository.verifyEvent(
      eventId: eventId,
      manualOverride: manualOverride,
    );
}
