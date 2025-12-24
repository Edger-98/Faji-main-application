import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Hosting', 'Co-hosting', 'Vendor'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    _buildSubtitle(context),
                    SizedBox(height: 20.h),
                    _buildFilterChips(context),
                    SizedBox(height: 20.h),
                    _buildTransactionList(context),
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

  Widget _buildFilterChips(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: ListView.separated(
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
    );
  }

  Widget _buildTransactionList(BuildContext context) {
    // Real transaction data with different types
    final transactions = [
      TransactionItem(
        name: 'Summer Music Festival',
        description: 'Ticket sales earnings',
        date: 'Dec 22, 2025',
        time: '08:30 PM',
        amount: '\$450.00',
        type: 'Hosting',
        icon: Icons.event_rounded,
        color: AppColors.eventCardBlue,
      ),
      TransactionItem(
        name: 'Tech Conference 2025',
        description: 'Co-host revenue share',
        date: 'Dec 20, 2025',
        time: '02:15 PM',
        amount: '\$225.00',
        type: 'Co-hosting',
        icon: Icons.people_rounded,
        color: AppColors.primary,
      ),
      TransactionItem(
        name: 'Elite Photography Studio',
        description: 'Wedding photography service',
        date: 'Dec 18, 2025',
        time: '10:00 AM',
        amount: '\$500.00',
        type: 'Vendor',
        icon: Icons.store_rounded,
        color: AppColors.eventCardYellow,
      ),
      TransactionItem(
        name: 'New Year Gala',
        description: 'VIP ticket sales',
        date: 'Dec 15, 2025',
        time: '06:45 PM',
        amount: '\$1,200.00',
        type: 'Hosting',
        icon: Icons.event_rounded,
        color: AppColors.eventCardBlue,
      ),
      TransactionItem(
        name: 'Gourmet Catering Co.',
        description: 'Corporate event catering',
        date: 'Dec 12, 2025',
        time: '11:30 AM',
        amount: '\$850.00',
        type: 'Vendor',
        icon: Icons.store_rounded,
        color: AppColors.eventCardYellow,
      ),
      TransactionItem(
        name: 'Art Exhibition Opening',
        description: 'Co-host revenue share',
        date: 'Dec 10, 2025',
        time: '04:20 PM',
        amount: '\$175.00',
        type: 'Co-hosting',
        icon: Icons.people_rounded,
        color: AppColors.primary,
      ),
      TransactionItem(
        name: 'Charity Fundraiser',
        description: 'Ticket sales earnings',
        date: 'Dec 8, 2025',
        time: '07:00 PM',
        amount: '\$680.00',
        type: 'Hosting',
        icon: Icons.event_rounded,
        color: AppColors.eventCardBlue,
      ),
    ];

    // Filter transactions based on selected filter
    final filteredTransactions = _selectedFilter == 'All'
        ? transactions
        : transactions.where((t) => t.type == _selectedFilter).toList();

    if (filteredTransactions.isEmpty) {
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

    return Column(
      children: filteredTransactions
          .map((transaction) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _buildTransactionCard(context, transaction),
              ))
          .toList(),
    );
  }

  Widget _buildTransactionCard(
    BuildContext context,
    TransactionItem transaction,
  ) {
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
              color: transaction.color.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              transaction.icon,
              color: transaction.color,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.name,
                  style: AppTypography.bodyMedium.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  transaction.description,
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
                        color: transaction.color.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        transaction.type,
                        style: AppTypography.bodySmall.copyWith(
                          color: transaction.color,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      transaction.date,
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
            '+${transaction.amount}',
            style: AppTypography.titleSmall.copyWith(
              color: AppColors.successGreen,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionItem {
  final String name;
  final String description;
  final String date;
  final String time;
  final String amount;
  final String type;
  final IconData icon;
  final Color color;

  TransactionItem({
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.amount,
    required this.type,
    required this.icon,
    required this.color,
  });
}
