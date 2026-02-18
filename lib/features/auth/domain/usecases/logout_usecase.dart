import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Logout use case
class LogoutUseCase {

  LogoutUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, bool>> call() async => await repository.logout();
}
