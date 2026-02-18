import 'package:fajimobileapp/features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/verify_password_reset_otp_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';

part 'forgot_password_viewmodel.freezed.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = _Initial;
  const factory ForgotPasswordState.loading() = _Loading;
  const factory ForgotPasswordState.success(String message) = _Success;
  const factory ForgotPasswordState.error(Failure failure) = _Error;
}

class ForgotPasswordViewModel extends StateNotifier<ForgotPasswordState> {
  
  ForgotPasswordViewModel(
    this._forgetPasswordUseCase,
    this._verifyPasswordResetOtpUseCase,
    this._resetPasswordUseCase,
  ) : super(const ForgotPasswordState.initial());
  final dynamic _forgetPasswordUseCase;
  final dynamic _verifyPasswordResetOtpUseCase;
  final dynamic _resetPasswordUseCase;
  
  // Store resetToken from step 2 for step 3
  String? _resetToken;

  /// Send reset code to email
  Future<void> sendResetCode(String email) async {
    state = const ForgotPasswordState.loading();
    
    final result = await _forgetPasswordUseCase.call(email: email);
    
    result.fold(
      (failure) => state = ForgotPasswordState.error(failure),
      (success) => state = const ForgotPasswordState.success(
        'Reset code sent to your email',
      ),
    );
  }

  /// Verify reset code (OTP) and get reset token
  Future<void> verifyResetCode({
    required String email,
    required String otp,
  }) async {
    state = const ForgotPasswordState.loading();
    
    final result = await _verifyPasswordResetOtpUseCase.call(
      email: email,
      otp: otp,
    );
    
    result.fold(
      (failure) => state = ForgotPasswordState.error(failure),
      (resetToken) {
        // Store the reset token for step 3
        _resetToken = resetToken;
        state = const ForgotPasswordState.success('Code verified successfully');
      },
    );
  }

  /// Reset password with new password
  Future<void> resetPassword({
    required String newPassword,
  }) async {
    if (_resetToken == null) {
      state = const ForgotPasswordState.error(
        ServerFailure(message: 'Reset token not found. Please verify OTP again.'),
      );
      return;
    }
    
    state = const ForgotPasswordState.loading();
    
    final result = await _resetPasswordUseCase.call(
      resetToken: _resetToken!,
      newPassword: newPassword,
    );
    
    result.fold(
      (failure) => state = ForgotPasswordState.error(failure),
      (success) => state = const ForgotPasswordState.success(
        'Password reset successfully. Please login with your new password.',
      ),
    );
  }

  void reset() {
    state = const ForgotPasswordState.initial();
    _resetToken = null;
  }
}

final AutoDisposeStateNotifierProvider<ForgotPasswordViewModel, ForgotPasswordState> forgotPasswordViewModelProvider =
    StateNotifierProvider.autoDispose<ForgotPasswordViewModel, ForgotPasswordState>(
  (AutoDisposeStateNotifierProviderRef<ForgotPasswordViewModel, ForgotPasswordState> ref) {
    final ForgetPasswordUseCase forgetPasswordUseCase = ref.watch(forgetPasswordUseCaseProvider);
    final VerifyPasswordResetOtpUseCase verifyPasswordResetOtpUseCase = ref.watch(verifyPasswordResetOtpUseCaseProvider);
    final ResetPasswordUseCase resetPasswordUseCase = ref.watch(resetPasswordUseCaseProvider);
    return ForgotPasswordViewModel(
      forgetPasswordUseCase,
      verifyPasswordResetOtpUseCase,
      resetPasswordUseCase,
    );
  },
);
