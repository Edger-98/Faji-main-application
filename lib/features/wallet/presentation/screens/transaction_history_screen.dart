import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import '../providers/wallet_providers.dart';
import '../../domain/entities/wallet_transaction.dart';

class TransactionHistoryScreen extends HookConsumerWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletViewModel = ref.watch(walletViewModelProvider.notifier);
    final walletState = ref.watch(walletViewModelProvider);
    final selectedFilter = useState('All');
    final filters = ['All', 'Hosting', 'Co-hosting', 'Vendor'];
    final scrollController = useScrollController();

    // Load transactions on mount
    useEffect(() {
      Future.microtask(() => walletViewModel.getWalletTransactions());
      return null;
    }, []);

    // Pagination listener
    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200) {
          walletViewModel.loadMoreTransactions();
        }
      }
      
      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

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
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    _buildSubtitle(context),
                    SizedBox(height: 20.h),
                    _buildFilterChips(context, filters, selectedFilter.value, onFilterChanged),
                    SizedBox(height: 20.h),
                    walletState.transactionsState.when(
                      initial: () => _buildTransactionsEmpty(context),
                      loading: () => _buildTransactionsLoading(context),
                      success: (transactionsResponse) => _buildTransactionList(
                        context,
                        transactionsResponse.transactions,
                      ),
                      error: (failure) => _buildTransactionsError(context, failure.message),
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.pop(context);
            },
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: context.colors.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: context.colors.onSurface,
                size: 16.sp,
              ),
            ),
          ),
          const Spacer(),
          Text(
            'Transaction History',
            style: AppTypography.headlineMedium.copyWith(
              color: context.colors.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          SizedBox(width: 50.w),
        ],
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      'View all your earnings from hosting, co-hosting, and vendor services.',
      style: AppTypography.bodyMedium.copyWith(
        color: context.colors.onSurfaceVariant,
      ),
    );
  }

  Widget _buildFilterChips(
    BuildContext context,
    List<String> filters,
    String selectedFilter,
    Function(String) onFilterChanged,
  ) {
    return SizedBox(
      height: 48.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = selectedFilter == filter;
          
          return FilterChip(
            label: Text(filter),
            selected: isSelected,
            onSelected: (selected) => onFilterChanged(filter),
            backgroundColor: context.colors.surfaceContainerHighest,
            selectedColor: context.colors.primary,
            labelStyle: AppTypography.labelMedium.copyWith(
              color: isSelected ? context.colors.onPrimary : context.colors.onSurface,
            ),
          );
        },
      ),
    );
  }

  Widget _buildTransactionList(BuildContext context, List<WalletTransaction> transactions) {
    if (transactions.isEmpty) {
      return _buildTransactionsEmpty(context);
    }

    return Column(
      children: transactions
          .map((transaction) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _buildTransactionCard(context, transaction),
              ))
          .toList(),
    );
  }

  Widget _buildTransactionsLoading(BuildContext context) {
    return Column(
      children: List.generate(
        5,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: _buildTransactionSkeleton(context),
        ),
      ),
    );
  }

  Widget _buildTransactionSkeleton(BuildContext context) {
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
  }

  Widget _buildTransactionsEmpty(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 60.h),
        child: Column(
          children: [
            Icon(
              Icons.receipt_long_rounded,
              size: 64.sp,
              color: context.colors.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            SizedBox(height: 16.h),
            Text(
              'No transactions found',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Transactions will appear here once you start earning',
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsError(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 60.h),
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: context.colors.error,
            ),
            SizedBox(height: 16.h),
            Text(
              'Failed to load transactions',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              message,
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionCard(
    BuildContext context,
    WalletTransaction transaction,
  ) {
    // Determine icon and color based on transaction type
    IconData icon;
    Color color;
    String typeLabel;
    String amountPrefix;

    if (transaction.type == 'ticket_sale') {
      icon = Icons.event_rounded;
      color = AppColors.eventCardBlue;
      typeLabel = 'Hosting';
      amountPrefix = '+';
    } else if (transaction.type == 'cohost_earning') {
      icon = Icons.people_rounded;
      color = AppColors.primary;
      typeLabel = 'Co-hosting';
      amountPrefix = '+';
    } else if (transaction.type == 'vendor_earning') {
      icon = Icons.store_rounded;
      color = AppColors.eventCardYellow;
      typeLabel = 'Vendor';
      amountPrefix = '+';
    } else if (transaction.type == 'withdrawal') {
      icon = Icons.arrow_upward_rounded;
      color = AppColors.error;
      typeLabel = 'Withdrawal';
      amountPrefix = '-';
    } else {
      icon = Icons.receipt_long_outlined;
      color = context.colors.primary;
      typeLabel = transaction.type;
      amountPrefix = '+';
    }

    // Format date
    String formattedDate;
    try {
      final date = DateTime.parse(transaction.createdAt);
      formattedDate = '${_getMonthName(date.month)} ${date.day}, ${date.year}';
    } catch (e) {
      formattedDate = transaction.createdAt;
    }

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
            child: Icon(
              icon,
              color: color,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  'Ref: ${transaction.reference}',
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        typeLabel,
                        style: AppTypography.bodySmall.copyWith(
                          color: color,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      formattedDate,
                      style: AppTypography.bodySmall.copyWith(
                        color: context.colors.onSurfaceVariant,
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            '$amountPrefix${transaction.currency} ${transaction.amount.toStringAsFixed(2)}',
            style: AppTypography.titleSmall.copyWith(
              color: amountPrefix == '+' ? AppColors.successGreen : AppColors.error,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}
