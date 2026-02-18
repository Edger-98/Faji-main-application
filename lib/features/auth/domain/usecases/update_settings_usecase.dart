import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/entities/user_entity.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Update account settings use case
class UpdateSettingsUseCase {

  UpdateSettingsUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, UserEntity>> call({
    required String id,
    String? firstName,
    String? lastName,
    String? phoneNo,
    String? imagePath,
  }) async => await repository.updateSettings(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phoneNo: phoneNo,
      imagePath: imagePath,
    );
}
