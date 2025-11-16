import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

/// Send OTP use case
class SendOtpUseCase {
  final AuthRepository repository;

  SendOtpUseCase(this.repository);

  Future<Either<Failure, bool>> call({
    required String email,
  }) async {
    return await repository.sendOtp(email: email);
  }
}
