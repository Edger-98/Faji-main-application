import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/home/presentation/screens/home_content.dart';
import 'package:fajimobileapp/features/vendor/presentation/screens/vendor_marketplace_screen.dart';
import 'package:fajimobileapp/features/events/presentation/screens/my_events_screen.dart';
import 'package:fajimobileapp/features/wallet/presentation/screens/wallet_screen.dart';
import 'package:fajimobileapp/features/profile/presentation/screens/profile_content.dart';
import 'package:fajimobileapp/features/dashboard/presentation/widgets/main_bottom_nav.dart';

/// Main dashboard screen with 5 tabs following MVP spec:
/// Home | Vendors | My Events | Wallet | Profile
/// 
/// Discovery is public (Home, Vendors)
/// Management is private (My Events, Profile)
/// Money flows through Wallet only
class MainDashboardScreen extends ConsumerStatefulWidget {
  const MainDashboardScreen({super.key});

  @override
  ConsumerState<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends ConsumerState<MainDashboardScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    HapticFeedback.lightImpact();
    setState(() => _selectedIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
    );
  }

  void _onPageChanged(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe, use nav only
        children: const [
          HomeContent(),
          VendorMarketplaceScreen(),
          MyEventsScreen(),
          WalletScreen(),
          ProfileContent(),
        ],
      ),
      bottomNavigationBar: MainBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
