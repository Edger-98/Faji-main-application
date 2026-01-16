import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/auth_state_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';
import '../widgets/rate_app_bottom_sheet.dart';
// Debug data screen import removed - feature disabled
// import 'package:fajimobileapp/debug_data_screen.dart';

class ProfileContent extends ConsumerStatefulWidget {
  const ProfileContent({super.key});

  @override
  ConsumerState<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends ConsumerState<ProfileContent> {
  String _userName = 'User';
  String _userEmail = 'user@example.com';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserData();
    });
  }

  Future<void> _loadUserData() async {
    final localDataSource = ref.read(authLocalDataSourceProvider);
    final userData = await localDataSource.getUserData();
    
    if (userData['firstName'] != null && userData['email'] != null) {
      if (mounted) {
        setState(() {
          _userName = '${userData['firstName']} ${userData['lastName'] ?? ''}';
          _userEmail = userData['email']!;
        });
      }
    }
    
    ref.read(authStateViewModelProvider.notifier).checkAuthStatus().then((_) {
      final currentUser = ref.read(currentUserProvider);
      
      if (currentUser != null && mounted) {
        setState(() {
          _userName = '${currentUser.firstName} ${currentUser.lastName}';
          _userEmail = currentUser.email;
        });
      }
    });
  }

  Future<void> _performLogout() async {
    try {
      // Call logout
      await ref.read(authStateViewModelProvider.notifier).logout();
      
      // Navigate to intro/login screen
      if (mounted) {
        context.go(RouteManager.intro);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Logout failed: ${e.toString()}'),
            backgroundColor: AppColors.liveRed,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(currentUserProvider, (previous, next) {
      if (next != null) {
        setState(() {
          _userName = '${next.firstName} ${next.lastName}';
          _userEmail = next.email;
        });
      }
    });
    
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          // Header
          AppHeader(
            title: 'Profile',
            subtitle: 'Manage your account and settings',
            // Settings button removed - debug data screen disabled
          ),
          
          // Content
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              children: [
                SizedBox(height: 24.h),
                
                // Profile Card
                _buildProfileCard(),
                
                SizedBox(height: 24.h),
                
                // Quick Actions
                Row(
                  children: [
                    Expanded(
                      child: _buildQuickAction(
                        icon: Icons.storefront_rounded,
                        label: 'Become Vendor',
                        onTap: () {
                          HapticFeedback.lightImpact();
                          context.push(RouteManager.vendorRegistration);
                        },
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: _buildQuickAction(
                        icon: Icons.history_rounded,
                        label: 'Events History',
                        onTap: () {
                          HapticFeedback.lightImpact();
                          context.push(RouteManager.myEvents);
                        },
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 32.h),
                
                // Vendor Management
                _buildSectionTitle('Vendor Management'),
                SizedBox(height: 12.h),
                _buildMenuItem(
                  icon: Icons.dashboard_rounded,
                  title: 'Vendor Dashboard',
                  onTap: () {
                    HapticFeedback.lightImpact();
                    context.push(RouteManager.vendorDashboardScreen);
                  },
                ),
                _buildMenuItem(
                  icon: Icons.inventory_2_rounded,
                  title: 'My Services',
                  onTap: () {
                    HapticFeedback.lightImpact();
                    context.push(RouteManager.vendorResourcesList);
                  },
                ),
                _buildMenuItem(
                  icon: Icons.request_page_rounded,
                  title: 'Booking Requests',
                  onTap: () {
                    HapticFeedback.lightImpact();
                    context.push(RouteManager.vendorBookingsList);
                  },
                ),
                
                SizedBox(height: 24.h),
                
                // Account
                _buildSectionTitle('Account'),
                SizedBox(height: 12.h),
                _buildMenuItem(
                  icon: Icons.person_rounded,
                  title: 'Account Settings',
                  onTap: () {
                    HapticFeedback.lightImpact();
                    context.push(RouteManager.accountSettings);
                  },
                ),
                _buildMenuItem(
                  icon: Icons.history_rounded,
                  title: 'Events History',
                  onTap: () {
                    HapticFeedback.lightImpact();
                    context.push(RouteManager.myEvents);
                  },
                ),
                
                SizedBox(height: 24.h),
                
                // Support
                _buildSectionTitle('Support'),
                SizedBox(height: 12.h),
                _buildMenuItem(
                  icon: Icons.support_agent_rounded,
                  title: 'Contact Support',
                  onTap: () {
                    HapticFeedback.lightImpact();
                    context.push(RouteManager.support);
                  },
                ),
                _buildMenuItem(
                  icon: Icons.description_rounded,
                  title: 'Terms & Conditions',
                  onTap: () {
                    HapticFeedback.lightImpact();
                    context.push(RouteManager.terms);
                  },
                ),
                _buildMenuItem(
                  icon: Icons.star_rounded,
                  title: 'Rate App',
                  onTap: () {
                    HapticFeedback.lightImpact();
                    RateAppBottomSheet.show(context);
                  },
                ),
                
                SizedBox(height: 32.h),
                
                // Log out button
                _buildLogoutButton(),
                
                SizedBox(height: 120.h), // Space for bottom nav
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              color: context.colors.primary.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                _userName.isNotEmpty ? _userName[0].toUpperCase() : 'U',
                style: AppTypography.headlineMedium.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(width: 16.w),
          // User info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _userName,
                  style: AppTypography.titleMedium.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  _userEmail,
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // Edit button
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              context.push(RouteManager.accountSettings);
            },
            child: Container(
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit_rounded,
                size: 18.sp,
                color: context.colors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 28.sp,
              color: context.colors.primary,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTypography.titleSmall.copyWith(
        color: context.colors.onSurfaceVariant,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                size: 20.sp,
                color: context.colors.primary,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: AppTypography.bodyMedium.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16.sp,
              color: context.colors.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        // TODO: Implement logout
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: context.colors.surfaceContainerHighest,
            title: Text(
              'Log Out',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurface,
              ),
            ),
            content: Text(
              'Are you sure you want to log out?',
              style: AppTypography.bodyMedium.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: AppTypography.labelLarge.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Implement actual logout
                  _performLogout();
                },
                child: Text(
                  'Log Out',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.liveRed,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.liveRed.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.liveRed.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logout_rounded,
              color: AppColors.liveRed,
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              'Log Out',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.liveRed,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
