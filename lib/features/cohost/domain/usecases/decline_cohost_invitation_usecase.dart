import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/accept_invitation_response.dart';
import 'package:fajimobileapp/features/cohost/domain/repositories/cohost_repository.dart';

class DeclineCohostInvitationUseCase {

  DeclineCohostInvitationUseCase(this.repository);
  final CohostRepository repository;

  Future<Either<Failure, DeclineInvitationResponse>> call({
    required String invitationId,
    String? reason,
  }) async => await repository.declineInvitation(
      invitationId: invitationId,
      reason: reason,
    );
}
