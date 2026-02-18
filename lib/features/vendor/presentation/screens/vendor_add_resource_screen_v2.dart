import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/vendor/data/providers/vendor_providers.dart';

class VendorAddResourceScreenV2 extends ConsumerStatefulWidget {
  const VendorAddResourceScreenV2({super.key});

  @override
  ConsumerState<VendorAddResourceScreenV2> createState() =>
      _VendorAddResourceScreenV2State();
}

class _VendorAddResourceScreenV2State
    extends ConsumerState<VendorAddResourceScreenV2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  String? _selectedCategory;
  final List<String> _imageUrls = [];
  bool _isUploadingImage = false;

  final List<Map<String, dynamic>> _categories = <Map<String, dynamic>>[
    <String, dynamic>{'id': 'venue', 'name': 'Venue', 'icon': Icons.location_city},
    <String, dynamic>{'id': 'entertainment', 'name': 'Entertainment', 'icon': Icons.music_note},
    <String, dynamic>{'id': 'catering', 'name': 'Catering', 'icon': Icons.restaurant},
    <String, dynamic>{'id': 'photography', 'name': 'Photography', 'icon': Icons.camera_alt},
    <String, dynamic>{'id': 'decoration', 'name': 'Decoration', 'icon': Icons.celebration},
    <String, dynamic>{'id': 'security', 'name': 'Security', 'icon': Icons.security},
    <String, dynamic>{'id': 'promotion', 'name': 'Promotion', 'icon': Icons.campaign},
    <String, dynamic>{'id': 'equipment', 'name': 'Equipment', 'icon': Icons.speaker},
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  Future<void> _pickAndUploadImage() async {
    try {
      setState(() => _isUploadingImage = true);
      
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );
      
      if (image == null) {
        setState(() => _isUploadingImage = false);
        return;
      }
      
      // Upload via backend API - use 'cover' as imageType since 'resource' is not supported
      final datasource = ref.read(vendorRemoteDataSourceProvider);
      final FormData formData = FormData.fromMap({
        'imageType': 'cover', // Backend only accepts 'profile' or 'cover'
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
          _imageUrls.add(imageUrl);
          _isUploadingImage = false;
        });
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Image uploaded successfully'),
              backgroundColor: AppColors.successGreen,
            ),
          );
        }
      } else {
        throw Exception(response.data['error']?['message'] ?? 'Upload failed');
      }
    } on DioException catch (e) {
      setState(() => _isUploadingImage = false);
      
      // Extract error message from API response
      String errorMessage = 'Failed to upload image';
      
      if (e.response?.data != null) {
        final data = e.response!.data;
        if (data is Map) {
          // Try to get error message from various possible structures
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
      setState(() => _isUploadingImage = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to upload image: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imageUrls.removeAt(index);
    });
  }

  Future<void> _submitResource() async {
    if (_formKey.currentState!.validate() && _selectedCategory != null) {
      HapticFeedback.mediumImpact();
      
      setState(() => _isLoading = true);
      
      try {
        // Prepare FormData
        final Map<String, dynamic> data = {
          'title': _titleController.text,
          'description': _descriptionController.text,
          'category': _selectedCategory,
          'basePrice': _priceController.text,
        };
        
        // Add images if any
        if (_imageUrls.isNotEmpty) {
          data['images'] = _imageUrls;
        }
        
        final FormData formData = FormData.fromMap(data);
        
        // Call API
        final datasource = ref.read(vendorRemoteDataSourceProvider);
        final response = await datasource.addResource(formData);
        
        if (!mounted) return;
        
        setState(() => _isLoading = false);
        
        if (response.response.statusCode == 201 || response.response.statusCode == 200) {
          Navigator.pop(context, true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text((response.data['message'] ?? 'Service added successfully!') as String),
              backgroundColor: AppColors.success,
            ),
          );
        } else {
          throw Exception(response.data['error']?['message'] ?? 'Failed to add service');
        }
      } on DioException catch (e) {
        if (!mounted) return;
        
        setState(() => _isLoading = false);
        
        // Extract clean error message from API response
        String errorMessage = 'Failed to add service';
        
        if (e.response?.data != null) {
          final data = e.response!.data;
          if (data is Map) {
            // Extract message from error structure: {"error": {"message": "..."}}
            errorMessage = (data['error']?['message'] ?? 
                          data['message'] ?? 
                          data['error'] ?? 
                          'Failed to add service').toString();
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
        
        setState(() => _isLoading = false);
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add service: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } else if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a category')),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                    'Add New Service',
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
                      // Image Upload
                      if (_imageUrls.isEmpty)
                        InkWell(
                          onTap: _isUploadingImage ? null : _pickAndUploadImage,
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            height: 180,
                            decoration: BoxDecoration(
                              color: AppColors.searchBarBackground,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.textSecondary.withOpacity(0.3),
                                width: 2,
                              ),
                            ),
                            child: _isUploadingImage
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primary,
                                    ),
                                  )
                                : Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.add_photo_alternate_outlined,
                                          size: 48,
                                          color: AppColors.textSecondary,
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          'Add Photos',
                                          style: AppTypography.bodyLarge.copyWith(
                                            color: AppColors.textSecondary,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Tap to upload service images',
                                          style: AppTypography.bodySmall.copyWith(
                                            color: AppColors.textSecondary.withOpacity(0.7),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _imageUrls.length + 1,
                                itemBuilder: (context, index) {
                                  if (index == _imageUrls.length) {
                                    // Add more button
                                    return InkWell(
                                      onTap: _isUploadingImage ? null : _pickAndUploadImage,
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        width: 120,
                                        margin: const EdgeInsets.only(right: 12),
                                        decoration: BoxDecoration(
                                          color: AppColors.searchBarBackground,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                            color: AppColors.primary.withOpacity(0.3),
                                            width: 2,
                                          ),
                                        ),
                                        child: _isUploadingImage
                                            ? const Center(
                                                child: CircularProgressIndicator(
                                                  color: AppColors.primary,
                                                ),
                                              )
                                            : const Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add_photo_alternate,
                                                    size: 32,
                                                    color: AppColors.primary,
                                                  ),
                                                  SizedBox(height: 8),
                                                  Text(
                                                    'Add More',
                                                    style: TextStyle(
                                                      color: AppColors.primary,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                      ),
                                    );
                                  }
                                  
                                  return Container(
                                    width: 120,
                                    margin: const EdgeInsets.only(right: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.network(
                                            _imageUrls[index],
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Container(
                                                color: AppColors.searchBarBackground,
                                                child: const Icon(
                                                  Icons.broken_image,
                                                  color: AppColors.textSecondary,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Positioned(
                                          top: 4,
                                          right: 4,
                                          child: InkWell(
                                            onTap: () => _removeImage(index),
                                            child: Container(
                                              padding: const EdgeInsets.all(4),
                                              decoration: const BoxDecoration(
                                                color: AppColors.error,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.close,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 24),
                      // Category
                      Text(
                        'Category*',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: _categories.map((Map<String, dynamic> category) {
                          final String categoryId = category['id'] as String;
                          final isSelected = _selectedCategory == categoryId;
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _selectedCategory = categoryId;
                              });
                              HapticFeedback.selectionClick();
                            },
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
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    category['icon'] as IconData,
                                    size: 18,
                                    color: isSelected
                                        ? AppColors.onPrimary
                                        : AppColors.textSecondary,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    category['name'] as String,
                                    style: AppTypography.bodyMedium.copyWith(
                                      color: isSelected
                                          ? AppColors.onPrimary
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
                      const SizedBox(height: 24),
                      // Title
                      Text(
                        'Service Title*',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _titleController,
                        style: AppTypography.bodyLarge.copyWith(
                          color: AppColors.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'e.g., Grand Ballroom - Premium Venue',
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
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      // Description
                      Text(
                        'Description*',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 5,
                        style: AppTypography.bodyLarge.copyWith(
                          color: AppColors.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Describe your service in detail...',
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
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      // Price
                      Text(
                        'Base Price (₦)*',
                        style: AppTypography.labelMedium.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        style: AppTypography.bodyLarge.copyWith(
                          color: AppColors.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: '500000',
                          prefixText: '₦ ',
                          prefixStyle: AppTypography.bodyLarge.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
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
                            return 'Please enter a price';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
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
                  onPressed: _isLoading ? null : _submitResource,
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
                          'Add Service',
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
