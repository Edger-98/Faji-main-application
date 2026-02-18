import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/home/presentation/widgets/widgets.dart';
import 'package:fajimobileapp/features/favorites/presentation/screens/favorites_content.dart';
import 'package:fajimobileapp/features/tickets/presentation/screens/tickets_content.dart';
import 'package:fajimobileapp/features/profile/presentation/screens/profile_content.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/auth_state_viewmodel.dart';

/// Home screen matching Figma design (node-id=2-648)
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    // Ensure user data is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authStateViewModelProvider.notifier).checkAuthStatus();
    });
  }

  Future<void> _refreshHome() async {
    HapticFeedback.lightImpact();
    setState(() => _isRefreshing = true);
    // Refresh user data
    await ref.read(authStateViewModelProvider.notifier).checkAuthStatus();
    setState(() => _isRefreshing = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
      floatingActionButton: _selectedIndex == 0 ? FloatingActionButton.extended(
        onPressed: () {
          HapticFeedback.mediumImpact();
          context.push(RouteManager.eventCreationFlow);
        },
        backgroundColor: context.colors.primary,
        foregroundColor: context.colors.onPrimary,
        elevation: 4,
        icon: Icon(Icons.add, size: 24.sp),
        label: Text(
          'Create Event',
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: HomeBottomNav(
        currentIndex: _selectedIndex,
        onTap: (index) {
          HapticFeedback.lightImpact();
          setState(() => _selectedIndex = index);
        },
      ),
    );

  Widget _buildHomeContent() => SafeArea(
      bottom: false,
      child: RefreshIndicator(
        onRefresh: _refreshHome,
        color: AppColors.primary,
        backgroundColor: AppColors.surfaceContainerHighest,
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
        
        // Your Events (moved to top for better visibility)
        SliverToBoxAdapter(
          child: YourEventsSection(),
        ),
        
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        
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
        
        // Trending Organizers
        SliverToBoxAdapter(
          child: TrendingOrganizersSection(),
        ),
        
        SliverToBoxAdapter(child: SizedBox(height: 100.h)),
        ],
        ),
      ),
    );
}
