import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';

class BuyTicketScreen extends StatefulWidget {
  const BuyTicketScreen({super.key});

  @override
  State<BuyTicketScreen> createState() => _BuyTicketScreenState();
}

class _BuyTicketScreenState extends State<BuyTicketScreen> {
  int ticketCount = 3;

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
                  image: NetworkImage('https://picsum.photos/390/701?random=102'),
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
              // Ticket count
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.headlineMedium(
                      '03 Tickets ',
                      color: context.colors.onSurface,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (ticketCount > 1) {
                              setState(() => ticketCount--);
                            }
                          },
                          child: Container(
                            width: 21.w,
                            height: 21.h,
                            decoration: BoxDecoration(
                              color: context.colors.onSurface,
                              borderRadius: BorderRadius.circular(34.5.r),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '-',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                color: AppColors.onPrimary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 27.w),
                        Text(
                          '0$ticketCount',
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                            color: context.colors.onSurface,
                          ),
                        ),
                        SizedBox(width: 27.w),
                        GestureDetector(
                          onTap: () {
                            setState(() => ticketCount++);
                          },
                          child: Container(
                            width: 21.w,
                            height: 21.h,
                            decoration: BoxDecoration(
                              color: context.colors.onSurface,
                              borderRadius: BorderRadius.circular(34.5.r),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.2,
                                color: AppColors.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              // Event description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: AppText.bodyMedium(
                  'Nesciunt alias a nihil sint.',
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 33.h),
              // Promo code
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  width: 337.w,
                  height: 69.h,
                  padding: EdgeInsets.symmetric(horizontal: 41.w),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(34.5.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Promo Code',
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w100,
                            height: 1.2,
                            color: const Color(0xFFA1A1A1),
                          ),
                        ),
                      ),
                      Container(
                        width: 110.w,
                        height: 57.h,
                        decoration: BoxDecoration(
                          color: context.colors.primary,
                          borderRadius: BorderRadius.circular(34.5.r),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Apply',
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                            color: AppColors.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              // Total price
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.headlineMedium(
                      'Total Price',
                      color: context.colors.onSurface,
                    ),
                    AppText.headlineMedium(
                      '\$ ${(ticketCount * 40).toStringAsFixed(2)}',
                      color: context.colors.onSurface,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 59.h),
              // Proceed button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GestureDetector(
                  onTap: () {
                    context.push(RouteManager.makePayment);
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
                      'Proceed to payment',
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
}
