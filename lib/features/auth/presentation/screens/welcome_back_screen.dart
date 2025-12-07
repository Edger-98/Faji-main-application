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
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';

/// Welcome back screen - Quick login with just password
class WelcomeBackScreen extends ConsumerStatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  ConsumerState<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends ConsumerState<WelcomeBackScreen> {
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _userEmail = '';
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final localDataSource = ref.read(authLocalDataSourceProvider);
    final userData = await localDataSource.getUserData();
    
    setState(() {
      _userEmail = userData['email'] ?? '';
      _userName = userData['firstName'] ?? 'there';
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_passwordController.text.isEmpty) {
      _showError('Password is required');
      return;
    }
    if (_passwordController.text.length < 6) {
      _showError('Password must be at least 6 characters');
      return;
    }
    
    ref.read(loginViewModelProvider.notifier).login(
          email: _userEmail,
          password: _passwordController.text,
        );
  }

  void _showError(String message) {
    ToastService.showError(
      context: context,
      message: message,
    );
  }

  void _switchAccount() {
    // Clear saved data and go to login
    context.go(RouteManager.login);
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
          
          // Navigate to home
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                
                // Welcome back message
                Center(
                  child: Column(
                    children: [
                      // User avatar placeholder
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: context.colors.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 50.sp,
                          color: context.colors.primary,
                        ),
                      ),
                      
                      SizedBox(height: 24.h),
                      
                      // Welcome text
                      AppText.displayLarge(
                        'Welcome back,',
                        color: context.colors.onSurface,
                      ),
                      
                      SizedBox(height: 8.h),
                      
                      // User name
                      AppText.displayLarge(
                        _userName,
                        color: context.colors.primary,
                      ),
                      
                      SizedBox(height: 12.h),
                      
                      // Email
                      AppText.bodyMedium(
                        _userEmail,
                        color: context.colors.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 60.h),
                
                // Password field
                AppText.bodyMedium(
                  'Enter your password',
                  color: context.colors.onSurface,
                ),
                SizedBox(height: 12.h),
                AppTextField(
                  hintText: 'Password',
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  enabled: !isLoading,
                  //autofocus: true,
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
                
                // Continue button
                Center(
                  child: AuthButton(
                    text: isLoading ? 'Signing In...' : 'Continue',
                    width: 337.w,
                    height: 69.h,
                    onPressed: isLoading ? null : _handleLogin,
                  ),
                ),
                
                SizedBox(height: 24.h),
                
                // Switch account
                Center(
                  child: TextButton(
                    onPressed: _switchAccount,
                    child: AppText.bodyMedium(
                      'Not you? Sign in with different account',
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
    );
  }
}
