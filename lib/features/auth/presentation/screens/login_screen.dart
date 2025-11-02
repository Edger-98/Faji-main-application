import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/auth_widgets.dart';

/// Login screen for existing users
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  obscureText: true,
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
                    text: 'Sign In',
                    width: 337.w,
                    height: 69.h,
                    onPressed: () {
                      // Navigate to home
                      context.go(RouteManager.home);
                    },
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
    );
  }
}
