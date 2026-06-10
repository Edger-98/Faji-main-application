import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';

class WithdrawalConfirmationScreen extends StatelessWidget {
  const WithdrawalConfirmationScreen({
    super.key,
    required this.amount,
    this.estimatedArrival,
    this.currency = 'USD',
  });

  final String amount;
  final String? estimatedArrival;
  final String currency;

  String get _formattedArrival {
    if (estimatedArrival == null || estimatedArrival!.isEmpty) {
      return '2 business days';
    }
    try {
      final DateTime dt = DateTime.parse(estimatedArrival!);
      const List<String> months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
      ];
      return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
    } catch (_) {
      return estimatedArrival!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
              child: Container(color: const Color(0x4A0F0E0E)),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                _buildCard(context),
                const Spacer(),
                _buildDoneButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Success icon
              Container(
                width: 72.w,
                height: 72.w,
                decoration: const BoxDecoration(
                  color: AppColors.successGreen,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 36.sp,
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                'Withdrawal Initiated',
                style: AppTypography.headlineMedium.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 8.h),

              Text(
                '\$$amount $currency',
                style: AppTypography.displaySmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 16.h),

              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.successGreen.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: AppColors.successGreen.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.schedule_rounded,
                        size: 18.sp, color: AppColors.successGreen),
                    SizedBox(width: 8.w),
                    Flexible(
                      child: Text(
                        'Est. arrival: $_formattedArrival',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.successGreen,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              Text(
                'The funds are on their way to your Stripe connected bank account. '
                'Stripe typically processes payouts within 2 business days.',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );

  Widget _buildDoneButton(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 32.h),
        child: GestureDetector(
          onTap: () => context.go(RouteManager.dashboard),
          child: Container(
            width: double.infinity,
            height: 58.h,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(29.h),
            ),
            child: Center(
              child: Text(
                'Done',
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.onPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      );
}
