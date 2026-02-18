import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Forget password use case
class ForgetPasswordUseCase {

  ForgetPasswordUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, bool>> call({
    required String email,
  }) async => await repository.forgetPassword(email: email);
}
