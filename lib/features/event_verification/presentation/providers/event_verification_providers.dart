import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/network_info.dart';
import '../../data/datasources/event_verification_remote_datasource.dart';
import '../../data/repositories/event_verification_repository_impl.dart';
import '../../domain/repositories/event_verification_repository.dart';
import '../../domain/usecases/get_revenue_distribution_usecase.dart';
import '../../domain/usecases/get_verification_status_usecase.dart';
import '../../domain/usecases/process_refunds_usecase.dart';
import '../../domain/usecases/verify_event_usecase.dart';

// ============================================================================
// Data Sources
// ============================================================================

/// Event Verification Remote Data Source Provider
final eventVerificationRemoteDataSourceProvider =
    Provider<EventVerificationRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return EventVerificationRemoteDataSource(dio);
});

// ============================================================================
// Repository
// ============================================================================

/// Event Verification Repository Provider
final eventVerificationRepositoryProvider =
    Provider<EventVerificationRepository>((ref) {
  final remoteDataSource = ref.watch(eventVerificationRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);

  return EventVerificationRepositoryImpl(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});

// ============================================================================
// Use Cases
// ============================================================================

/// Get Verification Status Use Case Provider
final getVerificationStatusUseCaseProvider =
    Provider<GetVerificationStatusUseCase>((ref) {
  final repository = ref.watch(eventVerificationRepositoryProvider);
  return GetVerificationStatusUseCase(repository);
});

/// Verify Event Use Case Provider
final verifyEventUseCaseProvider = Provider<VerifyEventUseCase>((ref) {
  final repository = ref.watch(eventVerificationRepositoryProvider);
  return VerifyEventUseCase(repository);
});

/// Get Revenue Distribution Use Case Provider
final getRevenueDistributionUseCaseProvider =
    Provider<GetRevenueDistributionUseCase>((ref) {
  final repository = ref.watch(eventVerificationRepositoryProvider);
  return GetRevenueDistributionUseCase(repository);
});

/// Process Refunds Use Case Provider
final processRefundsUseCaseProvider = Provider<ProcessRefundsUseCase>((ref) {
  final repository = ref.watch(eventVerificationRepositoryProvider);
  return ProcessRefundsUseCase(repository);
});
