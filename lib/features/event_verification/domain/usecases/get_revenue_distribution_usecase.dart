import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/revenue_distribution.dart';
import '../repositories/event_verification_repository.dart';

/// Get Revenue Distribution Use Case
class GetRevenueDistributionUseCase {
  final EventVerificationRepository repository;

  GetRevenueDistributionUseCase(this.repository);

  Future<Either<Failure, RevenueDistribution>> call(String eventId) async {
    return await repository.getRevenueDistribution(eventId);
  }
}
