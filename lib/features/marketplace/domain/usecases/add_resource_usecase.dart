import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/marketplace_resource.dart';
import '../repositories/marketplace_repository.dart';

class AddResourceUseCase {
  final MarketplaceRepository repository;

  AddResourceUseCase(this.repository);

  Future<Either<Failure, MarketplaceResource>> call({
    required Map<String, dynamic> resourceData,
  }) async {
    return await repository.addResource(
      resourceData: resourceData,
    );
  }
}
