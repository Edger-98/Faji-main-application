import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/base/base_state.dart';
import '../../domain/entities/cohost_dashboard.dart';
import '../../domain/usecases/get_cohost_dashboard_usecase.dart';

// State for co-host dashboard
typedef CohostDashboardState = BaseState<CohostDashboard>;

class CohostDashboardViewModel extends StateNotifier<CohostDashboardState> {
  final GetCohostDashboardUseCase _getCohostDashboardUseCase;

  CohostDashboardViewModel(
    this._getCohostDashboardUseCase,
  ) : super(const BaseState.initial());

  /// Get co-host dashboard for an event
  Future<void> getCohostDashboard({
    required String eventId,
  }) async {
    state = const BaseState.loading();

    final result = await _getCohostDashboardUseCase(
      eventId: eventId,
    );

    result.fold(
      (failure) => state = BaseState.error(failure),
      (dashboard) => state = BaseState.success(dashboard),
    );
  }

  /// Refresh dashboard
  Future<void> refresh(String eventId) async {
    await getCohostDashboard(eventId: eventId);
  }
}
