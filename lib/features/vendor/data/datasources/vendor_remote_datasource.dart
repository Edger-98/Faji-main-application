import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'vendor_remote_datasource.g.dart';

/// Vendor remote data source using Retrofit
@RestApi()
abstract class VendorRemoteDataSource {
  factory VendorRemoteDataSource(Dio dio, {String baseUrl}) =
      _VendorRemoteDataSource;

  // ========== Vendor Registration ==========

  /// Check vendor registration status
  @GET('/vendor-registration/check-status')
  Future<HttpResponse<dynamic>> checkVendorStatus();

  /// Register as vendor (simple version - just basic fields)
  @POST('/vendor-registration/register')
  Future<HttpResponse<dynamic>> registerVendor(
    @Body() Map<String, dynamic> body,
  );

  /// Upload vendor image (profile or cover)
  @POST('/vendor-registration/upload-image')
  Future<HttpResponse<dynamic>> uploadImage(
    @Body() FormData formData,
  );

  /// Upload vendor documents
  @POST('/vendor-registration/documents')
  Future<HttpResponse<dynamic>> uploadDocument(
    @Body() FormData formData,
  );

  /// Upload portfolio images
  @POST('/vendor-registration/portfolio')
  Future<HttpResponse<dynamic>> uploadPortfolio(
    @Body() FormData formData,
  );

  /// Add bank details
  @POST('/vendor-registration/bank-details')
  Future<HttpResponse<dynamic>> addBankDetails(
    @Body() Map<String, dynamic> body,
  );

  /// Get vendor profile
  @GET('/vendor-registration/profile')
  Future<HttpResponse<dynamic>> getVendorProfile();

  /// Update vendor profile
  @PATCH('/vendor-registration/profile')
  Future<HttpResponse<dynamic>> updateVendorProfile(
    @Body() Map<String, dynamic> body,
  );

  /// Delete portfolio image
  @DELETE('/vendor-registration/portfolio/{imageId}')
  Future<HttpResponse<dynamic>> deletePortfolioImage(
    @Path('imageId') String imageId,
  );

  // ========== Vendor Resources ==========

  /// Add resource
  @POST('/marketplace/vendors/me/resources')
  Future<HttpResponse<dynamic>> addResource(
    @Body() FormData formData,
  );

  /// Get my resources
  @GET('/marketplace/vendors/me/resources')
  Future<HttpResponse<dynamic>> getMyResources();

  /// Update resource
  @PATCH('/marketplace/vendors/me/resources/{id}')
  Future<HttpResponse<dynamic>> updateResource(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Delete resource
  @DELETE('/marketplace/vendors/me/resources/{id}')
  Future<HttpResponse<dynamic>> deleteResource(
    @Path('id') String id,
  );

  // ========== Vendor Bookings ==========

  /// Get booking requests
  @GET('/marketplace/bookings/requests')
  Future<HttpResponse<dynamic>> getBookingRequests(
    @Query('status') String? status,
  );

  /// Accept booking
  @POST('/marketplace/bookings/{id}/accept')
  Future<HttpResponse<dynamic>> acceptBooking(
    @Path('id') String id,
  );

  /// Decline booking
  @POST('/marketplace/bookings/{id}/decline')
  Future<HttpResponse<dynamic>> declineBooking(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  /// Counter offer
  @POST('/marketplace/bookings/{id}/counter-offer')
  Future<HttpResponse<dynamic>> counterOffer(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  // ========== Vendor Dashboard ==========

  /// Get vendor stats
  @GET('/marketplace/vendors/me/stats')
  Future<HttpResponse<dynamic>> getVendorStats();

  /// Get complete vendor profile
  @GET('/marketplace/vendors/me')
  Future<HttpResponse<dynamic>> getCompleteProfile();
}
