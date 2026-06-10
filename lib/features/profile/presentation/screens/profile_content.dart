import 'package:cached_network_image/cached_network_image.dart';
import 'package:fajimobileapp/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:fajimobileapp/features/auth/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/auth_state_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:fajimobileapp/features/profile/presentation/widgets/rate_app_bottom_sheet.dart';
import 'package:fajimobileapp/features/vendor/presentation/providers/vendor_providers.dart';

class ProfileContent extends ConsumerStatefulWidget {
  const ProfileContent({super.key});

  @override
  ConsumerState<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends ConsumerState<ProfileContent> {
  String _userName = 'User';
  String _userEmail = 'user@example.com';
  String? _profileImageUrl;

  bool _isValidUrl(String? url) =>
      url != null && (url.startsWith('http://') || url.startsWith('https://'));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserData();
    });
  }

  Future<void> _loadUserData() async {
    final AuthLocalDataSource localDataSource = ref.read(authLocalDataSourceProvider);

    // Load locally-persisted profile image first (instant, no network)
    final String? savedImageUrl = await localDataSource.getProfileImageUrl();
    if (mounted && _isValidUrl(savedImageUrl)) {
      setState(() => _profileImageUrl = savedImageUrl);
    }

    final Map<String, String?> userData = await localDataSource.getUserData();
    if (userData['firstName'] != null && userData['email'] != null && mounted) {
      setState(() {
        _userName = '${userData['firstName']} ${userData['lastName'] ?? ''}';
        _userEmail = userData['email']!;
      });
    }

    ref.read(authStateViewModelProvider.notifier).checkAuthStatus().then((_) {
      final UserEntity? currentUser = ref.read(currentUserProvider);
      if (currentUser != null && mounted) {
        setState(() {
          _userName = '${currentUser.firstName} ${currentUser.lastName}';
          _userEmail = currentUser.email;
          if (_isValidUrl(currentUser.image)) {
            _profileImageUrl = currentUser.image;
          }
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
            content: Text('Logout failed: ${e}'),
            backgroundColor: AppColors.liveRed,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<UserEntity?>(currentUserProvider, (UserEntity? previous, UserEntity? next) {
      if (next != null) {
        setState(() {
          _userName = '${next.firstName} ${next.lastName}';
          _userEmail = next.email;
          if (_isValidUrl(next.image)) _profileImageUrl = next.image;
        });
      }
    });
    
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          // Header
          const AppHeader(
            title: 'Profile',
            subtitle: 'Manage your account and settings',
          ),
          
          // Content
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              children: <Widget>[
                    SizedBox(height: 24.h),
                    
                    // Profile Card
                    _buildProfileCard(),
                    
                    SizedBox(height: 24.h),
                    
                    // Quick Actions
                    Consumer(
                      builder: (context, ref, _) {
                        final vendorStatusAsync = ref.watch(vendorStatusProvider);
                        final bool isVendor = vendorStatusAsync.maybeWhen(
                          data: (s) => s != null && s.hasVendorAccount,
                          orElse: () => false,
                        );
                        return Row(
                          children: <Widget>[
                            Expanded(
                              child: _buildQuickAction(
                                icon: Icons.storefront_rounded,
                                label: isVendor ? 'Vendor Dashboard' : 'Become Vendor',
                                onTap: () {
                                  HapticFeedback.lightImpact();
                                  context.push(isVendor
                                      ? RouteManager.vendorDashboardScreen
                                      : RouteManager.vendorRegistration);
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
                        );
                      },
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
                      icon: Icons.confirmation_number_rounded,
                      title: 'My Tickets',
                      onTap: () {
                        HapticFeedback.lightImpact();
                        context.push(RouteManager.myTickets);
                      },
                    ),
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

  Widget _buildAvatarFallback() => Container(
      color: context.colors.primary.withValues(alpha: 0.2),
      alignment: Alignment.center,
      child: Text(
        _userName.isNotEmpty ? _userName[0].toUpperCase() : 'U',
        style: AppTypography.headlineMedium.copyWith(
          color: context.colors.primary,
          fontWeight: FontWeight.w800,
        ),
      ),
    );

  Widget _buildProfileCard() => Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          // Avatar
          SizedBox(
            width: 60.w,
            height: 60.w,
            child: ClipOval(
              child: _isValidUrl(_profileImageUrl)
                  ? CachedNetworkImage(
                      imageUrl: _profileImageUrl!,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) => _buildAvatarFallback(),
                    )
                  : _buildAvatarFallback(),
            ),
          ),
          
          SizedBox(width: 16.w),
          
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _userName,
                  style: AppTypography.titleLarge.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  _userEmail,
                  style: AppTypography.bodyMedium.copyWith(
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
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.edit_rounded,
                size: 20.sp,
                color: context.colors.primary,
              ),
            ),
          ),
        ],
      ),
    );

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) => GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: context.colors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 24.sp,
                color: context.colors.onPrimary,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

  Widget _buildSectionTitle(String title) => Text(
      title,
      style: AppTypography.titleMedium.copyWith(
        color: context.colors.onSurfaceVariant,
        fontWeight: FontWeight.w600,
      ),
    );

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) => GestureDetector(
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
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
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
                style: AppTypography.bodyLarge.copyWith(
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

  Widget _buildLogoutButton() => GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _performLogout();
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
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
              size: 20.sp,
              color: AppColors.liveRed,
            ),
            SizedBox(width: 8.w),
            Text(
              'Logout',
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.liveRed,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
}