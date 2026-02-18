import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/cohost.dart';
import 'package:fajimobileapp/features/cohost/domain/repositories/cohost_repository.dart';

class GetEventCohostsUseCase {

  GetEventCohostsUseCase(this.repository);
  final CohostRepository repository;

  Future<Either<Failure, EventCohostsResponse>> call({
    required String eventId,
  }) async => await repository.getEventCohosts(
      eventId: eventId,
    );
}
