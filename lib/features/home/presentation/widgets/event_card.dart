import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Event card widget for trending and upcoming events
class EventCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String time;
  final String price;
  final bool isLive;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;

  const EventCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.time,
    required this.price,
    this.isLive = false,
    this.onTap,
    this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event image with gradient overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Stack(
                    children: [
                      // Only load image if URL is valid
                      if (imageUrl.isNotEmpty)
                        Image.network(
                          imageUrl,
                          width: 220.w,
                          height: 260.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            width: 220.w,
                            height: 260.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.eventCardBlue,
                                  AppColors.eventCardYellow,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.image_outlined,
                                size: 48.sp,
                                color: Colors.white.withValues(alpha: 0.5),
                              ),
                            ),
                          ),
                        )
                      else
                        // Fallback for empty/null imageUrl
                        Container(
                          width: 220.w,
                          height: 260.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.eventCardBlue,
                                AppColors.eventCardYellow,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.event,
                              size: 48.sp,
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                          ),
                        ),
                      // Enhanced gradient overlay
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 140.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withValues(alpha: 0.85),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Live badge with pulse animation
                if (isLive)
                  Positioned(
                    left: 12.w,
                    top: 12.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
                      decoration: BoxDecoration(
                        color: AppColors.liveRed,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.liveRed.withValues(alpha: 0.5),
                            blurRadius: 12,
                            offset: const Offset(0, 2),
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 7.w,
                            height: 7.h,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'LIVE',
                            style: AppTypography.labelSmall.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 11.sp,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                
                // Favorite button
                Positioned(
                  right: 12.w,
                  top: 12.h,
                  child: GestureDetector(
                    onTap: onFavorite,
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.white,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ),
                
                // Content overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          title,
                          style: AppTypography.titleMedium.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                            shadows: [
                              Shadow(
                                color: Colors.black.withValues(alpha: 0.4),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        
                        SizedBox(height: 8.h),
                        
                        // Date with icon
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_rounded,
                              color: Colors.white.withValues(alpha: 0.9),
                              size: 13.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              date,
                              style: AppTypography.bodySmall.copyWith(
                                color: Colors.white.withValues(alpha: 0.95),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        
                        SizedBox(height: 10.h),
                        
                        // Price with enhanced background
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
                          decoration: BoxDecoration(
                            color: price == 'FREE' 
                                ? Colors.green
                                : context.colors.primary,
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                color: (price == 'FREE' ? Colors.green : context.colors.primary).withValues(alpha: 0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            price,
                            style: AppTypography.bodyMedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
