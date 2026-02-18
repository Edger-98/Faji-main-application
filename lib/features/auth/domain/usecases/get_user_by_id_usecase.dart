import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/entities/user_entity.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Get user by ID use case
class GetUserByIdUseCase {

  GetUserByIdUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, UserEntity>> call(String id) async => await repository.getUserById(id);
}
