import 'package:fajimobileapp/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:fajimobileapp/features/auth/domain/entities/user_entity.dart';
import 'package:fajimobileapp/features/vendor/presentation/providers/vendor_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/presentation/widgets/common/app_bottom_nav.dart';

import 'package:fajimobileapp/features/auth/presentation/viewmodels/auth_state_viewmodel.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
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
    // Trigger auth check to ensure user data is loaded
    await ref.read(authStateViewModelProvider.notifier).checkAuthStatus();
    
    // Try to get from current user provider
    final UserEntity? currentUser = ref.read(currentUserProvider);
    
    if (currentUser != null) {
      if (mounted) {
        setState(() {
          _userName = '${currentUser.firstName} ${currentUser.lastName}';
          _userEmail = currentUser.email;
        });
      }
      return;
    }

    // Fallback to saved user data
    final AuthLocalDataSource localDataSource = ref.read(authLocalDataSourceProvider);
    final Map<String, String?> userData = await localDataSource.getUserData();
    
    if (userData['firstName'] != null && userData['email'] != null) {
      if (mounted) {
        setState(() {
          _userName = '${userData['firstName']} ${userData['lastName'] ?? ''}';
          _userEmail = userData['email']!;
        });
      }
    }
  }

  Future<void> _rateApp(BuildContext context) async {
    HapticFeedback.lightImpact();
    
    try {
      final inAppReview = InAppReview.instance;
      
      if (await inAppReview.isAvailable()) {
        await inAppReview.requestReview();
      } else {
        // Fallback: Open app store page
        await inAppReview.openStoreListing(
          appStoreId: 'YOUR_APP_STORE_ID', // TODO: Replace with actual App Store ID
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unable to open app store: ${e}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await _performLogout();
            },
            child: const Text(
              'Log Out',
              style: TextStyle(color: Color(0xFFCA4638)),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _performLogout() async {
    try {
      await ref.read(authStateViewModelProvider.notifier).logout();
      
      if (mounted) {
        context.go(RouteManager.intro);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Logout failed: ${e}'),
            backgroundColor: const Color(0xFFCA4638),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch for user changes
    ref.listen(currentUserProvider, (UserEntity? previous, UserEntity? next) {
      if (next != null) {
        setState(() {
          _userName = '${next.firstName} ${next.lastName}';
          _userEmail = next.email;
        });
      }
    });
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: <Widget>[
                  // Back button
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                      color: AppColors.onSurface,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Spacer(),
                  // Settings button
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.settings_outlined, size: 19),
                      color: AppColors.onSurface,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: <Widget>[
                  const SizedBox(height: 31),
                  // Profile picture
                  Center(
                    child: Container(
                      width: 106,
                      height: 106,
                      decoration: const BoxDecoration(
                        color: Color(0xFFC4C4C4),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Name
                  Center(
                    child: Text(
                      _userName,
                      style: AppTypography.labelLarge.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: AppTypography.regular,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  // Email
                  Center(
                    child: Text(
                      _userEmail,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: AppTypography.regular,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Personal section
                  _buildSectionHeader('Personal'),
                  const SizedBox(height: 3),
                  // Conditionally show vendor option based on status
                  Consumer(
                    builder: (context, ref, child) {
                      final vendorStatusAsync = ref.watch(vendorStatusProvider);
                      
                      return vendorStatusAsync.when(
                        data: (vendorStatus) {
                          // If user is already a vendor, don't show "Become a Vendor"
                          if (vendorStatus != null && vendorStatus.hasVendorAccount) {
                            // Optionally show vendor dashboard link instead
                            return _buildMenuItem(
                              Icons.storefront_rounded,
                              'Vendor Dashboard',
                              onTap: () => context.push(RouteManager.vendorDashboard),
                            );
                          }
                          
                          // Show "Become a Vendor" if not a vendor
                          return _buildMenuItem(
                            Icons.storefront_rounded,
                            'Become a Vendor',
                            onTap: () => context.push(RouteManager.vendorRegistration),
                          );
                        },
                        loading: () => _buildMenuItem(
                          Icons.storefront_rounded,
                          'Become a Vendor',
                          onTap: null, // Disabled while loading
                        ),
                        error: (_, __) => _buildMenuItem(
                          Icons.storefront_rounded,
                          'Become a Vendor',
                          onTap: () => context.push(RouteManager.vendorRegistration),
                        ),
                      );
                    },
                  ),
                  _buildMenuItem(
                    Icons.person_outline, 
                    'Account settings',
                    onTap: () => context.push(RouteManager.accountSettings),
                  ),
                  _buildMenuItem(Icons.history, 'Events history'),
                  const SizedBox(height: 10),
                  _buildDivider(),
                  const SizedBox(height: 10),
                  // Preferences section
                  _buildSectionHeader('Preferences'),
                  const SizedBox(height: 3),
                  _buildMenuItem(Icons.payment_outlined, 'Payment Methods'),
                  _buildMenuItem(Icons.notifications_outlined, 'Notifications'),
                  _buildMenuItem(Icons.card_membership_outlined, 'Subscriptions'),
                  const SizedBox(height: 10),
                  _buildDivider(),
                  const SizedBox(height: 10),
                  // Resources section
                  _buildSectionHeader('Resources'),
                  const SizedBox(height: 3),
                  _buildMenuItem(Icons.support_agent_outlined, 'Contact Support', onTap: () => context.push(RouteManager.support)),
                  _buildMenuItem(Icons.description_outlined, 'Terms & Conditions', onTap: () => context.push(RouteManager.terms)),
                  _buildMenuItem(
                    Icons.star_border, 
                    'Rate in App Store',
                    onTap: () => _rateApp(context),
                  ),
                  const SizedBox(height: 20),
                  // Log out button
                  GestureDetector(
                    onTap: _showLogoutDialog,
                    child: Container(
                      height: 51,
                      decoration: BoxDecoration(
                        color: AppColors.searchBarBackground,
                        borderRadius: BorderRadius.circular(34.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.logout,
                            color: Color(0xFFCA4638),
                            size: 14,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Log out',
                            style: AppTypography.bodyLarge.copyWith(
                              color: const Color(0xFFCA4638),
                              fontWeight: AppTypography.regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 2), // Changed from 3 to 2
    );
  }

  Widget _buildSectionHeader(String title) => Text(
      title,
      style: AppTypography.bodyMedium.copyWith(
        color: AppColors.textSecondary,
        fontWeight: AppTypography.regular,
        fontSize: 15,
      ),
    );

  Widget _buildMenuItem(IconData icon, String title, {VoidCallback? onTap}) => InkWell(
      onTap: onTap != null ? () {
        HapticFeedback.lightImpact();
        onTap();
      } : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: icon == Icons.person_outline || icon == Icons.history
                  ? AppColors.textSecondary
                  : const Color(0xFF999898),
              size: 15,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: AppTypography.regular,
                ),
              ),
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.searchBarBackground,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.onSurface,
                size: 10,
              ),
            ),
          ],
        ),
      ),
    );

  Widget _buildDivider() => Container(
      height: 0.6,
      margin: const EdgeInsets.only(left: 25),
      color: const Color(0xFF2E2E2E),
    );
}
