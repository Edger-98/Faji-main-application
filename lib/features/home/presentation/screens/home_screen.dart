import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/home/presentation/widgets/widgets.dart';
import 'package:fajimobileapp/features/favorites/presentation/screens/favorites_content.dart';
import 'package:fajimobileapp/features/tickets/presentation/screens/tickets_content.dart';
import 'package:fajimobileapp/features/profile/presentation/screens/profile_content.dart';

/// Home screen matching Figma design (node-id=2-648)
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      extendBody: true, // Extend body behind bottom nav
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeContent(),
          const FavoritesContent(),
          const TicketsContent(),
          const ProfileContent(),
        ],
      ),
      bottomNavigationBar: HomeBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }

  Widget _buildHomeContent() {
    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        slivers: [
        // Header
        SliverToBoxAdapter(
          child: HomeHeader(),
        ),
        
        // Search Bar
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: HomeSearchBar(),
          ),
        ),
        
        // Trending Events
        SliverToBoxAdapter(
          child: TrendingEventsSection(),
        ),
        
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        
        // Category Filter
        SliverToBoxAdapter(
          child: CategoryFilterSection(),
        ),
        
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        
        // Upcoming Events
        SliverToBoxAdapter(
          child: UpcomingEventsSection(),
        ),
        
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        
        // Flash Deal
        SliverToBoxAdapter(
          child: FlashDealSection(),
        ),
        
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        
        // Your Events
        SliverToBoxAdapter(
          child: YourEventsSection(),
        ),
        
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        
        // Trending Organizers
        SliverToBoxAdapter(
          child: TrendingOrganizersSection(),
        ),
        
        SliverToBoxAdapter(child: SizedBox(height: 100.h)),
        ],
      ),
    );
  }
}
