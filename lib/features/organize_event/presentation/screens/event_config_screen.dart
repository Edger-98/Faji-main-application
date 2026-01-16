import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_creation_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/widgets/step_progress_indicator.dart';
import 'package:fajimobileapp/features/organize_event/presentation/widgets/feature_toggle_card.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_details_tabbed_screen.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart' as events_providers;
import 'package:fajimobileapp/features/cohost_marketplace/presentation/screens/resource_categories_screen.dart';

/// Step 2: Event Configuration Screen
class EventConfigScreen extends ConsumerStatefulWidget {
  const EventConfigScreen({super.key});

  @override
  ConsumerState<EventConfigScreen> createState() => _EventConfigScreenState();
}

class _EventConfigScreenState extends ConsumerState<EventConfigScreen> {
  final _guestsController = TextEditingController();
  final _budgetController = TextEditingController();

  @override
  void dispose() {
    _guestsController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  bool _isCreatingEvent = false;

  void _handleNext() {
    final viewModel = ref.read(eventCreationViewModelProvider.notifier);
    
    if (_isCreatingEvent) {
      print('⚠️ Already creating event, please wait...');
      return;
    }
    
    if (viewModel.canProceedFromStep2()) {
      print('✅ Validation passed, creating event...');
      // This is the final step - create event directly
      _createEvent();
    } else {
      print('❌ Validation failed: Missing expected guests');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please enter expected number of guests'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
    }
  }
  
  // NEW: Create event method (moved from theme screen)
  Future<void> _createEvent() async {
    setState(() {
      _isCreatingEvent = true;
    });
    
    final viewModel = ref.read(eventCreationViewModelProvider.notifier);
    final state = ref.read(eventCreationViewModelProvider);
    
    try {
      print('🎯 Starting event creation...');
      print('📋 Event data: ${state.eventData}');
      
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
      
      final createdEvent = await viewModel.createEvent(
        startDate: startDate,
        endDate: endDate,
        websiteLink: websiteLink,
        rsvpButtonText: 'Celebrate With Us',
      );
      
      if (!mounted) return;
      
      if (createdEvent != null) {
        print('✅ Event created successfully');
        
        // Reset loading state
        if (mounted) {
          setState(() {
            _isCreatingEvent = false;
          });
        }
        
        // Invalidate event providers (will auto-refetch when needed)
        ref.invalidate(filteredEventsProvider);
        ref.invalidate(events_providers.userEventsProvider);
        
        // Reset event creation state for next time
        ref.read(eventCreationViewModelProvider.notifier).reset();
        
        if (mounted) {
          // Check if marketplace is enabled
          if (state.eventData.enableCohostMarketplace) {
            print('🛒 Marketplace enabled - navigating directly to marketplace...');
            
            // Show brief success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Event created! Opening marketplace...'),
                duration: const Duration(seconds: 2),
                backgroundColor: AppColors.success,
              ),
            );
            
            // Pop current screen and navigate to marketplace
            Navigator.of(context).pop(); // Remove event creation screen
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (ctx) => ResourceCategoriesScreen(
                  eventId: createdEvent.id,
                ),
              ),
            );
            return;
          }
          
          // Show success bottom sheet with delay to ensure context is ready
          await Future<void>.delayed(const Duration(milliseconds: 300));
          
          if (!mounted) {
            print('⚠️ Widget unmounted before showing bottom sheet');
            return;
          }
          
          print('🔍 About to show bottom sheet, mounted: $mounted');
          
          await showModalBottomSheet<void>(
            context: context,
            isDismissible: false,
            enableDrag: false,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (sheetContext) {
              return PopScope(
                canPop: false,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r),
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(24.w, 32.h, 24.w, 40.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Success icon
                          Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              color: AppColors.success.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check_circle_rounded,
                              size: 50.sp,
                              color: AppColors.success,
                            ),
                          ),
                          SizedBox(height: 24.h),
                        
                          // Title
                          Text(
                            'Event Created!',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColors.onSurface,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          
                          // Event name
                          Text(
                            '"${createdEvent.name}"',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8.h),
                          
                          // Success message
                          Text(
                            'Your event is ready to go!',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 15.sp,
                              color: AppColors.onSurfaceVariant,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 32.h),
                          
                          // View Event button (primary action)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                print('🔘 View Event button pressed');
                                print('📍 Event ID: ${createdEvent.id}');
                                
                                // Close bottom sheet first
                                Navigator.of(sheetContext).pop();
                                
                                // Wait a frame to ensure bottom sheet is closed
                                await Future<void>.delayed(const Duration(milliseconds: 100));
                                
                                // Check if still mounted
                                if (!mounted) {
                                  print('⚠️ Widget unmounted, cannot navigate');
                                  return;
                                }
                                
                                // Pop the event creation screen
                                Navigator.of(context).pop();
                                
                                // Wait another frame
                                await Future<void>.delayed(const Duration(milliseconds: 100));
                                
                                // Check if still mounted
                                if (!mounted) {
                                  print('⚠️ Widget unmounted after pop');
                                  return;
                                }
                                
                                // Navigate to event details
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (ctx) => EventDetailsTabbedScreen(
                                      eventId: createdEvent.id,
                                      eventName: createdEvent.name,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(vertical: 18.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'View Event',
                                    style: TextStyle(
                                      fontFamily: AppTypography.modicaPro,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 20.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          
                          // Go Home button (secondary action)
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () async {
                                print('🏠 Go Home button pressed');
                                
                                // Close bottom sheet first
                                Navigator.of(sheetContext).pop();
                                
                                // Wait a frame to ensure bottom sheet is closed
                                await Future<void>.delayed(const Duration(milliseconds: 100));
                                
                                // Check if still mounted
                                if (!mounted) {
                                  print('⚠️ Widget unmounted, cannot navigate');
                                  return;
                                }
                                
                                // Pop the event creation screen and navigate to home
                                Navigator.of(context).pop();
                                
                                // Wait another frame
                                await Future<void>.delayed(const Duration(milliseconds: 100));
                                
                                // Check if still mounted before using context.go
                                if (!mounted) {
                                  print('⚠️ Widget unmounted after pop');
                                  return;
                                }
                                
                                // Navigate to home
                                context.go('/home');
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 18.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                              ),
                              child: Text(
                                'Go Home',
                                style: TextStyle(
                                  fontFamily: AppTypography.modicaPro,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      } else {
        print('❌ Event creation returned null');
        
        final error = ref.read(eventCreationViewModelProvider).error;
        print('❌ Error: $error');
        
        if (mounted) {
          setState(() {
            _isCreatingEvent = false;
          });
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
      print('💥 EXCEPTION in _createEvent: $e');
      print('Stack trace: $stackTrace');
      
      if (!mounted) return;
      
      setState(() {
        _isCreatingEvent = false;
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
    final state = ref.watch(eventCreationViewModelProvider);
    final viewModel = ref.read(eventCreationViewModelProvider.notifier);

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
                      currentStep: 2,
                      totalSteps: 3,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  SizedBox(height: 20.h),

                  // Expected guests input
                  Container(
                    height: 80.h,
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
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
                        Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Icon(
                            Icons.people_outline,
                            color: AppColors.primary,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText.bodySmall(
                                'Expected Guests',
                                color: AppColors.onSurfaceVariant,
                              ),
                              TextField(
                                controller: _guestsController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (value) {
                                  setState(() {});
                                  if (value.isNotEmpty) {
                                    viewModel.updateExpectedGuests(int.parse(value));
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: AppTypography.modicaPro,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.onSurface,
                                ),
                                decoration: InputDecoration(
                                  hintText: '0',
                                  hintStyle: TextStyle(
                                    fontFamily: AppTypography.modicaPro,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.onSurfaceVariant.withOpacity(0.5),
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                  isDense: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_guestsController.text.isNotEmpty)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: AppText.bodySmall(
                              '${_guestsController.text} guests',
                              color: AppColors.primary,
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Budget input
                  Container(
                    height: 80.h,
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
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
                        Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: AppColors.eventCardYellow.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Icon(
                            Icons.account_balance_wallet_outlined,
                            color: AppColors.eventCardYellow,
                            size: 20.sp,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText.bodySmall(
                                'Budget (Optional)',
                                color: AppColors.onSurfaceVariant,
                              ),
                              Row(
                                children: [
                                  AppText.titleMedium(
                                    'NGN',
                                    color: AppColors.onSurface,
                                  ),
                                  SizedBox(width: 4.w),
                                  Expanded(
                                    child: TextField(
                                      controller: _budgetController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      onChanged: (value) {
                                        setState(() {});
                                        if (value.isNotEmpty) {
                                          viewModel.updateBudget(double.parse(value));
                                        }
                                      },
                                      style: TextStyle(
                                        fontFamily: AppTypography.modicaPro,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.onSurface,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: '0',
                                        hintStyle: TextStyle(
                                          fontFamily: AppTypography.modicaPro,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.onSurfaceVariant.withOpacity(0.5),
                                        ),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // Features sectionf
                  // AppText.bodyMedium(
                  //   'Features you might need',
                  //   color: AppColors.onSurface,
                  // ),
                  SizedBox(height: 16.h),

                  // Wishlist toggle
                  // FeatureToggleCard(
                  //   title: 'Enable Wishlist Feature',
                  //   description: 'Let guests know what you\'d love to receive—no more guessing games!',
                  //   icon: '🎁',
                  //   value: state.eventData.enableWishlist,
                  //   onChanged: (value) => viewModel.toggleWishlist(value),
                  // ),
                  // SizedBox(height: 12.h),

                  // Budget tracking toggle
                  // FeatureToggleCard(
                  //   title: 'Enable Budget Feature',
                  //   description: 'Turn this on if you are planning to create & manage a budget for your event',
                  //   value: state.eventData.enableBudgetTracking,
                  //   onChanged: (value) => viewModel.toggleBudgetTracking(value),
                  // ),
                  // SizedBox(height: 12.h),

                  // Co-host marketplace toggle
                  FeatureToggleCard(
                    title: 'Enable Vendors Feature',
                    description: 'Turn this on if you need to find & manage vendors, order drinks, food, etc for your event',
                    value: state.eventData.enableCohostMarketplace,
                    onChanged: (value) => viewModel.toggleCohostMarketplace(value),
                  ),
                  SizedBox(height: 40.h),

                  // Navigation buttons
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _handlePrevious,
                          child: Container(
                            height: 69.h,
                            decoration: BoxDecoration(
                              color: AppColors.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(34.5.r),
                            ),
                            child: Center(
                              child: AppText.labelLarge(
                                'Previous',
                                color: AppColors.onSurface,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: _isCreatingEvent ? null : _handleNext,
                          child: Container(
                            height: 69.h,
                            decoration: BoxDecoration(
                              color: _isCreatingEvent 
                                  ? AppColors.primary.withOpacity(0.5)
                                  : AppColors.primary,
                              borderRadius: BorderRadius.circular(34.5.r),
                            ),
                            child: Center(
                              child: _isCreatingEvent
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 20.w,
                                          height: 20.h,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation<Color>(
                                              AppColors.onPrimary,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        AppText.labelLarge(
                                          'Creating...',
                                          color: AppColors.onPrimary,
                                        ),
                                      ],
                                    )
                                  : AppText.labelLarge(
                                      'Create Event',
                                      color: AppColors.onPrimary,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
}