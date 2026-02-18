import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_token_entity.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Add phone number use case (Step 3)
class AddPhoneUseCase {

  AddPhoneUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, RegistrationTokenEntity>> call({
    required String phoneNo,
    required String registrationToken,
  }) async => await repository.addPhone(
      phoneNo: phoneNo,
      registrationToken: registrationToken,
    );
}
