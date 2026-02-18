import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/revenue_distribution.dart';
import 'package:fajimobileapp/features/event_verification/domain/repositories/event_verification_repository.dart';

/// Get Revenue Distribution Use Case
class GetRevenueDistributionUseCase {

  GetRevenueDistributionUseCase(this.repository);
  final EventVerificationRepository repository;

  Future<Either<Failure, RevenueDistribution>> call(String eventId) async => await repository.getRevenueDistribution(eventId);
}
