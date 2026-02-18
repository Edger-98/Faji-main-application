import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/home/presentation/widgets/widgets.dart';
import 'package:fajimobileapp/features/auth/presentation/viewmodels/auth_state_viewmodel.dart';
import 'package:go_router/go_router.dart';

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
      _loadInitialData();
    });
  }

  Future<void> _loadInitialData() async {
    await ref.read(authStateViewModelProvider.notifier).checkAuthStatus();
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
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
                // Header with improved spacing
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Discover Events',
                          style: AppTypography.headlineLarge.copyWith(
                            color: context.colors.onSurface,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Find amazing experiences near you',
                          style: AppTypography.bodyMedium.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Enhanced Search Bar
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 20.h),
                    child: const HomeSearchBar(),
                  ),
                ),
                
                // Hero Banner with better spacing
                SliverToBoxAdapter(
                  child: HeroBanner(
                    onTap: () {
                      context.push(RouteManager.eventsList);
                    },
                  ),
                ),
                
                SliverToBoxAdapter(child: SizedBox(height: 32.h)),
                
                // Category Filter with better positioning
                const SliverToBoxAdapter(
                  child: CategoryFilterSection(),
                ),
                
                SliverToBoxAdapter(child: SizedBox(height: 28.h)),
                
                // Trending Events (Horizontal Scroll)
                const SliverToBoxAdapter(
                  child: TrendingEventsSection(),
                ),
                
                SliverToBoxAdapter(child: SizedBox(height: 32.h)),
                
                // Flash Deal - Commented out for now
                // SliverToBoxAdapter(
                //   child: FlashDealSection(),
                // ),
                // 
                // SliverToBoxAdapter(child: SizedBox(height: 32.h)),
                
                // Upcoming Events (List Style)
                const SliverToBoxAdapter(
                  child: UpcomingEventsSection(),
                ),
                
                SliverToBoxAdapter(child: SizedBox(height: 32.h)),
                
                // Your Events
                const SliverToBoxAdapter(
                  child: YourEventsSection(),
                ),
                
                // Bottom padding for nav bar
                SliverToBoxAdapter(child: SizedBox(height: 120.h)),
              ],
            ),
          ),
    );
  }
}
