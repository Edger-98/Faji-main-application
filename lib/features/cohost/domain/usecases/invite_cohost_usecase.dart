import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/invite_cohost_request.dart';
import '../repositories/cohost_repository.dart';

class InviteCohostUseCase {
  final CohostRepository repository;

  InviteCohostUseCase(this.repository);

  Future<Either<Failure, InviteCohostResponse>> call({
    required String eventId,
    required InviteCohostRequest request,
  }) async {
    return await repository.inviteCohost(
      eventId: eventId,
      request: request,
    );
  }
}
