import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Upcoming event card with date badge and organizer info
class UpcomingEventCard extends StatelessWidget {

  const UpcomingEventCard({
    super.key,
    required this.imageUrl,
    required this.month,
    required this.day,
    required this.organizerName,
    required this.organizerLocation,
    required this.organizerAvatar,
    this.isLive = false,
    this.onTap,
  });
  final String imageUrl;
  final String month;
  final String day;
  final String organizerName;
  final String organizerLocation;
  final String? organizerAvatar;
  final bool isLive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: onTap,
      child: Container(
        width: 196.w,
        height: 267.h,
        decoration: BoxDecoration(
          color: context.colors.eventCardBlue,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Stack(
          children: [
            // Event image
            ClipRRect(
              borderRadius: BorderRadius.circular(40.r),
              child: Image.network(
                imageUrl,
                width: 196.w,
                height: 267.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 196.w,
                  height: 267.h,
                  color: context.colors.eventCardBlue,
                  child: Icon(
                    Icons.image_outlined,
                    size: 48.sp,
                    color: Colors.white24,
                  ),
                ),
              ),
            ),
            
            // Live badge
            if (isLive)
              Positioned(
                left: 27.w,
                top: 20.h,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: context.colors.liveRed,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: AppText.bodySmall(
                    'Live',
                    color: context.colors.primary,
                  ),
                ),
              ),
            
            // Date badge
            Positioned(
              right: 16.w,
              top: 19.h,
              child: Column(
                children: [
                  AppText.bodySmall(
                    month,
                    color: context.colors.onSurface,
                  ),
                  AppText.headlineMedium(
                    day,
                    color: context.colors.onSurface,
                  ),
                ],
              ),
            ),
            
            // Organizer info overlay
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 82.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.47),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.r),
                    bottomRight: Radius.circular(40.r),
                  ),
                ),
                child: Row(
                  children: [
                    // Organizer avatar
                    CircleAvatar(
                      radius: 22.r,
                      backgroundColor: context.colors.primary,
                      backgroundImage: organizerAvatar != null && organizerAvatar!.isNotEmpty 
                          ? NetworkImage(organizerAvatar!) 
                          : null,
                      child: organizerAvatar == null || organizerAvatar!.isEmpty
                          ? Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 20.sp,
                            )
                          : null,
                    ),
                    SizedBox(width: 11.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText.bodyMedium(
                            organizerName,
                            maxLines: 1,
                            color: context.colors.onSurface,
                          ),
                          SizedBox(height: 2.h),
                          AppText.bodySmall(
                            organizerLocation,
                            maxLines: 1,
                            color: context.colors.onSurface,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
