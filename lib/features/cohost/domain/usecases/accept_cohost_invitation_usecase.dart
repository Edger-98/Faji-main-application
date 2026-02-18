import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/accept_invitation_response.dart';
import 'package:fajimobileapp/features/cohost/domain/repositories/cohost_repository.dart';

class AcceptCohostInvitationUseCase {

  AcceptCohostInvitationUseCase(this.repository);
  final CohostRepository repository;

  Future<Either<Failure, AcceptInvitationResponse>> call({
    required String invitationId,
  }) async => await repository.acceptInvitation(
      invitationId: invitationId,
    );
}
