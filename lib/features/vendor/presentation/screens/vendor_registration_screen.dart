import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import '../../data/providers/vendor_providers.dart';

class VendorRegistrationScreen extends ConsumerStatefulWidget {
  const VendorRegistrationScreen({super.key});

  @override
  ConsumerState<VendorRegistrationScreen> createState() =>
      _VendorRegistrationScreenState();
}

class _VendorRegistrationScreenState
    extends ConsumerState<VendorRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _businessNameController = TextEditingController();
  final _bioController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  final List<String> _selectedCategories = [];
  String? _profilePhotoUrl;
  bool _isUploadingPhoto = false;

  final List<Map<String, dynamic>> _categories = [
    {'id': 'venue', 'name': 'Venue', 'icon': Icons.location_city},
    {'id': 'entertainment', 'name': 'Entertainment', 'icon': Icons.music_note},
    {'id': 'catering', 'name': 'Catering', 'icon': Icons.restaurant},
    {'id': 'photography', 'name': 'Photography', 'icon': Icons.camera_alt},
    {'id': 'decoration', 'name': 'Decoration', 'icon': Icons.celebration},
    {'id': 'security', 'name': 'Security', 'icon': Icons.security},
    {'id': 'transport', 'name': 'Transport', 'icon': Icons.directions_car},
    {'id': 'equipment', 'name': 'Equipment', 'icon': Icons.speaker},
  ];

  @override
  void dispose() {
    _businessNameController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _toggleCategory(String categoryId) {
    setState(() {
      if (_selectedCategories.contains(categoryId)) {
        _selectedCategories.remove(categoryId);
      } else {
        _selectedCategories.add(categoryId);
      }
    });
    HapticFeedback.selectionClick();
  }

  Future<void> _pickAndUploadPhoto() async {
    try {
      setState(() => _isUploadingPhoto = true);
      
      final picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      
      if (image == null) {
        setState(() => _isUploadingPhoto = false);
        return;
      }
      
      // Upload via backend API
      final datasource = ref.read(vendorRemoteDataSourceProvider);
      final formData = FormData.fromMap({
        'imageType': 'profile',
        'image': await MultipartFile.fromFile(
          image.path,
          filename: image.name,
        ),
      });
      
      final response = await datasource.uploadImage(formData);
      final imageUrl = response.data['data']['imageUrl'] as String;
      
      setState(() {
        _profilePhotoUrl = imageUrl;
        _isUploadingPhoto = false;
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Photo uploaded successfully'),
            backgroundColor: AppColors.successGreen,
          ),
        );
      }
    } catch (e) {
      setState(() => _isUploadingPhoto = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to upload photo: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  bool _isLoading = false;

  Future<void> _submitRegistration() async {
    if (_formKey.currentState!.validate() && _selectedCategories.isNotEmpty) {
      HapticFeedback.mediumImpact();
      
      setState(() => _isLoading = true);
      
      try {
        // Prepare registration data matching backend spec
        final data = {
          'businessName': _businessNameController.text,
          'bio': _bioController.text,
          'categories': _selectedCategories,
          'location': _locationController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
          'businessType': 'individual',
        };
        
        // Add profile photo if uploaded
        if (_profilePhotoUrl != null) {
          data['profilePhotoUrl'] = _profilePhotoUrl!;
        }
        
        // Call API
        final datasource = ref.read(vendorRemoteDataSourceProvider);
        final response = await datasource.registerVendor(data);
        
        if (!mounted) return;
        
        setState(() => _isLoading = false);
        
        if (response.response.statusCode == 201 || response.response.statusCode == 200) {
          final message = response.data['message']?.toString() ?? 'Vendor registration submitted successfully!';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: AppColors.success,
              duration: const Duration(seconds: 3),
            ),
          );
          Navigator.pop(context);
        } else {
          throw Exception('Registration failed');
        }
      } catch (e) {
        if (!mounted) return;
        
        setState(() => _isLoading = false);
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed: ${e.toString()}'),
            backgroundColor: AppColors.error,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } else if (_selectedCategories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one category')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                      color: AppColors.onSurface,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Become a Vendor',
                    style: AppTypography.headlineMedium.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero Section
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.searchBarBackground,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.3),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.storefront_rounded,
                              size: 48,
                              color: AppColors.primary,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Start Earning Today',
                              style: AppTypography.titleLarge.copyWith(
                                color: AppColors.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Join our marketplace and offer your services to event hosts',
                              textAlign: TextAlign.center,
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Profile Photo
                      Text(
                        'Profile Photo (Optional)',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: _isUploadingPhoto ? null : _pickAndUploadPhoto,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: AppColors.searchBarBackground,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.3),
                            ),
                          ),
                          child: _isUploadingPhoto
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                                )
                              : _profilePhotoUrl != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        _profilePhotoUrl!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.add_photo_alternate_rounded,
                                          size: 40,
                                          color: AppColors.primary,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Add Photo',
                                          style: AppTypography.bodySmall.copyWith(
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                      ],
                                    ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Business Name
                      Text(
                        'Business Name',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _businessNameController,
                        style: AppTypography.bodyLarge.copyWith(
                          color: AppColors.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter your business name',
                          filled: true,
                          fillColor: AppColors.searchBarBackground,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your business name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      // Bio/Description
                      Text(
                        'Bio',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tell us about your services (50-1000 characters)',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _bioController,
                        maxLines: 5,
                        maxLength: 1000,
                        style: AppTypography.bodyLarge.copyWith(
                          color: AppColors.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Describe your business, services, experience, and what makes you unique...',
                          filled: true,
                          fillColor: AppColors.searchBarBackground,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.all(20),
                          counterStyle: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a bio';
                          }
                          if (value.length < 50) {
                            return 'Bio must be at least 50 characters (currently ${value.length})';
                          }
                          if (value.length > 1000) {
                            return 'Bio must not exceed 1000 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      // Email
                      Text(
                        'Email',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: AppTypography.bodyLarge.copyWith(
                          color: AppColors.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'your@email.com',
                          filled: true,
                          fillColor: AppColors.searchBarBackground,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      // Phone
                      Text(
                        'Phone Number',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: AppTypography.bodyLarge.copyWith(
                          color: AppColors.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: '+234...',
                          filled: true,
                          fillColor: AppColors.searchBarBackground,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      // Location
                      Text(
                        'Location',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _locationController,
                        style: AppTypography.bodyLarge.copyWith(
                          color: AppColors.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Lagos, Nigeria',
                          filled: true,
                          fillColor: AppColors.searchBarBackground,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your location';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      // Categories
                      Text(
                        'Select Categories',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Choose the services you offer',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: _categories.map((Map<String, dynamic> category) {
                          final String categoryId = category['id'] as String;
                          final isSelected =
                              _selectedCategories.contains(categoryId);
                          return InkWell(
                            onTap: () => _toggleCategory(categoryId),
                            borderRadius: BorderRadius.circular(12),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.searchBarBackground,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primary
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    category['icon'] as IconData,
                                    size: 18,
                                    color: isSelected
                                        ? Colors.white
                                        : AppColors.textSecondary,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    category['name'] as String,
                                    style: AppTypography.bodyMedium.copyWith(
                                      color: isSelected
                                          ? Colors.white
                                          : AppColors.onSurface,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            // Submit Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitRegistration,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'Submit Application',
                          style: AppTypography.labelLarge.copyWith(
                            color: AppColors.onPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
