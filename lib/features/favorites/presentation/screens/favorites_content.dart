import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class FavoritesContent extends StatefulWidget {
  const FavoritesContent({super.key});

  @override
  State<FavoritesContent> createState() => _FavoritesContentState();
}

class _FavoritesContentState extends State<FavoritesContent> {
  bool _showEvents = true;

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Favorites',
                  style: TextStyle(
                    fontFamily: 'Neue Haas Grotesk Display Pro',
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurface,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          // Search bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              height: 69.h,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              decoration: BoxDecoration(
                color: AppColors.searchBarBackground,
                borderRadius: BorderRadius.circular(34.5.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: AppColors.onSurfaceVariant,
                    size: 18.sp,
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    'Search your favorites',
                    style: TextStyle(
                      fontFamily: 'PP Neue Montreal',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w100,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          // Filter tabs
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                _buildFilterChip('Events', _showEvents, () {
                  setState(() => _showEvents = true);
                }),
                SizedBox(width: 6.w),
                _buildFilterChip('Organizer', !_showEvents, () {
                  setState(() => _showEvents = false);
                }),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          // Events list
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              children: [
                _buildEventCard(context, isLive: true),
                SizedBox(height: 14.h),
                _buildEventCard(context, isLive: true),
              ],
            ),
          ),
          SizedBox(height: 100.h), // Space for bottom nav
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 33.h,
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        decoration: BoxDecoration(
          color: AppColors.categoryChipBackground,
          borderRadius: BorderRadius.circular(34.5.r),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'PP Neue Montreal',
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
              color: isSelected ? AppColors.primary : AppColors.textTertiary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, {required bool isLive}) {
    return Container(
      height: 295.h,
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
          // Live badge
          if (isLive)
            Positioned(
              left: 30.w,
              top: 17.h,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.liveRed,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  'Live',
                  style: TextStyle(
                    fontFamily: 'PP Neue Montreal',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.onSurface,
                  ),
                ),
              ),
            ),
          // Like button
          Positioned(
            right: 16.w,
            top: 17.h,
            child: Container(
              width: 46.w,
              height: 46.h,
              decoration: const BoxDecoration(
                color: Color(0x351F1F1F),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite,
                color: AppColors.onSurface,
                size: 18.sp,
              ),
            ),
          ),
          // Gradient overlay
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 97.h,
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
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
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
                        SizedBox(height: 7.h),
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
        ],
      ),
    );
  }
}
