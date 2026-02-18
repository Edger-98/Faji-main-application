import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/features/auth/domain/entities/auth_token_entity.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/register_usecase.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';

/// Register ViewModel
class RegisterViewModel extends StateNotifier<BaseState<AuthTokenEntity>> {

  RegisterViewModel(this._registerUseCase) : super(const BaseState.initial());
  final RegisterUseCase _registerUseCase;

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? phoneNumber,
  }) async {
    state = const BaseState.loading();

    final Either<Failure, AuthTokenEntity> result = await _registerUseCase(
      email: email,
      phoneNo: phoneNumber ?? '',
      password: password,
      firstName: firstName,
      lastName: lastName,
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

/// Register ViewModel Provider
final AutoDisposeStateNotifierProvider<RegisterViewModel, BaseState<AuthTokenEntity>> registerViewModelProvider =
    StateNotifierProvider.autoDispose<RegisterViewModel, BaseState<AuthTokenEntity>>(
  (AutoDisposeStateNotifierProviderRef<RegisterViewModel, BaseState<AuthTokenEntity>> ref) {
    final RegisterUseCase registerUseCase = ref.watch(registerUseCaseProvider);
    return RegisterViewModel(registerUseCase);
  },
);
