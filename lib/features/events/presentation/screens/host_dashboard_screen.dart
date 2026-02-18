import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Host Dashboard - Full event management for hosts
/// Shows: Ticket sales, revenue breakdown, co-hosts, attached vendors
class HostDashboardScreen extends StatelessWidget {

  const HostDashboardScreen({
    super.key,
    required this.eventId,
  });
  final String eventId;

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: context.colors.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Host Dashboard',
          style: AppTypography.titleLarge.copyWith(
            color: context.colors.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_rounded, color: context.colors.onSurface),
            onPressed: () {
              // TODO: Navigate to edit event
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event name
            Text(
              'Summer Music Festival 2025',
              style: AppTypography.headlineMedium.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 24.h),

            // Revenue summary card
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.colors.primary,
                    AppColors.eventCardBlue,
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
                    'Total Revenue',
                    style: AppTypography.bodyMedium.copyWith(
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    '\$5,000.00',
                    style: AppTypography.displayMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      _buildRevenueMetric(
                        label: 'Tickets Sold',
                        value: '125',
                      ),
                      SizedBox(width: 24.w),
                      _buildRevenueMetric(
                        label: 'Your Share',
                        value: '\$2,250',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Revenue breakdown
            Text(
              'Revenue Breakdown',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 16.h),

            _buildBreakdownItem(
              context: context,
              label: 'Gross Revenue',
              amount: '\$5,000.00',
              color: context.colors.onSurface,
            ),
            _buildBreakdownItem(
              context: context,
              label: 'Platform Fee (10%)',
              amount: '-\$500.00',
              color: AppColors.liveRed,
            ),
            _buildBreakdownItem(
              context: context,
              label: 'Vendor Fees',
              amount: '-\$1,000.00',
              color: AppColors.liveRed,
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 12.h),
              color: context.colors.onSurface.withValues(alpha: 0.1),
            ),
            _buildBreakdownItem(
              context: context,
              label: 'Revenue Pool',
              amount: '\$3,500.00',
              color: context.colors.primary,
              isBold: true,
            ),
            _buildBreakdownItem(
              context: context,
              label: 'Your Share (50%)',
              amount: '\$1,750.00',
              color: AppColors.successGreen,
              isBold: true,
            ),
            _buildBreakdownItem(
              context: context,
              label: 'Co-Host Share (50%)',
              amount: '\$1,750.00',
              color: context.colors.onSurfaceVariant,
            ),

            SizedBox(height: 32.h),

            // Co-hosts section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Co-Hosts',
                  style: AppTypography.titleMedium.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to invite co-host screen
                  },
                  child: Text(
                    'Invite',
                    style: AppTypography.bodySmall.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            _buildCoHostItem(
              context: context,
              name: 'Jane Smith',
              email: 'jane@example.com',
              share: '50%',
              earnings: '\$1,750.00',
            ),

            SizedBox(height: 32.h),

            // Attached vendors section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Attached Vendors',
                  style: AppTypography.titleMedium.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to vendors marketplace
                  },
                  child: Text(
                    'Add Vendor',
                    style: AppTypography.bodySmall.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            _buildVendorItem(
              context: context,
              name: 'Elite Photography Studio',
              service: 'Event Photography',
              status: 'Confirmed',
              amount: '\$500.00',
            ),
            _buildVendorItem(
              context: context,
              name: 'Gourmet Catering Co.',
              service: 'Full Catering Service',
              status: 'Confirmed',
              amount: '\$500.00',
            ),
          ],
        ),
      ),
    );

  Widget _buildRevenueMetric({
    required String label,
    required String value,
  }) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 11.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: AppTypography.titleMedium.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );

  Widget _buildBreakdownItem({
    required BuildContext context,
    required String label,
    required String amount,
    required Color color,
    bool isBold = false,
  }) => Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: context.colors.onSurface,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          Text(
            amount,
            style: AppTypography.bodyMedium.copyWith(
              color: color,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
        ],
      ),
    );

  Widget _buildCoHostItem({
    required BuildContext context,
    required String name,
    required String email,
    required String share,
    required String earnings,
  }) => Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: context.colors.primary.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                name[0].toUpperCase(),
                style: AppTypography.titleMedium.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTypography.bodyMedium.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  '$share share • $earnings',
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  Widget _buildVendorItem({
    required BuildContext context,
    required String name,
    required String service,
    required String status,
    required String amount,
  }) => Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColors.eventCardYellow.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.store_rounded,
              color: AppColors.eventCardYellow,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTypography.bodyMedium.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  service,
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.successGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  status,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.successGreen,
                    fontWeight: FontWeight.w600,
                    fontSize: 10.sp,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                amount,
                style: AppTypography.bodySmall.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
}
