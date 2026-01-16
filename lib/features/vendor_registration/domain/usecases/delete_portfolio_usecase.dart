import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/vendor_registration_repository.dart';

class DeletePortfolioUseCase {
  final VendorRegistrationRepository repository;

  DeletePortfolioUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String portfolioId,
  }) async {
    return await repository.deletePortfolio(
      portfolioId: portfolioId,
    );
  }
}
