import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Co-Host Dashboard - Limited view for co-hosts
/// Co-hosts can view event status and earnings but CANNOT modify core event details
class CoHostDashboardScreen extends StatelessWidget {
  final String eventId;

  const CoHostDashboardScreen({
    super.key,
    required this.eventId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: context.colors.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Co-Host Dashboard',
          style: AppTypography.titleLarge.copyWith(
            color: context.colors.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Role badge
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.people_rounded,
                    size: 16.sp,
                    color: context.colors.primary,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'CO-HOST',
                    style: AppTypography.labelSmall.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Event name
            Text(
              'Summer Music Festival 2025',
              style: AppTypography.headlineMedium.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 8.h),

            // Event status
            Row(
              children: [
                Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: AppColors.successGreen,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  'Active',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.successGreen,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            SizedBox(height: 32.h),

            // Earnings card
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.colors.primary,
                    context.colors.primary.withValues(alpha: 0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: context.colors.primary.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Earnings',
                    style: AppTypography.bodyMedium.copyWith(
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    '\$1,250.00',
                    style: AppTypography.displayMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '50% revenue share',
                    style: AppTypography.bodySmall.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Permissions section
            Text(
              'Your Permissions',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 16.h),

            _buildPermissionItem(
              context: context,
              icon: Icons.visibility_rounded,
              title: 'View event details',
              hasPermission: true,
            ),
            _buildPermissionItem(
              context: context,
              icon: Icons.people_rounded,
              title: 'View attendee list',
              hasPermission: true,
            ),
            _buildPermissionItem(
              context: context,
              icon: Icons.account_balance_wallet_rounded,
              title: 'View revenue reports',
              hasPermission: true,
            ),
            _buildPermissionItem(
              context: context,
              icon: Icons.edit_rounded,
              title: 'Edit core event details',
              hasPermission: false,
            ),
            _buildPermissionItem(
              context: context,
              icon: Icons.delete_rounded,
              title: 'Delete event',
              hasPermission: false,
            ),

            SizedBox(height: 32.h),

            // Info banner
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: context.colors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: context.colors.onSurfaceVariant,
                    size: 20.sp,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      'As a co-host, you can view event details and track your earnings, but cannot modify core event settings.',
                      style: AppTypography.bodySmall.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required bool hasPermission,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: hasPermission
                  ? AppColors.successGreen.withValues(alpha: 0.1)
                  : context.colors.onSurfaceVariant.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              icon,
              size: 20.sp,
              color: hasPermission
                  ? AppColors.successGreen
                  : context.colors.onSurfaceVariant,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              title,
              style: AppTypography.bodyMedium.copyWith(
                color: context.colors.onSurface,
              ),
            ),
          ),
          Icon(
            hasPermission ? Icons.check_circle_rounded : Icons.cancel_rounded,
            size: 20.sp,
            color: hasPermission
                ? AppColors.successGreen
                : context.colors.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}
