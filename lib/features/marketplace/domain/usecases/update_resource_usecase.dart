import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/marketplace_resource.dart';
import '../repositories/marketplace_repository.dart';

class UpdateResourceUseCase {
  final MarketplaceRepository repository;

  UpdateResourceUseCase(this.repository);

  Future<Either<Failure, MarketplaceResource>> call({
    required String resourceId,
    required Map<String, dynamic> resourceData,
  }) async {
    return await repository.updateResource(
      resourceId: resourceId,
      resourceData: resourceData,
    );
  }
}
