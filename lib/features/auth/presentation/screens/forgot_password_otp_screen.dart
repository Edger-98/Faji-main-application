import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/services/toast_service.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/forgot_password_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/auth_widgets.dart';

/// OTP verification screen for password reset
class ForgotPasswordOtpScreen extends ConsumerStatefulWidget {
  
  const ForgotPasswordOtpScreen({
    required this.email,
    super.key,
  });
  final String email;

  @override
  ConsumerState<ForgotPasswordOtpScreen> createState() => _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState extends ConsumerState<ForgotPasswordOtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _handleVerify() {
    final String otp = _otpController.text.trim();
    
    if (otp.isEmpty) {
      _showError('Please enter the verification code');
      return;
    }
    
    if (otp.length < 6) {
      _showError('Please enter a valid 6-digit code');
      return;
    }
    
    ref.read(forgotPasswordViewModelProvider.notifier).verifyResetCode(
      email: widget.email,
      otp: otp,
    );
  }

  void _handleResendCode() {
    ref.read(forgotPasswordViewModelProvider.notifier).sendResetCode(widget.email);
  }

  void _showError(String message) {
    ToastService.showError(
      context: context,
      message: message,
    );
  }

  void _showSuccess(String message) {
    ToastService.showSuccess(
      context: context,
      message: message,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(forgotPasswordViewModelProvider, (ForgotPasswordState? previous, ForgotPasswordState next) {
      next.when(
        initial: () {},
        loading: () {},
        success: (String message) {
          if (message.contains('verified') || message.contains('correct')) {
            _showSuccess(message);
            // Navigate to reset password screen
            context.push(
              RouteManager.resetPassword,
              extra: <String, String>{
                'email': widget.email,
                'otp': _otpController.text.trim(),
              },
            );
          } else {
            _showSuccess(message);
          }
        },
        error: (Failure failure) {
          _showError(failure.message);
        },
      );
    });

    final ForgotPasswordState state = ref.watch(forgotPasswordViewModelProvider);
    final bool isLoading = state.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: context.colors.onSurface,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.h),
                
                // Title
                AppText.displayLarge(
                  'Verify Code',
                  color: context.colors.onSurface,
                ),
                
                SizedBox(height: 12.h),
                
                // Description
                AppText.bodyMedium(
                  'We sent a verification code to\n${widget.email}',
                  color: context.colors.onSurfaceVariant,
                ),
                
                SizedBox(height: 40.h),
                
                // OTP input
                AppText.bodyMedium(
                  'Enter Code',
                  color: context.colors.onSurface,
                ),
                SizedBox(height: 12.h),
                OtpInputField(
                  controller: _otpController,
                  enabled: !isLoading,
                  onCompleted: (_) => _handleVerify(),
                ),
                
                SizedBox(height: 24.h),
                
                // Resend code
                Center(
                  child: TextButton(
                    onPressed: isLoading ? null : _handleResendCode,
                    child: AppText.bodyMedium(
                      "Didn't receive code? Resend",
                      color: context.colors.primary,
                    ),
                  ),
                ),
                
                SizedBox(height: 40.h),
                
                // Verify button
                Center(
                  child: AuthButton(
                    text: isLoading ? 'Verifying...' : 'Verify Code',
                    width: 337.w,
                    height: 69.h,
                    onPressed: isLoading ? null : _handleVerify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
