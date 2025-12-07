import 'package:flutter/material.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrganizeEventScreen extends StatefulWidget {
  const OrganizeEventScreen({super.key});

  @override
  State<OrganizeEventScreen> createState() => _OrganizeEventScreenState();
}

class _OrganizeEventScreenState extends State<OrganizeEventScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _seatsController = TextEditingController();
  final _locationController = TextEditingController();
  final _priceController = TextEditingController();
  int _wordCount = 0;

  @override
  void initState() {
    super.initState();
    _descriptionController.addListener(_updateWordCount);
  }

  void _updateWordCount() {
    final text = _descriptionController.text;
    setState(() {
      _wordCount = text.isEmpty ? 0 : text.split(RegExp(r'\s+')).length;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _seatsController.dispose();
    _locationController.dispose();
    _priceController.dispose();
    super.dispose();
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  // Back button
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
                ],
              ),
            ),
            // Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  SizedBox(height: 6.h),
                  AppText.displayLarge(
                    'Organize an event',
                  ),
                  SizedBox(height: 4.h),
                  AppText.bodyMedium(
                    'Fill out the fields below to host an event',
                    color: AppColors.onSurfaceVariant,
                  ),
                  SizedBox(height: 31.h),
                  // Add Title
                  _buildSectionLabel('Add Title'),
                  SizedBox(height: 7.h),
                  AppTextField(
                    hintText: 'Add title of your event',
                    controller: _titleController,
                  ),
                  SizedBox(height: 27.h),
                  // Add Cover photos
                  _buildSectionLabel('Add Cover photos'),
                  SizedBox(height: 7.h),
                  AppTextField(
                    hintText: 'It shows on your event profile',
                    suffixWidget: Icon(
                      Icons.add_photo_alternate_outlined,
                      color: AppColors.onSurfaceVariant,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(height: 27.h),
                  // Description
                  _buildSectionLabel('Description'),
                  SizedBox(height: 7.h),
                  _buildDescriptionField(),
                  SizedBox(height: 27.h),
                  // Add event date
                  _buildSectionLabel('Add event date'),
                  SizedBox(height: 7.h),
                  AppTextField(
                    hintText: 'Choose date from the calendar',
                    controller: _dateController,
                    suffixWidget: Icon(
                      Icons.calendar_today_outlined,
                      color: AppColors.onSurfaceVariant,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(height: 27.h),
                  // Add event time
                  _buildSectionLabel('Add event time'),
                  SizedBox(height: 7.h),
                  AppTextField(
                    hintText: 'Add time',
                    controller: _timeController,
                  ),
                  SizedBox(height: 27.h),
                  // Add event seats
                  _buildSectionLabel('Add event seats'),
                  SizedBox(height: 7.h),
                  AppTextField(
                    hintText: 'Add total available seats',
                    controller: _seatsController,
                  ),
                  SizedBox(height: 27.h),
                  // Add event location
                  _buildSectionLabel('Add event location'),
                  SizedBox(height: 7.h),
                  AppTextField(
                    hintText: 'Get a location',
                    controller: _locationController,
                    suffixWidget: Icon(
                      Icons.location_on_outlined,
                      color: AppColors.onSurfaceVariant,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(height: 27.h),
                  // Add ticket price
                  _buildSectionLabel('Add ticket price'),
                  SizedBox(height: 7.h),
                  AppTextField(
                    hintText: 'Add ticket price',
                    controller: _priceController,
                  ),
                  SizedBox(height: 27.h),
                  // Organize button
                  GestureDetector(
                    onTap: () {
                      // Handle organize event
                    },
                    child: Container(
                      height: 69.h,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(34.5.r),
                      ),
                      child: Center(
                        child: AppText.labelLarge(
                          'Organize an event',
                          color: AppColors.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w),
      child: AppText.bodyMedium(
        label,
      ),
    );
  }

  Widget _buildDescriptionField() {
    return Container(
      height: 183.h,
      padding: EdgeInsets.all(22.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(37.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              controller: _descriptionController,
              maxLines: null,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.onSurface,
              ),
              decoration: InputDecoration(
                hintText: 'Add description about your event.',
                hintStyle: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.onSurfaceVariant,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: AppText.bodySmall(
              '$_wordCount-500 words',
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
