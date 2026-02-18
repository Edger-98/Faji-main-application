import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/marketplace_resource.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_profile.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/booking.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/counter_offer.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_stats.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_dashboard.dart';

part 'marketplace_remote_datasource.g.dart';

@RestApi()
abstract class MarketplaceRemoteDataSource {
  factory MarketplaceRemoteDataSource(Dio dio, {String baseUrl}) =
      _MarketplaceRemoteDataSource;

  /// Get marketplace resources by category
  @GET('/marketplace/resources')
  Future<ApiResponse<List<MarketplaceResource>>> getMarketplaceResources(
    @Query('category') String category,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  /// Get vendor profile by ID
  @GET('/marketplace/vendors/{vendorId}')
  Future<ApiResponse<VendorProfile>> getVendorProfile(
    @Path('vendorId') String vendorId,
  );

  /// Create booking request
  @POST('/marketplace/bookings')
  Future<ApiResponse<Booking>> createBooking(
    @Body() CreateBookingRequest request,
  );

  /// Get my bookings (host side)
  @GET('/marketplace/bookings/my-requests')
  Future<ApiResponse<List<Booking>>> getMyBookings(
    @Query('status') String? status,
  );

  /// Get booking requests (vendor side)
  @GET('/marketplace/bookings/requests')
  Future<ApiResponse<List<Booking>>> getBookingRequests(
    @Query('status') String? status,
  );

  /// Accept booking (vendor side)
  @POST('/marketplace/bookings/{bookingId}/accept')
  Future<ApiResponse<Booking>> acceptBooking(
    @Path('bookingId') String bookingId,
    @Body() AcceptBookingRequest request,
  );

  /// Decline booking (vendor side)
  @POST('/marketplace/bookings/{bookingId}/decline')
  Future<ApiResponse<Booking>> declineBooking(
    @Path('bookingId') String bookingId,
    @Body() DeclineBookingRequest request,
  );

  /// Send counter offer (vendor side)
  @POST('/marketplace/bookings/{bookingId}/counter-offer')
  Future<ApiResponse<CounterOfferResponse>> sendCounterOffer(
    @Path('bookingId') String bookingId,
    @Body() CounterOfferRequest request,
  );

  /// Update booking status
  @PATCH('/marketplace/bookings/{bookingId}')
  Future<ApiResponse<Booking>> updateBooking(
    @Path('bookingId') String bookingId,
    @Body() UpdateBookingRequest request,
  );

  /// Get my vendor profile
  @GET('/marketplace/vendors/me')
  Future<ApiResponse<VendorProfile>> getMyVendorProfile();

  /// Get vendor stats
  @GET('/marketplace/vendors/me/stats')
  Future<ApiResponse<VendorStats>> getVendorStats();

  /// Add resource (vendor)
  @POST('/marketplace/vendors/me/resources')
  Future<ApiResponse<MarketplaceResource>> addResource(
    @Body() Map<String, dynamic> resourceData,
  );

  /// Get my resources (vendor)
  @GET('/marketplace/vendors/me/resources')
  Future<ApiResponse<List<MarketplaceResource>>> getMyResources();

  /// Update resource (vendor)
  @PATCH('/marketplace/vendors/me/resources/{resourceId}')
  Future<ApiResponse<MarketplaceResource>> updateResource(
    @Path('resourceId') String resourceId,
    @Body() Map<String, dynamic> resourceData,
  );

  /// Delete resource (vendor)
  @DELETE('/marketplace/vendors/me/resources/{resourceId}')
  Future<void> deleteResource(
    @Path('resourceId') String resourceId,
  );

  /// Get vendor dashboard
  @GET('/marketplace/vendors/me/dashboard')
  Future<ApiResponse<VendorDashboard>> getVendorDashboard();
}
