import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/remove_cohost_response.dart';
import 'package:fajimobileapp/features/cohost/domain/repositories/cohost_repository.dart';

class RemoveCohostUseCase {

  RemoveCohostUseCase(this.repository);
  final CohostRepository repository;

  Future<Either<Failure, RemoveCohostResponse>> call({
    required String eventId,
    required String cohostId,
  }) async => await repository.removeCohost(
      eventId: eventId,
      cohostId: cohostId,
    );
}
