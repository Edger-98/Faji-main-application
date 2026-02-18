import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/entities/auth_token_entity.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Register/Signup use case
class RegisterUseCase {

  RegisterUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, AuthTokenEntity>> call({
    required String email,
    required String phoneNo,
    required String firstName,
    required String lastName,
    required String password,
    String role = 'Attendee',
    bool pushNotificationsEnabled = false,
    String? image,
    String? expoPushToken,
  }) async => await repository.signup(
      email: email,
      phoneNo: phoneNo,
      firstName: firstName,
      lastName: lastName,
      password: password,
      role: role,
      pushNotificationsEnabled: pushNotificationsEnabled,
      image: image,
      expoPushToken: expoPushToken,
    );
}
