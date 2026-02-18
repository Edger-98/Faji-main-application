import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/marketplace_resource.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';

class UpdateResourceUseCase {

  UpdateResourceUseCase(this.repository);
  final MarketplaceRepository repository;

  Future<Either<Failure, MarketplaceResource>> call({
    required String resourceId,
    required Map<String, dynamic> resourceData,
  }) async => await repository.updateResource(
      resourceId: resourceId,
      resourceData: resourceData,
    );
}
