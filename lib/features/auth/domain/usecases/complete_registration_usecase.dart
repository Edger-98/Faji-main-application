import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_complete_entity.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Complete registration use case (Step 5)
class CompleteRegistrationUseCase {

  CompleteRegistrationUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, RegistrationCompleteEntity>> call({
    required String password,
    required String role,
    required String registrationToken,
    bool pushNotificationsEnabled = false,
  }) async => await repository.completeRegistration(
      password: password,
      role: role,
      registrationToken: registrationToken,
      pushNotificationsEnabled: pushNotificationsEnabled,
    );
}
