import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/marketplace_repository.dart';

class DeleteResourceUseCase {
  final MarketplaceRepository repository;

  DeleteResourceUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String resourceId,
  }) async {
    return await repository.deleteResource(
      resourceId: resourceId,
    );
  }
}
