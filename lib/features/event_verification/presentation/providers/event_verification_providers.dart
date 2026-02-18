import 'package:dio/src/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/network/api_client.dart';
import 'package:fajimobileapp/core/network/network_info.dart';
import 'package:fajimobileapp/features/event_verification/data/datasources/event_verification_remote_datasource.dart';
import 'package:fajimobileapp/features/event_verification/data/repositories/event_verification_repository_impl.dart';
import 'package:fajimobileapp/features/event_verification/domain/repositories/event_verification_repository.dart';
import 'package:fajimobileapp/features/event_verification/domain/usecases/get_revenue_distribution_usecase.dart';
import 'package:fajimobileapp/features/event_verification/domain/usecases/get_verification_status_usecase.dart';
import 'package:fajimobileapp/features/event_verification/domain/usecases/process_refunds_usecase.dart';
import 'package:fajimobileapp/features/event_verification/domain/usecases/verify_event_usecase.dart';

// ============================================================================
// Data Sources
// ============================================================================

/// Event Verification Remote Data Source Provider
final Provider<EventVerificationRemoteDataSource> eventVerificationRemoteDataSourceProvider =
    Provider<EventVerificationRemoteDataSource>((ProviderRef<EventVerificationRemoteDataSource> ref) {
  final Dio dio = ref.watch(dioProvider);
  return EventVerificationRemoteDataSource(dio);
});

// ============================================================================
// Repository
// ============================================================================

/// Event Verification Repository Provider
final Provider<EventVerificationRepository> eventVerificationRepositoryProvider =
    Provider<EventVerificationRepository>((ProviderRef<EventVerificationRepository> ref) {
  final EventVerificationRemoteDataSource remoteDataSource = ref.watch(eventVerificationRemoteDataSourceProvider);
  final NetworkInfo networkInfo = ref.watch(networkInfoProvider);

  return EventVerificationRepositoryImpl(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});

// ============================================================================
// Use Cases
// ============================================================================

/// Get Verification Status Use Case Provider
final Provider<GetVerificationStatusUseCase> getVerificationStatusUseCaseProvider =
    Provider<GetVerificationStatusUseCase>((ProviderRef<GetVerificationStatusUseCase> ref) {
  final EventVerificationRepository repository = ref.watch(eventVerificationRepositoryProvider);
  return GetVerificationStatusUseCase(repository);
});

/// Verify Event Use Case Provider
final Provider<VerifyEventUseCase> verifyEventUseCaseProvider = Provider<VerifyEventUseCase>((ProviderRef<VerifyEventUseCase> ref) {
  final EventVerificationRepository repository = ref.watch(eventVerificationRepositoryProvider);
  return VerifyEventUseCase(repository);
});

/// Get Revenue Distribution Use Case Provider
final Provider<GetRevenueDistributionUseCase> getRevenueDistributionUseCaseProvider =
    Provider<GetRevenueDistributionUseCase>((ProviderRef<GetRevenueDistributionUseCase> ref) {
  final EventVerificationRepository repository = ref.watch(eventVerificationRepositoryProvider);
  return GetRevenueDistributionUseCase(repository);
});

/// Process Refunds Use Case Provider
final Provider<ProcessRefundsUseCase> processRefundsUseCaseProvider = Provider<ProcessRefundsUseCase>((ProviderRef<ProcessRefundsUseCase> ref) {
  final EventVerificationRepository repository = ref.watch(eventVerificationRepositoryProvider);
  return ProcessRefundsUseCase(repository);
});
