import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/services/image_upload_service.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_creation_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/widgets/step_progress_indicator.dart';

/// Step 1: Create Event Details Screen
class CreateEventDetailsScreen extends ConsumerStatefulWidget {
  const CreateEventDetailsScreen({super.key});

  @override
  ConsumerState<CreateEventDetailsScreen> createState() =>
      _CreateEventDetailsScreenState();
}

class _CreateEventDetailsScreenState
    extends ConsumerState<CreateEventDetailsScreen>
    with SingleTickerProviderStateMixin {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _websiteLinkController = TextEditingController();
  final _rsvpButtonController =
      TextEditingController(text: 'Celebrate With Us');
  DateTime? _startDate;
  DateTime? _endDate;
  bool _setDateLater = false;
  
  // Image upload state
  File? _selectedImage;
  bool _isUploadingImage = false;
  String? _uploadError;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _animationController.forward();

    // Load saved data if any
    final state = ref.read(eventCreationViewModelProvider);
    if (state.eventData.title != null) {
      _titleController.text = state.eventData.title!;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _websiteLinkController.dispose();
    _rsvpButtonController.dispose();
    super.dispose();
  }

  Future<void> _selectStartDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.primary,
              onPrimary: AppColors.onPrimary,
              surface: AppColors.surface,
              onSurface: AppColors.onSurface,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      // Now pick the time
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _startDate != null 
            ? TimeOfDay.fromDateTime(_startDate!)
            : TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.dark(
                primary: AppColors.primary,
                onPrimary: AppColors.onPrimary,
                surface: AppColors.surface,
                onSurface: AppColors.onSurface,
              ),
            ),
            child: child!,
          );
        },
      );

      // Use picked time or default to current time if cancelled
      final timeToUse = pickedTime ?? TimeOfDay.now();
      
      final DateTime fullDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        timeToUse.hour,
        timeToUse.minute,
      );
      
      setState(() {
        _startDate = fullDateTime;
      });
      ref.read(eventCreationViewModelProvider.notifier).updateEventDate(fullDateTime);
    }
  }

  Future<void> _selectEndDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _endDate ?? _startDate ?? DateTime.now(),
      firstDate: _startDate ?? DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.primary,
              onPrimary: AppColors.onPrimary,
              surface: AppColors.surface,
              onSurface: AppColors.onSurface,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      // Now pick the time
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _endDate != null 
            ? TimeOfDay.fromDateTime(_endDate!)
            : (_startDate != null 
                ? TimeOfDay.fromDateTime(_startDate!.add(const Duration(hours: 2)))
                : TimeOfDay.now()),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.dark(
                primary: AppColors.primary,
                onPrimary: AppColors.onPrimary,
                surface: AppColors.surface,
                onSurface: AppColors.onSurface,
              ),
            ),
            child: child!,
          );
        },
      );

      // Use picked time or default to 2 hours after start (or current time) if cancelled
      final TimeOfDay timeToUse;
      if (pickedTime != null) {
        timeToUse = pickedTime;
      } else if (_startDate != null) {
        final defaultEnd = _startDate!.add(const Duration(hours: 2));
        timeToUse = TimeOfDay.fromDateTime(defaultEnd);
      } else {
        timeToUse = TimeOfDay.now();
      }
      
      final DateTime fullDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        timeToUse.hour,
        timeToUse.minute,
      );
      
      setState(() {
        _endDate = fullDateTime;
      });
    }
  }

  void _handleNext() {
    final viewModel = ref.read(eventCreationViewModelProvider.notifier);

    // Update all fields
    viewModel.updateTitle(_titleController.text);
    viewModel.updateDescription(_descriptionController.text);
    viewModel.updateWebsiteLink(_websiteLinkController.text);
    viewModel.updateRsvpButtonText(_rsvpButtonController.text);

    // Store dates
    if (_startDate != null) {
      viewModel.updateStartDate(_startDate!);
    }
    if (_endDate != null) {
      viewModel.updateEndDate(_endDate!);
    }

    // Validate
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please give your event a name'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
      );
      return;
    }

    if (!_setDateLater && _startDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              const Text('Please set a start date or choose "Set a date later"'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
      );
      return;
    }

    viewModel.nextStep();
  }

  void _handlePrevious() {
    ref.read(eventCreationViewModelProvider.notifier).previousStep();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(eventCreationViewModelProvider);
    final eventType = state.eventData.eventType ?? 'Event';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              // Header with back button and progress
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color:
                            AppColors.surfaceContainerHighest.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_new, size: 18.sp),
                        color: AppColors.onSurface,
                        padding: EdgeInsets.zero,
                        onPressed: _handlePrevious,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    const Expanded(
                      child: StepProgressIndicator(
                        currentStep: 1,
                        totalSteps: 3,
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: SlideTransition(
                  position: _slideAnimation,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    children: [
                      SizedBox(height: 20.h),

                      // Title
                      Text(
                        'Bring your\nmoment to life',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 42.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.onSurface,
                          height: 1.1,
                          letterSpacing: -1.2,
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Subtitle
                      Text(
                        'Fill in the details to craft your perfect $eventType\nand create lasting memories.',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.onSurfaceVariant.withOpacity(0.8),
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 40.h),

                      // Event Name Field
                      _buildAnimatedField(
                        delay: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Give this $eventType a name',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                                letterSpacing: 0.3,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            _buildStyledTextField(
                              controller: _titleController,
                              hintText: 'Give this $eventType a name',
                              hintStyle: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.onSurfaceVariant
                                    .withOpacity(0.4),
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // Date + Time Section
                      _buildAnimatedField(
                        delay: 200,
                        child: Column(
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
                                    fontWeight: FontWeight.w500,
                                    color:
                                        AppColors.onSurface.withOpacity(0.7),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _setDateLater = !_setDateLater;
                                      if (_setDateLater) {
                                        _startDate = null;
                                        _endDate = null;
                                      }
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 6.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _setDateLater
                                          ? AppColors.primary.withOpacity(0.15)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(12.r),
                                      border: Border.all(
                                        color: _setDateLater
                                            ? AppColors.primary
                                            : const Color(0xFFFF8C42),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (_setDateLater)
                                          Padding(
                                            padding: EdgeInsets.only(right: 6.w),
                                            child: Icon(
                                              Icons.check_circle,
                                              size: 16.sp,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        Text(
                                          'Set a date later',
                                          style: TextStyle(
                                            fontFamily: AppTypography.modicaPro,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                            color: _setDateLater
                                                ? AppColors.primary
                                                : const Color(0xFFFF8C42),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              padding: EdgeInsets.all(20.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2A2A2A),
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: const Color(0xFF3A3A3A),
                                  width: 1.5,
                                ),
                              ),
                              child: Column(
                                children: [
                                  _buildDateRow(
                                    label: 'Start',
                                    date: _startDate,
                                    dateLabel: 'Start Date',
                                    onTap: _setDateLater
                                        ? null
                                        : _selectStartDate,
                                    isStart: true,
                                  ),
                                  SizedBox(height: 16.h),
                                  _buildDateRow(
                                    label: 'End',
                                    date: _endDate,
                                    dateLabel: 'End Date',
                                    onTap:
                                        _setDateLater ? null : _selectEndDate,
                                    isStart: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // Event Website Link
                      _buildAnimatedField(
                        delay: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Event Website Link (shared with guests)',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.onSurface.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            _buildWebsiteLinkField(),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // RSVP Button Title
                      _buildAnimatedField(
                        delay: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'RSVP Button Title (for your event link)',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.onSurface.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            _buildRSVPButtonField(),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // Event Image Upload (NEW)
                      _buildAnimatedField(
                        delay: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Event Image (Optional)',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.onSurface.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            _buildImageUploadField(),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // Description
                      _buildAnimatedField(
                        delay: 600,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Describe your event',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.onSurface.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            _buildDescriptionField(),
                          ],
                        ),
                      ),
                      SizedBox(height: 60.h),
                    ],
                  ),
                ),
              ),

              // Bottom Navigation
              Container(
                padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
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
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: _handlePrevious,
                        child: Container(
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainerHighest
                                .withOpacity(0.8),
                            borderRadius: BorderRadius.circular(28.r),
                          ),
                          child: Center(
                            child: Text(
                              'Previous',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurface,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: _handleNext,
                        child: Container(
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(28.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedField({required int delay, required Widget child}) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 600 + delay),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  Widget _buildStyledTextField({
    required TextEditingController controller,
    required String hintText,
    TextStyle? hintStyle,
    Widget? suffixIcon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A), // Darker, more visible background
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xFF3A3A3A), // Subtle border for definition
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.onSurface,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle ??
                    TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.onSurfaceVariant.withOpacity(0.5),
                    ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
              onChanged: (value) => setState(() {}),
            ),
          ),
          if (suffixIcon != null) suffixIcon,
        ],
      ),
    );
  }

  Widget _buildDateRow({
    required String label,
    required DateTime? date,
    required String dateLabel,
    required VoidCallback? onTap,
    required bool isStart,
  }) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 12.w,
              height: 12.h,
              decoration: BoxDecoration(
                color: date != null
                    ? AppColors.primary
                    : AppColors.onSurface.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
            if (!isStart)
              Container(
                width: 2.w,
                height: 20.h,
                color: AppColors.onSurface.withOpacity(0.2),
                margin: EdgeInsets.symmetric(vertical: 4.h),
              ),
          ],
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.onSurface.withOpacity(0.7),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: date != null
                  ? AppColors.primary.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: date != null
                    ? AppColors.primary.withOpacity(0.3)
                    : AppColors.onSurface.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Text(
              date != null
                  ? '${date.day}/${date.month}/${date.year} ${_formatTime(date)}'
                  : dateLabel,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: date != null
                    ? AppColors.primary
                    : AppColors.onSurface.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour > 12 ? dateTime.hour - 12 : (dateTime.hour == 0 ? 12 : dateTime.hour);
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  Widget _buildWebsiteLinkField() {
    final isLinkValid = _websiteLinkController.text.isNotEmpty;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xFF3A3A3A),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.link_rounded,
                color: const Color(0xFFFF8C42),
                size: 20.sp,
              ),
              SizedBox(width: 12.w),
              Text(
                'faji.com/',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurface.withOpacity(0.7),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _websiteLinkController,
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurface,
                  ),
                  decoration: InputDecoration(
                    hintText: 'sdggy',
                    hintStyle: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.onSurfaceVariant.withOpacity(0.4),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                  onChanged: (value) => setState(() {}),
                ),
              ),
              if (isLinkValid)
                Icon(
                  Icons.check_circle,
                  color: const Color(0xFF4CAF50),
                  size: 20.sp,
                ),
            ],
          ),
          if (isLinkValid) ...[
            SizedBox(height: 12.h),
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: const Color(0xFF4CAF50),
                  size: 16.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  'This link is available!',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF4CAF50),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRSVPButtonField() {
    final rsvpOptions = [
      'Celebrate With Us',
      'Join Us',
      'RSVP Now',
      'Save Your Spot',
      'Count Me In',
      'Be There',
    ];

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: const Color(0xFF1A1A1A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          builder: (context) => Container(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'Choose RSVP Button Text',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                ...rsvpOptions.map((option) => ListTile(
                      title: Text(
                        option,
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.onSurface,
                        ),
                      ),
                      trailing: _rsvpButtonController.text == option
                          ? Icon(Icons.check, color: AppColors.primary)
                          : null,
                      onTap: () {
                        setState(() {
                          _rsvpButtonController.text = option;
                        });
                        Navigator.pop(context);
                      },
                    )),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: const Color(0xFF3A3A3A),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _rsvpButtonController.text,
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurface,
                ),
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.onSurface.withOpacity(0.5),
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xFF3A3A3A),
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              controller: _descriptionController,
              maxLines: null,
              minLines: 1,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.onSurface,
              ),
              decoration: InputDecoration(
                hintText: 'What would you like to say about it (optional)',
                hintStyle: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.onSurfaceVariant.withOpacity(0.4),
                  fontStyle: FontStyle.italic,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
              onChanged: (value) => setState(() {}),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {
              // TODO: Implement AI generation
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('AI generation coming soon!'),
                  backgroundColor: AppColors.primary,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7B68EE), Color(0xFF9B7FFF)],
                ),
                borderRadius: BorderRadius.circular(12.r),
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
                  Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 14.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // NEW: Image upload widget
  Widget _buildImageUploadField() {
    return GestureDetector(
      onTap: _isUploadingImage ? null : _pickAndUploadImage,
      child: Container(
        height: 200.h,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: _uploadError != null 
                ? AppColors.error 
                : const Color(0xFF3A3A3A),
            width: 1.5,
          ),
          image: _selectedImage != null
              ? DecorationImage(
                  image: FileImage(_selectedImage!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: _selectedImage == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_isUploadingImage)
                      Column(
                        children: [
                          CircularProgressIndicator(color: AppColors.primary),
                          SizedBox(height: 12.h),
                          Text(
                            'Uploading image...',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 14.sp,
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      )
                    else ...[
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 48.sp,
                        color: AppColors.onSurfaceVariant.withOpacity(0.6),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        'Tap to add event image',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Gallery or Camera',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 12.sp,
                          color: AppColors.onSurfaceVariant.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ],
                ),
              )
            : Stack(
                children: [
                  // Remove button
                  Positioned(
                    top: 12.h,
                    right: 12.w,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedImage = null;
                          _uploadError = null;
                        });
                        ref.read(eventCreationViewModelProvider.notifier)
                            .updateImageUrl('');
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  // Success indicator
                  Positioned(
                    bottom: 12.h,
                    left: 12.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 16.sp,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            'Image uploaded',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  // NEW: Pick and upload image method
  Future<void> _pickAndUploadImage() async {
    // Show options: Gallery or Camera
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose Image Source',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
              ),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.photo_library, color: AppColors.primary),
              ),
              title: Text(
                'Choose from Gallery',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurface,
                ),
              ),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            SizedBox(height: 8.h),
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.camera_alt, color: AppColors.primary),
              ),
              title: Text(
                'Take Photo',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurface,
                ),
              ),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );

    if (source == null) return;

    setState(() {
      _isUploadingImage = true;
      _uploadError = null;
    });

    try {
      final imageUploadService = ref.read(imageUploadServiceProvider);
      
      // Pick image
      final file = source == ImageSource.gallery
          ? await imageUploadService.pickImageFromGallery()
          : await imageUploadService.pickImageFromCamera();

      if (file == null) {
        setState(() => _isUploadingImage = false);
        return;
      }

      // Upload to backend (which uploads to Cloudinary)
      final imageUrl = await imageUploadService.uploadEventImage(file);

      // Save to viewmodel
      ref.read(eventCreationViewModelProvider.notifier).updateImageUrl(imageUrl);
      ref.read(eventCreationViewModelProvider.notifier).updateLocalImagePath(file.path);

      setState(() {
        _selectedImage = file;
        _isUploadingImage = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 12.w),
                const Text('Image uploaded successfully!'),
              ],
            ),
            backgroundColor: AppColors.success,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _uploadError = e.toString();
        _isUploadingImage = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to upload image: ${e.toString()}'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }
}
