import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';

class DeleteResourceUseCase {

  DeleteResourceUseCase(this.repository);
  final MarketplaceRepository repository;

  Future<Either<Failure, void>> call({
    required String resourceId,
  }) async => await repository.deleteResource(
      resourceId: resourceId,
    );
}
