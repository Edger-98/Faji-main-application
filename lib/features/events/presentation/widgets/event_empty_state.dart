import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Empty state widget for events
class EventEmptyState extends StatelessWidget {

  const EventEmptyState({
    super.key,
    this.title,
    this.message,
    this.icon,
    this.onRetry,
    this.retryText,
  });
  final String? title;
  final String? message;
  final IconData? icon;
  final VoidCallback? onRetry;
  final String? retryText;

  @override
  Widget build(BuildContext context) => Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.event_busy,
              size: 64.sp,
              color: context.colors.onSurfaceVariant,
            ),
            
            SizedBox(height: 24.h),
            
            AppText.headlineSmall(
              title ?? 'No Events Found',
              textAlign: TextAlign.center,
              color: context.colors.onSurface,
            ),
            
            SizedBox(height: 8.h),
            
            AppText.bodyMedium(
              message ?? 'There are no events available at the moment. Please check back later.',
              textAlign: TextAlign.center,
              color: context.colors.onSurfaceVariant,
            ),
            
            if (onRetry != null) ...[
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: onRetry,
                child: Text(retryText ?? 'Refresh'),
              ),
            ],
          ],
        ),
      ),
    );
}
