import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_creation_flow_screen.dart';

/// Bottom sheet for creating a new event
class CreateEventBottomSheet extends StatelessWidget {
  const CreateEventBottomSheet({super.key});

  static Future<void> show(BuildContext context) => showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) => const CreateEventBottomSheet(),
    );

  @override
  Widget build(BuildContext context) => Container(
      height: MediaQuery.of(context).size.height * 0.95,
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        children: [
          // Drag handle
          Container(
            margin: EdgeInsets.only(top: 12.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: context.colors.onSurfaceVariant.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Create Event',
                    style: AppTypography.headlineMedium.copyWith(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          
          // Divider
          Divider(
            height: 1,
            color: context.colors.onSurfaceVariant.withOpacity(0.2),
          ),
          
          // Event creation flow
          Expanded(
            child: EventCreationFlowScreen(),
          ),
        ],
      ),
    );
}
