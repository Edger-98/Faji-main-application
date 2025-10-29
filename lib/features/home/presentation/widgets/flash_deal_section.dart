import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Flash deal promotional section
class FlashDealSection extends StatelessWidget {
  const FlashDealSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.headlineMedium(
                'Flash Deal',
                color: context.colors.onSurface,
              ),
              AppText.labelLarge(
                '03 : 09 : 24',
                color: context.colors.primary,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              // TODO: Handle flash deal tap
            },
            child: Container(
              height: 193.h,
              decoration: BoxDecoration(
                color: context.colors.eventCardBlue,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Stack(
                children: [
                  // Background pattern/image
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.r),
                      child: Image.network(
                        'https://picsum.photos/362/193?random=flash',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: context.colors.eventCardBlue,
                        ),
                      ),
                    ),
                  ),
                  
                  // Content
                  Padding(
                    padding: EdgeInsets.all(29.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 14.w,
                              height: 14.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: context.colors.successGreen,
                                  width: 1.75,
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width: 10.5.w,
                                  height: 10.5.h,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 4.w),
                            AppText.bodySmall(
                              'Promocode',
                              color: context.colors.textSecondary,
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        AppText.displayMedium(
                          'Tap for \$20',
                          color: context.colors.primary,
                        ),
                        SizedBox(height: 8.h),
                        SizedBox(
                          width: 179.w,
                          child: AppText.bodySmall(
                            'Ipsa ut dolore. Impedit hic quis.\nVel aspernatur deleniti unde\nnam quisquam et rerum ass\nmenda. Nam quo eos.',
                            color: context.colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // QR Code placeholder
                  Positioned(
                    right: 16.w,
                    bottom: 16.h,
                    child: Container(
                      width: 158.w,
                      height: 155.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.qr_code,
                        size: 100.sp,
                        color: Colors.black,
                      ),
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
