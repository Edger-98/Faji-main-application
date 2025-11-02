import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';

class TicketInformationScreen extends StatelessWidget {
  const TicketInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Stack(
        children: [
          // Hero Image
          Positioned(
            top: -118.h,
            left: 0,
            right: 0,
            child: Container(
              height: 701.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(43.r),
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/390/701?random=101'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 64.h),
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHighest,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: context.colors.onSurface,
                          size: 16.sp,
                        ),
                      ),
                    ),
                    const Spacer(),
                    AppText.headlineMedium(
                      'Ticket Information',
                      color: context.colors.onSurface,
                    ),
                    const Spacer(),
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHighest,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.share_outlined,
                        color: context.colors.onSurface,
                        size: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Ticket icon
              Center(
                child: Icon(
                  Icons.confirmation_number_outlined,
                  color: context.colors.onSurface,
                  size: 100.sp,
                ),
              ),
              SizedBox(height: 50.h),
              // Event title
              Center(
                child: AppText.headlineMedium(
                  'GENfest Music Festival',
                  color: context.colors.onSurface,
                ),
              ),
              SizedBox(height: 6.h),
              // Event description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 31.w),
                child: AppText.bodyMedium(
                  'Nesciunt alias a. Nihil sint et nihil atque. Omnis quis rerum. Quibusdam ex excepturi est ex aliquam quasi. Assumenda amet ut cumque et cumque.',
                  color: AppColors.textSecondary,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
              SizedBox(height: 13.h),
              // Info cards
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoCard(context, 'Tickets left', '104'),
                    _buildInfoCard(context, 'Tickets Price', '\$ 40'),
                    _buildInfoCard(context, 'Rating', '4.9', showStar: true),
                  ],
                ),
              ),
              SizedBox(height: 72.h),
              // Continue button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GestureDetector(
                  onTap: () {
                    context.push(RouteManager.buyTicket);
                  },
                  child: Container(
                    width: 337.w,
                    height: 69.h,
                    decoration: BoxDecoration(
                      color: context.colors.primary,
                      borderRadius: BorderRadius.circular(34.5.r),
                    ),
                    alignment: Alignment.center,
                    child: AppText.labelLarge(
                      'Continue',
                      color: context.colors.background,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 21.h),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String label, String value, {bool showStar = false}) {
    return Container(
      width: showStar ? 110.w : (label == 'Tickets Price' ? 109.w : 110.w),
      height: 96.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(21.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showStar) ...[
                Icon(
                  Icons.star,
                  color: const Color(0xFFFFC107),
                  size: 20.sp,
                ),
                SizedBox(width: 2.w),
              ],
              AppText.headlineMedium(
                value,
                color: context.colors.onSurface,
              ),
            ],
          ),
          SizedBox(height: 6.h),
          AppText.bodySmall(
            label,
            color: AppColors.textSecondary,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
