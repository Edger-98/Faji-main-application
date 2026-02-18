import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Reusable section header with title and "View all" link
class SectionHeader extends StatelessWidget {

  const SectionHeader({
    super.key,
    required this.title,
    this.onViewAll,
    this.subtitle,
    this.viewAllText,
  });
  final String title;
  final VoidCallback? onViewAll;
  final String? subtitle;
  final String? viewAllText;

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTypography.titleLarge.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (subtitle != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    subtitle!,
                    style: AppTypography.bodySmall.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          if (onViewAll != null) ...[
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: onViewAll,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: context.colors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      viewAllText ?? 'View all',
                      style: AppTypography.bodySmall.copyWith(
                        color: context.colors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(
                      viewAllText != null && viewAllText!.contains('+') 
                          ? Icons.add_circle_outline 
                          : Icons.arrow_forward_rounded,
                      color: context.colors.primary,
                      size: 14.sp,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
}
