import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/auth_token_entity.dart';
import '../repositories/auth_repository.dart';

/// Login use case
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, AuthTokenEntity>> call({
    required String email,
    required String password,
    String? expoPushToken,
  }) async {
    return await repository.login(
      email: email,
      password: password,
      expoPushToken: expoPushToken,
    );
  }
}
