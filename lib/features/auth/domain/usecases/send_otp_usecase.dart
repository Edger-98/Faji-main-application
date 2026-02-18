import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Send OTP use case
class SendOtpUseCase {

  SendOtpUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, bool>> call({
    required String email,
  }) async => await repository.sendOtp(email: email);
}
