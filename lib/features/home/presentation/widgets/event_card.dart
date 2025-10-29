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
        width: 306.w,
        height: 267.h,
        decoration: BoxDecoration(
          color: context.colors.eventCardBlue,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.r),
          child: Stack(
            children: [
              // Event image - clipped to only show top portion
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: 306.w,
                    height: 244.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 306.w,
                      height: 244.h,
                      color: context.colors.eventCardBlue,
                      child: Icon(
                        Icons.image_outlined,
                        size: 48.sp,
                        color: Colors.white24,
                      ),
                    ),
                  ),
                ),
              ),
              
              // Live badge - no background, just text
              if (isLive)
                Positioned(
                  left: 27.w,
                  top: 20.h,
                  child: AppText.bodySmall(
                    'Live',
                    color: context.colors.liveRed,
                  ),
                ),
              
              // Favorite button - outlined heart on semi-transparent circle
              Positioned(
                right: 15.w,
                top: 15.h,
                child: GestureDetector(
                  onTap: onFavorite,
                  child: Container(
                    width: 42.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.21),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      color: context.colors.onSurface,
                      size: 18.sp,
                    ),
                  ),
                ),
              ),
              
              // Event details overlay with glassy effect
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 90.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.r),
                    bottomRight: Radius.circular(40.r),
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(22.w, 20.h, 22.w, 18.h),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.6),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.r),
                          bottomRight: Radius.circular(40.r),
                          topLeft: Radius.circular(35.r),
                          topRight: Radius.circular(35.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Title - no overflow, natural wrap
                          Flexible(
                            child: AppText.bodyMedium(
                              title,
                              maxLines: 2,
                              color: context.colors.onSurface,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          // Date, time, price row
                          Row(
                            children: [
                              Flexible(
                                child: AppText.bodySmall(
                                  date,
                                  color: context.colors.textSecondary,
                                ),
                              ),
                              _buildDot(context),
                              Flexible(
                                child: AppText.bodySmall(
                                  time,
                                  color: context.colors.textSecondary,
                                ),
                              ),
                              _buildDot(context),
                              Flexible(
                                child: AppText.bodySmall(
                                  price,
                                  color: context.colors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDot(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Container(
        width: 3.w,
        height: 3.h,
        decoration: BoxDecoration(
          color: context.colors.dotSeparator,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
