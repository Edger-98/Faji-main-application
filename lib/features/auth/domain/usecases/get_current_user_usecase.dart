import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

/// Get current user use case
class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call() async {
    // Get stored user ID
    final userId = await repository.getUserId();
    if (userId == null) {
      return Left(CacheFailure(message: 'No user ID found'));
    }
    
    // Fetch user by ID
    return await repository.getUserById(userId);
  }
}
