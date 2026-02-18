import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/registration_status.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/repositories/vendor_registration_repository.dart';

class CheckVendorStatusUseCase {

  CheckVendorStatusUseCase(this.repository);
  final VendorRegistrationRepository repository;

  Future<Either<Failure, RegistrationStatus>> call() async => await repository.checkStatus();
}
