import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/base/base_state.dart';
import '../../domain/entities/vendor_dashboard.dart';
import '../../domain/entities/vendor_profile.dart';
import '../../domain/entities/vendor_stats.dart';
import '../../domain/usecases/get_vendor_dashboard_usecase.dart';
import '../../domain/usecases/get_my_vendor_profile_usecase.dart';
import '../../domain/usecases/get_vendor_stats_usecase.dart';

// State for vendor dashboard
class VendorDashboardState {
  final BaseState<VendorDashboard> dashboardState;
  final BaseState<VendorProfile> profileState;
  final BaseState<VendorStats> statsState;

  VendorDashboardState({
    required this.dashboardState,
    required this.profileState,
    required this.statsState,
  });

  VendorDashboardState copyWith({
    BaseState<VendorDashboard>? dashboardState,
    BaseState<VendorProfile>? profileState,
    BaseState<VendorStats>? statsState,
  }) {
    return VendorDashboardState(
      dashboardState: dashboardState ?? this.dashboardState,
      profileState: profileState ?? this.profileState,
      statsState: statsState ?? this.statsState,
    );
  }
}

class VendorDashboardViewModel extends StateNotifier<VendorDashboardState> {
  final GetVendorDashboardUseCase _getVendorDashboardUseCase;
  final GetMyVendorProfileUseCase _getMyVendorProfileUseCase;
  final GetVendorStatsUseCase _getVendorStatsUseCase;

  VendorDashboardViewModel(
    this._getVendorDashboardUseCase,
    this._getMyVendorProfileUseCase,
    this._getVendorStatsUseCase,
  ) : super(VendorDashboardState(
          dashboardState: const BaseState.initial(),
          profileState: const BaseState.initial(),
          statsState: const BaseState.initial(),
        ));

  /// Get vendor dashboard
  Future<void> getVendorDashboard() async {
    state = state.copyWith(
      dashboardState: const BaseState.loading(),
    );

    final result = await _getVendorDashboardUseCase();

    result.fold(
      (failure) => state = state.copyWith(
        dashboardState: BaseState.error(failure),
      ),
      (dashboard) => state = state.copyWith(
        dashboardState: BaseState.success(dashboard),
      ),
    );
  }

  /// Get my vendor profile
  Future<void> getMyVendorProfile() async {
    state = state.copyWith(
      profileState: const BaseState.loading(),
    );

    final result = await _getMyVendorProfileUseCase();

    result.fold(
      (failure) => state = state.copyWith(
        profileState: BaseState.error(failure),
      ),
      (profile) => state = state.copyWith(
        profileState: BaseState.success(profile),
      ),
    );
  }

  /// Get vendor stats
  Future<void> getVendorStats() async {
    state = state.copyWith(
      statsState: const BaseState.loading(),
    );

    final result = await _getVendorStatsUseCase();

    result.fold(
      (failure) => state = state.copyWith(
        statsState: BaseState.error(failure),
      ),
      (stats) => state = state.copyWith(
        statsState: BaseState.success(stats),
      ),
    );
  }

  /// Refresh all
  Future<void> refreshAll() async {
    await Future.wait([
      getVendorDashboard(),
      getMyVendorProfile(),
      getVendorStats(),
    ]);
  }
}
