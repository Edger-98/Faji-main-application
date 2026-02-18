import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_profile.dart';
import 'package:fajimobileapp/features/marketplace/domain/repositories/marketplace_repository.dart';

class GetVendorProfileUseCase {

  GetVendorProfileUseCase(this.repository);
  final MarketplaceRepository repository;

  Future<Either<Failure, VendorProfile>> call({
    required String vendorId,
  }) async => await repository.getVendorProfile(
      vendorId: vendorId,
    );
}
