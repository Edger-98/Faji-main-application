import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Delete account use case
class DeleteAccountUseCase {

  DeleteAccountUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, bool>> call(String id) async => await repository.deleteAccount(id);
}
