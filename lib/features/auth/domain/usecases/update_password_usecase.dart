import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Update password use case
class UpdatePasswordUseCase {

  UpdatePasswordUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, bool>> call({
    required String token,
    required String oldPassword,
    required String newPassword,
  }) async => await repository.updatePassword(
      token: token,
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
}
