import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/refund_response.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/revenue_distribution.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/verification_status.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/verify_event_response.dart' hide VerificationStatus;

part 'event_verification_remote_datasource.g.dart';

/// Event Verification Remote Data Source using Retrofit
@RestApi()
abstract class EventVerificationRemoteDataSource {
  factory EventVerificationRemoteDataSource(Dio dio, {String baseUrl}) =
      _EventVerificationRemoteDataSource;

  /// Get verification status
  @GET('/api/v1/events/{eventId}/verification')
  Future<ApiResponse<VerificationStatus>> getVerificationStatus(
    @Path('eventId') String eventId,
  );

  /// Verify event
  @POST('/api/v1/events/{eventId}/verify')
  Future<ApiResponse<VerifyEventResponse>> verifyEvent(
    @Path('eventId') String eventId,
    @Body() Map<String, dynamic>? body,
  );

  /// Get revenue distribution
  @GET('/api/v1/events/{eventId}/revenue')
  Future<ApiResponse<RevenueDistribution>> getRevenueDistribution(
    @Path('eventId') String eventId,
  );

  /// Process refunds
  @POST('/api/v1/events/{eventId}/refund')
  Future<ApiResponse<RefundResponse>> processRefunds(
    @Path('eventId') String eventId,
    @Body() Map<String, dynamic>? body,
  );

  /// Release escrow manually
  @POST('/api/v1/events/{eventId}/release-escrow')
  Future<ApiResponse<VerifyEventResponse>> releaseEscrow(
    @Path('eventId') String eventId,
  );
}
