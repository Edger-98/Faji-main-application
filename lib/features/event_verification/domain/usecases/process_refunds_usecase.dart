import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/refund_response.dart';
import 'package:fajimobileapp/features/event_verification/domain/repositories/event_verification_repository.dart';

/// Process Refunds Use Case
class ProcessRefundsUseCase {

  ProcessRefundsUseCase(this.repository);
  final EventVerificationRepository repository;

  Future<Either<Failure, RefundResponse>> call({
    required String eventId,
    String? reason,
  }) async => await repository.processRefunds(
      eventId: eventId,
      reason: reason,
    );
}
