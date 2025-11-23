import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/registration_complete_entity.dart';
import '../repositories/auth_repository.dart';

/// Complete registration use case (Step 5)
class CompleteRegistrationUseCase {
  final AuthRepository repository;

  CompleteRegistrationUseCase(this.repository);

  Future<Either<Failure, RegistrationCompleteEntity>> call({
    required String password,
    required String role,
    required String registrationToken,
    bool pushNotificationsEnabled = false,
  }) async {
    return await repository.completeRegistration(
      password: password,
      role: role,
      registrationToken: registrationToken,
      pushNotificationsEnabled: pushNotificationsEnabled,
    );
  }
}
