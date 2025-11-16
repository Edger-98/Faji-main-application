import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Update account settings use case
class UpdateSettingsUseCase {
  final AuthRepository repository;

  UpdateSettingsUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String id,
    String? firstName,
    String? lastName,
    String? phoneNo,
    String? imagePath,
  }) async {
    return await repository.updateSettings(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phoneNo: phoneNo,
      imagePath: imagePath,
    );
  }
}
