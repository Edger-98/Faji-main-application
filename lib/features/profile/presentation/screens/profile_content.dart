import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/auth_state_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:fajimobileapp/debug_data_screen.dart';

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
    // Load user data after frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserData();
    });
  }

  Future<void> _loadUserData() async {
    // First, try to load from saved data (faster)
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
    
    // Then trigger auth check in background to refresh data
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

  @override
  Widget build(BuildContext context) {
    // Watch for user changes
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
          // Header with settings
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.searchBarBackground,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.settings_outlined, size: 19.sp),
                    color: AppColors.onSurface,
                    onPressed: () {
                      // Temporary: Navigate to debug screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DebugDataScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              children: [
                SizedBox(height: 31.h),
                // Profile picture
                Center(
                  child: Container(
                    width: 106.w,
                    height: 106.h,
                    decoration: const BoxDecoration(
                      color: Color(0xFFC4C4C4),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                // Name
                Center(
                  child: Text(
                    _userName,
                    style: TextStyle(
                      fontFamily: 'PP Neue Montreal',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.onSurface,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                // Email
                Center(
                  child: Text(
                    _userEmail,
                    style: TextStyle(
                      fontFamily: 'PP Neue Montreal',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                // Balance card
                GestureDetector(
                    onTap: () {
                      context.push(RouteManager.walletBalance);
                    },
                  child: Container(
                    height: 71.h,
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      borderRadius: BorderRadius.circular(39.5.r),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Current Balance',
                              style: TextStyle(
                                fontFamily: 'PP Neue Montreal',
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w100,
                                color: AppColors.onSurface,
                              ),
                            ),
                            Text(
                              '\$23000.00',
                              style: TextStyle(
                                fontFamily: 'PP Neue Montreal',
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFFEB822),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.onSurface,
                          size: 10.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                // Become a Vendor Card
                _buildVendorCard(context),
                SizedBox(height: 16.h),
                // Personal section
                _buildSectionHeader('Personal'),
                SizedBox(height: 3.h),
                _buildMenuItem(
                  context, 
                  Icons.dashboard_outlined, 
                  'Vendor Dashboard',
                  onTap: () {
                    HapticFeedback.lightImpact();
                    context.push(RouteManager.vendorDashboardScreen);
                  },
                ),
                _buildMenuItem(
                  context, 
                  Icons.inventory_2_outlined, 
                  'My Services',
                  onTap: () {
                    HapticFeedback.lightImpact();
                    context.push(RouteManager.vendorResourcesList);
                  },
                ),
                _buildMenuItem(
                  context, 
                  Icons.request_page_outlined, 
                  'Booking Requests',
                  onTap: () {
                    HapticFeedback.lightImpact();
                    context.push(RouteManager.vendorBookingsList);
                  },
                ),
                _buildMenuItem(
                  context, 
                  Icons.person_outline, 
                  'Account settings',
                  onTap: () {
                    HapticFeedback.lightImpact();
                    context.push(RouteManager.accountSettings);
                  },
                ),
                _buildMenuItem(context, Icons.history, 'Events history'),
                SizedBox(height: 10.h),
                _buildDivider(),
                SizedBox(height: 10.h),
                // Preferences section
                _buildSectionHeader('Preferences'),
                SizedBox(height: 3.h),
                _buildMenuItem(context, Icons.payment_outlined, 'Payment Methods'),
                _buildMenuItem(context, Icons.notifications_outlined, 'Notifications'),
                _buildMenuItem(context, Icons.card_membership_outlined, 'Subscriptions'),
                SizedBox(height: 10.h),
                _buildDivider(),
                SizedBox(height: 10.h),
                // Resources section
                _buildSectionHeader('Resources'),
                SizedBox(height: 3.h),
                _buildMenuItem(context, Icons.support_agent_outlined, 'Contact Support', onTap: () => context.push(RouteManager.support)),
                _buildMenuItem(context, Icons.description_outlined, 'Terms & Conditions', onTap: () => context.push(RouteManager.terms)),
                _buildMenuItem(context, Icons.star_border, 'Rate in App Store'),
                SizedBox(height: 20.h),
                // Log out button
                Container(
                  height: 51.h,
                  decoration: BoxDecoration(
                    color: AppColors.searchBarBackground,
                    borderRadius: BorderRadius.circular(34.5.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        color: const Color(0xFFCA4638),
                        size: 14.sp,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Log out',
                        style: TextStyle(
                          fontFamily: 'PP Neue Montreal',
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFCA4638),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 120.h), // Space for bottom nav
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'PP Neue Montreal',
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: icon == Icons.person_outline || icon == Icons.history
                  ? AppColors.textSecondary
                  : const Color(0xFF999898),
              size: 15.sp,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'PP Neue Montreal',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.onSurface,
                ),
              ),
            ),
            Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: AppColors.searchBarBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.onSurface,
                size: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 0.6,
      margin: EdgeInsets.only(left: 25.w),
      color: const Color(0xFF2E2E2E),
    );
  }

  Widget _buildVendorCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        context.push(RouteManager.vendorRegistration);
      },
      child: Container(
        height: 71.h,
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        decoration: BoxDecoration(
          color: AppColors.searchBarBackground,
          borderRadius: BorderRadius.circular(39.5.r),
        ),
        child: Row(
          children: [
            Icon(
              Icons.storefront_rounded,
              color: AppColors.primary,
              size: 20.sp,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                'Become a Vendor',
                style: TextStyle(
                  fontFamily: 'PP Neue Montreal',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.onSurface,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.onSurface,
              size: 10.sp,
            ),
          ],
        ),
      ),
    );
  }
}
