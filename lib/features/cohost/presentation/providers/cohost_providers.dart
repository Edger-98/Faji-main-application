import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/dio_client.dart';
import '../../data/datasources/cohost_remote_datasource.dart';
import '../../data/repositories/cohost_repository_impl.dart';
import '../../domain/repositories/cohost_repository.dart';
import '../../domain/usecases/invite_cohost_usecase.dart';
import '../../domain/usecases/get_cohost_invitations_usecase.dart';
import '../../domain/usecases/accept_cohost_invitation_usecase.dart';
import '../../domain/usecases/decline_cohost_invitation_usecase.dart';
import '../../domain/usecases/get_event_cohosts_usecase.dart';
import '../../domain/usecases/remove_cohost_usecase.dart';
import '../../domain/usecases/get_cohost_dashboard_usecase.dart';
import '../viewmodels/cohost_invitation_viewmodel.dart';
import '../viewmodels/cohost_dashboard_viewmodel.dart';

// Data Source Provider
final cohostRemoteDataSourceProvider = Provider<CohostRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return CohostRemoteDataSource(dio);
});

// Repository Provider
final cohostRepositoryProvider = Provider<CohostRepository>((ref) {
  final remoteDataSource = ref.watch(cohostRemoteDataSourceProvider);
  return CohostRepositoryImpl(remoteDataSource);
});

// Use Case Providers
final inviteCohostUseCaseProvider = Provider<InviteCohostUseCase>((ref) {
  final repository = ref.watch(cohostRepositoryProvider);
  return InviteCohostUseCase(repository);
});

final getCohostInvitationsUseCaseProvider =
    Provider<GetCohostInvitationsUseCase>((ref) {
  final repository = ref.watch(cohostRepositoryProvider);
  return GetCohostInvitationsUseCase(repository);
});

final acceptCohostInvitationUseCaseProvider =
    Provider<AcceptCohostInvitationUseCase>((ref) {
  final repository = ref.watch(cohostRepositoryProvider);
  return AcceptCohostInvitationUseCase(repository);
});

final declineCohostInvitationUseCaseProvider =
    Provider<DeclineCohostInvitationUseCase>((ref) {
  final repository = ref.watch(cohostRepositoryProvider);
  return DeclineCohostInvitationUseCase(repository);
});

final getEventCohostsUseCaseProvider = Provider<GetEventCohostsUseCase>((ref) {
  final repository = ref.watch(cohostRepositoryProvider);
  return GetEventCohostsUseCase(repository);
});

final removeCohostUseCaseProvider = Provider<RemoveCohostUseCase>((ref) {
  final repository = ref.watch(cohostRepositoryProvider);
  return RemoveCohostUseCase(repository);
});

final getCohostDashboardUseCaseProvider =
    Provider<GetCohostDashboardUseCase>((ref) {
  final repository = ref.watch(cohostRepositoryProvider);
  return GetCohostDashboardUseCase(repository);
});

// ViewModel Providers
final cohostInvitationViewModelProvider = StateNotifierProvider.autoDispose<
    CohostInvitationViewModel, CohostInvitationState>((ref) {
  final inviteUseCase = ref.watch(inviteCohostUseCaseProvider);
  final getInvitationsUseCase = ref.watch(getCohostInvitationsUseCaseProvider);
  final acceptUseCase = ref.watch(acceptCohostInvitationUseCaseProvider);
  final declineUseCase = ref.watch(declineCohostInvitationUseCaseProvider);
  final getEventCohostsUseCase = ref.watch(getEventCohostsUseCaseProvider);
  final removeUseCase = ref.watch(removeCohostUseCaseProvider);

  return CohostInvitationViewModel(
    inviteUseCase,
    getInvitationsUseCase,
    acceptUseCase,
    declineUseCase,
    getEventCohostsUseCase,
    removeUseCase,
  );
});

final cohostDashboardViewModelProvider = StateNotifierProvider.autoDispose<
    CohostDashboardViewModel, CohostDashboardState>((ref) {
  final getDashboardUseCase = ref.watch(getCohostDashboardUseCaseProvider);
  return CohostDashboardViewModel(getDashboardUseCase);
});
