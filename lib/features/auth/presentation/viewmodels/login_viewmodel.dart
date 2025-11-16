import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/auth_token_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import '../providers/auth_providers.dart';

/// Login ViewModel
class LoginViewModel extends StateNotifier<BaseState<AuthTokenEntity>> {
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase) : super(const BaseState.initial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const BaseState.loading();

    final result = await _loginUseCase(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => state = BaseState.error(failure),
      (token) => state = BaseState.success(token),
    );
  }

  void reset() {
    state = const BaseState.initial();
  }
}

/// Login ViewModel Provider
final loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, BaseState<AuthTokenEntity>>(
  (ref) {
    final loginUseCase = ref.watch(loginUseCaseProvider);
    return LoginViewModel(loginUseCase);
  },
);
