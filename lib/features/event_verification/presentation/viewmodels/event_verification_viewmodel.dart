import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/refund_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/revenue_distribution.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/verification_status.dart';
import 'package:fajimobileapp/features/event_verification/domain/entities/verify_event_response.dart' hide VerificationStatus;
import 'package:fajimobileapp/features/event_verification/domain/usecases/get_revenue_distribution_usecase.dart';
import 'package:fajimobileapp/features/event_verification/domain/usecases/get_verification_status_usecase.dart';
import 'package:fajimobileapp/features/event_verification/domain/usecases/process_refunds_usecase.dart';
import 'package:fajimobileapp/features/event_verification/domain/usecases/verify_event_usecase.dart';
import 'package:fajimobileapp/features/event_verification/presentation/providers/event_verification_providers.dart';

/// Event Verification ViewModel
class EventVerificationViewModel
    extends StateNotifier<BaseState<VerificationStatus>> {

  EventVerificationViewModel(
    this._getVerificationStatusUseCase,
    this._verifyEventUseCase,
    this._getRevenueDistributionUseCase,
    this._processRefundsUseCase,
  ) : super(const BaseState.initial());
  final GetVerificationStatusUseCase _getVerificationStatusUseCase;
  final VerifyEventUseCase _verifyEventUseCase;
  final GetRevenueDistributionUseCase _getRevenueDistributionUseCase;
  final ProcessRefundsUseCase _processRefundsUseCase;

  RevenueDistribution? _revenueDistribution;
  RevenueDistribution? get revenueDistribution => _revenueDistribution;

  /// Get verification status
  Future<void> getVerificationStatus(String eventId) async {
    state = const BaseState.loading();

    final Either<Failure, VerificationStatus> result = await _getVerificationStatusUseCase(eventId);

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (VerificationStatus status) => state = BaseState.success(status),
    );
  }

  /// Verify event
  Future<VerifyEventResponse?> verifyEvent({
    required String eventId,
    bool manualOverride = false,
  }) async {
    final Either<Failure, VerifyEventResponse> result = await _verifyEventUseCase(
      eventId: eventId,
      manualOverride: manualOverride,
    );

    return result.fold(
      (Failure failure) {
        state = BaseState.error(failure);
        return null;
      },
      (VerifyEventResponse response) {
        // Refresh verification status
        getVerificationStatus(eventId);
        return response;
      },
    );
  }

  /// Get revenue distribution
  Future<void> getRevenueDistribution(String eventId) async {
    final Either<Failure, RevenueDistribution> result = await _getRevenueDistributionUseCase(eventId);

    result.fold(
      (Failure failure) => _revenueDistribution = null,
      (RevenueDistribution distribution) {
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
    final Either<Failure, RefundResponse> result = await _processRefundsUseCase(
      eventId: eventId,
      reason: reason,
    );

    return result.fold(
      (Failure failure) {
        state = BaseState.error(failure);
        return false;
      },
      (RefundResponse response) {
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
final AutoDisposeStateNotifierProvider<EventVerificationViewModel, BaseState<dynamic>> eventVerificationViewModelProvider = StateNotifierProvider.autoDispose<
    EventVerificationViewModel, BaseState<VerificationStatus>>(
  (AutoDisposeStateNotifierProviderRef<EventVerificationViewModel, BaseState<dynamic>> ref) => EventVerificationViewModel(
    ref.watch(getVerificationStatusUseCaseProvider),
    ref.watch(verifyEventUseCaseProvider),
    ref.watch(getRevenueDistributionUseCaseProvider),
    ref.watch(processRefundsUseCaseProvider),
  ),
);
