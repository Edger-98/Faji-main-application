import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/vendor_portfolio.dart';
import '../repositories/vendor_registration_repository.dart';

class UploadPortfolioUseCase {
  final VendorRegistrationRepository repository;

  UploadPortfolioUseCase(this.repository);

  Future<Either<Failure, VendorPortfolio>> call({
    required UploadPortfolioRequest request,
  }) async {
    return await repository.uploadPortfolio(
      request: request,
    );
  }
}
