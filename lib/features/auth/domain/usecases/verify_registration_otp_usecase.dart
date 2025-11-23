import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/registration_token_entity.dart';
import '../repositories/auth_repository.dart';

/// Verify registration OTP use case (Step 2)
class VerifyRegistrationOtpUseCase {
  final AuthRepository repository;

  VerifyRegistrationOtpUseCase(this.repository);

  Future<Either<Failure, RegistrationTokenEntity>> call({
    required String email,
    required String otp,
    required String sessionId,
  }) async {
    return await repository.verifyRegistrationOtp(
      email: email,
      otp: otp,
      sessionId: sessionId,
    );
  }
}
