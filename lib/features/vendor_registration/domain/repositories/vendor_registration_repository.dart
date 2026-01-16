import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/vendor_registration.dart';
import '../entities/vendor_document.dart';
import '../entities/vendor_portfolio.dart';
import '../entities/bank_details.dart';
import '../entities/registration_status.dart';

abstract class VendorRegistrationRepository {
  /// Register as vendor
  Future<Either<Failure, VendorRegistrationResponse>> registerVendor({
    required VendorRegistrationRequest request,
  });

  /// Upload documents
  Future<Either<Failure, VendorDocument>> uploadDocuments({
    required UploadDocumentRequest request,
  });

  /// Upload portfolio
  Future<Either<Failure, VendorPortfolio>> uploadPortfolio({
    required UploadPortfolioRequest request,
  });

  /// Add bank details
  Future<Either<Failure, BankDetailsResponse>> addBankDetails({
    required BankDetailsRequest request,
  });

  /// Check registration status
  Future<Either<Failure, RegistrationStatus>> checkStatus();

  /// Get vendor registration profile
  Future<Either<Failure, VendorRegistrationProfile>> getProfile();

  /// Update vendor registration profile
  Future<Either<Failure, VendorRegistrationProfile>> updateProfile({
    required Map<String, dynamic> profileData,
  });

  /// Delete portfolio item
  Future<Either<Failure, void>> deletePortfolio({
    required String portfolioId,
  });
}
