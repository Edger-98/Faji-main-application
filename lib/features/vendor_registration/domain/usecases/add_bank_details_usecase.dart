import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/bank_details.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/repositories/vendor_registration_repository.dart';

class AddBankDetailsUseCase {

  AddBankDetailsUseCase(this.repository);
  final VendorRegistrationRepository repository;

  Future<Either<Failure, BankDetailsResponse>> call({
    required BankDetailsRequest request,
  }) async => await repository.addBankDetails(
      request: request,
    );
}
