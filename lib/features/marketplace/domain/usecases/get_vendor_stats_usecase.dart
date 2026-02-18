import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_stats.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';

class GetVendorStatsUseCase {

  GetVendorStatsUseCase(this.repository);
  final MarketplaceRepository repository;

  Future<Either<Failure, VendorStats>> call() async => await repository.getVendorStats();
}
