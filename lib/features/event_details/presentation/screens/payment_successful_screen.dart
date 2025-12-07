import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  const PaymentSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Stack(
        children: [
          // Blurred background
          Positioned.fill(
            child: Container(
              color: const Color(0x4A0F0E0E),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          // Blurred payment method content
          Positioned(
            top: 64.h,
            left: 24.w,
            right: 24.w,
            child: Opacity(
              opacity: 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
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
                      const Spacer(),
                      AppText.headlineMedium(
                        'Payment method',
                        color: context.colors.onSurface,
                      ),
                      const Spacer(),
                      SizedBox(width: 50.w),
                    ],
                  ),
                  SizedBox(height: 55.h),
                  // Saved cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.headlineMedium(
                        'Saved cards',
                        color: context.colors.onSurface,
                      ),
                      AppText.bodyMedium(
                        '+ New Card',
                        color: context.colors.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  // Payment cards (blurred)
                  ...List.generate(4, (index) => Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Container(
                      width: 337.w,
                      height: 69.h,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(34.5.r),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
          // Success modal
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 476.h,
              decoration: BoxDecoration(
                color: context.colors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(43.r),
                  topRight: Radius.circular(43.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 39.h),
                  // Success icon
                  Container(
                    width: 72.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                      color: context.colors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: context.colors.primary,
                      size: 38.sp,
                    ),
                  ),
                  SizedBox(height: 11.h),
                  // Success title
                  Text(
                    'Payment Successful',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      color: context.colors.onSurface,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  // Success message
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 67.w),
                    child: AppText.bodyMedium(
                      'You have successfully purchased a ticket for the event.',
                      color: AppColors.textSecondary,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 63.h),
                  // View Tickets button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to tickets tab
                        context.go(RouteManager.home);
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
                          'View Tickets',
                          color: context.colors.background,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  // Go to homepage button
                  GestureDetector(
                    onTap: () {
                      context.go('/home');
                    },
                    child: AppText.labelLarge(
                      'Go to homepage',
                      color: context.colors.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
