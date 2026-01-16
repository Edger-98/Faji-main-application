import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/vendor_profile.dart';
import '../repositories/marketplace_repository.dart';

class GetMyVendorProfileUseCase {
  final MarketplaceRepository repository;

  GetMyVendorProfileUseCase(this.repository);

  Future<Either<Failure, VendorProfile>> call() async {
    return await repository.getMyVendorProfile();
  }
}
