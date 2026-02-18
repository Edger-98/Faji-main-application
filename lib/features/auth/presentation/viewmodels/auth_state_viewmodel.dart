import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/auth/domain/entities/user_entity.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/logout_usecase.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';

/// Auth State ViewModel - manages global auth state
class AuthStateViewModel extends StateNotifier<BaseState<UserEntity?>> {

  AuthStateViewModel(
    this._getCurrentUserUseCase,
    this._logoutUseCase,
  ) : super(const BaseState.initial());
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final LogoutUseCase _logoutUseCase;

  Future<void> checkAuthStatus() async {
    state = const BaseState.loading();

    final Either<Failure, UserEntity> result = await _getCurrentUserUseCase();

    result.fold(
      (Failure failure) => state = const BaseState.success(null),
      (UserEntity user) => state = BaseState.success(user),
    );
  }

  Future<void> logout() async {
    state = const BaseState.loading();

    final Either<Failure, bool> result = await _logoutUseCase();

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (_) => state = const BaseState.success(null),
    );
  }

  void setUser(UserEntity user) {
    state = BaseState.success(user);
  }

  void clearUser() {
    state = const BaseState.success(null);
  }
}

/// Auth State ViewModel Provider
final StateNotifierProvider<AuthStateViewModel, BaseState<UserEntity?>> authStateViewModelProvider =
    StateNotifierProvider<AuthStateViewModel, BaseState<UserEntity?>>(
  (StateNotifierProviderRef<AuthStateViewModel, BaseState<UserEntity?>> ref) {
    final GetCurrentUserUseCase getCurrentUserUseCase = ref.watch(getCurrentUserUseCaseProvider);
    final LogoutUseCase logoutUseCase = ref.watch(logoutUseCaseProvider);
    return AuthStateViewModel(getCurrentUserUseCase, logoutUseCase);
  },
);

/// Helper provider to check if user is authenticated
final Provider<bool> isAuthenticatedProvider = Provider<bool>((ProviderRef<bool> ref) {
  final BaseState<UserEntity?> authState = ref.watch(authStateViewModelProvider);
  return authState.maybeWhen(
    success: (UserEntity? user) => user != null,
    orElse: () => false,
  );
});

/// Helper provider to get current user
final Provider<UserEntity?> currentUserProvider = Provider<UserEntity?>((ProviderRef<UserEntity?> ref) {
  final BaseState<UserEntity?> authState = ref.watch(authStateViewModelProvider);
  return authState.maybeWhen(
    success: (UserEntity? user) => user,
    orElse: () => null,
  );
});
