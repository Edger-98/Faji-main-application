import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Verify password reset OTP use case
class VerifyPasswordResetOtpUseCase {

  VerifyPasswordResetOtpUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, String>> call({
    required String email,
    required String otp,
  }) async => await repository.verifyPasswordResetOtp(
      email: email,
      otp: otp,
    );
}
