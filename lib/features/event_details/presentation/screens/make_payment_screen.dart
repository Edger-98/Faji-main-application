import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';

class MakePaymentScreen extends StatefulWidget {
  const MakePaymentScreen({super.key});

  @override
  State<MakePaymentScreen> createState() => _MakePaymentScreenState();
}

class _MakePaymentScreenState extends State<MakePaymentScreen> {
  int selectedPaymentMethod = 0; // 0: Mastercard, 1: Visa, 2: Apple Pay, 3: PayPal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Column(
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
                  'Payment method',
                  color: context.colors.onSurface,
                ),
                const Spacer(),
                SizedBox(width: 50.w),
              ],
            ),
          ),
          SizedBox(height: 55.h),
          // Saved cards
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
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
          ),
          SizedBox(height: 20.h),
          // Mastercard
          _buildPaymentCard(
            context,
            0,
            'Mastercard ***** 3276',
            'EXP 09/02',
            isMastercard: true,
          ),
          SizedBox(height: 8.h),
          // Visa
          _buildPaymentCard(
            context,
            1,
            'Visa ***** 3276',
            'EXP 09/02',
            isVisa: true,
          ),
          SizedBox(height: 16.h),
          // Or divider
          Center(
            child: AppText.bodyMedium(
              'Or',
              color: context.colors.onSurface,
            ),
          ),
          SizedBox(height: 31.h),
          // Apple Pay
          _buildPaymentCard(
            context,
            2,
            'Apple Pay',
            '',
            isApplePay: true,
          ),
          SizedBox(height: 8.h),
          // PayPal
          _buildPaymentCard(
            context,
            3,
            'PayPal',
            '',
            isPayPal: true,
          ),
          const Spacer(),
          // Confirm button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GestureDetector(
              onTap: () {
                context.push(RouteManager.paymentSuccessful);
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
                  'Confirm Payment',
                  color: context.colors.background,
                ),
              ),
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildPaymentCard(
    BuildContext context,
    int index,
    String title,
    String subtitle, {
    bool isMastercard = false,
    bool isVisa = false,
    bool isApplePay = false,
    bool isPayPal = false,
  }) {
    final isSelected = selectedPaymentMethod == index;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: GestureDetector(
        onTap: () {
          setState(() => selectedPaymentMethod = index);
        },
        child: Container(
          width: 337.w,
          height: 69.h,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(34.5.r),
          ),
          child: Row(
            children: [
              // Icon
              if (isMastercard)
                _buildMastercardIcon()
              else if (isVisa)
                _buildVisaIcon()
              else if (isApplePay)
                Icon(Icons.apple, color: context.colors.onSurface, size: 42.sp)
              else if (isPayPal)
                _buildPayPalIcon(),
              SizedBox(width: 15.w),
              // Text
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.labelLarge(
                      title,
                      color: context.colors.onSurface,
                    ),
                    if (subtitle.isNotEmpty) ...[
                      SizedBox(height: 2.h),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontFamily: AppTypography.ppNeueMontreal,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w100,
                          height: 1.2,
                          color: context.colors.onSurface,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // Radio button
              Container(
                width: 19.w,
                height: 19.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? context.colors.primary
                        : const Color(0x33FFFFFF),
                    width: 1.w,
                  ),
                  color: isSelected
                      ? const Color(0x26FD99C9)
                      : Colors.transparent,
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 10.74.w,
                          height: 10.74.h,
                          decoration: BoxDecoration(
                            color: context.colors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMastercardIcon() {
    return SizedBox(
      width: 50.w,
      height: 32.14.h,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: 32.14.w,
              height: 32.14.h,
              decoration: const BoxDecoration(
                color: Color(0xFFEA001B),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: 17.86.w,
            child: Container(
              width: 32.14.w,
              height: 32.14.h,
              decoration: const BoxDecoration(
                color: Color(0xFFF79F1A),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisaIcon() {
    return Container(
      width: 42.w,
      height: 13.w,
      decoration: const BoxDecoration(
        color: AppColors.onSurface,
      ),
      child: Center(
        child: Text(
          'VISA',
          style: TextStyle(
            fontSize: 8.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildPayPalIcon() {
    return Container(
      width: 32.w,
      height: 32.h,
      decoration: BoxDecoration(
        color: context.colors.onSurface,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Center(
        child: Text(
          'P',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0085CC),
          ),
        ),
      ),
    );
  }
}
