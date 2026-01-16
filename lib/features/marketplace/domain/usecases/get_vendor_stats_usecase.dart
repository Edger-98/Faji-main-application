import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/vendor_stats.dart';
import '../repositories/marketplace_repository.dart';

class GetVendorStatsUseCase {
  final MarketplaceRepository repository;

  GetVendorStatsUseCase(this.repository);

  Future<Either<Failure, VendorStats>> call() async {
    return await repository.getVendorStats();
  }
}
