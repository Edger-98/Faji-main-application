import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/revenue_distribution.dart';
import '../../domain/entities/verification_status.dart';
import '../../domain/entities/verify_event_response.dart';
import '../../domain/usecases/get_revenue_distribution_usecase.dart';
import '../../domain/usecases/get_verification_status_usecase.dart';
import '../../domain/usecases/process_refunds_usecase.dart';
import '../../domain/usecases/verify_event_usecase.dart';
import '../providers/event_verification_providers.dart';

/// Event Verification ViewModel
class EventVerificationViewModel
    extends StateNotifier<BaseState<VerificationStatus>> {
  final GetVerificationStatusUseCase _getVerificationStatusUseCase;
  final VerifyEventUseCase _verifyEventUseCase;
  final GetRevenueDistributionUseCase _getRevenueDistributionUseCase;
  final ProcessRefundsUseCase _processRefundsUseCase;

  RevenueDistribution? _revenueDistribution;
  RevenueDistribution? get revenueDistribution => _revenueDistribution;

  EventVerificationViewModel(
    this._getVerificationStatusUseCase,
    this._verifyEventUseCase,
    this._getRevenueDistributionUseCase,
    this._processRefundsUseCase,
  ) : super(const BaseState.initial());

  /// Get verification status
  Future<void> getVerificationStatus(String eventId) async {
    state = const BaseState.loading();

    final result = await _getVerificationStatusUseCase(eventId);

    result.fold(
      (failure) => state = BaseState.error(failure),
      (status) => state = BaseState.success(status),
    );
  }

  /// Verify event
  Future<VerifyEventResponse?> verifyEvent({
    required String eventId,
    bool manualOverride = false,
  }) async {
    final result = await _verifyEventUseCase(
      eventId: eventId,
      manualOverride: manualOverride,
    );

    return result.fold(
      (failure) {
        state = BaseState.error(failure);
        return null;
      },
      (response) {
        // Refresh verification status
        getVerificationStatus(eventId);
        return response;
      },
    );
  }

  /// Get revenue distribution
  Future<void> getRevenueDistribution(String eventId) async {
    final result = await _getRevenueDistributionUseCase(eventId);

    result.fold(
      (failure) => _revenueDistribution = null,
      (distribution) {
        _revenueDistribution = distribution;
        // Notify listeners
        state = state;
      },
    );
  }

  /// Process refunds
  Future<bool> processRefunds({
    required String eventId,
    String? reason,
  }) async {
    final result = await _processRefundsUseCase(
      eventId: eventId,
      reason: reason,
    );

    return result.fold(
      (failure) {
        state = BaseState.error(failure);
        return false;
      },
      (response) {
        // Refresh verification status
        getVerificationStatus(eventId);
        return response.success;
      },
    );
  }

  /// Reset state
  void resetState() {
    state = const BaseState.initial();
    _revenueDistribution = null;
  }
}

/// Event Verification ViewModel Provider
final eventVerificationViewModelProvider = StateNotifierProvider.autoDispose<
    EventVerificationViewModel, BaseState<VerificationStatus>>(
  (ref) => EventVerificationViewModel(
    ref.watch(getVerificationStatusUseCaseProvider),
    ref.watch(verifyEventUseCaseProvider),
    ref.watch(getRevenueDistributionUseCaseProvider),
    ref.watch(processRefundsUseCaseProvider),
  ),
);
