import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/vendor/data/providers/vendor_providers.dart';

class VendorEditResourceScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic> resource;
  
  const VendorEditResourceScreen({
    super.key,
    required this.resource,
  });

  @override
  ConsumerState<VendorEditResourceScreen> createState() =>
      _VendorEditResourceScreenState();
}

class _VendorEditResourceScreenState
    extends ConsumerState<VendorEditResourceScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late String? _selectedCategory;
  late bool _isAvailable;

  final List<Map<String, dynamic>> _categories = [
    {'id': 'venue', 'name': 'Venue', 'icon': Icons.location_city},
    {'id': 'entertainment', 'name': 'Entertainment', 'icon': Icons.music_note},
    {'id': 'catering', 'name': 'Catering', 'icon': Icons.restaurant},
    {'id': 'photography', 'name': 'Photography', 'icon': Icons.camera_alt},
    {'id': 'decoration', 'name': 'Decoration', 'icon': Icons.celebration},
    {'id': 'security', 'name': 'Security', 'icon': Icons.security},
    {'id': 'promotion', 'name': 'Promotion', 'icon': Icons.campaign},
    {'id': 'equipment', 'name': 'Equipment', 'icon': Icons.speaker},
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.resource['title'] as String?);
    _descriptionController = TextEditingController(text: widget.resource['description'] as String? ?? '');
    _priceController = TextEditingController(
      text: ((widget.resource['basePrice'] ?? widget.resource['price'] ?? 0) as int).toString(),
    );
    _selectedCategory = widget.resource['category'] as String?;
    _isAvailable = widget.resource['isAvailable'] as bool? ?? true;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  Future<void> _submitUpdate() async {
    if (_formKey.currentState!.validate() && _selectedCategory != null) {
      HapticFeedback.mediumImpact();
      
      setState(() => _isLoading = true);
      
      try {
        final resourceId = widget.resource['_id'] ?? widget.resource['id'];
        
        // Prepare update data
        final Map<String, dynamic> data = {
          'title': _titleController.text,
          'description': _descriptionController.text,
          'category': _selectedCategory,
          'basePrice': int.parse(_priceController.text),
          'isAvailable': _isAvailable,
        };
        
        // Call API
        final datasource = ref.read(vendorRemoteDataSourceProvider);
        final response = await datasource.updateResource(
          resourceId.toString(),
          data,
        );
        
        if (!mounted) return;
        
        setState(() => _isLoading = false);
        
        if (response.response.statusCode == 200) {
          Navigator.pop(context, true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text((response.data['message'] ?? 'Service updated successfully!') as String),
              backgroundColor: AppColors.success,
            ),
          );
        } else {
          throw Exception(response.data['error']?['message'] ?? 'Failed to update service');
        }
      } on DioException catch (e) {
        if (!mounted) return;
        
        setState(() => _isLoading = false);
        
        // Extract clean error message from API response
        String errorMessage = 'Failed to update service';
        
        if (e.response?.data != null) {
          final data = e.response!.data;
          if (data is Map) {
            errorMessage = (data['error']?['message'] ?? 
                          data['message'] ?? 
                          data['error'] ?? 
                          'Failed to update service').toString();
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
            content: Text('Failed to update service: $e'),
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
                    decoration: const BoxDecoration(
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
                    'Edit Service',
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
                      // Availability Toggle
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.searchBarBackground,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _isAvailable ? Icons.check_circle : Icons.cancel,
                              color: _isAvailable ? AppColors.success : AppColors.error,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Service Availability',
                                    style: AppTypography.bodyLarge.copyWith(
                                      color: AppColors.onSurface,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    _isAvailable ? 'Currently available for booking' : 'Currently unavailable',
                                    style: AppTypography.bodySmall.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Switch(
                              value: _isAvailable,
                              onChanged: (value) {
                                setState(() => _isAvailable = value);
                                HapticFeedback.selectionClick();
                              },
                              activeColor: AppColors.success,
                            ),
                          ],
                        ),
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
                        children: _categories.map((category) {
                          final categoryId = category['id'] as String;
                          final isSelected = _selectedCategory == categoryId;
                          return InkWell(
                            onTap: () {
                              setState(() => _selectedCategory = categoryId);
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
                  onPressed: _isLoading ? null : _submitUpdate,
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
                          'Update Service',
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
