import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/marketplace_resource.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';

class GetMyResourcesUseCase {

  GetMyResourcesUseCase(this.repository);
  final MarketplaceRepository repository;

  Future<Either<Failure, List<MarketplaceResource>>> call() async => await repository.getMyResources();
}
