import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/registration_session_entity.dart';
import '../repositories/auth_repository.dart';

/// Register email use case (Step 1)
class RegisterEmailUseCase {
  final AuthRepository repository;

  RegisterEmailUseCase(this.repository);

  Future<Either<Failure, RegistrationSessionEntity>> call({
    required String email,
  }) async {
    return await repository.registerEmail(email: email);
  }
}
