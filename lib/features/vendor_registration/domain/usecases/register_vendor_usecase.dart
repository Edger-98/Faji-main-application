import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/vendor_registration.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/repositories/vendor_registration_repository.dart';

class RegisterVendorUseCase {

  RegisterVendorUseCase(this.repository);
  final VendorRegistrationRepository repository;

  Future<Either<Failure, VendorRegistrationResponse>> call({
    required VendorRegistrationRequest request,
  }) async => await repository.registerVendor(
      request: request,
    );
}
