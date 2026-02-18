import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Card with toggle switch for enabling/disabling features
class FeatureToggleCard extends StatelessWidget {
  const FeatureToggleCard({
    required this.title, required this.description, required this.value, required this.onChanged, super.key,
    this.icon,
  });

  final String title;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? icon;

  @override
  Widget build(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Expanded(
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
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
            activeTrackColor: AppColors.primary.withOpacity(0.5),
            inactiveThumbColor: AppColors.onSurfaceVariant,
            inactiveTrackColor: AppColors.surfaceContainerHighest,
          ),
        ],
      ),
    );
}
