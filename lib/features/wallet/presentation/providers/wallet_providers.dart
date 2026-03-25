import 'package:dio/src/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/network/api_client.dart';
import 'package:fajimobileapp/features/wallet/data/datasources/wallet_remote_datasource.dart';
import 'package:fajimobileapp/features/wallet/data/repositories/wallet_repository_impl.dart';
import 'package:fajimobileapp/features/wallet/domain/repositories/wallet_repository.dart';
import 'package:fajimobileapp/features/wallet/domain/usecases/get_wallet_balance_usecase.dart';
import 'package:fajimobileapp/features/wallet/domain/usecases/get_wallet_transactions_usecase.dart';
import 'package:fajimobileapp/features/wallet/domain/usecases/withdraw_funds_usecase.dart';
import 'package:fajimobileapp/features/wallet/domain/usecases/topup_wallet_usecase.dart';
import 'package:fajimobileapp/features/wallet/domain/usecases/get_earnings_breakdown_usecase.dart';
import 'package:fajimobileapp/features/wallet/presentation/viewmodels/wallet_viewmodel.dart';
import 'package:fajimobileapp/features/wallet/presentation/viewmodels/withdraw_viewmodel.dart';
import 'package:fajimobileapp/features/wallet/presentation/viewmodels/topup_viewmodel.dart';

// Data Source Provider
final Provider<WalletRemoteDataSource> walletRemoteDataSourceProvider = Provider<WalletRemoteDataSource>((ProviderRef<WalletRemoteDataSource> ref) {
  final Dio dio = ref.watch(dioProvider);
  return WalletRemoteDataSource(dio);
});

// Repository Provider
final Provider<WalletRepository> walletRepositoryProvider = Provider<WalletRepository>((ProviderRef<WalletRepository> ref) {
  final WalletRemoteDataSource remoteDataSource = ref.watch(walletRemoteDataSourceProvider);
  return WalletRepositoryImpl(remoteDataSource);
});

// Use Case Providers
final Provider<GetWalletBalanceUseCase> getWalletBalanceUseCaseProvider = Provider<GetWalletBalanceUseCase>((ProviderRef<GetWalletBalanceUseCase> ref) {
  final WalletRepository repository = ref.watch(walletRepositoryProvider);
  return GetWalletBalanceUseCase(repository);
});

final Provider<GetWalletTransactionsUseCase> getWalletTransactionsUseCaseProvider =
    Provider<GetWalletTransactionsUseCase>((ProviderRef<GetWalletTransactionsUseCase> ref) {
  final WalletRepository repository = ref.watch(walletRepositoryProvider);
  return GetWalletTransactionsUseCase(repository);
});

final Provider<WithdrawFundsUseCase> withdrawFundsUseCaseProvider = Provider<WithdrawFundsUseCase>((ProviderRef<WithdrawFundsUseCase> ref) {
  final WalletRepository repository = ref.watch(walletRepositoryProvider);
  return WithdrawFundsUseCase(repository);
});

final Provider<TopupWalletUseCase> topupWalletUseCaseProvider = Provider<TopupWalletUseCase>((ProviderRef<TopupWalletUseCase> ref) {
  final WalletRepository repository = ref.watch(walletRepositoryProvider);
  return TopupWalletUseCase(repository);
});

final Provider<GetEarningsBreakdownUseCase> getEarningsBreakdownUseCaseProvider =
    Provider<GetEarningsBreakdownUseCase>((ProviderRef<GetEarningsBreakdownUseCase> ref) {
  final WalletRepository repository = ref.watch(walletRepositoryProvider);
  return GetEarningsBreakdownUseCase(repository);
});

// ViewModel Providers
final StateNotifierProvider<WalletViewModel, WalletState> walletViewModelProvider =
    StateNotifierProvider<WalletViewModel, WalletState>((ref) {
  final GetWalletBalanceUseCase getBalanceUseCase = ref.watch(getWalletBalanceUseCaseProvider);
  final GetWalletTransactionsUseCase getTransactionsUseCase = ref.watch(getWalletTransactionsUseCaseProvider);
  final GetEarningsBreakdownUseCase getEarningsUseCase = ref.watch(getEarningsBreakdownUseCaseProvider);

  return WalletViewModel(
    getBalanceUseCase,
    getTransactionsUseCase,
    getEarningsUseCase,
  );
});

final AutoDisposeStateNotifierProvider<WithdrawViewModel, WithdrawState> withdrawViewModelProvider =
    StateNotifierProvider.autoDispose<WithdrawViewModel, WithdrawState>((AutoDisposeStateNotifierProviderRef<WithdrawViewModel, WithdrawState> ref) {
  final WithdrawFundsUseCase withdrawUseCase = ref.watch(withdrawFundsUseCaseProvider);
  return WithdrawViewModel(withdrawUseCase);
});

final StateNotifierProvider<TopupViewModel, TopupState> topupViewModelProvider =
    StateNotifierProvider<TopupViewModel, TopupState>((ref) {
  final TopupWalletUseCase topupUseCase = ref.watch(topupWalletUseCaseProvider);
  return TopupViewModel(topupUseCase);
});
