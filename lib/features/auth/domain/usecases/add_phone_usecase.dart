import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/registration_token_entity.dart';
import '../repositories/auth_repository.dart';

/// Add phone number use case (Step 3)
class AddPhoneUseCase {
  final AuthRepository repository;

  AddPhoneUseCase(this.repository);

  Future<Either<Failure, RegistrationTokenEntity>> call({
    required String phoneNo,
    required String registrationToken,
  }) async {
    return await repository.addPhone(
      phoneNo: phoneNo,
      registrationToken: registrationToken,
    );
  }
}
