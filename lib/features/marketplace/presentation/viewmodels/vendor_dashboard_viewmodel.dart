import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_dashboard.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_profile.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/vendor_stats.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_vendor_dashboard_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_my_vendor_profile_usecase.dart';
import 'package:fajimobileapp/features/marketplace/domain/usecases/get_vendor_stats_usecase.dart';

// State for vendor dashboard
class VendorDashboardState {

  VendorDashboardState({
    required this.dashboardState,
    required this.profileState,
    required this.statsState,
  });
  final BaseState<VendorDashboard> dashboardState;
  final BaseState<VendorProfile> profileState;
  final BaseState<VendorStats> statsState;

  VendorDashboardState copyWith({
    BaseState<VendorDashboard>? dashboardState,
    BaseState<VendorProfile>? profileState,
    BaseState<VendorStats>? statsState,
  }) => VendorDashboardState(
      dashboardState: dashboardState ?? this.dashboardState,
      profileState: profileState ?? this.profileState,
      statsState: statsState ?? this.statsState,
    );
}

class VendorDashboardViewModel extends StateNotifier<VendorDashboardState> {

  VendorDashboardViewModel(
    this._getVendorDashboardUseCase,
    this._getMyVendorProfileUseCase,
    this._getVendorStatsUseCase,
  ) : super(VendorDashboardState(
          dashboardState: const BaseState.initial(),
          profileState: const BaseState.initial(),
          statsState: const BaseState.initial(),
        ));
  final GetVendorDashboardUseCase _getVendorDashboardUseCase;
  final GetMyVendorProfileUseCase _getMyVendorProfileUseCase;
  final GetVendorStatsUseCase _getVendorStatsUseCase;

  /// Get vendor dashboard
  Future<void> getVendorDashboard() async {
    state = state.copyWith(
      dashboardState: const BaseState.loading(),
    );

    final Either<Failure, VendorDashboard> result = await _getVendorDashboardUseCase();

    result.fold(
      (Failure failure) => state = state.copyWith(
        dashboardState: BaseState.error(failure),
      ),
      (VendorDashboard dashboard) => state = state.copyWith(
        dashboardState: BaseState.success(dashboard),
      ),
    );
  }

  /// Get my vendor profile
  Future<void> getMyVendorProfile() async {
    state = state.copyWith(
      profileState: const BaseState.loading(),
    );

    final Either<Failure, VendorProfile> result = await _getMyVendorProfileUseCase();

    result.fold(
      (Failure failure) => state = state.copyWith(
        profileState: BaseState.error(failure),
      ),
      (VendorProfile profile) => state = state.copyWith(
        profileState: BaseState.success(profile),
      ),
    );
  }

  /// Get vendor stats
  Future<void> getVendorStats() async {
    state = state.copyWith(
      statsState: const BaseState.loading(),
    );

    final Either<Failure, VendorStats> result = await _getVendorStatsUseCase();

    result.fold(
      (Failure failure) => state = state.copyWith(
        statsState: BaseState.error(failure),
      ),
      (VendorStats stats) => state = state.copyWith(
        statsState: BaseState.success(stats),
      ),
    );
  }

  /// Refresh all
  Future<void> refreshAll() async {
    await Future.wait(<Future<void>>[
      getVendorDashboard(),
      getMyVendorProfile(),
      getVendorStats(),
    ]);
  }
}
