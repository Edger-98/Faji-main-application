import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/accept_invitation_response.dart';
import '../repositories/cohost_repository.dart';

class AcceptCohostInvitationUseCase {
  final CohostRepository repository;

  AcceptCohostInvitationUseCase(this.repository);

  Future<Either<Failure, AcceptInvitationResponse>> call({
    required String invitationId,
  }) async {
    return await repository.acceptInvitation(
      invitationId: invitationId,
    );
  }
}
