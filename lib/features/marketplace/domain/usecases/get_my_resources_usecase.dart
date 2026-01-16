import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/marketplace_resource.dart';
import '../repositories/marketplace_repository.dart';

class GetMyResourcesUseCase {
  final MarketplaceRepository repository;

  GetMyResourcesUseCase(this.repository);

  Future<Either<Failure, List<MarketplaceResource>>> call() async {
    return await repository.getMyResources();
  }
}
