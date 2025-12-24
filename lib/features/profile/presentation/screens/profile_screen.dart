import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
    final currentUser = ref.read(currentUserProvider);
    
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
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  // Back button
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
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
                    decoration: BoxDecoration(
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
                children: [
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
                  // Balance card
                  InkWell(
                    onTap: () {
                        context.push(RouteManager.walletBalance);
                    },
                    borderRadius: BorderRadius.circular(39.5),
                    child: Ink(
                      height: 71,
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      decoration: BoxDecoration(
                        color: AppColors.searchBarBackground,
                        borderRadius: BorderRadius.circular(39.5),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Current Balance',
                                style: AppTypography.bodySmall.copyWith(
                                  color: AppColors.onSurface,
                                  fontWeight: AppTypography.thin,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                '\$230d00000.00',
                                style: AppTypography.headlineMedium.copyWith(
                                  color: const Color(0xFFFEB822),
                                  fontWeight: AppTypography.regular,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.onSurface,
                            size: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Personal section
                  _buildSectionHeader('Personal'),
                  const SizedBox(height: 3),
                  _buildMenuItem(
                    Icons.storefront_rounded, 
                    'Become a Vendor',
                    onTap: () => context.push(RouteManager.vendorRegistration),
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
                  _buildMenuItem(Icons.star_border, 'Rate in App Store'),
                  const SizedBox(height: 20),
                  // Log out button
                  Container(
                    height: 51,
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      borderRadius: BorderRadius.circular(34.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 3),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: AppTypography.bodyMedium.copyWith(
        color: AppColors.textSecondary,
        fontWeight: AppTypography.regular,
        fontSize: 15,
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {VoidCallback? onTap}) {
    return InkWell(
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
  }

  Widget _buildDivider() {
    return Container(
      height: 0.6,
      margin: const EdgeInsets.only(left: 25),
      color: const Color(0xFF2E2E2E),
    );
  }
}
