import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

/// PROMOTE Tab - Event promotion tools
class PromoteTab extends ConsumerWidget {

  const PromoteTab({super.key, required this.eventId});
  final String eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        // Header text
        Text(
          'With promotion, you can use any of our available tools to help you boost your event visibility. Explore these options to effectively promote your event and engage your audience!',
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        SizedBox(height: 24.h),

        // Party Promoters Card
        _buildPartyPromotersCard(),
        SizedBox(height: 16.h),

        // Broadcast Card
        _buildBroadcastCard(),
        SizedBox(height: 100.h),
      ],
    );

  Widget _buildPartyPromotersCard() => Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFF4CAF50), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.campaign,
                    size: 24.sp, color: const Color(0xFF4CAF50)),
              ),
              SizedBox(width: 12.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'In Use',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'Party Promoters',
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Let people promote your event for you for some commission on the ticket...',
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.onSurfaceVariant,
              height: 1.4,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                '5.00% Commission',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF4CAF50),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                '(cap: ₦55,500)',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit_outlined,
                    size: 20.sp, color: AppColors.onSurfaceVariant),
              ),
            ],
          ),
        ],
      ),
    );

  Widget _buildBroadcastCard() => Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.onSurfaceVariant.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(Icons.notifications_active_outlined,
                size: 24.sp, color: AppColors.onSurfaceVariant),
          ),
          SizedBox(height: 16.h),
          Text(
            'Broadcast',
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Send broadcast message to your guests and keep them updated on any changes.',
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.onSurfaceVariant,
              height: 1.4,
            ),
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2A2A2A),
              foregroundColor: AppColors.onSurface,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              'START NOW',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
}
