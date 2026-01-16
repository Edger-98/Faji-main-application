import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/check_in_request.dart';
import '../../domain/usecases/check_in_guest_usecase.dart';
import '../providers/ticket_providers.dart';

/// Check-In ViewModel
class CheckInViewModel extends StateNotifier<BaseState<CheckInResponse>> {
  final CheckInGuestUseCase _checkInGuestUseCase;

  CheckInViewModel(this._checkInGuestUseCase)
      : super(const BaseState.initial());

  /// Check-in guest
  Future<void> checkInGuest({
    required String ticketId,
    required String eventId,
    double? latitude,
    double? longitude,
    double? accuracy,
  }) async {
    state = const BaseState.loading();

    final request = CheckInRequest(
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

    final result = await _checkInGuestUseCase(request);

    result.fold(
      (failure) => state = BaseState.error(failure),
      (response) => state = BaseState.success(response),
    );
  }

  /// Reset state
  void resetState() {
    state = const BaseState.initial();
  }
}

/// Check-In ViewModel Provider
final checkInViewModelProvider = StateNotifierProvider.autoDispose<
    CheckInViewModel, BaseState<CheckInResponse>>(
  (ref) => CheckInViewModel(
    ref.watch(checkInGuestUseCaseProvider),
  ),
);
