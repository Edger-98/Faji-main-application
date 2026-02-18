import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// List-style event card for main feed (inspired by Partiful)
class EventListCard extends StatelessWidget {

  const EventListCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.attendees,
    this.onTap,
  });
  final String imageUrl;
  final String title;
  final String date;
  final String time;
  final String location;
  final String attendees;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: context.colors.onSurface.withValues(alpha: 0.05),
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event image with gradient
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Stack(
                    children: [
                      Image.network(
                        imageUrl,
                        width: 90.w,
                        height: 90.w,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 90.w,
                          height: 90.w,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.primary.withValues(alpha: 0.3),
                                AppColors.eventCardBlue.withValues(alpha: 0.3),
                              ],
                            ),
                          ),
                          child: Icon(
                            Icons.event_rounded,
                            size: 28.sp,
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ),
                      // Subtle gradient overlay
                      Container(
                        width: 90.w,
                        height: 90.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.2),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            SizedBox(width: 14.w),
            
            // Event details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: AppTypography.titleSmall.copyWith(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  SizedBox(height: 8.h),
                  
                  // Date and time with icon
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          color: context.colors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.calendar_today_rounded,
                              size: 10.sp,
                              color: context.colors.primary,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              date,
                              style: AppTypography.bodySmall.copyWith(
                                color: context.colors.primary,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Icon(
                        Icons.access_time_rounded,
                        size: 12.sp,
                        color: context.colors.onSurfaceVariant,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        time,
                        style: AppTypography.bodySmall.copyWith(
                          color: context.colors.onSurfaceVariant,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 6.h),
                  
                  // Location
                  if (location.isNotEmpty)
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 12.sp,
                          color: context.colors.onSurfaceVariant,
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            location,
                            style: AppTypography.bodySmall.copyWith(
                              color: context.colors.onSurfaceVariant,
                              fontSize: 11.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  
                  SizedBox(height: 6.h),
                  
                  // Attendees with avatars
                  Row(
                    children: [
                      // Avatar stack
                      SizedBox(
                        width: 50.w,
                        height: 20.h,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              child: Container(
                                width: 20.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: AppColors.eventCardBlue,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: context.colors.surfaceContainerHighest,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 14.w,
                              child: Container(
                                width: 20.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: AppColors.eventCardYellow,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: context.colors.surfaceContainerHighest,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 28.w,
                              child: Container(
                                width: 20.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: context.colors.surfaceContainerHighest,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        attendees,
                        style: AppTypography.bodySmall.copyWith(
                          color: context.colors.onSurface,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Arrow
            Icon(
              Icons.chevron_right_rounded,
              size: 24.sp,
              color: context.colors.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
}
