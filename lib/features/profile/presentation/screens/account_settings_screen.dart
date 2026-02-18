import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:fajimobileapp/features/auth/domain/entities/user_entity.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/update_settings_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/services/toast_service.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/auth_state_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';

/// Account Settings Screen
class AccountSettingsScreen extends ConsumerStatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  ConsumerState<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends ConsumerState<AccountSettingsScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  
  bool _isEditing = false;
  bool _isLoading = false;
  String _userId = '';

  @override
  void initState() {
    super.initState();
    // Load user data after frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserData();
    });
  }

  Future<void> _loadUserData() async {
    final AuthRepository authRepo = ref.read(authRepositoryProvider);
    final String? userId = await authRepo.getUserId();
    
    // Load from saved data first (faster)
    final AuthLocalDataSource localDataSource = ref.read(authLocalDataSourceProvider);
    final Map<String, String?> userData = await localDataSource.getUserData();
    
    if (mounted) {
      setState(() {
        _userId = userId ?? '';
        _firstNameController.text = userData['firstName'] ?? '';
        _lastNameController.text = userData['lastName'] ?? '';
        _phoneController.text = userData['phoneNo'] ?? '';
        _emailController.text = userData['email'] ?? '';
      });
    }
    
    // Then try to refresh from API in background
    ref.read(authStateViewModelProvider.notifier).checkAuthStatus().then((_) {
      final UserEntity? currentUser = ref.read(currentUserProvider);
      
      if (currentUser != null && mounted) {
        setState(() {
          _firstNameController.text = currentUser.firstName;
          _lastNameController.text = currentUser.lastName;
          _phoneController.text = currentUser.phoneNo;
          _emailController.text = currentUser.email;
        });
      }
    });
  }

  Future<void> _saveChanges() async {
    if (_firstNameController.text.isEmpty) {
      _showError('First name is required');
      return;
    }
    if (_lastNameController.text.isEmpty) {
      _showError('Last name is required');
      return;
    }

    setState(() => _isLoading = true);

    final UpdateSettingsUseCase updateSettingsUseCase = ref.read(updateSettingsUseCaseProvider);
    final Either<Failure, UserEntity> result = await updateSettingsUseCase(
      id: _userId,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      phoneNo: _phoneController.text.isNotEmpty ? _phoneController.text : null,
    );

    setState(() => _isLoading = false);

    result.fold(
      (Failure failure) {
        _showError(failure.message);
      },
      (UserEntity user) {
        // Update auth state
        ref.read(authStateViewModelProvider.notifier).setUser(user);
        
        // Update local storage
        ref.read(authLocalDataSourceProvider).saveUserData(
          user.firstName,
          user.lastName,
          user.email,
        );
        
        _showSuccess('Profile updated successfully');
        setState(() => _isEditing = false);
      },
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
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: context.colors.onSurface),
          onPressed: () => context.pop(),
        ),
        title: AppText.titleLarge(
          'Account Settings',
          color: context.colors.onSurface,
        ),
        actions: [
          if (!_isEditing)
            TextButton(
              onPressed: () => setState(() => _isEditing = true),
              child: AppText.bodyLarge(
                'Edit',
                color: context.colors.primary,
              ),
            )
          else
            TextButton(
              onPressed: _isLoading ? null : _saveChanges,
              child: AppText.bodyLarge(
                _isLoading ? 'Saving...' : 'Save',
                color: _isLoading ? context.colors.onSurfaceVariant : context.colors.primary,
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Center(
                child: Stack(
                  children: [
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
                    if (_isEditing)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: context.colors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 16.sp,
                            color: context.colors.onPrimary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              
              SizedBox(height: 40.h),
              
              // First Name
              AppText.bodyMedium(
                'First Name',
                color: context.colors.onSurface,
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: _firstNameController,
                enabled: _isEditing,
                style: AppTypography.bodyLarge.copyWith(
                  color: context.colors.onSurface,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter first name',
                  hintStyle: AppTypography.bodyLarge.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                  filled: true,
                  fillColor: _isEditing 
                      ? context.colors.surfaceContainerHighest 
                      : context.colors.surfaceContainerHighest.withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                ),
              ),
              
              SizedBox(height: 20.h),
              
              // Last Name
              AppText.bodyMedium(
                'Last Name',
                color: context.colors.onSurface,
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: _lastNameController,
                enabled: _isEditing,
                style: AppTypography.bodyLarge.copyWith(
                  color: context.colors.onSurface,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter last name',
                  hintStyle: AppTypography.bodyLarge.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                  filled: true,
                  fillColor: _isEditing 
                      ? context.colors.surfaceContainerHighest 
                      : context.colors.surfaceContainerHighest.withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                ),
              ),
              
              SizedBox(height: 20.h),
              
              // Phone Number
              AppText.bodyMedium(
                'Phone Number',
                color: context.colors.onSurface,
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: _phoneController,
                enabled: _isEditing,
                keyboardType: TextInputType.phone,
                style: AppTypography.bodyLarge.copyWith(
                  color: context.colors.onSurface,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter phone number',
                  hintStyle: AppTypography.bodyLarge.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                  filled: true,
                  fillColor: _isEditing 
                      ? context.colors.surfaceContainerHighest 
                      : context.colors.surfaceContainerHighest.withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                ),
              ),
              
              SizedBox(height: 20.h),
              
              // Email (Read-only)
              AppText.bodyMedium(
                'Email',
                color: context.colors.onSurface,
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: _emailController,
                enabled: false,
                style: AppTypography.bodyLarge.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: AppTypography.bodyLarge.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                  filled: true,
                  fillColor: context.colors.surfaceContainerHighest.withOpacity(0.3),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  suffixIcon: Icon(
                    Icons.lock_outline,
                    color: context.colors.onSurfaceVariant,
                    size: 20.sp,
                  ),
                ),
              ),
              
              SizedBox(height: 12.h),
              
              AppText.bodySmall(
                'Email cannot be changed',
                color: context.colors.onSurfaceVariant,
              ),
              
              SizedBox(height: 40.h),
              
              // Cancel button when editing
              if (_isEditing)
                Center(
                  child: TextButton(
                    onPressed: () {
                      setState(() => _isEditing = false);
                      _loadUserData(); // Reset fields
                    },
                    child: AppText.bodyLarge(
                      'Cancel',
                      color: context.colors.error,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
}
