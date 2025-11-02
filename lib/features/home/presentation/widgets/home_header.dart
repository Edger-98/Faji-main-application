import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';

/// Home screen header with greeting and notification bell
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(27.w, 20.h, 27.w, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Greeting text
          AppText.displayLarge(
            'Hi, Chineme!',
            color: context.colors.onSurface,
          ),
          
          Row(
            children: [
              // Chat/Messages icon
              GestureDetector(
                onTap: () {
                  context.push(RouteManager.chatList);
                },
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: context.colors.searchBarBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chat_bubble_outline,
                    color: context.colors.iconGray,
                    size: 24.sp,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              // Notification bell with badge
              Stack(
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: context.colors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: context.colors.iconGray,
                      size: 24.sp,
                    ),
                  ),
                  Positioned(
                    right: 9.w,
                    top: 13.h,
                    child: Container(
                      width: 8.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        color: context.colors.liveRed,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
