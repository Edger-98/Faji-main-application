import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/marketplace_resource.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';

class GetMarketplaceResourcesUseCase {

  GetMarketplaceResourcesUseCase(this.repository);
  final MarketplaceRepository repository;

  Future<Either<Failure, MarketplaceResourcesResponse>> call({
    required String category,
    int page = 1,
    int limit = 20,
  }) async => await repository.getMarketplaceResources(
      category: category,
      page: page,
      limit: limit,
    );
}
