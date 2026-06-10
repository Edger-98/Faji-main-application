import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/network/api_client.dart';
import 'package:fajimobileapp/features/cohost/data/datasources/cohost_remote_datasource.dart';
import 'package:fajimobileapp/features/cohost/data/repositories/cohost_repository_impl.dart';
import 'package:fajimobileapp/features/cohost/domain/repositories/cohost_repository.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/invite_cohost_usecase.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/get_cohost_invitations_usecase.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/accept_cohost_invitation_usecase.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/decline_cohost_invitation_usecase.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/get_event_cohosts_usecase.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/remove_cohost_usecase.dart';
import 'package:fajimobileapp/features/cohost/domain/usecases/get_cohost_dashboard_usecase.dart';
import 'package:fajimobileapp/features/cohost/presentation/viewmodels/cohost_invitation_viewmodel.dart';
import 'package:fajimobileapp/features/cohost/presentation/viewmodels/cohost_dashboard_viewmodel.dart';

// Data Source Provider
final Provider<CohostRemoteDataSource> cohostRemoteDataSourceProvider = Provider<CohostRemoteDataSource>((ProviderRef<CohostRemoteDataSource> ref) {
  final dio = ref.watch(dioProvider);
  return CohostRemoteDataSource(dio);
});

// Repository Provider
final Provider<CohostRepository> cohostRepositoryProvider = Provider<CohostRepository>((ProviderRef<CohostRepository> ref) {
  final CohostRemoteDataSource remoteDataSource = ref.watch(cohostRemoteDataSourceProvider);
  return CohostRepositoryImpl(remoteDataSource);
});

// Use Case Providers
final Provider<InviteCohostUseCase> inviteCohostUseCaseProvider = Provider<InviteCohostUseCase>((ProviderRef<InviteCohostUseCase> ref) {
  final CohostRepository repository = ref.watch(cohostRepositoryProvider);
  return InviteCohostUseCase(repository);
});

final Provider<GetCohostInvitationsUseCase> getCohostInvitationsUseCaseProvider =
    Provider<GetCohostInvitationsUseCase>((ProviderRef<GetCohostInvitationsUseCase> ref) {
  final CohostRepository repository = ref.watch(cohostRepositoryProvider);
  return GetCohostInvitationsUseCase(repository);
});

final Provider<AcceptCohostInvitationUseCase> acceptCohostInvitationUseCaseProvider =
    Provider<AcceptCohostInvitationUseCase>((ProviderRef<AcceptCohostInvitationUseCase> ref) {
  final CohostRepository repository = ref.watch(cohostRepositoryProvider);
  return AcceptCohostInvitationUseCase(repository);
});

final Provider<DeclineCohostInvitationUseCase> declineCohostInvitationUseCaseProvider =
    Provider<DeclineCohostInvitationUseCase>((ProviderRef<DeclineCohostInvitationUseCase> ref) {
  final CohostRepository repository = ref.watch(cohostRepositoryProvider);
  return DeclineCohostInvitationUseCase(repository);
});

final Provider<GetEventCohostsUseCase> getEventCohostsUseCaseProvider = Provider<GetEventCohostsUseCase>((ProviderRef<GetEventCohostsUseCase> ref) {
  final CohostRepository repository = ref.watch(cohostRepositoryProvider);
  return GetEventCohostsUseCase(repository);
});

final Provider<RemoveCohostUseCase> removeCohostUseCaseProvider = Provider<RemoveCohostUseCase>((ProviderRef<RemoveCohostUseCase> ref) {
  final CohostRepository repository = ref.watch(cohostRepositoryProvider);
  return RemoveCohostUseCase(repository);
});

final Provider<GetCohostDashboardUseCase> getCohostDashboardUseCaseProvider =
    Provider<GetCohostDashboardUseCase>((ProviderRef<GetCohostDashboardUseCase> ref) {
  final CohostRepository repository = ref.watch(cohostRepositoryProvider);
  return GetCohostDashboardUseCase(repository);
});

// ViewModel Providers
final AutoDisposeStateNotifierProvider<CohostInvitationViewModel, CohostInvitationState> cohostInvitationViewModelProvider = StateNotifierProvider.autoDispose<
    CohostInvitationViewModel, CohostInvitationState>((AutoDisposeStateNotifierProviderRef<CohostInvitationViewModel, CohostInvitationState> ref) {
  final InviteCohostUseCase inviteUseCase = ref.watch(inviteCohostUseCaseProvider);
  final GetCohostInvitationsUseCase getInvitationsUseCase = ref.watch(getCohostInvitationsUseCaseProvider);
  final AcceptCohostInvitationUseCase acceptUseCase = ref.watch(acceptCohostInvitationUseCaseProvider);
  final DeclineCohostInvitationUseCase declineUseCase = ref.watch(declineCohostInvitationUseCaseProvider);
  final GetEventCohostsUseCase getEventCohostsUseCase = ref.watch(getEventCohostsUseCaseProvider);
  final RemoveCohostUseCase removeUseCase = ref.watch(removeCohostUseCaseProvider);

  return CohostInvitationViewModel(
    inviteUseCase,
    getInvitationsUseCase,
    acceptUseCase,
    declineUseCase,
    getEventCohostsUseCase,
    removeUseCase,
  );
});

final AutoDisposeStateNotifierProvider<CohostDashboardViewModel, CohostDashboardState> cohostDashboardViewModelProvider = StateNotifierProvider.autoDispose<
    CohostDashboardViewModel, CohostDashboardState>((AutoDisposeStateNotifierProviderRef<CohostDashboardViewModel, CohostDashboardState> ref) {
  final GetCohostDashboardUseCase getDashboardUseCase = ref.watch(getCohostDashboardUseCaseProvider);
  return CohostDashboardViewModel(getDashboardUseCase);
});
