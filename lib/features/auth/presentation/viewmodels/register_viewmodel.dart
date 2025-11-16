import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/base/base_state.dart';
import '../../domain/entities/auth_token_entity.dart';
import '../../domain/usecases/register_usecase.dart';
import '../providers/auth_providers.dart';

/// Register ViewModel
class RegisterViewModel extends StateNotifier<BaseState<AuthTokenEntity>> {
  final RegisterUseCase _registerUseCase;

  RegisterViewModel(this._registerUseCase) : super(const BaseState.initial());

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? phoneNumber,
  }) async {
    state = const BaseState.loading();

    final result = await _registerUseCase(
      email: email,
      phoneNo: phoneNumber ?? '',
      password: password,
      firstName: firstName,
      lastName: lastName,
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

/// Register ViewModel Provider
final registerViewModelProvider =
    StateNotifierProvider.autoDispose<RegisterViewModel, BaseState<AuthTokenEntity>>(
  (ref) {
    final registerUseCase = ref.watch(registerUseCaseProvider);
    return RegisterViewModel(registerUseCase);
  },
);
