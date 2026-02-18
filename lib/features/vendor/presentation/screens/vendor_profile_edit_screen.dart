import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/vendor/data/providers/vendor_providers.dart';

class VendorProfileEditScreen extends ConsumerStatefulWidget {
  const VendorProfileEditScreen({super.key});

  @override
  ConsumerState<VendorProfileEditScreen> createState() =>
      _VendorProfileEditScreenState();
}

class _VendorProfileEditScreenState
    extends ConsumerState<VendorProfileEditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final List<String> _selectedCategories = [];
  String? _profilePhotoUrl;
  bool _isUploadingPhoto = false;
  bool _isLoading = true;
  bool _isSaving = false;

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
  void initState() {
    super.initState();
    _fetchProfile();
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _fetchProfile() async {
    setState(() => _isLoading = true);

    try {
      final datasource = ref.read(vendorRemoteDataSourceProvider);
      final response = await datasource.getVendorProfile();

      if (!mounted) return;

      if (response.response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        
        setState(() {
          _businessNameController.text = (data['businessName'] ?? '') as String;
          _bioController.text = (data['bio'] ?? '') as String;
          _emailController.text = (data['email'] ?? '') as String;
          _phoneController.text = (data['phone'] ?? '') as String;
          _locationController.text = (data['location'] ?? '') as String;
          _profilePhotoUrl = data['profilePhotoUrl'] as String?;
          
          if (data['categories'] is List) {
            _selectedCategories.clear();
            _selectedCategories.addAll((data['categories'] as List).cast<String>());
          }
          
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      print('Error fetching profile: $e');
      if (!mounted) return;
      setState(() => _isLoading = false);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to load profile: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    }
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
      final image = await picker.pickImage(
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
      
      // Check if response is successful
      if (response.response.statusCode == 200 || response.response.statusCode == 201) {
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
      } else {
        throw Exception(response.data['error']?['message'] ?? 'Upload failed');
      }
    } on DioException catch (e) {
      setState(() => _isUploadingPhoto = false);
      
      // Extract error message from API response
      String errorMessage = 'Failed to upload photo';
      
      if (e.response?.data != null) {
        final data = e.response!.data;
        if (data is Map) {
          errorMessage = (data['error']?['message'] ?? 
                        data['message'] ?? 
                        data['error'] ?? 
                        'Upload failed').toString();
        }
      } else if (e.message != null) {
        errorMessage = e.message!;
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: AppColors.error,
            duration: const Duration(seconds: 4),
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

  Future<void> _submitUpdate() async {
    if (_formKey.currentState!.validate() && _selectedCategories.isNotEmpty) {
      HapticFeedback.mediumImpact();
      
      setState(() => _isSaving = true);
      
      try {
        // Prepare update data
        final data = {
          'businessName': _businessNameController.text,
          'bio': _bioController.text,
          'categories': _selectedCategories,
          'location': _locationController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
        };
        
        // Add profile photo if uploaded
        if (_profilePhotoUrl != null) {
          data['profilePhotoUrl'] = _profilePhotoUrl!;
        }
        
        // Call API
        final datasource = ref.read(vendorRemoteDataSourceProvider);
        final response = await datasource.updateVendorProfile(data);
        
        if (!mounted) return;
        
        setState(() => _isSaving = false);
        
        if (response.response.statusCode == 200) {
          final message = response.data['message']?.toString() ?? 'Profile updated successfully!';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: AppColors.success,
              duration: const Duration(seconds: 3),
            ),
          );
          Navigator.pop(context, true);
        } else {
          throw Exception(response.data['error']?['message'] ?? 'Update failed');
        }
      } on DioException catch (e) {
        if (!mounted) return;
        
        setState(() => _isSaving = false);
        
        // Extract clean error message from API response
        String errorMessage = 'Update failed';
        
        if (e.response?.data != null) {
          final data = e.response!.data;
          if (data is Map) {
            errorMessage = (data['error']?['message'] ?? 
                          data['message'] ?? 
                          data['error'] ?? 
                          'Update failed').toString();
          }
        } else if (e.message != null) {
          errorMessage = e.message!;
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: AppColors.error,
            duration: const Duration(seconds: 4),
          ),
        );
      } catch (e) {
        if (!mounted) return;
        
        setState(() => _isSaving = false);
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Update failed: $e'),
            backgroundColor: AppColors.error,
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
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }

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
                    decoration: const BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                      color: AppColors.onSurface,
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Edit Profile',
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
                      // Profile Photo
                      Center(
                        child: GestureDetector(
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
                      ),
                      const SizedBox(height: 32),
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
                      // Bio
                      Text(
                        'Bio',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
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
                          hintText: 'Describe your business...',
                          filled: true,
                          fillColor: AppColors.searchBarBackground,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a bio';
                          }
                          if (value.length < 50) {
                            return 'Bio must be at least 50 characters';
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
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: _categories.map((category) {
                          final categoryId = category['id'] as String;
                          final isSelected = _selectedCategories.contains(categoryId);
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
                  onPressed: _isSaving ? null : _submitUpdate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: _isSaving
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'Save Changes',
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
