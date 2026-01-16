import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/registration_status.dart';
import '../repositories/vendor_registration_repository.dart';

class UpdateVendorProfileUseCase {
  final VendorRegistrationRepository repository;

  UpdateVendorProfileUseCase(this.repository);

  Future<Either<Failure, VendorRegistrationProfile>> call({
    required Map<String, dynamic> profileData,
  }) async {
    return await repository.updateProfile(
      profileData: profileData,
    );
  }
}
