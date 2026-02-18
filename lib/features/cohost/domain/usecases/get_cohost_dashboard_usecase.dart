import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/cohost_dashboard.dart';
import 'package:fajimobileapp/features/cohost/domain/repositories/cohost_repository.dart';

class GetCohostDashboardUseCase {

  GetCohostDashboardUseCase(this.repository);
  final CohostRepository repository;

  Future<Either<Failure, CohostDashboard>> call({
    required String eventId,
  }) async => await repository.getCohostDashboard(
      eventId: eventId,
    );
}
