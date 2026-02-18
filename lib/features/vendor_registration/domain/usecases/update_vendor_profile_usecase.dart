import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/registration_status.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/repositories/vendor_registration_repository.dart';

class UpdateVendorProfileUseCase {

  UpdateVendorProfileUseCase(this.repository);
  final VendorRegistrationRepository repository;

  Future<Either<Failure, VendorRegistrationProfile>> call({
    required Map<String, dynamic> profileData,
  }) async => await repository.updateProfile(
      profileData: profileData,
    );
}
