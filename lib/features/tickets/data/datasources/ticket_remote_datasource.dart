import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/check_in_request.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/my_ticket.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/promo_code_validation.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/purchase_ticket_request.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/purchase_ticket_response.dart';
import 'package:fajimobileapp/features/tickets/data/models/ticket_model.dart';

part 'ticket_remote_datasource.g.dart';

/// Ticket remote data source using Retrofit
@RestApi()
abstract class TicketRemoteDataSource {
  factory TicketRemoteDataSource(Dio dio, {String baseUrl}) =
      _TicketRemoteDataSource;

  // ========== NEW API METHODS ==========

  /// Purchase tickets
  @POST('/tickets/purchase')
  Future<ApiResponse<PurchaseTicketResponse>> purchaseTickets(
    @Body() PurchaseTicketRequest request,
  );

  /// Validate promo code
  @POST('/tickets/validate-promo')
  Future<ApiResponse<PromoCodeValidation>> validatePromoCode(
    @Body() Map<String, dynamic> body,
  );

  /// Get my tickets
  @GET('/tickets/my-tickets')
  Future<HttpResponse<dynamic>> getMyTickets(
    @Query('status') String? status,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  /// Check-in guest
  @POST('/tickets/check-in')
  Future<ApiResponse<CheckInResponse>> checkInGuest(
    @Body() CheckInRequest request,
  );

  // ========== OLD METHODS (Keep for backward compatibility) ==========

  /// Get all tickets
  @GET('/api/tickets')
  Future<ApiResponse<List<TicketModel>>> getAllTickets();

  /// Get ticket by ID
  @GET('/api/tickets/{id}')
  Future<ApiResponse<TicketModel>> getTicketById(
    @Path('id') String id,
  );

  /// Get user's purchased tickets
  @GET('/api/tickets/{userId}/purchased')
  Future<ApiResponse<List<TicketModel>>> getPurchasedTickets(
    @Path('userId') String userId,
  );

  /// Get event participants
  @GET('/api/tickets/getParticipants/{id}')
  Future<ApiResponse<List<TicketModel>>> getEventParticipants(
    @Path('id') String eventId,
  );

  /// Get total tickets sold for an event
  @GET('/api/tickets/totalTicketsSold/{eventId}')
  Future<HttpResponse<dynamic>> getTotalTicketsSold(
    @Path('eventId') String eventId,
  );

  /// Get users by event ID
  @GET('/api/tickets/usersByEvent/{eventId}')
  Future<ApiResponse<List<String>>> getUsersByEventId(
    @Path('eventId') String eventId,
  );

  /// Filter tickets
  @GET('/api/tickets/filterTicket')
  Future<ApiResponse<List<TicketModel>>> filterTickets(
    @Query('filter') String filter,
    @Query('value') String value,
  );

  /// Create/Purchase ticket
  @POST('/api/tickets')
  Future<ApiResponse<TicketModel>> createTicket(
    @Body() Map<String, dynamic> body,
  );

  /// Validate ticket
  @POST('/api/tickets/validate')
  Future<HttpResponse<dynamic>> validateTicket(
    @Body() Map<String, dynamic> body,
  );

  /// Check-in attendee
  @POST('/api/tickets/check-in')
  Future<HttpResponse<dynamic>> checkInAttendee(
    @Body() Map<String, dynamic> body,
  );
}
