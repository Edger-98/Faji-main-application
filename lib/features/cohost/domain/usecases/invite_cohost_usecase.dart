import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/invite_cohost_request.dart';
import 'package:fajimobileapp/features/cohost/domain/repositories/cohost_repository.dart';

class InviteCohostUseCase {

  InviteCohostUseCase(this.repository);
  final CohostRepository repository;

  Future<Either<Failure, InviteCohostResponse>> call({
    required String eventId,
    required InviteCohostRequest request,
  }) async => await repository.inviteCohost(
      eventId: eventId,
      request: request,
    );
}
