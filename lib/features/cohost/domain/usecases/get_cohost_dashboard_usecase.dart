import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/cohost_dashboard.dart';
import '../repositories/cohost_repository.dart';

class GetCohostDashboardUseCase {
  final CohostRepository repository;

  GetCohostDashboardUseCase(this.repository);

  Future<Either<Failure, CohostDashboard>> call({
    required String eventId,
  }) async {
    return await repository.getCohostDashboard(
      eventId: eventId,
    );
  }
}
