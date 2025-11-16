import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/services/toast_service.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/login_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/auth_state_viewmodel.dart';

/// Login screen for existing users
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    // Basic validation
    if (_emailController.text.trim().isEmpty) {
      _showError('Email is required');
      return;
    }
    if (!_emailController.text.contains('@')) {
      _showError('Enter a valid email');
      return;
    }
    if (_passwordController.text.isEmpty) {
      _showError('Password is required');
      return;
    }
    if (_passwordController.text.length < 6) {
      _showError('Password must be at least 6 characters');
      return;
    }
    
    ref.read(loginViewModelProvider.notifier).login(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
  }

  void _showError(String message) {
    ToastService.showError(
      context: context,
      message: message,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Listen to login state
    ref.listen(loginViewModelProvider, (previous, next) {
      next.when(
        initial: () {},
        loading: () {},
        success: (token) async {
          // Fetch user data
          await ref.read(authStateViewModelProvider.notifier).checkAuthStatus();
          
          // Navigate directly to home after first login
          context.go(RouteManager.home);
        },
        error: (failure) {
          _showError(failure.message);
        },
      );
    });

    final loginState = ref.watch(loginViewModelProvider);
    final isLoading = loginState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(height: 40.h),
                
                // Back button
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHighest,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: context.colors.onSurface,
                      size: 16.sp,
                    ),
                  ),
                ),
                
                SizedBox(height: 40.h),
                
                // Title
                AppText.displayLarge(
                  'Welcome back',
                  color: context.colors.onSurface,
                ),
                
                SizedBox(height: 12.h),
                
                // Subtitle
                AppText.bodyMedium(
                  'Sign in to continue',
                  color: context.colors.onSurfaceVariant,
                ),
                
                SizedBox(height: 60.h),
                
                // Email field
                AppText.bodyMedium(
                  'Email',
                  color: context.colors.onSurface,
                ),
                SizedBox(height: 12.h),
                AppTextField(
                  hintText: 'Enter your email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  enabled: !isLoading,
                ),
                
                SizedBox(height: 24.h),
                
                // Password field
                AppText.bodyMedium(
                  'Password',
                  color: context.colors.onSurface,
                ),
                SizedBox(height: 12.h),
                AppTextField(
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  enabled: !isLoading,
                  suffixWidget: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: context.colors.onSurfaceVariant,
                      size: 20.sp,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                
                SizedBox(height: 16.h),
                
                // Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Implement forgot password
                    },
                    child: AppText.bodySmall(
                      'Forgot password?',
                      color: context.colors.primary,
                    ),
                  ),
                ),
                
                SizedBox(height: 40.h),
                
                // Sign in button
                Center(
                  child: AuthButton(
                    text: isLoading ? 'Signing In...' : 'Sign In',
                    width: 337.w,
                    height: 69.h,
                    onPressed: isLoading ? null : _handleLogin,
                  ),
                ),
                
                SizedBox(height: 24.h),
                
                // Sign up link
                Center(
                  child: TextButton(
                    onPressed: () {
                      context.go(RouteManager.authEmail);
                    },
                    child: AppText.bodyMedium(
                      'Don\'t have an account? Sign up',
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ),
                
                SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
