import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/auth/domain/entities/auth_token_entity.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/login_usecase.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';

/// Login ViewModel
class LoginViewModel extends StateNotifier<BaseState<AuthTokenEntity>> {

  LoginViewModel(this._loginUseCase) : super(const BaseState.initial());
  final LoginUseCase _loginUseCase;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const BaseState.loading();

    final Either<Failure, AuthTokenEntity> result = await _loginUseCase(
      email: email,
      password: password,
    );

    result.fold(
      (Failure failure) => state = BaseState.error(failure),
      (AuthTokenEntity token) => state = BaseState.success(token),
    );
  }

  void reset() {
    state = const BaseState.initial();
  }
}

/// Login ViewModel Provider
final AutoDisposeStateNotifierProvider<LoginViewModel, BaseState<AuthTokenEntity>> loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, BaseState<AuthTokenEntity>>(
  (AutoDisposeStateNotifierProviderRef<LoginViewModel, BaseState<AuthTokenEntity>> ref) {
    final LoginUseCase loginUseCase = ref.watch(loginUseCaseProvider);
    return LoginViewModel(loginUseCase);
  },
);
