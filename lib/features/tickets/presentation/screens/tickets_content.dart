import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';

class TicketsContent extends StatelessWidget {
  const TicketsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 50),
                Text(
                  'My Tickets',
                  style: TextStyle(
                    fontFamily: 'Neue Haas Grotesk Display Pro',
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurface,
                  ),
                ),
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.searchBarBackground,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.settings_outlined, size: 18.sp),
                    color: AppColors.onSurface,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          // Organize event button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GestureDetector(
              onTap: () => context.push(RouteManager.organizeEvent),
              child: Container(
                height: 69.h,
                decoration: BoxDecoration(
                  color: AppColors.searchBarBackground,
                  borderRadius: BorderRadius.circular(37.r),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 22.w),
                    Text(
                      'Organize an event',
                      style: TextStyle(
                        fontFamily: 'PP Neue Montreal',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFB9B9B9),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 28.w,
                      height: 28.h,
                      margin: EdgeInsets.only(right: 30.w),
                      child: Icon(
                        Icons.add_circle_outline,
                        color: AppColors.onSurface,
                        size: 28.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 14.h),
          // Tickets list
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              children: [
                _buildTicketCard(context, isLiked: false),
                SizedBox(height: 14.h),
                _buildTicketCard(context, isLiked: true),
              ],
            ),
          ),
          SizedBox(height: 100.h), // Space for bottom nav
        ],
      ),
    );
  }

  Widget _buildTicketCard(BuildContext context, {required bool isLiked}) {
    return Container(
      height: 267.h,
      decoration: BoxDecoration(
        color: AppColors.eventCardBlue,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Stack(
        children: [
          // Background image placeholder
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.r),
              child: Container(
                color: AppColors.eventCardBlue,
              ),
            ),
          ),
          // Gradient overlay
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 88.h,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.overlayBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.r),
                  bottomRight: Radius.circular(40.r),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.r),
                  bottomRight: Radius.circular(40.r),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GENfest Music Festival 2024 - Multi - \nsensorial Audio Interface',
                          style: TextStyle(
                            fontFamily: 'PP Neue Montreal',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.onSurface,
                          ),
                          maxLines: 2,
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            Text(
                              'Wed 22/03',
                              style: TextStyle(
                                fontFamily: 'PP Neue Montreal',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              width: 3.w,
                              height: 3.h,
                              decoration: const BoxDecoration(
                                color: AppColors.dotSeparator,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              '08:30 PM',
                              style: TextStyle(
                                fontFamily: 'PP Neue Montreal',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              width: 3.w,
                              height: 3.h,
                              decoration: const BoxDecoration(
                                color: AppColors.dotSeparator,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'From \$40.00',
                              style: TextStyle(
                                fontFamily: 'PP Neue Montreal',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
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
          ),
          // Like button
          Positioned(
            right: 16.w,
            top: 16.h,
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: isLiked ? Colors.black : Colors.black.withOpacity(0.38),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: AppColors.onSurface,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
