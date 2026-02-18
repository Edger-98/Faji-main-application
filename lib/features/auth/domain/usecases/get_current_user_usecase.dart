import 'package:dartz/dartz.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/domain/entities/user_entity.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';

/// Get current user use case
class GetCurrentUserUseCase {

  GetCurrentUserUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<Failure, UserEntity>> call() async {
    // Get stored user ID
    final String? userId = await repository.getUserId();
    if (userId == null) {
      return const Left(CacheFailure(message: 'No user ID found'));
    }
    
    // Fetch user by ID
    return repository.getUserById(userId);
  }
}
