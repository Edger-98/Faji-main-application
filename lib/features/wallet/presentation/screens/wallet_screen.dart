import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';

/// Wallet Screen - Single source of truth for all earnings and withdrawals
/// Purpose: Financial layer for all money flows
/// Shows earnings from: Hosting, Co-hosting, Vendor services
/// Contains: Available balance, pending payouts, transaction history, withdrawal actions
class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({super.key});

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> 
    with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;

  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Hosting', 'Co-hosting', 'Vendor'];

  Future<void> _refreshWallet() async {
    HapticFeedback.lightImpact();
    // TODO: Implement wallet refresh
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: _refreshWallet,
          color: AppColors.primary,
          backgroundColor: AppColors.surfaceContainerHighest,
          child: CustomScrollView(
            slivers: [
              // Header
              SliverToBoxAdapter(
                child: AppHeader(
                  title: 'Wallet',
                  subtitle: 'Manage your earnings and withdrawals',
                ),
              ),

              // Balance Card
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          context.colors.primary,
                          context.colors.primary.withValues(alpha: 0.8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Available Balance',
                          style: AppTypography.bodyMedium.copyWith(
                            color: context.colors.onPrimary.withValues(alpha: 0.9),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          '\$0.00',
                          style: AppTypography.displayLarge.copyWith(
                            color: context.colors.onPrimary,
                            fontSize: 42.sp,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            Expanded(
                              child: _buildBalanceAction(
                                context: context,
                                icon: Icons.arrow_upward_rounded,
                                label: 'Withdraw',
                                onTap: () {
                                  HapticFeedback.lightImpact();
                                  context.push(RouteManager.walletEnterAmount);
                                },
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: _buildBalanceAction(
                                context: context,
                                icon: Icons.history_rounded,
                                label: 'History',
                                onTap: () {
                                  HapticFeedback.lightImpact();
                                  context.push(RouteManager.walletHistory);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 24.h)),

              // Earnings Breakdown
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Earnings Breakdown',
                        style: AppTypography.titleMedium.copyWith(
                          color: context.colors.onSurface,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      _buildEarningCard(
                        context: context,
                        icon: Icons.event_rounded,
                        title: 'Hosting',
                        amount: '\$0.00',
                        color: AppColors.eventCardBlue,
                      ),
                      SizedBox(height: 12.h),
                      _buildEarningCard(
                        context: context,
                        icon: Icons.people_rounded,
                        title: 'Co-hosting',
                        amount: '\$0.00',
                        color: AppColors.primary,
                      ),
                      SizedBox(height: 12.h),
                      _buildEarningCard(
                        context: context,
                        icon: Icons.store_rounded,
                        title: 'Vendor Services',
                        amount: '\$0.00',
                        color: AppColors.eventCardYellow,
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 32.h)),

              // Transaction History Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Transactions',
                        style: AppTypography.titleMedium.copyWith(
                          color: context.colors.onSurface,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          context.push(RouteManager.walletHistory);
                        },
                        child: Text('View All'),
                      ),
                    ],
                  ),
                ),
              ),

              // Filter Chips
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 48.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: _filters.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemBuilder: (context, index) {
                      final filter = _filters[index];
                      final isSelected = _selectedFilter == filter;
                      
                      return FilterChip(
                        label: Text(filter),
                        selected: isSelected,
                        onSelected: (selected) {
                          HapticFeedback.lightImpact();
                          setState(() => _selectedFilter = filter);
                        },
                        backgroundColor: context.colors.surfaceContainerHighest,
                        selectedColor: context.colors.primary,
                        labelStyle: AppTypography.labelMedium.copyWith(
                          color: isSelected ? context.colors.onPrimary : context.colors.onSurface,
                        ),
                      );
                    },
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 16.h)),

              // Transaction List
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _buildTransactionItem(context, index),
                    childCount: 5, // TODO: Replace with actual transaction count
                  ),
                ),
              ),

              // Bottom padding for nav bar
              SliverToBoxAdapter(child: SizedBox(height: 120.h)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceAction({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: context.colors.onPrimary.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: context.colors.onPrimary, size: 20.sp),
            SizedBox(width: 8.w),
            Text(
              label,
              style: AppTypography.labelMedium.copyWith(
                color: context.colors.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEarningCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String amount,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.bodyMedium.copyWith(
                    color: context.colors.onSurface,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  amount,
                  style: AppTypography.titleMedium.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16.sp,
            color: context.colors.onSurfaceVariant,
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.successGreen.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_downward_rounded,
              color: AppColors.successGreen,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Event Ticket Sale',
                  style: AppTypography.bodyMedium.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Dec 24, 2025',
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '+\$50.00',
            style: AppTypography.titleSmall.copyWith(
              color: AppColors.successGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
