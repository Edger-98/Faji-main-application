import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/registration_token_entity.dart';
import '../repositories/auth_repository.dart';

/// Add name use case (Step 4)
class AddNameUseCase {
  final AuthRepository repository;

  AddNameUseCase(this.repository);

  Future<Either<Failure, RegistrationTokenEntity>> call({
    required String firstName,
    required String lastName,
    required String registrationToken,
  }) async {
    return await repository.addName(
      firstName: firstName,
      lastName: lastName,
      registrationToken: registrationToken,
    );
  }
}
