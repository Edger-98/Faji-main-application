import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_creation_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/theme_poster_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/widgets/step_progress_indicator.dart';

/// Step 3: Event Poster Selection Screen
class EventPosterScreen extends ConsumerStatefulWidget {
  const EventPosterScreen({super.key});

  @override
  ConsumerState<EventPosterScreen> createState() => _EventPosterScreenState();
}

class _EventPosterScreenState extends ConsumerState<EventPosterScreen> {
  String? _selectedPosterId;

  @override
  void initState() {
    super.initState();
    // Load posters on init
    Future.microtask(() => ref.read(postersProvider(null)));
  }

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
                    child: Consumer(
                      builder: (context, ref, child) {
                        final postersAsync = ref.watch(postersProvider(null));
                        
                        return postersAsync.when(
                          data: (posters) {
                            if (posters.isEmpty) {
                              return Center(
                                child: AppText.bodyMedium(
                                  'No posters available',
                                  color: AppColors.onSurfaceVariant,
                                ),
                              );
                            }
                            
                            return GridView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 16.h,
                                childAspectRatio: 0.75,
                              ),
                              itemCount: posters.length,
                              itemBuilder: (context, index) {
                                final poster = posters[index];
                                final bool isSelected = _selectedPosterId == poster.id;

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedPosterId = poster.id;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      gradient: LinearGradient(
                                        colors: poster.gradientColors,
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
                                        // Poster content
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(16.w),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  poster.name,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: AppTypography.modicaPro,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                    shadows: [
                                                      Shadow(
                                                        color: Colors.black.withOpacity(0.3),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (poster.description != null) ...[
                                                  SizedBox(height: 8.h),
                                                  Text(
                                                    poster.description!,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: AppTypography.modicaPro,
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.white.withOpacity(0.9),
                                                      shadows: [
                                                        Shadow(
                                                          color: Colors.black.withOpacity(0.3),
                                                          blurRadius: 4,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ],
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
                            );
                          },
                          loading: () => const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                          error: (error, stack) => Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  size: 48.sp,
                                  color: AppColors.error,
                                ),
                                SizedBox(height: 16.h),
                                AppText.bodyMedium(
                                  'Failed to load posters',
                                  color: AppColors.error,
                                ),
                                SizedBox(height: 8.h),
                                AppText.bodySmall(
                                  error.toString(),
                                  color: AppColors.onSurfaceVariant,
                                  textAlign: TextAlign.center,
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
