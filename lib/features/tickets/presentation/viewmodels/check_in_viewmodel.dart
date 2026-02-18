import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/check_in_request.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/check_in_guest_usecase.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/ticket_providers.dart';

/// Check-In ViewModel
class CheckInViewModel extends StateNotifier<BaseState<CheckInResponse>> {

  CheckInViewModel(this._checkInGuestUseCase)
      : super(const BaseState.initial());
  final CheckInGuestUseCase _checkInGuestUseCase;

  /// Check-in guest
  Future<void> checkInGuest({
    required String ticketId,
    required String eventId,
    double? latitude,
    double? longitude,
    double? accuracy,
  }) async {
    state = const BaseState.loading();

    final CheckInRequest request = CheckInRequest(
      ticketId: ticketId,
      eventId: eventId,
      location: (latitude != null && longitude != null)
          ? LocationData(
              latitude: latitude,
              longitude: longitude,
              accuracy: accuracy,
            )
          : null,
    );

    final Either<Failure, CheckInResponse> result = await _checkInGuestUseCase(request);

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (CheckInResponse response) => state = BaseState.success(response),
    );
  }

  /// Reset state
  void resetState() {
    state = const BaseState.initial();
  }
}

/// Check-In ViewModel Provider
final AutoDisposeStateNotifierProvider<CheckInViewModel, BaseState<CheckInResponse>> checkInViewModelProvider = StateNotifierProvider.autoDispose<
    CheckInViewModel, BaseState<CheckInResponse>>(
  (AutoDisposeStateNotifierProviderRef<CheckInViewModel, BaseState<CheckInResponse>> ref) => CheckInViewModel(
    ref.watch(checkInGuestUseCaseProvider),
  ),
);
