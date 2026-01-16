import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/cohost.dart';
import '../repositories/cohost_repository.dart';

class GetEventCohostsUseCase {
  final CohostRepository repository;

  GetEventCohostsUseCase(this.repository);

  Future<Either<Failure, EventCohostsResponse>> call({
    required String eventId,
  }) async {
    return await repository.getEventCohosts(
      eventId: eventId,
    );
  }
}
