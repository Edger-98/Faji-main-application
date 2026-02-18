import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/services/toast_service.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/forgot_password_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/auth_widgets.dart';

/// Forgot password screen - Enter email to receive reset code
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final String email = _emailController.text.trim();
    
    if (email.isEmpty) {
      _showError('Please enter your email');
      return;
    }
    
    if (!_isValidEmail(email)) {
      _showError('Please enter a valid email address');
      return;
    }
    
    ref.read(forgotPasswordViewModelProvider.notifier).sendResetCode(email);
  }

  bool _isValidEmail(String email) => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

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
          _showSuccess(message);
          // Navigate to OTP verification screen
          context.push(
            RouteManager.forgotPasswordOtp,
            extra: _emailController.text.trim(),
          );
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
                  'Forgot Password?',
                  color: context.colors.onSurface,
                ),
                
                SizedBox(height: 12.h),
                
                // Description
                AppText.bodyMedium(
                  "Enter your email address and we'll send you a code to reset your password.",
                  color: context.colors.onSurfaceVariant,
                ),
                
                SizedBox(height: 40.h),
                
                // Email field
                AppText.bodyMedium(
                  'Email Address',
                  color: context.colors.onSurface,
                ),
                SizedBox(height: 12.h),
                AppTextField(
                  hintText: 'Enter your email',
                  controller: _emailController,
                  enabled: !isLoading,
                  keyboardType: TextInputType.emailAddress,
                  onSubmitted: (_) => _handleSubmit(),
                ),
                
                SizedBox(height: 40.h),
                
                // Submit button
                Center(
                  child: AuthButton(
                    text: isLoading ? 'Sending...' : 'Send Reset Code',
                    width: 337.w,
                    height: 69.h,
                    onPressed: isLoading ? null : _handleSubmit,
                  ),
                ),
                
                SizedBox(height: 24.h),
                
                // Back to login
                Center(
                  child: TextButton(
                    onPressed: () => context.pop(),
                    child: AppText.bodyMedium(
                      'Back to Login',
                      color: context.colors.primary,
                    ),
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
