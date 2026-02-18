import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Main bottom navigation bar with 5 tabs
/// Home | Vendors | My Events | Wallet | Profile
class MainBottomNav extends StatelessWidget {

  const MainBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) => Container(
      color: Colors.transparent,
      padding: EdgeInsets.fromLTRB(14.w, 0, 14.w, 20.h),
      child: SafeArea(
        child: Container(
          height: 88.h,
          decoration: BoxDecoration(
            color: context.colors.bottomNavBackground,
            borderRadius: BorderRadius.circular(44.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(44.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(
                    context: context,
                    icon: FlutterRemix.home_5_line,
                    activeIcon: FlutterRemix.home_5_fill,
                    label: 'Home',
                    index: 0,
                  ),
                  _buildNavItem(
                    context: context,
                    icon: FlutterRemix.store_2_line,
                    activeIcon: FlutterRemix.store_2_fill,
                    label: 'Vendors',
                    index: 1,
                  ),
                  _buildNavItem(
                    context: context,
                    icon: FlutterRemix.calendar_event_line,
                    activeIcon: FlutterRemix.calendar_event_fill,
                    label: 'Events',
                    index: 2,
                  ),
                  _buildNavItem(
                    context: context,
                    icon: FlutterRemix.wallet_3_line,
                    activeIcon: FlutterRemix.wallet_3_fill,
                    label: 'Wallet',
                    index: 3,
                  ),
                  _buildNavItem(
                    context: context,
                    icon: FlutterRemix.user_3_line,
                    activeIcon: FlutterRemix.user_3_fill,
                    label: 'Profile',
                    index: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final isActive = currentIndex == index;
    
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: isActive ? 52.w : 44.w,
              height: isActive ? 52.h : 44.h,
              decoration: BoxDecoration(
                color: isActive ? context.colors.primary : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isActive ? activeIcon : icon,
                color: isActive ? context.colors.onPrimary : context.colors.onSurface.withValues(alpha: 0.6),
                size: isActive ? 24.sp : 22.sp,
              ),
            ),
            SizedBox(height: 2.h),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: AppTypography.labelSmall.copyWith(
                color: isActive ? context.colors.primary : context.colors.onSurface.withValues(alpha: 0.6),
                fontSize: isActive ? 10.sp : 9.sp,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
