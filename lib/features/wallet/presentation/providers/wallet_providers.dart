import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/wallet_remote_datasource.dart';
import '../../data/repositories/wallet_repository_impl.dart';
import '../../domain/repositories/wallet_repository.dart';
import '../../domain/usecases/get_wallet_balance_usecase.dart';
import '../../domain/usecases/get_wallet_transactions_usecase.dart';
import '../../domain/usecases/withdraw_funds_usecase.dart';
import '../../domain/usecases/topup_wallet_usecase.dart';
import '../../domain/usecases/get_earnings_breakdown_usecase.dart';
import '../viewmodels/wallet_viewmodel.dart';
import '../viewmodels/withdraw_viewmodel.dart';
import '../viewmodels/topup_viewmodel.dart';

// Data Source Provider
final walletRemoteDataSourceProvider = Provider<WalletRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return WalletRemoteDataSource(dio);
});

// Repository Provider
final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  final remoteDataSource = ref.watch(walletRemoteDataSourceProvider);
  return WalletRepositoryImpl(remoteDataSource);
});

// Use Case Providers
final getWalletBalanceUseCaseProvider = Provider<GetWalletBalanceUseCase>((ref) {
  final repository = ref.watch(walletRepositoryProvider);
  return GetWalletBalanceUseCase(repository);
});

final getWalletTransactionsUseCaseProvider =
    Provider<GetWalletTransactionsUseCase>((ref) {
  final repository = ref.watch(walletRepositoryProvider);
  return GetWalletTransactionsUseCase(repository);
});

final withdrawFundsUseCaseProvider = Provider<WithdrawFundsUseCase>((ref) {
  final repository = ref.watch(walletRepositoryProvider);
  return WithdrawFundsUseCase(repository);
});

final topupWalletUseCaseProvider = Provider<TopupWalletUseCase>((ref) {
  final repository = ref.watch(walletRepositoryProvider);
  return TopupWalletUseCase(repository);
});

final getEarningsBreakdownUseCaseProvider =
    Provider<GetEarningsBreakdownUseCase>((ref) {
  final repository = ref.watch(walletRepositoryProvider);
  return GetEarningsBreakdownUseCase(repository);
});

// ViewModel Providers
final walletViewModelProvider =
    StateNotifierProvider.autoDispose<WalletViewModel, WalletState>((ref) {
  final getBalanceUseCase = ref.watch(getWalletBalanceUseCaseProvider);
  final getTransactionsUseCase = ref.watch(getWalletTransactionsUseCaseProvider);
  final getEarningsUseCase = ref.watch(getEarningsBreakdownUseCaseProvider);

  return WalletViewModel(
    getBalanceUseCase,
    getTransactionsUseCase,
    getEarningsUseCase,
  );
});

final withdrawViewModelProvider =
    StateNotifierProvider.autoDispose<WithdrawViewModel, WithdrawState>((ref) {
  final withdrawUseCase = ref.watch(withdrawFundsUseCaseProvider);
  return WithdrawViewModel(withdrawUseCase);
});

final topupViewModelProvider =
    StateNotifierProvider.autoDispose<TopupViewModel, TopupState>((ref) {
  final topupUseCase = ref.watch(topupWalletUseCaseProvider);
  return TopupViewModel(topupUseCase);
});
