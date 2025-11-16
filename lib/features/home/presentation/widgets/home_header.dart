import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/auth_state_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';

/// Provider for user display name
final userDisplayNameProvider = FutureProvider<String>((ref) async {
  // Try to get from current user provider first
  final currentUser = ref.watch(currentUserProvider);
  if (currentUser?.firstName != null && currentUser!.firstName.isNotEmpty) {
    return currentUser.firstName;
  }

  // Fallback to saved user data
  final localDataSource = ref.watch(authLocalDataSourceProvider);
  final userData = await localDataSource.getUserData();
  
  if (userData['firstName'] != null && userData['firstName']!.isNotEmpty) {
    return userData['firstName']!;
  }
  
  return 'Guest';
});

/// Home screen header with greeting and notification bell
class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameAsync = ref.watch(userDisplayNameProvider);
    
    return Padding(
      padding: EdgeInsets.fromLTRB(27.w, 20.h, 27.w, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Greeting text
          userNameAsync.when(
            data: (userName) => AppText.displayLarge(
              'Hi, $userName!',
              color: context.colors.onSurface,
            ),
            loading: () => AppText.displayLarge(
              'Hi!',
              color: context.colors.onSurface,
            ),
            error: (_, __) => AppText.displayLarge(
              'Hi, Guest!',
              color: context.colors.onSurface,
            ),
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
