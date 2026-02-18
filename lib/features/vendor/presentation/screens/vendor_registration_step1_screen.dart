import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Step 1: Basic Information
class VendorRegistrationStep1Screen extends ConsumerStatefulWidget {
  const VendorRegistrationStep1Screen({super.key});

  @override
  ConsumerState<VendorRegistrationStep1Screen> createState() =>
      _VendorRegistrationStep1ScreenState();
}

class _VendorRegistrationStep1ScreenState
    extends ConsumerState<VendorRegistrationStep1Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _alternatePhoneController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _yearsController = TextEditingController();
  
  String _businessType = 'individual';
  final List<String> _selectedCategories = <String>[];

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
    _businessNameController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _alternatePhoneController.dispose();
    _websiteController.dispose();
    _yearsController.dispose();
    super.dispose();
  }

  void _continue() {
    if (_formKey.currentState!.validate() && _selectedCategories.isNotEmpty) {
      // TODO: Save data and navigate to step 2 (documents)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Step 1 complete! Document upload coming next.')),
      );
      Navigator.pop(context);
    } else if (_selectedCategories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one category')),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vendor Registration',
                          style: AppTypography.headlineMedium.copyWith(
                            color: AppColors.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Step 1 of 3: Basic Info',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Progress
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: LinearProgressIndicator(
                value: 0.33,
                backgroundColor: AppColors.searchBarBackground,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField('Business Name*', _businessNameController, 'e.g., Elite Event Venues', required: true),
                      const SizedBox(height: 20),
                      _buildTextField('Bio*', _bioController, 'Tell us about your business...', maxLines: 4, required: true),
                      const SizedBox(height: 20),
                      _buildTextField('Location*', _locationController, 'e.g., Lagos, Nigeria', required: true),
                      const SizedBox(height: 20),
                      _buildTextField('Email*', _emailController, 'contact@business.com', keyboardType: TextInputType.emailAddress, required: true),
                      const SizedBox(height: 20),
                      _buildTextField('Phone*', _phoneController, '+234 800 000 0000', keyboardType: TextInputType.phone, required: true),
                      const SizedBox(height: 20),
                      _buildTextField('Alternate Phone', _alternatePhoneController, '+234 800 000 0000', keyboardType: TextInputType.phone),
                      const SizedBox(height: 20),
                      // Business Type
                      Text('Business Type*', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(child: _buildBusinessTypeOption('Individual', 'individual')),
                          const SizedBox(width: 12),
                          Expanded(child: _buildBusinessTypeOption('Company', 'company')),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildTextField('Years in Business', _yearsController, 'e.g., 5', keyboardType: TextInputType.number),
                      const SizedBox(height: 20),
                      _buildTextField('Website', _websiteController, 'https://yourbusiness.com', keyboardType: TextInputType.url),
                      const SizedBox(height: 24),
                      // Categories
                      Text('Select Categories*', style: AppTypography.labelMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: _categories.map((cat) {
                          final isSelected = _selectedCategories.contains(cat['id']);
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  _selectedCategories.remove(cat['id']);
                                } else {
                                  _selectedCategories.add(cat['id'] as String);
                                }
                              });
                              HapticFeedback.selectionClick();
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primary : AppColors.searchBarBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(cat['icon'] as IconData, size: 18, color: isSelected ? AppColors.onPrimary : AppColors.textSecondary),
                                  const SizedBox(width: 8),
                                  Text(cat['name'] as String, style: AppTypography.bodyMedium.copyWith(color: isSelected ? AppColors.onPrimary : AppColors.onSurface)),
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
            // Continue Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _continue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text('Continue', style: AppTypography.labelLarge.copyWith(color: AppColors.onPrimary, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  Widget _buildTextField(String label, TextEditingController controller, String hint, {int maxLines = 1, TextInputType? keyboardType, bool required = false}) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.labelMedium.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurface),
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: AppColors.searchBarBackground,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: maxLines > 1 ? 16 : 16),
          ),
          validator: required ? (value) => (value == null || value.isEmpty) ? 'Required' : null : null,
        ),
      ],
    );

  Widget _buildBusinessTypeOption(String label, String value) {
    final bool isSelected = _businessType == value;
    return InkWell(
      onTap: () {
        setState(() => _businessType = value);
        HapticFeedback.selectionClick();
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.searchBarBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked, color: isSelected ? AppColors.onPrimary : AppColors.textSecondary, size: 20),
            const SizedBox(width: 8),
            Text(label, style: AppTypography.bodyMedium.copyWith(color: isSelected ? AppColors.onPrimary : AppColors.onSurface)),
          ],
        ),
      ),
    );
  }
}
