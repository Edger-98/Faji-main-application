import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/verification_status.dart';
import 'package:fajimobileapp/features/event_verification/domain/repositories/event_verification_repository.dart';

/// Get Verification Status Use Case
class GetVerificationStatusUseCase {

  GetVerificationStatusUseCase(this.repository);
  final EventVerificationRepository repository;

  Future<Either<Failure, VerificationStatus>> call(String eventId) async => await repository.getVerificationStatus(eventId);
}
