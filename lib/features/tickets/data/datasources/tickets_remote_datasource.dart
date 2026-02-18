import 'package:dio/dio.dart';
import 'package:fajimobileapp/features/tickets/data/models/my_tickets_response_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/purchase_status_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/ticket_details_model.dart';
import 'package:fajimobileapp/features/tickets/data/models/upcoming_events_model.dart';

/// Remote data source for tickets operations
abstract class TicketsRemoteDataSource {
  /// Get all tickets purchased by user
  Future<MyTicketsResponseModel> getMyTickets({
    String status = 'all',
    int page = 1,
    int limit = 20,
  });

  /// Get upcoming events with tickets
  Future<UpcomingEventsResponseModel> getUpcomingEvents({
    int page = 1,
    int limit = 20,
  });

  /// Get past events attended
  Future<UpcomingEventsResponseModel> getPastEvents({
    int page = 1,
    int limit = 20,
  });

  /// Check if user purchased tickets for an event
  Future<PurchaseStatusModel> checkPurchaseStatus(String eventId);

  /// Get detailed ticket information
  Future<TicketDetailsModel> getTicketDetails(String ticketId);
}

class TicketsRemoteDataSourceImpl implements TicketsRemoteDataSource {
  TicketsRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<MyTicketsResponseModel> getMyTickets({
    String status = 'all',
    int page = 1,
    int limit = 20,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/tickets/my-tickets',
      queryParameters: {
        'status': status,
        'page': page,
        'limit': limit,
      },
    );

    if (response.data == null) {
      throw Exception('Failed to load tickets');
    }

    return MyTicketsResponseModel.fromJson(response.data!);
  }

  @override
  Future<UpcomingEventsResponseModel> getUpcomingEvents({
    int page = 1,
    int limit = 20,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/tickets/my-upcoming-events',
      queryParameters: {
        'page': page,
        'limit': limit,
      },
    );

    if (response.data == null) {
      throw Exception('Failed to load upcoming events');
    }

    return UpcomingEventsResponseModel.fromJson(response.data!);
  }

  @override
  Future<UpcomingEventsResponseModel> getPastEvents({
    int page = 1,
    int limit = 20,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/tickets/my-past-events',
      queryParameters: {
        'page': page,
        'limit': limit,
      },
    );

    if (response.data == null) {
      throw Exception('Failed to load past events');
    }

    return UpcomingEventsResponseModel.fromJson(response.data!);
  }

  @override
  Future<PurchaseStatusModel> checkPurchaseStatus(String eventId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/tickets/check-purchase/$eventId',
    );

    if (response.data == null) {
      throw Exception('Failed to check purchase status');
    }

    return PurchaseStatusModel.fromJson(response.data!);
  }

  @override
  Future<TicketDetailsModel> getTicketDetails(String ticketId) async {
    try {
      print('🎫 Fetching ticket details for ID: $ticketId');
      
      final response = await _dio.get<Map<String, dynamic>>(
        '/tickets/$ticketId',
      );

      print('📥 Ticket details response status: ${response.statusCode}');
      print('📥 Ticket details response data: ${response.data}');

      if (response.data == null) {
        throw Exception('Failed to load ticket details: Response data is null');
      }

      final ticketDetails = TicketDetailsModel.fromJson(response.data!);
      print('✅ Ticket details parsed successfully');
      
      return ticketDetails;
    } catch (e, stackTrace) {
      print('❌ Error fetching ticket details: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }
}
