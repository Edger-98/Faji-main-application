import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/invite_cohost_request.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/cohost_invitation.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/accept_invitation_response.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/cohost.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/cohost_dashboard.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/remove_cohost_response.dart';

abstract class CohostRepository {
  /// Invite a co-host to an event
  Future<Either<Failure, InviteCohostResponse>> inviteCohost({
    required String eventId,
    required InviteCohostRequest request,
  });

  /// Get co-host invitations for current user
  Future<Either<Failure, CohostInvitationsResponse>> getCohostInvitations({
    String? status,
    int page = 1,
    int limit = 20,
  });

  /// Accept a co-host invitation
  Future<Either<Failure, AcceptInvitationResponse>> acceptInvitation({
    required String invitationId,
  });

  /// Decline a co-host invitation
  Future<Either<Failure, DeclineInvitationResponse>> declineInvitation({
    required String invitationId,
    String? reason,
  });

  /// Get co-hosts for an event
  Future<Either<Failure, EventCohostsResponse>> getEventCohosts({
    required String eventId,
  });

  /// Remove a co-host from an event
  Future<Either<Failure, RemoveCohostResponse>> removeCohost({
    required String eventId,
    required String cohostId,
  });

  /// Get co-host dashboard for an event
  Future<Either<Failure, CohostDashboard>> getCohostDashboard({
    required String eventId,
  });
}
