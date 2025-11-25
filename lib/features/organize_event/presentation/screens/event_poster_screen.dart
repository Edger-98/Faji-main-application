import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_creation_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/widgets/step_progress_indicator.dart';

/// Step 3: Event Poster Selection Screen
class EventPosterScreen extends ConsumerStatefulWidget {
  const EventPosterScreen({super.key});

  @override
  ConsumerState<EventPosterScreen> createState() => _EventPosterScreenState();
}

class _EventPosterScreenState extends ConsumerState<EventPosterScreen> {
  String? _selectedPosterId;

  // Mock poster data (will be replaced with API data)
  final List<Map<String, dynamic>> _posters = <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 'poster_1',
      'name': 'Show Up & Turn Up',
      'gradient': <Color>[const Color(0xFF6B4FBB), const Color(0xFFFF6B9D), const Color(0xFFFFA500)],
    },
    {
      'id': 'poster_2',
      'name': 'You Are Specially Invited',
      'gradient': [Color(0xFFFFFFFF), Color(0xFFE0E0E0)],
    },
    {
      'id': 'poster_3',
      'name': 'You Are Invited - Rainbow',
      'gradient': [Color(0xFF00D4FF), Color(0xFFFF00FF), Color(0xFFFFFF00)],
    },
    {
      'id': 'poster_4',
      'name': 'You Are Specially Invited - Colorful',
      'gradient': [Color(0xFFFF0080), Color(0xFF7928CA), Color(0xFFFF0080)],
    },
    {
      'id': 'poster_5',
      'name': 'Cute Characters',
      'gradient': [Color(0xFFFF6B9D), Color(0xFFFF1744)],
    },
    {
      'id': 'poster_6',
      'name': 'Be Our Special Guest',
      'gradient': [Color(0xFF6B4FBB), Color(0xFFFF6B9D)],
    },
  ];

  void _handleNext() {
    final viewModel = ref.read(eventCreationViewModelProvider.notifier);
    
    if (_selectedPosterId != null) {
      viewModel.selectPoster(_selectedPosterId!);
      viewModel.nextStep();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a poster'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  void _handlePrevious() {
    ref.read(eventCreationViewModelProvider.notifier).previousStep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
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
                      color: AppColors.surfaceContainerHighest.withOpacity(0.5),
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
                      currentStep: 3,
                      totalSteps: 5,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        AppText.displayLarge('Choose your\nposter!'),
                        SizedBox(height: 8.h),
                        AppText.bodyMedium(
                          'Select a poster for your event that guests will see when you share your event. You can always change it later.',
                          color: AppColors.onSurfaceVariant,
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),

                  // Poster grid
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: _posters.length,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> poster = _posters[index];
                        final bool isSelected = _selectedPosterId == poster['id'] as String?;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedPosterId = poster['id'] as String?;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: LinearGradient(
                                colors: poster['gradient'] as List<Color>,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              border: isSelected
                                  ? Border.all(
                                      color: AppColors.primary,
                                      width: 3,
                                    )
                                  : null,
                            ),
                            child: Stack(
                              children: [
                                // Poster content placeholder
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(16.w),
                                    child: Text(
                                      poster['name'] as String,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: AppTypography.neueHaasDisplay,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                                // Selection indicator
                                if (isSelected)
                                  Positioned(
                                    top: 12.h,
                                    right: 12.w,
                                    child: Container(
                                      width: 28.w,
                                      height: 28.h,
                                      decoration: const BoxDecoration(
                                        color: AppColors.primary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: AppColors.onPrimary,
                                        size: 18.sp,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Bottom button
                  Padding(
                    padding: EdgeInsets.all(24.w),
                    child: GestureDetector(
                      onTap: _handleNext,
                      child: Container(
                        height: 69.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(34.5.r),
                        ),
                        child: Center(
                          child: AppText.labelLarge(
                            'Continue',
                            color: AppColors.onPrimary,
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
    );
  }
}
