import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/core/services/biometric_auth_service.dart';
import 'package:fajimobileapp/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:fajimobileapp/features/auth/domain/entities/auth_token_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/services/toast_service.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/auth_state_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/login_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:local_auth_platform_interface/types/biometric_type.dart';

/// Welcome back screen - Quick login with just password
class WelcomeBackScreen extends ConsumerStatefulWidget {
  const WelcomeBackScreen({super.key});

  @override
  ConsumerState<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends ConsumerState<WelcomeBackScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  String _userEmail = '';
  String _userName = '';
  bool _isBiometricAvailable = false;
  String _biometricType = 'Biometric';

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _checkBiometricAvailability();
  }

  Future<void> _loadUserData() async {
    final AuthLocalDataSource localDataSource = ref.read(authLocalDataSourceProvider);
    final Map<String, String?> userData = await localDataSource.getUserData();
    
    setState(() {
      _userEmail = userData['email'] ?? '';
      _userName = userData['firstName'] ?? 'there';
    });
  }

  Future<void> _checkBiometricAvailability() async {
    final BiometricAuthService biometricService = ref.read(biometricAuthServiceProvider);
    final bool isAvailable = await biometricService.isBiometricEnabled();
    
    if (isAvailable) {
      final List<BiometricType> biometrics = await biometricService.getAvailableBiometrics();
      final String typeName = biometricService.getBiometricTypeName(biometrics);
      
      setState(() {
        _isBiometricAvailable = true;
        _biometricType = typeName;
      });
    }
  }

  Future<void> _authenticateWithBiometric() async {
    print('🔐 Biometric authentication started');
    
    final BiometricAuthService biometricService = ref.read(biometricAuthServiceProvider);
    
    try {
      final bool authenticated = await biometricService.authenticate(
        localizedReason: 'Authenticate to sign in to your account',
      );
      
      print('🔐 Biometric result: $authenticated');
      
      if (authenticated && mounted) {
        // Get saved credentials from secure storage
        final AuthLocalDataSource localDataSource = ref.read(authLocalDataSourceProvider);
        final String? token = await localDataSource.getToken();
        
        print('🔐 Token found: ${token != null && token.isNotEmpty}');
        
        if (token != null && token.isNotEmpty) {
          // User has valid token, check if still valid
          ToastService.showSuccess(
            context: context,
            message: 'Authentication successful',
          );
          
          await ref.read(authStateViewModelProvider.notifier).checkAuthStatus();
          
          if (mounted) {
            context.go(RouteManager.home);
          }
        } else {
          // No saved token, need to get password from secure storage
          final String? password = await localDataSource.getPassword();
          
          print('🔐 Password found: ${password != null && password.isNotEmpty}');
          
          if (password != null && password.isNotEmpty && _userEmail.isNotEmpty) {
            // Perform login with saved credentials
            ToastService.showSuccess(
              context: context,
              message: 'Authenticating...',
            );
            
            ref.read(loginViewModelProvider.notifier).login(
              email: _userEmail,
              password: password,
            );
          } else {
            _showError('Please enter your password to continue');
          }
        }
      } else if (!authenticated && mounted) {
        print('🔐 Biometric authentication failed or cancelled');
        _showError('Authentication failed');
      }
    } catch (e) {
      print('🔐 Biometric error: $e');
      if (mounted) {
        _showError('Biometric authentication error: ${e}');
      }
    }
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
    ref.listen(loginViewModelProvider, (BaseState<AuthTokenEntity>? previous, BaseState<AuthTokenEntity> next) {
      next.when(
        initial: () {},
        loading: () {},
        success: (AuthTokenEntity token) async {
          // Save password for biometric login
          final AuthLocalDataSource localDataSource = ref.read(authLocalDataSourceProvider);
          await localDataSource.savePassword(_passwordController.text);
          
          // Fetch user data
          await ref.read(authStateViewModelProvider.notifier).checkAuthStatus();
          
          // Navigate to home
          context.go(RouteManager.home);
        },
        error: (Failure failure) {
          _showError(failure.message);
        },
      );
    });

    final BaseState<AuthTokenEntity> loginState = ref.watch(loginViewModelProvider);
    final bool isLoading = loginState.maybeWhen(
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
              children: <Widget>[
                SizedBox(height: 60.h),
                
                // Welcome back message
                Center(
                  child: Column(
                    children: <Widget>[
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
                      context.push(RouteManager.forgotPassword);
                    },
                    child: AppText.bodySmall(
                      'Forgot password?',
                      color: context.colors.primary,
                    ),
                  ),
                ),
                
                // Biometric authentication option
                if (_isBiometricAvailable) ...<Widget>[
                  SizedBox(height: 24.h),
                  
                  // Divider with "OR"
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: context.colors.onSurfaceVariant.withOpacity(0.3),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: AppText.bodySmall(
                          'OR',
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: context.colors.onSurfaceVariant.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 24.h),
                  
                  // Biometric button
                  Center(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: isLoading ? null : _authenticateWithBiometric,
                          borderRadius: BorderRadius.circular(50.r),
                          child: Container(
                            width: 70.w,
                            height: 70.h,
                            decoration: BoxDecoration(
                              color: context.colors.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: context.colors.primary,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              _biometricType == 'Face ID' 
                                  ? Icons.face 
                                  : Icons.fingerprint,
                              size: 35.sp,
                              color: context.colors.primary,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        AppText.bodySmall(
                          'Sign in with $_biometricType',
                          color: context.colors.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ],
                
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
