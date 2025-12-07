import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/edit_providers.dart';
import 'package:intl/intl.dart';

/// EDIT Tab - Edit event details with REAL API DATA
class EditTab extends ConsumerStatefulWidget {
  final String eventId;

  const EditTab({super.key, required this.eventId});

  @override
  ConsumerState<EditTab> createState() => _EditTabState();
}

class _EditTabState extends ConsumerState<EditTab> {
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _guestCountController = TextEditingController();
  final _budgetController = TextEditingController();

  String? _selectedColorTheme;
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isInitialized = false;

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    _guestCountController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  void _initializeControllers(event) {
    if (!_isInitialized) {
      _titleController.text = event.name;
      _categoryController.text = event.category;
      _descriptionController.text = event.description ?? '';
      _guestCountController.text = event.stats.expectedGuests.toString();
      _budgetController.text = event.budget.total.toStringAsFixed(0);
      _selectedColorTheme = event.colorTheme;
      _startDate = event.startDate;
      _endDate = event.endDate;
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventAsync = ref.watch(eventDetailsProvider(widget.eventId));

    return eventAsync.when(
      data: (event) {
        _initializeControllers(event);
        return Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.w),
                children: [
                  // Color themes
                  _buildColorThemes(),
                  SizedBox(height: 24.h),

                  // Event name
                  _buildTextField(
                    label: 'Event Name',
                    controller: _titleController,
                  ),
                  SizedBox(height: 20.h),

                  // Category
                  _buildDropdownField(
                    label: 'Category',
                    controller: _categoryController,
                  ),
                  SizedBox(height: 20.h),

                  // Date & Time
                  _buildDateTimeSection(),
                  SizedBox(height: 20.h),

                  // Event Description
                  _buildDescriptionField(),
                  SizedBox(height: 20.h),

                  // Logistics
                  _buildLogisticsSection(),
                  SizedBox(height: 100.h),
                ],
              ),
            ),

            // Save button
            _buildSaveButton(),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
            SizedBox(height: 16.h),
            Text('Failed to load event data'),
            SizedBox(height: 8.h),
            ElevatedButton(
              onPressed: () =>
                  ref.invalidate(eventDetailsProvider(widget.eventId)),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorThemes() {
    final themes = [
      {'name': 'green', 'gradient': const LinearGradient(colors: [Color(0xFFB8E986), Color(0xFF8FD14F)])},
      {'name': 'gray', 'gradient': const LinearGradient(colors: [Color(0xFF6B6B6B), Color(0xFF3A3A3A)])},
      {'name': 'orange', 'gradient': const LinearGradient(colors: [Color(0xFFFF6B6B), Color(0xFFFF8C42)])},
      {'name': 'purple', 'gradient': const LinearGradient(colors: [Color(0xFFB794F6), Color(0xFF9F7AEA)])},
    ];

    return SizedBox(
      height: 80.h,
      child: Row(
        children: themes.map((theme) {
          final isSelected = _selectedColorTheme == theme['name'];
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColorTheme = theme['name'] as String;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                  gradient: theme['gradient'] as LinearGradient,
                  borderRadius: BorderRadius.circular(16.r),
                  border: isSelected
                      ? Border.all(color: Colors.white, width: 3)
                      : null,
                ),
                child: Center(
                  child: isSelected
                      ? Icon(Icons.check_circle,
                          size: 32.sp, color: Colors.white)
                      : null,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFF2A2A2A)),
          ),
          child: TextField(
            controller: controller,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.onSurface,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFF2A2A2A)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  controller.text,
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurface,
                  ),
                ),
              ),
              Icon(Icons.keyboard_arrow_down,
                  size: 20.sp, color: AppColors.onSurfaceVariant),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateTimeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date + Time',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _startDate = null;
                  _endDate = null;
                });
              },
              child: Text(
                'Set a date later',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFF8C42),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFF2A2A2A)),
          ),
          child: Column(
            children: [
              _buildDateRow(
                label: 'Start',
                date: _startDate != null ? _formatDateTime(_startDate!) : 'Not set',
                onTap: () => _selectStartDate(),
              ),
              SizedBox(height: 16.h),
              _buildDateRow(
                label: 'End',
                date: _endDate != null ? _formatDateTime(_endDate!) : 'Not set',
                onTap: () => _selectEndDate(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateRow({
    required String label,
    required String date,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 12.w,
            height: 12.h,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            label,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const Spacer(),
          Text(
            date,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(width: 8.w),
          Icon(Icons.calendar_today,
              size: 16.sp, color: AppColors.onSurfaceVariant),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final formatter = DateFormat('EEE, MMM d, y; h:mm a');
    return formatter.format(dateTime);
  }

  Future<void> _selectStartDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );

    if (picked != null) {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_startDate ?? DateTime.now()),
      );

      if (time != null) {
        setState(() {
          _startDate = DateTime(
            picked.year,
            picked.month,
            picked.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  Future<void> _selectEndDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? _startDate ?? DateTime.now(),
      firstDate: _startDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );

    if (picked != null) {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_endDate ?? DateTime.now()),
      );

      if (time != null) {
        setState(() {
          _endDate = DateTime(
            picked.year,
            picked.month,
            picked.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  Widget _buildDescriptionField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Event Description',
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFF2A2A2A)),
          ),
          child: Column(
            children: [
              TextField(
                controller: _descriptionController,
                maxLines: 5,
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.onSurface,
                ),
                decoration: InputDecoration(
                  hintText:
                      'Prepare for a day bursting with pure joy and endless laughter as Ronke\'s love story unfolds!\n\nThis vibrant celebration promises a lifetime of smiles, fun, and unforgettable memories. Join us for a heartfelt union where every moment is a testament to true love and happiness.',
                  hintStyle: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.onSurfaceVariant.withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              SizedBox(height: 12.h),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7B68EE),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Generate',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.auto_awesome,
                          size: 14.sp, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLogisticsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Logistics',
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.onSurface,
          ),
        ),
        SizedBox(height: 12.h),
        _buildLogisticItem(
          icon: Icons.people_outline,
          label: 'Expected No. of guests/Attendees',
          controller: _guestCountController,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 12.h),
        _buildLogisticItem(
          icon: Icons.attach_money,
          label: 'A rough budget (₦)',
          controller: _budgetController,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _buildLogisticItem({
    required IconData icon,
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20.sp, color: AppColors.onSurfaceVariant),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ),
          SizedBox(
            width: 100.w,
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    final isSaving = ref.watch(eventUpdateProvider).isLoading;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isSaving ? null : _saveChanges,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.r),
          ),
          disabledBackgroundColor: Colors.grey,
        ),
        child: isSaving
            ? SizedBox(
                height: 20.h,
                width: 20.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              )
            : Text(
                'Save Changes',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Future<void> _saveChanges() async {
    // Validate
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Event name is required'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Prepare updates
    final updates = <String, dynamic>{
      'name': _titleController.text,
      'category': _categoryController.text,
      'description': _descriptionController.text,
      'colorTheme': _selectedColorTheme,
    };

    if (_startDate != null) {
      updates['startDate'] = _startDate!.toIso8601String();
    }

    if (_endDate != null) {
      updates['endDate'] = _endDate!.toIso8601String();
    }

    // Parse numbers
    final guestCount = int.tryParse(_guestCountController.text);
    if (guestCount != null) {
      updates['expectedGuests'] = guestCount;
    }

    final budget = double.tryParse(_budgetController.text);
    if (budget != null) {
      updates['budget'] = budget;
    }

    try {
      await ref.read(eventUpdateProvider.notifier).updateEvent(
            eventId: widget.eventId,
            updates: updates,
          );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Event updated successfully!'),
            backgroundColor: Color(0xFF4CAF50),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update event: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
