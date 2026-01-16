import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/bank_details.dart';
import '../repositories/vendor_registration_repository.dart';

class AddBankDetailsUseCase {
  final VendorRegistrationRepository repository;

  AddBankDetailsUseCase(this.repository);

  Future<Either<Failure, BankDetailsResponse>> call({
    required BankDetailsRequest request,
  }) async {
    return await repository.addBankDetails(
      request: request,
    );
  }
}
