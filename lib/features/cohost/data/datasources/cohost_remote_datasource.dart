import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/api_response.dart';
import '../../domain/entities/invite_cohost_request.dart';
import '../../domain/entities/cohost_invitation.dart';
import '../../domain/entities/accept_invitation_response.dart';
import '../../domain/entities/cohost.dart';
import '../../domain/entities/cohost_dashboard.dart';
import '../../domain/entities/remove_cohost_response.dart';

part 'cohost_remote_datasource.g.dart';

@RestApi()
abstract class CohostRemoteDataSource {
  factory CohostRemoteDataSource(Dio dio, {String baseUrl}) =
      _CohostRemoteDataSource;

  /// Invite a co-host to an event
  @POST('/api/v1/events/{eventId}/cohosts/invite')
  Future<ApiResponse<InviteCohostResponse>> inviteCohost(
    @Path('eventId') String eventId,
    @Body() InviteCohostRequest request,
  );

  /// Get co-host invitations for current user
  @GET('/api/v1/cohosts/invitations')
  Future<ApiResponse<CohostInvitationsResponse>> getCohostInvitations(
    @Query('status') String? status,
    @Query('page') int page,
    @Query('limit') int limit,
  );

  /// Accept a co-host invitation
  @POST('/api/v1/cohosts/invitations/{invitationId}/accept')
  Future<ApiResponse<AcceptInvitationResponse>> acceptInvitation(
    @Path('invitationId') String invitationId,
  );

  /// Decline a co-host invitation
  @POST('/api/v1/cohosts/invitations/{invitationId}/decline')
  Future<ApiResponse<DeclineInvitationResponse>> declineInvitation(
    @Path('invitationId') String invitationId,
    @Body() DeclineInvitationRequest request,
  );

  /// Get co-hosts for an event
  @GET('/api/v1/events/{eventId}/cohosts')
  Future<ApiResponse<EventCohostsResponse>> getEventCohosts(
    @Path('eventId') String eventId,
  );

  /// Remove a co-host from an event
  @DELETE('/api/v1/events/{eventId}/cohosts/{cohostId}')
  Future<ApiResponse<RemoveCohostResponse>> removeCohost(
    @Path('eventId') String eventId,
    @Path('cohostId') String cohostId,
  );

  /// Get co-host dashboard for an event
  @GET('/api/v1/cohosts/dashboard/{eventId}')
  Future<ApiResponse<CohostDashboard>> getCohostDashboard(
    @Path('eventId') String eventId,
  );
}
