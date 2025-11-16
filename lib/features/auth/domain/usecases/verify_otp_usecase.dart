import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

/// Verify OTP use case
class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Either<Failure, bool>> call({
    required String email,
    required String otp,
  }) async {
    return await repository.verifyOtp(
      email: email,
      otp: otp,
    );
  }
}
