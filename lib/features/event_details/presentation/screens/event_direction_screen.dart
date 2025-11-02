import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

class EventDirectionScreen extends StatelessWidget {
  const EventDirectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Stack(
        children: [
          // Map Image
          Positioned(
            top: -66.h,
            left: 4.w,
            right: 4.w,
            child: Container(
              height: 614.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(43.r),
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/382/614?random=200'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Map overlay elements
          Positioned(
            top: 118.h,
            left: 85.24.w,
            child: Icon(
              Icons.location_on,
              color: context.colors.primary,
              size: 17.sp,
            ),
          ),
          Positioned(
            top: 138.h,
            left: 89.w,
            child: Container(
              width: 5.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: context.colors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 384.h,
            left: 226.w,
            child: Container(
              width: 5.w,
              height: 5.h,
              decoration: const BoxDecoration(
                color: AppColors.onSurface,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Route line
          Positioned(
            top: 142.5.h,
            left: 97.w,
            child: CustomPaint(
              size: Size(128.5.w, 241.5.h),
              painter: RoutePainter(),
            ),
          ),
          // Distance badge
          Positioned(
            top: 171.h,
            left: 89.w,
            child: Container(
              width: 74.w,
              height: 39.h,
              decoration: BoxDecoration(
                color: const Color(0xCF171717),
                borderRadius: BorderRadius.circular(34.5.r),
              ),
              alignment: Alignment.center,
              child: AppText.bodyMedium(
                '24 km',
                color: context.colors.onSurface,
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
                      'Direction Map',
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
                        Icons.favorite_border,
                        color: context.colors.onSurface,
                        size: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Location title
              Center(
                child: AppText.headlineMedium(
                  'The Global City',
                  color: context.colors.onSurface,
                ),
              ),
              SizedBox(height: 6.h),
              // Location description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 38.w),
                child: AppText.bodyMedium(
                  'Nesciunt alias a. Nihil sint et nihil atque. Omnis quis rerum. Quibusdam ex excepturi.',
                  color: AppColors.textSecondary,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              SizedBox(height: 18.h),
              // Info cards
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoCard(
                      context,
                      'Date',
                      '03 Mar 2023',
                      Icons.calendar_today_outlined,
                    ),
                    _buildInfoCard(
                      context,
                      'Time',
                      '10:00 PM - End',
                      Icons.access_time,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.h),
              // Get Direction button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GestureDetector(
                  onTap: () {
                    // Open maps
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
                      'Get Direction',
                      color: context.colors.background,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, String label, String value, IconData icon) {
    return Container(
      width: 166.w,
      height: 96.h,
      padding: EdgeInsets.symmetric(horizontal: 43.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(21.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppColors.textSecondary,
                size: icon == Icons.calendar_today_outlined ? 15.sp : 16.sp,
              ),
              SizedBox(width: 23.w),
              AppText.bodySmall(
                label,
                color: AppColors.textSecondary,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 0.w),
            child: AppText.bodySmall(
              value,
              color: context.colors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 2.w
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.3,
      size.width,
      size.height,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
