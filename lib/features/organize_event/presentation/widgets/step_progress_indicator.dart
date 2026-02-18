import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Progress indicator showing current step in event creation flow
class StepProgressIndicator extends StatelessWidget {
  const StepProgressIndicator({
    required this.currentStep, required this.totalSteps, super.key,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) => Row(
      children: [
        // Elegant progress bar
        Expanded(
          child: Stack(
            children: [
              // Background bar
              Container(
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHighest.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              // Progress bar with smooth gradient
              FractionallySizedBox(
                widthFactor: (currentStep + 1) / totalSteps,
                child: Container(
                  height: 4.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary,
                        AppColors.primary.withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(2.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16.w),
        // Step counter
        Text(
          '${currentStep + 1}/$totalSteps',
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.onSurface,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
}
