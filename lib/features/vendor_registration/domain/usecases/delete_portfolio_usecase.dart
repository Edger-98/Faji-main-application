import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/repositories/vendor_registration_repository.dart';

class DeletePortfolioUseCase {

  DeletePortfolioUseCase(this.repository);
  final VendorRegistrationRepository repository;

  Future<Either<Failure, void>> call({
    required String portfolioId,
  }) async => await repository.deletePortfolio(
      portfolioId: portfolioId,
    );
}
