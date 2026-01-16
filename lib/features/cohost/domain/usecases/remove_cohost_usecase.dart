import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/remove_cohost_response.dart';
import '../repositories/cohost_repository.dart';

class RemoveCohostUseCase {
  final CohostRepository repository;

  RemoveCohostUseCase(this.repository);

  Future<Either<Failure, RemoveCohostResponse>> call({
    required String eventId,
    required String cohostId,
  }) async {
    return await repository.removeCohost(
      eventId: eventId,
      cohostId: cohostId,
    );
  }
}
