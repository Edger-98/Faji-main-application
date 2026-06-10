import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/core/services/image_upload_service.dart';
import 'package:fajimobileapp/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:fajimobileapp/features/auth/domain/entities/user_entity.dart';
import 'package:fajimobileapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:fajimobileapp/features/auth/domain/usecases/update_settings_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

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
  final ImagePicker _imagePicker = ImagePicker();

  bool _isEditing = false;
  bool _isLoading = false;
  bool _isUploadingPhoto = false;
  String _userId = '';
  File? _selectedImage;
  String? _currentProfileImageUrl;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserData();
    });
  }

  Future<void> _loadUserData() async {
    final AuthRepository authRepo = ref.read(authRepositoryProvider);
    final String? userId = await authRepo.getUserId();

    final AuthLocalDataSource localDataSource = ref.read(authLocalDataSourceProvider);
    final Map<String, String?> userData = await localDataSource.getUserData();
    final String? savedImageUrl = await localDataSource.getProfileImageUrl();

    if (mounted) {
      setState(() {
        _userId = userId ?? '';
        _firstNameController.text = userData['firstName'] ?? '';
        _lastNameController.text = userData['lastName'] ?? '';
        _phoneController.text = userData['phoneNo'] ?? '';
        _emailController.text = userData['email'] ?? '';
        if (savedImageUrl != null) _currentProfileImageUrl = savedImageUrl;
      });
    }

    ref.read(authStateViewModelProvider.notifier).checkAuthStatus().then((_) {
      final UserEntity? currentUser = ref.read(currentUserProvider);

      if (currentUser != null && mounted) {
        setState(() {
          _firstNameController.text = currentUser.firstName;
          _lastNameController.text = currentUser.lastName;
          _phoneController.text = currentUser.phoneNo;
          _emailController.text = currentUser.email;
          // Only overwrite with server image if it's a valid URL; otherwise keep local
          if (currentUser.image != null &&
              (currentUser.image!.startsWith('http://') ||
               currentUser.image!.startsWith('https://'))) {
            _currentProfileImageUrl = currentUser.image;
          }
        });
      }
    });
  }

  Future<void> _showImagePickerOptions() async {
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: context.colors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext ctx) => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: context.colors.onSurfaceVariant.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              AppText.titleMedium('Change Profile Photo', color: context.colors.onSurface),
              SizedBox(height: 16.h),
              ListTile(
                leading: Icon(Icons.photo_library_outlined, color: context.colors.primary),
                title: AppText.bodyLarge('Choose from Gallery', color: context.colors.onSurface),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt_outlined, color: context.colors.primary),
                title: AppText.bodyLarge('Take a Photo', color: context.colors.onSurface),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickImage(ImageSource.camera);
                },
              ),
              if (_currentProfileImageUrl != null || _selectedImage != null)
                ListTile(
                  leading: Icon(Icons.delete_outline, color: context.colors.error),
                  title: AppText.bodyLarge('Remove Photo', color: context.colors.error),
                  onTap: () {
                    Navigator.pop(ctx);
                    setState(() {
                      _selectedImage = null;
                      _currentProfileImageUrl = null;
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? picked = await _imagePicker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (picked == null) return;

      setState(() {
        _selectedImage = File(picked.path);
      });
    } catch (e) {
      if (mounted) {
        _showError('Failed to pick image: $e');
      }
    }
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

    // Upload image first to get a valid Cloudinary URL, then pass the URL
    // to updateSettings. The backend's direct-file upload constructs a broken
    // URL (undefined prefix), so we use the dedicated /upload/image endpoint.
    String? uploadedImageUrl;
    if (_selectedImage != null) {
      try {
        setState(() => _isUploadingPhoto = true);
        final ImageUploadService uploadService = ref.read(imageUploadServiceProvider);
        uploadedImageUrl = await uploadService.uploadProfileImage(_selectedImage!);
        setState(() => _isUploadingPhoto = false);
      } catch (e) {
        setState(() {
          _isLoading = false;
          _isUploadingPhoto = false;
        });
        _showError('Failed to upload photo: $e');
        return;
      }
    }

    final UpdateSettingsUseCase updateSettingsUseCase = ref.read(updateSettingsUseCaseProvider);
    final Either<Failure, UserEntity> result = await updateSettingsUseCase(
      id: _userId,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      phoneNo: _phoneController.text.isNotEmpty ? _phoneController.text : null,
      imageUrl: uploadedImageUrl,
    );

    setState(() => _isLoading = false);

    result.fold(
      (Failure failure) {
        _showError(failure.message);
      },
      (UserEntity user) {
        final String? finalImageUrl = uploadedImageUrl ?? user.image;

        // Push correct image into Riverpod state so all screens update
        ref.read(authStateViewModelProvider.notifier).setUser(
          user.copyWith(image: finalImageUrl),
        );

        final AuthLocalDataSource local = ref.read(authLocalDataSourceProvider);
        local.saveUserData(user.firstName, user.lastName, user.email);
        // Persist the Cloudinary URL so it survives app restarts
        local.saveProfileImageUrl(finalImageUrl);

        setState(() {
          _isEditing = false;
          _selectedImage = null;
          _currentProfileImageUrl = finalImageUrl;
        });

        _showSuccess('Profile updated successfully');
      },
    );
  }

  void _showError(String message) {
    ToastService.showError(context: context, message: message);
  }

  void _showSuccess(String message) {
    ToastService.showSuccess(context: context, message: message);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Widget _buildAvatar() {
    final bool hasLocal = _selectedImage != null;
    final bool hasNetwork = _currentProfileImageUrl != null && _currentProfileImageUrl!.isNotEmpty;

    Widget avatar;
    if (hasLocal) {
      avatar = CircleAvatar(
        radius: 50.r,
        backgroundImage: FileImage(_selectedImage!),
      );
    } else if (hasNetwork) {
      avatar = CircleAvatar(
        radius: 50.r,
        backgroundImage: CachedNetworkImageProvider(_currentProfileImageUrl!),
        backgroundColor: context.colors.primary.withOpacity(0.1),
      );
    } else {
      avatar = Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: context.colors.primary.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.person, size: 50.sp, color: context.colors.primary),
      );
    }

    return Stack(
      children: [
        _isUploadingPhoto
            ? Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.primary.withOpacity(0.1),
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.colors.primary,
                    strokeWidth: 2,
                  ),
                ),
              )
            : avatar,
        if (_isEditing)
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: _showImagePickerOptions,
              child: Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: context.colors.surface, width: 2),
                ),
                child: Icon(Icons.camera_alt, size: 16.sp, color: context.colors.onPrimary),
              ),
            ),
          ),
      ],
    );
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
          title: AppText.titleLarge('Account Settings', color: context.colors.onSurface),
          actions: [
            if (!_isEditing)
              TextButton(
                onPressed: () => setState(() => _isEditing = true),
                child: AppText.bodyLarge('Edit', color: context.colors.primary),
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
                Center(child: _buildAvatar()),

                SizedBox(height: 40.h),

                AppText.bodyMedium('First Name', color: context.colors.onSurface),
                SizedBox(height: 8.h),
                TextField(
                  controller: _firstNameController,
                  enabled: _isEditing,
                  style: AppTypography.bodyLarge.copyWith(color: context.colors.onSurface),
                  decoration: InputDecoration(
                    hintText: 'Enter first name',
                    hintStyle: AppTypography.bodyLarge.copyWith(color: context.colors.onSurfaceVariant),
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

                AppText.bodyMedium('Last Name', color: context.colors.onSurface),
                SizedBox(height: 8.h),
                TextField(
                  controller: _lastNameController,
                  enabled: _isEditing,
                  style: AppTypography.bodyLarge.copyWith(color: context.colors.onSurface),
                  decoration: InputDecoration(
                    hintText: 'Enter last name',
                    hintStyle: AppTypography.bodyLarge.copyWith(color: context.colors.onSurfaceVariant),
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

                AppText.bodyMedium('Phone Number', color: context.colors.onSurface),
                SizedBox(height: 8.h),
                TextField(
                  controller: _phoneController,
                  enabled: _isEditing,
                  keyboardType: TextInputType.phone,
                  style: AppTypography.bodyLarge.copyWith(color: context.colors.onSurface),
                  decoration: InputDecoration(
                    hintText: 'Enter phone number',
                    hintStyle: AppTypography.bodyLarge.copyWith(color: context.colors.onSurfaceVariant),
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

                AppText.bodyMedium('Email', color: context.colors.onSurface),
                SizedBox(height: 8.h),
                TextField(
                  controller: _emailController,
                  enabled: false,
                  style: AppTypography.bodyLarge.copyWith(color: context.colors.onSurfaceVariant),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: AppTypography.bodyLarge.copyWith(color: context.colors.onSurfaceVariant),
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
                AppText.bodySmall('Email cannot be changed', color: context.colors.onSurfaceVariant),

                SizedBox(height: 40.h),

                if (_isEditing)
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _isEditing = false;
                          _selectedImage = null;
                        });
                        _loadUserData();
                      },
                      child: AppText.bodyLarge('Cancel', color: context.colors.error),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
}
