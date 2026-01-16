import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/cohost_invitation.dart';
import '../repositories/cohost_repository.dart';

class GetCohostInvitationsUseCase {
  final CohostRepository repository;

  GetCohostInvitationsUseCase(this.repository);

  Future<Either<Failure, CohostInvitationsResponse>> call({
    String? status,
    int page = 1,
    int limit = 20,
  }) async {
    return await repository.getCohostInvitations(
      status: status,
      page: page,
      limit: limit,
    );
  }
}
