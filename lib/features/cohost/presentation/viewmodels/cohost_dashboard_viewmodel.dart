import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/cohost/domain/entities/cohost_dashboard.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/get_cohost_dashboard_usecase.dart';

// State for co-host dashboard
typedef CohostDashboardState = BaseState<CohostDashboard>;

class CohostDashboardViewModel extends StateNotifier<CohostDashboardState> {

  CohostDashboardViewModel(
    this._getCohostDashboardUseCase,
  ) : super(const BaseState.initial());
  final GetCohostDashboardUseCase _getCohostDashboardUseCase;

  /// Get co-host dashboard for an event
  Future<void> getCohostDashboard({
    required String eventId,
  }) async {
    state = const BaseState.loading();

    final Either<Failure, CohostDashboard> result = await _getCohostDashboardUseCase(
      eventId: eventId,
    );

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (CohostDashboard dashboard) => state = BaseState.success(dashboard),
    );
  }

  /// Refresh dashboard
  Future<void> refresh(String eventId) async {
    await getCohostDashboard(eventId: eventId);
  }
}
