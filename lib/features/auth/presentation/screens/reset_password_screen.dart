import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/services/toast_service.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/forgot_password_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/auth_widgets.dart';

/// Reset password screen - Enter new password
class ResetPasswordScreen extends ConsumerStatefulWidget {
  
  const ResetPasswordScreen({
    required this.email,
    required this.otp,
    super.key,
  });
  final String email;
  final String otp;

  @override
  ConsumerState<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleReset() {
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;
    
    if (password.isEmpty) {
      _showError('Please enter a new password');
      return;
    }
    
    if (password.length < 6) {
      _showError('Password must be at least 6 characters');
      return;
    }
    
    if (password != confirmPassword) {
      _showError('Passwords do not match');
      return;
    }
    
    ref.read(forgotPasswordViewModelProvider.notifier).resetPassword(
      newPassword: password,
    );
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
          _showSuccess(message);
          // Navigate back to login
          context.go(RouteManager.login);
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
                  'Reset Password',
                  color: context.colors.onSurface,
                ),
                
                SizedBox(height: 12.h),
                
                // Description
                AppText.bodyMedium(
                  'Enter your new password below.',
                  color: context.colors.onSurfaceVariant,
                ),
                
                SizedBox(height: 40.h),
                
                // New password field
                AppText.bodyMedium(
                  'New Password',
                  color: context.colors.onSurface,
                ),
                SizedBox(height: 12.h),
                AppTextField(
                  hintText: 'Enter new password',
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  enabled: !isLoading,
                  suffixWidget: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: context.colors.onSurfaceVariant,
                      size: 20.sp,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                
                SizedBox(height: 24.h),
                
                // Confirm password field
                AppText.bodyMedium(
                  'Confirm Password',
                  color: context.colors.onSurface,
                ),
                SizedBox(height: 12.h),
                AppTextField(
                  hintText: 'Confirm new password',
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  enabled: !isLoading,
                  onSubmitted: (_) => _handleReset(),
                  suffixWidget: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                      color: context.colors.onSurfaceVariant,
                      size: 20.sp,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ),
                
                SizedBox(height: 16.h),
                
                // Password requirements
                AppText.bodySmall(
                  '• Password must be at least 6 characters',
                  color: context.colors.onSurfaceVariant,
                ),
                
                SizedBox(height: 40.h),
                
                // Reset button
                Center(
                  child: AuthButton(
                    text: isLoading ? 'Resetting...' : 'Reset Password',
                    width: 337.w,
                    height: 69.h,
                    onPressed: isLoading ? null : _handleReset,
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
