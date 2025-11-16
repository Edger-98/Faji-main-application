import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../providers/auth_providers.dart';

/// Auth State ViewModel - manages global auth state
class AuthStateViewModel extends StateNotifier<BaseState<UserEntity?>> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthStateViewModel(
    this._getCurrentUserUseCase,
    this._logoutUseCase,
  ) : super(const BaseState.initial());

  Future<void> checkAuthStatus() async {
    state = const BaseState.loading();

    final result = await _getCurrentUserUseCase();

    result.fold(
      (failure) => state = const BaseState.success(null),
      (user) => state = BaseState.success(user),
    );
  }

  Future<void> logout() async {
    state = const BaseState.loading();

    final result = await _logoutUseCase();

    result.fold(
      (failure) => state = BaseState.error(failure),
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
final authStateViewModelProvider =
    StateNotifierProvider<AuthStateViewModel, BaseState<UserEntity?>>(
  (ref) {
    final getCurrentUserUseCase = ref.watch(getCurrentUserUseCaseProvider);
    final logoutUseCase = ref.watch(logoutUseCaseProvider);
    return AuthStateViewModel(getCurrentUserUseCase, logoutUseCase);
  },
);

/// Helper provider to check if user is authenticated
final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateViewModelProvider);
  return authState.maybeWhen(
    success: (user) => user != null,
    orElse: () => false,
  );
});

/// Helper provider to get current user
final currentUserProvider = Provider<UserEntity?>((ref) {
  final authState = ref.watch(authStateViewModelProvider);
  return authState.maybeWhen(
    success: (user) => user,
    orElse: () => null,
  );
});
