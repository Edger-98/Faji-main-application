import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/home/presentation/widgets/widgets.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/auth_state_viewmodel.dart';

/// Home content - Event discovery feed
/// Purpose: Public discovery of events and hosts
/// Contains: Event feed, highlighted/trending events, event hosts
class HomeContent extends ConsumerStatefulWidget {
  const HomeContent({super.key});

  @override
  ConsumerState<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends ConsumerState<HomeContent> with AutomaticKeepAliveClientMixin {
  bool _isRefreshing = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authStateViewModelProvider.notifier).checkAuthStatus();
    });
  }

  Future<void> _refreshHome() async {
    HapticFeedback.lightImpact();
    setState(() => _isRefreshing = true);
    await ref.read(authStateViewModelProvider.notifier).checkAuthStatus();
    setState(() => _isRefreshing = false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return SafeArea(
      bottom: false,
      child: RefreshIndicator(
        onRefresh: _refreshHome,
        color: AppColors.primary,
        backgroundColor: AppColors.surfaceContainerHighest,
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: AppHeader(
                title: 'Home',
                subtitle: 'Discover amazing events',
              ),
            ),
            
            // Search Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 20.h),
                child: HomeSearchBar(),
              ),
            ),
            
            // Hero Banner
            SliverToBoxAdapter(
              child: HeroBanner(
                onTap: () {
                  // TODO: Navigate to featured events
                },
              ),
            ),
            
            SliverToBoxAdapter(child: SizedBox(height: 28.h)),
            
            // Trending Events (Horizontal Scroll)
            SliverToBoxAdapter(
              child: TrendingEventsSection(),
            ),
            
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            
            // Category Filter
            SliverToBoxAdapter(
              child: CategoryFilterSection(),
            ),
            
            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
            
            // Featured Events Section
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured Events',
                      style: AppTypography.titleLarge.copyWith(
                        color: context.colors.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 20.sp,
                      color: context.colors.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
            
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            
            // Upcoming Events (List Style)
            SliverToBoxAdapter(
              child: UpcomingEventsSection(),
            ),
            
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            
            // This Week Section
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'This Week',
                      style: AppTypography.titleLarge.copyWith(
                        color: context.colors.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 20.sp,
                      color: context.colors.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
            
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            
            // Your Events
            SliverToBoxAdapter(
              child: YourEventsSection(),
            ),
            
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            
            // Trending in Your Network
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending in Your Network',
                      style: AppTypography.titleLarge.copyWith(
                        color: context.colors.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 20.sp,
                      color: context.colors.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
            
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            
            // Flash Deal
            SliverToBoxAdapter(
              child: FlashDealSection(),
            ),
            
            SliverToBoxAdapter(child: SizedBox(height: 24.h)),
            
            // Trending Hosts
            SliverToBoxAdapter(
              child: TrendingOrganizersSection(),
            ),
            
            // Bottom padding for nav bar
            SliverToBoxAdapter(child: SizedBox(height: 120.h)),
          ],
        ),
      ),
    );
  }
}
