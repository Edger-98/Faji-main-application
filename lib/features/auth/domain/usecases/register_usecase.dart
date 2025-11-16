import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/auth_token_entity.dart';
import '../repositories/auth_repository.dart';

/// Register/Signup use case
class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

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
  }) async {
    return await repository.signup(
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
}
