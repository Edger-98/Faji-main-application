import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Reset password use case
class ResetPasswordUseCase {

  ResetPasswordUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, bool>> call({
    required String resetToken,
    required String newPassword,
  }) async => await repository.resetPassword(
      resetToken: resetToken,
      newPassword: newPassword,
    );
}
