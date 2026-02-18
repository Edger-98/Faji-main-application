import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/wallet/presentation/viewmodels/wallet_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/wallet/presentation/providers/wallet_providers.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/wallet_balance.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/wallet_transaction.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/earnings_breakdown.dart';

/// Wallet Screen - Single source of truth for all earnings and withdrawals
/// Purpose: Financial layer for all money flows
/// Shows earnings from: Hosting, Co-hosting, Vendor services
/// Contains: Available balance, pending payouts, transaction history, withdrawal actions
class WalletScreen extends HookConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WalletViewModel walletViewModel = ref.watch(walletViewModelProvider.notifier);
    final WalletState walletState = ref.watch(walletViewModelProvider);
    final ValueNotifier<String> selectedFilter = useState('All');
    final List<String> filters = <String>['All', 'Hosting', 'Co-hosting', 'Vendor'];

    // Load wallet data on mount
    useEffect(() {
      Future.microtask(walletViewModel.refreshAll);
      return null;
    }, <Object?>[]);

    Future<void> refreshWallet() async {
      HapticFeedback.lightImpact();
      await walletViewModel.refreshAll();
    }

    void onFilterChanged(String filter) {
      HapticFeedback.lightImpact();
      selectedFilter.value = filter;
      
      // Map filter to API type
      String? apiType;
      if (filter == 'Hosting') {
        apiType = 'ticket_sale';
      } else if (filter == 'Co-hosting') {
        apiType = 'cohost_earning';
      } else if (filter == 'Vendor') {
        apiType = 'vendor_earning';
      }
      
      walletViewModel.filterTransactionsByType(apiType ?? '');
    }

    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: refreshWallet,
          color: AppColors.primary,
          backgroundColor: AppColors.surfaceContainerHighest,
          child: CustomScrollView(
            slivers: <Widget>[
              // Header
              const SliverToBoxAdapter(
                child: AppHeader(
                  title: 'Wallet',
                  subtitle: 'Manage your earnings and withdrawals',
                ),
              ),

              // Balance Card
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: walletState.balanceState.when(
                    initial: () => _buildBalanceCardSkeleton(context),
                    loading: () => _buildBalanceCardSkeleton(context),
                    success: (WalletBalance balance) => _buildBalanceCard(context, balance),
                    error: (Failure failure) => _buildBalanceCardError(context, failure.message),
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
                    children: <Widget>[
                      Text(
                        'Earnings Breakdown',
                        style: AppTypography.titleMedium.copyWith(
                          color: context.colors.onSurface,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      walletState.earningsState.when(
                        initial: () => _buildEarningsSkeletons(context),
                        loading: () => _buildEarningsSkeletons(context),
                        success: (EarningsBreakdown earnings) => _buildEarningsBreakdown(context, earnings),
                        error: (Failure failure) => _buildEarningsError(context, failure.message),
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
                    children: <Widget>[
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
                        child: const Text('View All'),
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
                    itemCount: filters.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemBuilder: (BuildContext context, int index) {
                      final String filter = filters[index];
                      final bool isSelected = selectedFilter.value == filter;
                      
                      return FilterChip(
                        label: Text(filter),
                        selected: isSelected,
                        onSelected: (bool selected) => onFilterChanged(filter),
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
              walletState.transactionsState.when(
                initial: () => _buildTransactionsEmpty(context),
                loading: () => _buildTransactionsLoading(context),
                success: (WalletTransactionsResponse transactionsResponse) => _buildTransactionsList(
                  context,
                  transactionsResponse.transactions,
                ),
                error: (Failure failure) => _buildTransactionsError(context, failure.message),
              ),

              // Bottom padding for nav bar
              SliverToBoxAdapter(child: SizedBox(height: 120.h)),
            ],
          ),
        ),
      ),
    );
  }

  // Balance Card with real data
  Widget _buildBalanceCard(BuildContext context, WalletBalance balance) => Container(
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
            '${balance.currency} ${balance.availableBalance.toStringAsFixed(2)}',
            style: AppTypography.displayLarge.copyWith(
              color: context.colors.onPrimary,
              fontSize: 42.sp,
            ),
          ),
          if (balance.pendingBalance > 0) ...[
            SizedBox(height: 8.h),
            Text(
              'Pending: ${balance.currency} ${balance.pendingBalance.toStringAsFixed(2)}',
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onPrimary.withValues(alpha: 0.7),
              ),
            ),
          ],
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
    );

  // Balance Card Skeleton
  Widget _buildBalanceCardSkeleton(BuildContext context) => Container(
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
          Container(
            width: 200.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: context.colors.onPrimary.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8.r),
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
                  onTap: () {},
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildBalanceAction(
                  context: context,
                  icon: Icons.history_rounded,
                  label: 'History',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );

  // Balance Card Error
  Widget _buildBalanceCardError(BuildContext context, String message) => Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: context.colors.errorContainer,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: context.colors.error, size: 48.sp),
          SizedBox(height: 12.h),
          Text(
            'Failed to load balance',
            style: AppTypography.titleMedium.copyWith(
              color: context.colors.onErrorContainer,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            message,
            style: AppTypography.bodySmall.copyWith(
              color: context.colors.onErrorContainer.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

  // Earnings Breakdown with real data
  Widget _buildEarningsBreakdown(BuildContext context, EarningsBreakdown earnings) => Column(
      children: [
        _buildEarningCard(
          context: context,
          icon: Icons.account_balance_wallet_rounded,
          title: 'Available Balance',
          amount: '${earnings.currency} ${earnings.availableBalance.toStringAsFixed(2)}',
          color: AppColors.successGreen,
        ),
        SizedBox(height: 12.h),
        _buildEarningCard(
          context: context,
          icon: Icons.pending_rounded,
          title: 'Pending Balance',
          amount: '${earnings.currency} ${earnings.pendingBalance.toStringAsFixed(2)}',
          color: AppColors.eventCardYellow,
        ),
        SizedBox(height: 12.h),
        _buildEarningCard(
          context: context,
          icon: Icons.lock_rounded,
          title: 'Escrow Balance',
          amount: '${earnings.currency} ${earnings.escrowBalance.toStringAsFixed(2)}',
          color: AppColors.eventCardBlue,
        ),
      ],
    );

  // Earnings Skeletons
  Widget _buildEarningsSkeletons(BuildContext context) => Column(
      children: [
        _buildEarningCardSkeleton(context),
        SizedBox(height: 12.h),
        _buildEarningCardSkeleton(context),
        SizedBox(height: 12.h),
        _buildEarningCardSkeleton(context),
      ],
    );

  Widget _buildEarningCardSkeleton(BuildContext context) => Container(
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
              color: context.colors.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 80.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  // Earnings Error
  Widget _buildEarningsError(BuildContext context, String message) => Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.errorContainer,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: context.colors.error),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              'Failed to load earnings',
              style: AppTypography.bodyMedium.copyWith(
                color: context.colors.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
    );

  // Transactions List with real data
  Widget _buildTransactionsList(BuildContext context, List<WalletTransaction> transactions) {
    if (transactions.isEmpty) {
      return _buildTransactionsEmpty(context);
    }

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) => _buildTransactionItem(context, transactions[index]),
          childCount: transactions.length > 5 ? 5 : transactions.length,
        ),
      ),
    );
  }

  // Transactions Loading
  Widget _buildTransactionsLoading(BuildContext context) => SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildTransactionSkeleton(context),
          childCount: 3,
        ),
      ),
    );

  Widget _buildTransactionSkeleton(BuildContext context) => Container(
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
              color: context.colors.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 100.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: context.colors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
        ],
      ),
    );

  // Transactions Empty
  Widget _buildTransactionsEmpty(BuildContext context) => SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 64.sp,
              color: context.colors.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            SizedBox(height: 16.h),
            Text(
              'No transactions yet',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Your transaction history will appear here',
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onSurfaceVariant.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

  // Transactions Error
  Widget _buildTransactionsError(BuildContext context, String message) => SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: context.colors.errorContainer,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Icon(Icons.error_outline, color: context.colors.error),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  'Failed to load transactions',
                  style: AppTypography.bodyMedium.copyWith(
                    color: context.colors.onErrorContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  Widget _buildBalanceAction({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) => GestureDetector(
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

  Widget _buildEarningCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String amount,
    required Color color,
  }) => Container(
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

  Widget _buildTransactionItem(BuildContext context, WalletTransaction transaction) {
    // Determine icon and color based on transaction type
    IconData icon;
    Color iconColor;
    String amountPrefix;

    if (transaction.type == 'credit' || 
        transaction.type == 'ticket_sale' || 
        transaction.type == 'cohost_earning' || 
        transaction.type == 'vendor_earning') {
      icon = Icons.arrow_downward_rounded;
      iconColor = AppColors.successGreen;
      amountPrefix = '+';
    } else {
      icon = Icons.arrow_upward_rounded;
      iconColor = AppColors.error;
      amountPrefix = '-';
    }

    // Format date
    String formattedDate;
    try {
      final DateTime date = DateTime.parse(transaction.createdAt);
      formattedDate = '${_getMonthName(date.month)} ${date.day}, ${date.year}';
    } catch (e) {
      formattedDate = transaction.createdAt;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  transaction.description,
                  style: AppTypography.bodyMedium.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  formattedDate,
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '$amountPrefix${transaction.currency} ${transaction.amount.toStringAsFixed(2)}',
            style: AppTypography.titleSmall.copyWith(
              color: iconColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    const List<String> months = <String>[
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}
