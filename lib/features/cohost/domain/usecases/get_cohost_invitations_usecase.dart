import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/cohost_invitation.dart';
import 'package:fajimobileapp/features/cohost/domain/repositories/cohost_repository.dart';

class GetCohostInvitationsUseCase {

  GetCohostInvitationsUseCase(this.repository);
  final CohostRepository repository;

  Future<Either<Failure, CohostInvitationsResponse>> call({
    String? status,
    int page = 1,
    int limit = 20,
  }) async => await repository.getCohostInvitations(
      status: status,
      page: page,
      limit: limit,
    );
}
