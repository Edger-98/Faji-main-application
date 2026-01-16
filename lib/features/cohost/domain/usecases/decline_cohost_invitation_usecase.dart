import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/accept_invitation_response.dart';
import '../repositories/cohost_repository.dart';

class DeclineCohostInvitationUseCase {
  final CohostRepository repository;

  DeclineCohostInvitationUseCase(this.repository);

  Future<Either<Failure, DeclineInvitationResponse>> call({
    required String invitationId,
    String? reason,
  }) async {
    return await repository.declineInvitation(
      invitationId: invitationId,
      reason: reason,
    );
  }
}
