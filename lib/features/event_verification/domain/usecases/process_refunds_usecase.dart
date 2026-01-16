import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/refund_response.dart';
import '../repositories/event_verification_repository.dart';

/// Process Refunds Use Case
class ProcessRefundsUseCase {
  final EventVerificationRepository repository;

  ProcessRefundsUseCase(this.repository);

  Future<Either<Failure, RefundResponse>> call({
    required String eventId,
    String? reason,
  }) async {
    return await repository.processRefunds(
      eventId: eventId,
      reason: reason,
    );
  }
}
