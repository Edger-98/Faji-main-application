import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/registration_status.dart';
import '../repositories/vendor_registration_repository.dart';

class CheckVendorStatusUseCase {
  final VendorRegistrationRepository repository;

  CheckVendorStatusUseCase(this.repository);

  Future<Either<Failure, RegistrationStatus>> call() async {
    return await repository.checkStatus();
  }
}
