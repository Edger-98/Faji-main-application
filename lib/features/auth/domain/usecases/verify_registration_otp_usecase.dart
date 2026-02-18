import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_token_entity.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Verify registration OTP use case (Step 2)
class VerifyRegistrationOtpUseCase {

  VerifyRegistrationOtpUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, RegistrationTokenEntity>> call({
    required String email,
    required String otp,
    required String sessionId,
  }) async => await repository.verifyRegistrationOtp(
      email: email,
      otp: otp,
      sessionId: sessionId,
    );
}
