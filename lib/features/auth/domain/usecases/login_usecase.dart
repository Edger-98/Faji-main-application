import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/entities/auth_token_entity.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Login use case
class LoginUseCase {

  LoginUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, AuthTokenEntity>> call({
    required String email,
    required String password,
    String? expoPushToken,
  }) async => await repository.login(
      email: email,
      password: password,
      expoPushToken: expoPushToken,
    );
}
