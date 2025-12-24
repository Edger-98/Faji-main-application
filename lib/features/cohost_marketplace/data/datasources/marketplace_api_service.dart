import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'marketplace_api_service.g.dart';

@RestApi()
abstract class MarketplaceApiService {
  factory MarketplaceApiService(Dio dio, {String baseUrl}) = _MarketplaceApiService;

  /// Get vendors for an event by category
  @GET('/events/{eventId}/vendors')
  Future<HttpResponse<dynamic>> getVendorsForEvent(
    @Path('eventId') String eventId,
    @Query('category') String? category,
    @Query('page') int? page,
    @Query('limit') int? limit,
  );
  
  /// Get resources by category (general marketplace)
  @GET('/marketplace/resources')
  Future<HttpResponse<dynamic>> getResourcesByCategory(
    @Query('category') String category,
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  /// Get vendor/cohost profile
  @GET('/marketplace/vendors/{id}')
  Future<HttpResponse<dynamic>> getVendorProfile(
    @Path('id') String vendorId,
  );

  /// Create booking request
  @POST('/marketplace/bookings')
  Future<HttpResponse<dynamic>> createBooking(
    @Body() Map<String, dynamic> bookingData,
  );

  /// Get user's bookings (as host)
  @GET('/marketplace/bookings/my-requests')
  Future<HttpResponse<dynamic>> getMyBookings(
    @Query('status') String? status,
  );

  /// Get booking requests (as vendor)
  @GET('/marketplace/bookings/requests')
  Future<HttpResponse<dynamic>> getBookingRequests(
    @Query('status') String? status,
  );

  /// Update booking status
  @PATCH('/marketplace/bookings/{id}')
  Future<HttpResponse<dynamic>> updateBookingStatus(
    @Path('id') String bookingId,
    @Body() Map<String, dynamic> updateData,
  );

  /// Accept booking
  @POST('/marketplace/bookings/{id}/accept')
  Future<HttpResponse<dynamic>> acceptBooking(
    @Path('id') String bookingId,
  );

  /// Decline booking
  @POST('/marketplace/bookings/{id}/decline')
  Future<HttpResponse<dynamic>> declineBooking(
    @Path('id') String bookingId,
  );

  /// Send counter offer
  @POST('/marketplace/bookings/{id}/counter-offer')
  Future<HttpResponse<dynamic>> sendCounterOffer(
    @Path('id') String bookingId,
    @Body() Map<String, dynamic> offerData,
  );
}
