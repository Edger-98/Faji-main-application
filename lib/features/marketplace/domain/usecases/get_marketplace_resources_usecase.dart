import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/marketplace_resource.dart';
import '../repositories/marketplace_repository.dart';

class GetMarketplaceResourcesUseCase {
  final MarketplaceRepository repository;

  GetMarketplaceResourcesUseCase(this.repository);

  Future<Either<Failure, MarketplaceResourcesResponse>> call({
    required String category,
    int page = 1,
    int limit = 20,
  }) async {
    return await repository.getMarketplaceResources(
      category: category,
      page: page,
      limit: limit,
    );
  }
}
