import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/services/auth_token_service.dart';
import 'package:fajimobileapp/features/auth/domain/entities/registration_complete_entity.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/auth_state_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/registration_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/auth_button.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/back_button_widget.dart';

/// Password creation screen matching Figma design (node-id=2-565)
class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({super.key});

  @override
  ConsumerState<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isPasswordValid = false;
  bool _isPasswordVisible = false;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePassword);
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _passwordController.removeListener(_validatePassword);
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _validatePassword() {
    final password = _passwordController.text;
    // Password must be at least 6 characters
    final isValid = password.length >= 6;
    if (isValid != _isPasswordValid) {
      setState(() {
        _isPasswordValid = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final registrationState = ref.watch(registrationViewModelProvider);
    final isLoading = registrationState.stepState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: IntrinsicHeight(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),

                        // Back button - positioned at x: 24, y: 64
                        const BackButtonWidget(),

                        SizedBox(height: 32.h),

                        // Title - positioned at x: 28, y: 126
                        Text(
                          'Create password',
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            letterSpacing: 0,
                            color: context.colors.onSurface,
                          ),
                        ),

                        SizedBox(height: 6.h),

                        // Subtitle - positioned at x: 28, y: 160
                        Text(
                          'Create a password with at least 6 letters or\nnumbers. It should be something others\ncan\'t guess.',
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w100,
                            height: 1.2,
                            letterSpacing: 0,
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),

                        SizedBox(height: 63.h), // 243 - 180 = 63

                        // Password input - positioned at x: 24, y: 243
                        AppTextField(
                          hintText: 'Password',
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          obscureText: !_isPasswordVisible,
                          keyboardType: TextInputType.visiblePassword,
                          suffixWidget: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: context.colors.onSurfaceVariant,
                                size: 20,
                              ),
                            ),
                          ),
                          onSubmitted: (_) {
                            if (_isPasswordValid) {
                              _handleContinue();
                            }
                          },
                        ),

                        SizedBox(height: 16.h),

                        // Password strength indicator
                        AnimatedOpacity(
                          opacity: _passwordController.text.isNotEmpty ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: Row(
                              children: [
                                Icon(
                                  _isPasswordValid
                                      ? Icons.check_circle
                                      : Icons.info_outline,
                                  size: 16,
                                  color: _isPasswordValid
                                      ? Colors.green
                                      : context.colors.onSurfaceVariant,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  _isPasswordValid
                                      ? 'Strong password'
                                      : 'At least 6 characters required',
                                  style: TextStyle(
                                    fontFamily: AppTypography.modicaPro,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w100,
                                    color: _isPasswordValid
                                        ? Colors.green
                                        : context.colors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const Spacer(),

                        // Continue button - positioned at x: 24, y: 717
                        AnimatedOpacity(
                          opacity: _isPasswordValid && !isLoading ? 1.0 : 0.5,
                          duration: const Duration(milliseconds: 300),
                          child: AuthButton(
                            text: isLoading ? 'Creating Account...' : 'Continue',
                            height: 59.h,
                            onPressed: (_isPasswordValid && !isLoading) ? _handleContinue : null,
                            isEnabled: _isPasswordValid && !isLoading,
                          ),
                        ),

                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleContinue() async {
    if (!_isPasswordValid) return;
    
    FocusScope.of(context).unfocus();
    
    // Complete registration with password
    // Default role is "Attendee" - you can add a role selector if needed
    await ref.read(registrationViewModelProvider.notifier).completeRegistration(
      _passwordController.text,
      'Attendee', // Default role
    );
    
    // Check the result
    final state = ref.read(registrationViewModelProvider);
    state.stepState.when(
      initial: () {},
      loading: () {},
      success: (complete) async {
        // Registration complete! Update auth state
        if (complete is RegistrationCompleteEntity) {
          // CRITICAL FIX: Initialize auth token service to sync token with API service
          // This ensures the token is available for all subsequent API calls
          await ref.read(authTokenServiceProvider).initialize();
          
          // Set the user in auth state
          ref.read(authStateViewModelProvider.notifier).setUser(complete.user);
          
          // Verify auth status is updated
          await ref.read(authStateViewModelProvider.notifier).checkAuthStatus();
          
          // Navigate to home screen (replace entire stack)
          if (mounted) {
            context.goNamed(RouteManager.homeName);
          }
        }
      },
      error: (failure) {
        // Show error
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(failure.message)),
          );
        }
      },
    );
  }
}
