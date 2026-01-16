import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/vendor_registration.dart';
import '../repositories/vendor_registration_repository.dart';

class RegisterVendorUseCase {
  final VendorRegistrationRepository repository;

  RegisterVendorUseCase(this.repository);

  Future<Either<Failure, VendorRegistrationResponse>> call({
    required VendorRegistrationRequest request,
  }) async {
    return await repository.registerVendor(
      request: request,
    );
  }
}
