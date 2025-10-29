import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Reusable section header with title and "View all" link
class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.headlineMedium(
            title,
            color: context.colors.onSurface,
          ),
          if (onViewAll != null)
            GestureDetector(
              onTap: onViewAll,
              child: AppText.labelLarge(
                'View all',
                color: context.colors.onSurfaceVariant,
              ),
            ),
        ],
      ),
    );
  }
}
