import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/vendor_registration.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/vendor_document.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/vendor_portfolio.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/bank_details.dart';
import 'package:fajimobileapp/features/vendor_registration/domain/entities/registration_status.dart';

part 'vendor_registration_remote_datasource.g.dart';

@RestApi()
abstract class VendorRegistrationRemoteDataSource {
  factory VendorRegistrationRemoteDataSource(Dio dio, {String baseUrl}) =
      _VendorRegistrationRemoteDataSource;

  /// Register as vendor
  @POST('/api/v1/vendor-registration/register')
  Future<ApiResponse<VendorRegistrationResponse>> registerVendor(
    @Body() VendorRegistrationRequest request,
  );

  /// Upload documents
  @POST('/api/v1/vendor-registration/documents')
  Future<ApiResponse<VendorDocument>> uploadDocuments(
    @Body() UploadDocumentRequest request,
  );

  /// Upload portfolio
  @POST('/api/v1/vendor-registration/portfolio')
  Future<ApiResponse<VendorPortfolio>> uploadPortfolio(
    @Body() UploadPortfolioRequest request,
  );

  /// Add bank details
  @POST('/api/v1/vendor-registration/bank-details')
  Future<ApiResponse<BankDetailsResponse>> addBankDetails(
    @Body() BankDetailsRequest request,
  );

  /// Check registration status
  @GET('/api/v1/vendor-registration/check-status')
  Future<ApiResponse<RegistrationStatus>> checkStatus();

  /// Get vendor registration profile
  @GET('/api/v1/vendor-registration/profile')
  Future<ApiResponse<VendorRegistrationProfile>> getProfile();

  /// Update vendor registration profile
  @PATCH('/api/v1/vendor-registration/profile')
  Future<ApiResponse<VendorRegistrationProfile>> updateProfile(
    @Body() Map<String, dynamic> profileData,
  );

  /// Delete portfolio item
  @DELETE('/api/v1/vendor-registration/portfolio/{portfolioId}')
  Future<void> deletePortfolio(
    @Path('portfolioId') String portfolioId,
  );
}
