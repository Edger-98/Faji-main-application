import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_dashboard.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';

class GetVendorDashboardUseCase {

  GetVendorDashboardUseCase(this.repository);
  final MarketplaceRepository repository;

  Future<Either<Failure, VendorDashboard>> call() async => await repository.getVendorDashboard();
}
