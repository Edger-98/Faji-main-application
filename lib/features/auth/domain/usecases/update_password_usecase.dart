import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

/// Update password use case
class UpdatePasswordUseCase {
  final AuthRepository repository;

  UpdatePasswordUseCase(this.repository);

  Future<Either<Failure, bool>> call({
    required String token,
    required String oldPassword,
    required String newPassword,
  }) async {
    return await repository.updatePassword(
      token: token,
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
