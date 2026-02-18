import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_token_entity.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Add name use case (Step 4)
class AddNameUseCase {

  AddNameUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, RegistrationTokenEntity>> call({
    required String firstName,
    required String lastName,
    required String registrationToken,
  }) async => await repository.addName(
      firstName: firstName,
      lastName: lastName,
      registrationToken: registrationToken,
    );
}
