import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/home/presentation/widgets/widgets.dart';

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
      body: SafeArea(
        bottom: false, // Don't apply safe area to bottom
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            _buildHomeContent(),
            _buildFavoritesContent(),
            _buildTicketsContent(),
            _buildProfileContent(),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }

  Widget _buildHomeContent() {
    return CustomScrollView(
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
    );
  }

  Widget _buildFavoritesContent() {
    return Center(
      child: AppText.titleLarge('Favorites', color: context.colors.onSurface),
    );
  }

  Widget _buildTicketsContent() {
    return Center(
      child: AppText.titleLarge('Tickets', color: context.colors.onSurface),
    );
  }

  Widget _buildProfileContent() {
    return Center(
      child: AppText.titleLarge('Profile', color: context.colors.onSurface),
    );
  }
}
