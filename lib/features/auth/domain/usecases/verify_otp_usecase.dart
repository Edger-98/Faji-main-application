import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Verify OTP use case
class VerifyOtpUseCase {

  VerifyOtpUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, bool>> call({
    required String email,
    required String otp,
  }) async => await repository.verifyOtp(
      email: email,
      otp: otp,
    );
}
