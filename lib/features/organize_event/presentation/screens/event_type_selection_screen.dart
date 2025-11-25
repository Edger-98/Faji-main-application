import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_creation_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/widgets/step_progress_indicator.dart';

/// Step 0: Event Type Selection Screen
/// "What's the moment?" - Select the type of event
class EventTypeSelectionScreen extends ConsumerWidget {
  const EventTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  const Expanded(
                    child: StepProgressIndicator(
                      currentStep: 0,
                      totalSteps: 5,
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
                  
                  // Title
                  Text(
                    "What's the\nmoment?",
                    style: TextStyle(
                      fontFamily: AppTypography.ppNeueMontreal,
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                      height: 1.1,
                      letterSpacing: -1.5,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  
                  // Subtitle
                  Text(
                    "Pick the type of event you're planning,\nand we'll help you make lasting memories from\nit.",
                    style: TextStyle(
                      fontFamily: AppTypography.ppNeueMontreal,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.onSurfaceVariant.withOpacity(0.8),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 40.h),

                  // Main event types grid
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.h,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: 1.0,
                    children: [
                      _EventTypeCard(
                        label: 'Birthday',
                        shape: _CardShape.pentagon,
                        onTap: () => _selectEventType(context, ref, 'Birthday'),
                      ),
                      _EventTypeCard(
                        label: 'Wedding',
                        shape: _CardShape.star,
                        onTap: () => _selectEventType(context, ref, 'Wedding'),
                      ),
                      _EventTypeCard(
                        label: 'Anniversary',
                        shape: _CardShape.hexagon,
                        onTap: () => _selectEventType(context, ref, 'Anniversary'),
                      ),
                      _EventTypeCard(
                        label: 'Party',
                        shape: _CardShape.roundedSquare,
                        onTap: () => _selectEventType(context, ref, 'Party'),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),

                  // Other Event Types section
                  Text(
                    'Other Event Types',
                    style: TextStyle(
                      fontFamily: AppTypography.ppNeueMontreal,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.onSurface.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Category chips
                  _buildCategorySection(
                    context,
                    ref,
                    'Personal Milestones',
                    [],
                  ),
                  SizedBox(height: 12.h),
                  
                  Wrap(
                    spacing: 10.w,
                    runSpacing: 10.h,
                    children: [
                      _EventTypeChip(
                        label: 'Social & Community Gathering',
                        onTap: () => _selectEventType(context, ref, 'Social & Community Gathering'),
                      ),
                      _EventTypeChip(
                        label: 'Music & Entertainment Events',
                        onTap: () => _selectEventType(context, ref, 'Music & Entertainment Events'),
                      ),
                      _EventTypeChip(
                        label: 'Professional & Educational Events',
                        onTap: () => _selectEventType(context, ref, 'Professional & Educational Events'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Specific event types
                  Wrap(
                    spacing: 10.w,
                    runSpacing: 10.h,
                    children: [
                      _EventTypeChip(
                        label: 'Engagement',
                        onTap: () => _selectEventType(context, ref, 'Engagement'),
                      ),
                      _EventTypeChip(
                        label: 'Baby Shower',
                        onTap: () => _selectEventType(context, ref, 'Baby Shower'),
                      ),
                      _EventTypeChip(
                        label: 'Graduation',
                        onTap: () => _selectEventType(context, ref, 'Graduation'),
                      ),
                      _EventTypeChip(
                        label: 'Karaoke Night',
                        onTap: () => _selectEventType(context, ref, 'Karaoke Night'),
                      ),
                      _EventTypeChip(
                        label: 'Wine Tasting',
                        onTap: () => _selectEventType(context, ref, 'Wine Tasting'),
                      ),
                      _EventTypeChip(
                        label: 'Movie Night',
                        onTap: () => _selectEventType(context, ref, 'Movie Night'),
                      ),
                      _EventTypeChip(
                        label: 'Concert',
                        onTap: () => _selectEventType(context, ref, 'Concert'),
                      ),
                      _EventTypeChip(
                        label: 'Listening Party',
                        onTap: () => _selectEventType(context, ref, 'Listening Party'),
                      ),
                      _EventTypeChip(
                        label: 'General Event',
                        onTap: () => _selectEventType(context, ref, 'General Event'),
                      ),
                      _EventTypeChip(
                        label: 'Corporate',
                        onTap: () => _selectEventType(context, ref, 'Corporate'),
                      ),
                      _EventTypeChip(
                        label: 'Launching/Opening',
                        onTap: () => _selectEventType(context, ref, 'Launching/Opening'),
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

  Widget _buildCategorySection(BuildContext context, WidgetRef ref, String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (items.isNotEmpty) ...[
          SizedBox(height: 8.h),
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: items.map((item) => _EventTypeChip(
              label: item,
              onTap: () => _selectEventType(context, ref, item),
            )).toList(),
          ),
        ],
      ],
    );
  }

  void _selectEventType(BuildContext context, WidgetRef ref, String eventType) {
    ref.read(eventCreationViewModelProvider.notifier).updateEventType(eventType);
    ref.read(eventCreationViewModelProvider.notifier).nextStep();
  }
}

enum _CardShape {
  pentagon,
  star,
  hexagon,
  roundedSquare,
}

class _EventTypeCard extends StatelessWidget {
  const _EventTypeCard({
    required this.label,
    required this.shape,
    required this.onTap,
  });

  final String label;
  final _CardShape shape;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHighest.withOpacity(0.6),
          borderRadius: _getBorderRadius(),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: AppTypography.ppNeueMontreal,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.onSurface,
            ),
          ),
        ),
      ),
    );
  }

  BorderRadius _getBorderRadius() {
    switch (shape) {
      case _CardShape.pentagon:
        return BorderRadius.only(
          topLeft: Radius.circular(60.r),
          topRight: Radius.circular(60.r),
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        );
      case _CardShape.star:
        return BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(60.r),
          bottomLeft: Radius.circular(60.r),
          bottomRight: Radius.circular(20.r),
        );
      case _CardShape.hexagon:
        return BorderRadius.only(
          topLeft: Radius.circular(60.r),
          topRight: Radius.circular(20.r),
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(60.r),
        );
      case _CardShape.roundedSquare:
        return BorderRadius.circular(30.r);
    }
  }
}

class _EventTypeChip extends StatelessWidget {
  const _EventTypeChip({
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: AppColors.onSurface.withOpacity(0.2),
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: AppTypography.ppNeueMontreal,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.onSurface.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
