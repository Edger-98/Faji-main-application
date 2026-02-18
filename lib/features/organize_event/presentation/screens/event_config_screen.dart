import 'package:fajimobileapp/core/models/event_model.dart';
import 'package:fajimobileapp/features/organize_event/presentation/viewmodels/event_creation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
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
  final TextEditingController _guestsController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();

  @override
  void dispose() {
    _guestsController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  void _handleNext() {
    final EventCreationViewModel viewModel = ref.read(eventCreationViewModelProvider.notifier);
    
    if (viewModel.canProceedFromStep2()) {
      print('✅ Validation passed, proceeding to location picker...');
      // Go to step 3 (location picker)
      viewModel.nextStep();
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
  
  void _handlePrevious() {
    ref.read(eventCreationViewModelProvider.notifier).previousStep();
  }

  @override
  Widget build(BuildContext context) {
    final EventCreationState state = ref.watch(eventCreationViewModelProvider);
    final EventCreationViewModel viewModel = ref.read(eventCreationViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Header with back button and progress
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Row(
                children: <Widget>[
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
                      totalSteps: 4,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: <Widget>[
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
                      children: <Widget>[
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
                            children: <Widget>[
                              AppText.bodySmall(
                                'Expected Guests',
                                color: AppColors.onSurfaceVariant,
                              ),
                              TextField(
                                controller: _guestsController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (String value) {
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
                      children: <Widget>[
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
                            children: <Widget>[
                              AppText.bodySmall(
                                'Budget (Optional)',
                                color: AppColors.onSurfaceVariant,
                              ),
                              Row(
                                children: <Widget>[
                                  AppText.titleMedium(
                                    'USD',
                                    color: AppColors.onSurface,
                                  ),
                                  SizedBox(width: 4.w),
                                  Expanded(
                                    child: TextField(
                                      controller: _budgetController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      onChanged: (String value) {
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
                    onChanged: viewModel.toggleCohostMarketplace,
                  ),
                  SizedBox(height: 40.h),

                  // Navigation buttons
                  Row(
                    children: <Widget>[
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
                          onTap: _handleNext,
                          child: Container(
                            height: 69.h,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(34.5.r),
                            ),
                            child: Center(
                              child: AppText.labelLarge(
                                'Next',
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