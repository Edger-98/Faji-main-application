import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/vendor_portfolio.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/repositories/vendor_registration_repository.dart';

class UploadPortfolioUseCase {

  UploadPortfolioUseCase(this.repository);
  final VendorRegistrationRepository repository;

  Future<Either<Failure, VendorPortfolio>> call({
    required UploadPortfolioRequest request,
  }) async => await repository.uploadPortfolio(
      request: request,
    );
}
