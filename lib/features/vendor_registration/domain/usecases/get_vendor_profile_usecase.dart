import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/registration_status.dart';
import '../repositories/vendor_registration_repository.dart';

class GetVendorProfileUseCase {
  final VendorRegistrationRepository repository;

  GetVendorProfileUseCase(this.repository);

  Future<Either<Failure, VendorRegistrationProfile>> call() async {
    return await repository.getProfile();
  }
}
