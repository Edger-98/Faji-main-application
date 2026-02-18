import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_session_entity.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Register email use case (Step 1)
class RegisterEmailUseCase {

  RegisterEmailUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, RegistrationSessionEntity>> call({
    required String email,
  }) async => await repository.registerEmail(email: email);
}
