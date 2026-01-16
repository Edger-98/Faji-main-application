import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/verification_status.dart';
import '../repositories/event_verification_repository.dart';

/// Get Verification Status Use Case
class GetVerificationStatusUseCase {
  final EventVerificationRepository repository;

  GetVerificationStatusUseCase(this.repository);

  Future<Either<Failure, VerificationStatus>> call(String eventId) async {
    return await repository.getVerificationStatus(eventId);
  }
}
