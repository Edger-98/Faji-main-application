import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_creation_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/widgets/step_progress_indicator.dart';

/// Step 4: Event Theme Selection Screen
class EventThemeScreen extends ConsumerStatefulWidget {
  const EventThemeScreen({super.key});

  @override
  ConsumerState<EventThemeScreen> createState() => _EventThemeScreenState();
}

class _EventThemeScreenState extends ConsumerState<EventThemeScreen> {
  String? _selectedThemeId;

  // Mock theme data (will be replaced with API data)
  final List<Map<String, dynamic>> _themes = <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 'theme_1',
      'name': 'Silver',
      'gradient': <Color>[const Color(0xFFE0E0E0), const Color(0xFF9E9E9E)],
    },
    {
      'id': 'theme_2',
      'name': 'Sunset',
      'gradient': [Color(0xFFFF6B6B), Color(0xFFFFD93D)],
    },
    {
      'id': 'theme_3',
      'name': 'Pastel Rainbow',
      'gradient': [Color(0xFFB4E7CE), Color(0xFFFFF4B7), Color(0xFFFFB4E7)],
    },
    {
      'id': 'theme_4',
      'name': 'Coral',
      'gradient': [Color(0xFFFF9A8B), Color(0xFFFF6A88)],
    },
    {
      'id': 'theme_5',
      'name': 'Ocean Blue',
      'gradient': [Color(0xFF4A90E2), Color(0xFF7B68EE)],
    },
    {
      'id': 'theme_6',
      'name': 'Neon Orange',
      'gradient': [Color(0xFFFF6B35), Color(0xFFFF8C42)],
    },
    {
      'id': 'theme_7',
      'name': 'Mint Green',
      'gradient': [Color(0xFF98D8C8), Color(0xFFF6F7D7)],
    },
    {
      'id': 'theme_8',
      'name': 'Pink Gradient',
      'gradient': [Color(0xFFFF6B9D), Color(0xFFFFC3A0)],
    },
    {
      'id': 'theme_9',
      'name': 'Tangerine',
      'gradient': [Color(0xFFFF9966), Color(0xFFFF5E62)],
    },
    {
      'id': 'theme_10',
      'name': 'Aqua Mint',
      'gradient': [Color(0xFFB2FEFA), Color(0xFF0ED2F7)],
    },
  ];

  void _handleCreateEvent() async {
    final viewModel = ref.read(eventCreationViewModelProvider.notifier);
    
    if (_selectedThemeId != null) {
      viewModel.selectTheme(_selectedThemeId!);
      
      // Show loading
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
          ),
        ),
      );
      
      // Create event
      await viewModel.createEvent();
      
      // Close loading
      if (mounted) {
        Navigator.pop(context);
        
        // Show success and navigate back
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Event created successfully!'),
            backgroundColor: AppColors.success,
          ),
        );
        
        // Navigate to home or event details
        context.go('/home');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a theme'),
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
                      currentStep: 4,
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
                        AppText.displayLarge('Choose your\nparty\'s theme'),
                        SizedBox(height: 8.h),
                        AppText.bodyMedium(
                          'Swipe through stunning themes and customize the feel for your event.',
                          color: AppColors.onSurfaceVariant,
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),

                  // Theme grid
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: _themes.length,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> theme = _themes[index];
                        final bool isSelected = _selectedThemeId == theme['id'] as String?;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedThemeId = theme['id'] as String?;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: LinearGradient(
                                colors: theme['gradient'] as List<Color>,
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

                  // Bottom text and button
                  Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      children: [
                        AppText.bodyMedium(
                          'Pick a design that sets the tone for your event. Don\'t worry—you can tweak it later!',
                          color: AppColors.onSurfaceVariant,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h),
                        GestureDetector(
                          onTap: _handleCreateEvent,
                          child: Container(
                            height: 69.h,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(34.5.r),
                            ),
                            child: Center(
                              child: AppText.labelLarge(
                                'Create Event',
                                color: AppColors.onPrimary,
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
          ],
        ),
      ),
    );
  }
}
