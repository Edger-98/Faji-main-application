import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Bottom navigation bar with blur effect
class HomeBottomNav extends StatelessWidget {

  const HomeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) => Container(
      color: Colors.transparent, // Transparent background
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
                    icon: Icons.home_rounded,
                    index: 0,
                    isActive: currentIndex == 0,
                  ),
                  _buildNavItem(
                    icon: Icons.favorite_border,
                    index: 1,
                    isActive: currentIndex == 1,
                  ),
                  _buildNavItem(
                    icon: Icons.confirmation_number_outlined,
                    index: 2,
                    isActive: currentIndex == 2,
                  ),
                  _buildNavItem(
                    icon: Icons.person_outline,
                    index: 3,
                    isActive: currentIndex == 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  Widget _buildNavItem({
    required IconData icon,
    required int index,
    required bool isActive,
  }) => Builder(
      builder: (context) => GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: isActive ? context.colors.primary : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: isActive ? context.colors.onPrimary : context.colors.onSurface,
            size: 24.sp,
          ),
        ),
      ),
    );
}
