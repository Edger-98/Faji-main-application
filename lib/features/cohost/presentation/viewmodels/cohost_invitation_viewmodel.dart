import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/remove_cohost_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/invite_cohost_request.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/cohost_invitation.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/accept_invitation_response.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/cohost.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/invite_cohost_usecase.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/get_cohost_invitations_usecase.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/accept_cohost_invitation_usecase.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/decline_cohost_invitation_usecase.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/get_event_cohosts_usecase.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/remove_cohost_usecase.dart';

// State for co-host invitations
typedef CohostInvitationState = BaseState<CohostInvitationsResponse>;

class CohostInvitationViewModel
    extends StateNotifier<CohostInvitationState> {

  CohostInvitationViewModel(
    this._inviteCohostUseCase,
    this._getCohostInvitationsUseCase,
    this._acceptCohostInvitationUseCase,
    this._declineCohostInvitationUseCase,
    this._getEventCohostsUseCase,
    this._removeCohostUseCase,
  ) : super(const BaseState.initial());
  final InviteCohostUseCase _inviteCohostUseCase;
  final GetCohostInvitationsUseCase _getCohostInvitationsUseCase;
  final AcceptCohostInvitationUseCase _acceptCohostInvitationUseCase;
  final DeclineCohostInvitationUseCase _declineCohostInvitationUseCase;
  final GetEventCohostsUseCase _getEventCohostsUseCase;
  final RemoveCohostUseCase _removeCohostUseCase;

  // Store event co-hosts separately
  EventCohostsResponse? _eventCohosts;
  EventCohostsResponse? get eventCohosts => _eventCohosts;

  // Store invite response separately
  InviteCohostResponse? _inviteResponse;
  InviteCohostResponse? get inviteResponse => _inviteResponse;

  /// Invite a co-host to an event
  Future<void> inviteCohost({
    required String eventId,
    required String userId,
    required double revenueShare,
    String? message,
  }) async {
    state = const BaseState.loading();

    final InviteCohostRequest request = InviteCohostRequest(
      userId: userId,
      revenueShare: revenueShare,
      message: message,
    );

    final Either<Failure, InviteCohostResponse> result = await _inviteCohostUseCase(
      eventId: eventId,
      request: request,
    );

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (InviteCohostResponse response) {
        _inviteResponse = response;
        // Keep state as loading or set to initial
        state = const BaseState.initial();
      },
    );
  }

  /// Get co-host invitations for current user
  Future<void> getCohostInvitations({
    String? status,
    int page = 1,
    int limit = 20,
  }) async {
    state = const BaseState.loading();

    final Either<Failure, CohostInvitationsResponse> result = await _getCohostInvitationsUseCase(
      status: status,
      page: page,
      limit: limit,
    );

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (CohostInvitationsResponse response) => state = BaseState.success(response),
    );
  }

  /// Accept a co-host invitation
  Future<AcceptInvitationResponse?> acceptInvitation({
    required String invitationId,
  }) async {
    final Either<Failure, AcceptInvitationResponse> result = await _acceptCohostInvitationUseCase(
      invitationId: invitationId,
    );

    return result.fold(
      (Failure failure) => null,
      (AcceptInvitationResponse response) => response,
    );
  }

  /// Decline a co-host invitation
  Future<bool> declineInvitation({
    required String invitationId,
    String? reason,
  }) async {
    final Either<Failure, DeclineInvitationResponse> result = await _declineCohostInvitationUseCase(
      invitationId: invitationId,
      reason: reason,
    );

    return result.fold(
      (Failure failure) => false,
      (DeclineInvitationResponse response) => true,
    );
  }

  /// Get co-hosts for an event
  Future<void> getEventCohosts({
    required String eventId,
  }) async {
    final Either<Failure, EventCohostsResponse> result = await _getEventCohostsUseCase(
      eventId: eventId,
    );

    result.fold(
      (Failure failure) => _eventCohosts = null,
      (EventCohostsResponse response) => _eventCohosts = response,
    );
  }

  /// Remove a co-host from an event
  Future<bool> removeCohost({
    required String eventId,
    required String cohostId,
  }) async {
    final Either<Failure, RemoveCohostResponse> result = await _removeCohostUseCase(
      eventId: eventId,
      cohostId: cohostId,
    );

    return result.fold(
      (Failure failure) => false,
      (RemoveCohostResponse response) => response.success,
    );
  }

  /// Filter invitations by status
  Future<void> filterByStatus(String status) async {
    await getCohostInvitations(status: status);
  }

  /// Refresh invitations
  Future<void> refresh() async {
    await getCohostInvitations();
  }
}
