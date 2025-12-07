import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_creation_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/theme_poster_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/widgets/step_progress_indicator.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_details_tabbed_screen.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart' as events_providers;

/// Step 4: Event Theme Selection Screen
class EventThemeScreen extends ConsumerStatefulWidget {
  const EventThemeScreen({super.key});

  @override
  ConsumerState<EventThemeScreen> createState() => _EventThemeScreenState();
}

class _EventThemeScreenState extends ConsumerState<EventThemeScreen> {
  String? _selectedThemeId;
  bool _isCreating = false;

  @override
  void initState() {
    super.initState();
    // Load themes on init
    Future.microtask(() => ref.read(themesProvider));
  }

  void _handleCreateEvent() async {
    if (_selectedThemeId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a theme'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_isCreating) return;

    setState(() {
      _isCreating = true;
    });

    try {
      print('🎯 Starting event creation...');
      final viewModel = ref.read(eventCreationViewModelProvider.notifier);
      final state = ref.read(eventCreationViewModelProvider);
      
      viewModel.selectTheme(_selectedThemeId!);
      
      final startDate = state.eventData.eventDate;
      DateTime? endDate;
      if (state.eventData.eventTime != null) {
        try {
          endDate = DateTime.parse(state.eventData.eventTime!);
        } catch (e) {
          print('⚠️ Failed to parse end date: $e');
          endDate = startDate?.add(const Duration(hours: 3));
        }
      }
      
      final websiteLink = state.eventData.location;
      
      print('📤 Calling createEvent API...');
      print('   Title: ${state.eventData.title}');
      print('   Start: $startDate');
      print('   End: $endDate');
      print('   Theme: $_selectedThemeId');
      print('   Poster: ${state.eventData.selectedPosterId}');
      
      final createdEvent = await viewModel.createEvent(
        startDate: startDate,
        endDate: endDate,
        websiteLink: websiteLink,
        rsvpButtonText: 'Celebrate With Us',
      );
      
      print('📥 API Response received');
      print('   Event: ${createdEvent?.id}');
      print('   Name: ${createdEvent?.name}');
      
      if (!mounted) {
        print('⚠️ Widget not mounted, aborting navigation');
        return;
      }
      
      if (createdEvent != null) {
        print('✅ Event created successfully, refreshing lists...');
        
        // Invalidate and refetch all event providers
        ref.invalidate(filteredEventsProvider);
        ref.invalidate(events_providers.userEventsProvider);
        
        // Trigger immediate refetch
        ref.read(events_providers.userEventsProvider.notifier).getUserEvents();
        
        // Reset event creation state for next time
        ref.read(eventCreationViewModelProvider.notifier).reset();
        
        if (mounted) {
          // Show success dialog instead of navigating to a new screen
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (dialogContext) => AlertDialog(
              backgroundColor: AppColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: AppColors.success.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      size: 50.sp,
                      color: AppColors.success,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Event Created!',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onSurface,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    '"${createdEvent.name}"',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Your event has been created successfully!',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 14.sp,
                      color: AppColors.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                            context.go('/home');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.surfaceContainerHighest,
                            foregroundColor: AppColors.onSurface,
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            'Go Home',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                            // Navigate to the tabbed event details screen for organized events
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => EventDetailsTabbedScreen(
                                  eventId: createdEvent.id,
                                  eventName: createdEvent.name,
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.onPrimary,
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            'View Event',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        print('✅ Navigation complete');
      } else {
        print('❌ Event creation returned null');
        setState(() {
          _isCreating = false;
        });
        
        final error = ref.read(eventCreationViewModelProvider).error;
        print('❌ Error: $error');
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error ?? 'Failed to create event'),
              backgroundColor: AppColors.error,
              duration: const Duration(seconds: 4),
            ),
          );
        }
      }
    } catch (e, stackTrace) {
      print('💥 EXCEPTION in _handleCreateEvent: $e');
      print('Stack trace: $stackTrace');
      
      if (!mounted) return;
      
      setState(() {
        _isCreating = false;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: AppColors.error,
          duration: const Duration(seconds: 4),
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
                    child: Consumer(
                      builder: (context, ref, child) {
                        final themesAsync = ref.watch(themesProvider);
                        
                        return themesAsync.when(
                          data: (themes) {
                            if (themes.isEmpty) {
                              return Center(
                                child: AppText.bodyMedium(
                                  'No themes available',
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
                                childAspectRatio: 1.2,
                              ),
                              itemCount: themes.length,
                              itemBuilder: (context, index) {
                                final theme = themes[index];
                                final bool isSelected = _selectedThemeId == theme.id;

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedThemeId = theme.id;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      gradient: LinearGradient(
                                        colors: theme.gradientColors,
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
                                        // Theme name
                                        Positioned(
                                          bottom: 12.h,
                                          left: 12.w,
                                          right: 12.w,
                                          child: Text(
                                            theme.name,
                                            style: TextStyle(
                                              fontFamily: AppTypography.modicaPro,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              shadows: [
                                                Shadow(
                                                  color: Colors.black.withOpacity(0.3),
                                                  blurRadius: 4,
                                                ),
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
                                  'Failed to load themes',
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
                          onTap: _isCreating ? null : _handleCreateEvent,
                          child: Container(
                            height: 69.h,
                            decoration: BoxDecoration(
                              color: _isCreating 
                                  ? AppColors.primary.withOpacity(0.6)
                                  : AppColors.primary,
                              borderRadius: BorderRadius.circular(34.5.r),
                            ),
                            child: Center(
                              child: _isCreating
                                  ? SizedBox(
                                      width: 24.w,
                                      height: 24.h,
                                      child: const CircularProgressIndicator(
                                        color: AppColors.onPrimary,
                                        strokeWidth: 2.5,
                                      ),
                                    )
                                  : AppText.labelLarge(
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
