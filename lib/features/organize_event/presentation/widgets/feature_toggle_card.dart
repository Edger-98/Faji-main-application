import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Card with toggle switch for enabling/disabling features
class FeatureToggleCard extends StatelessWidget {
  const FeatureToggleCard({
    required this.title, required this.description, required this.value, required this.onChanged, super.key,
    this.icon,
    this.onTap,
  });

  final String title;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20.r),
        border: value && onTap != null ? Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
          width: 1.5,
        ) : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: value && onTap != null ? onTap : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (icon != null) ...[
                        Text(
                          icon!,
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        SizedBox(width: 8.w),
                      ],
                      Expanded(
                        child: AppText.titleMedium(
                          title,
                          color: AppColors.onSurface,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  AppText.bodySmall(
                    description,
                    color: AppColors.onSurfaceVariant,
                  ),
                  if (value && onTap != null) ...[
                    SizedBox(height: 8.h),
                    // Row(
                    //   children: [
                    //     Icon(
                    //       Icons.arrow_forward,
                    //       size: 14.sp,
                    //       color: AppColors.primary,
                    //     ),
                    //     SizedBox(width: 4.w),
                    //     AppText.bodySmall(
                    //       'Tap to browse vendors',
                    //       color: AppColors.primary,
                    //     ),
                    //   ],
                    // ),
                  ],
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.primary,
            activeTrackColor: AppColors.primary.withValues(alpha: 0.5),
            inactiveThumbColor: AppColors.onSurfaceVariant,
            inactiveTrackColor: AppColors.surfaceContainerHighest,
          ),
        ],
      ),
    );
}
