import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/base/base_state.dart';
import '../../domain/entities/invite_cohost_request.dart';
import '../../domain/entities/cohost_invitation.dart';
import '../../domain/entities/accept_invitation_response.dart';
import '../../domain/entities/cohost.dart';
import '../../domain/usecases/invite_cohost_usecase.dart';
import '../../domain/usecases/get_cohost_invitations_usecase.dart';
import '../../domain/usecases/accept_cohost_invitation_usecase.dart';
import '../../domain/usecases/decline_cohost_invitation_usecase.dart';
import '../../domain/usecases/get_event_cohosts_usecase.dart';
import '../../domain/usecases/remove_cohost_usecase.dart';

// State for co-host invitations
typedef CohostInvitationState = BaseState<CohostInvitationsResponse>;

class CohostInvitationViewModel
    extends StateNotifier<CohostInvitationState> {
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

  CohostInvitationViewModel(
    this._inviteCohostUseCase,
    this._getCohostInvitationsUseCase,
    this._acceptCohostInvitationUseCase,
    this._declineCohostInvitationUseCase,
    this._getEventCohostsUseCase,
    this._removeCohostUseCase,
  ) : super(const BaseState.initial());

  /// Invite a co-host to an event
  Future<void> inviteCohost({
    required String eventId,
    required String userId,
    required double revenueShare,
    String? message,
  }) async {
    state = const BaseState.loading();

    final request = InviteCohostRequest(
      userId: userId,
      revenueShare: revenueShare,
      message: message,
    );

    final result = await _inviteCohostUseCase(
      eventId: eventId,
      request: request,
    );

    result.fold(
      (failure) => state = BaseState.error(failure),
      (response) {
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

    final result = await _getCohostInvitationsUseCase(
      status: status,
      page: page,
      limit: limit,
    );

    result.fold(
      (failure) => state = BaseState.error(failure),
      (response) => state = BaseState.success(response),
    );
  }

  /// Accept a co-host invitation
  Future<AcceptInvitationResponse?> acceptInvitation({
    required String invitationId,
  }) async {
    final result = await _acceptCohostInvitationUseCase(
      invitationId: invitationId,
    );

    return result.fold(
      (failure) => null,
      (response) => response,
    );
  }

  /// Decline a co-host invitation
  Future<bool> declineInvitation({
    required String invitationId,
    String? reason,
  }) async {
    final result = await _declineCohostInvitationUseCase(
      invitationId: invitationId,
      reason: reason,
    );

    return result.fold(
      (failure) => false,
      (response) => true,
    );
  }

  /// Get co-hosts for an event
  Future<void> getEventCohosts({
    required String eventId,
  }) async {
    final result = await _getEventCohostsUseCase(
      eventId: eventId,
    );

    result.fold(
      (failure) => _eventCohosts = null,
      (response) => _eventCohosts = response,
    );
  }

  /// Remove a co-host from an event
  Future<bool> removeCohost({
    required String eventId,
    required String cohostId,
  }) async {
    final result = await _removeCohostUseCase(
      eventId: eventId,
      cohostId: cohostId,
    );

    return result.fold(
      (failure) => false,
      (response) => response.success,
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
