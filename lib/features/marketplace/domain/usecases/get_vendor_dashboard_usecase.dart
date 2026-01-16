import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/vendor_dashboard.dart';
import '../repositories/marketplace_repository.dart';

class GetVendorDashboardUseCase {
  final MarketplaceRepository repository;

  GetVendorDashboardUseCase(this.repository);

  Future<Either<Failure, VendorDashboard>> call() async {
    return await repository.getVendorDashboard();
  }
}
