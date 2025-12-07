import 'package:flutter/material.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _buildSubtitle(context),
                    const SizedBox(height: 17),
                    _buildTransactionList(context),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            _buildDoneButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.onSurface,
                size: 16,
              ),
            ),
          ),
          const Spacer(),
          Text(
            'History',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontFamily: AppTypography.modicaPro,
              fontSize: 25,
              fontWeight: AppTypography.medium,
              color: AppColors.onSurface,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 50),
        ],
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    final theme = Theme.of(context);
    
    return Text(
      'Peoples who have bought tickets for your party.',
      style: theme.textTheme.bodyMedium?.copyWith(
        fontFamily: AppTypography.modicaPro,
        fontSize: 14,
        fontWeight: AppTypography.thin,
        color: AppColors.onBackground,
      ),
    );
  }

  Widget _buildTransactionList(BuildContext context) {
    final transactions = [
      TransactionItem(
        name: 'Winston Block',
        description: 'Winston buy 2 ticket for your GENfest event',
        date: 'Wed 22/03',
        time: '08:30 PM',
        amount: '\$80.00',
        avatarUrl: '',
      ),
      TransactionItem(
        name: 'Renee Ruecker',
        description: 'Winston buy 1 ticket for your GENfest event',
        date: 'Wed 22/03',
        time: '08:30 PM',
        amount: '\$40.00',
        avatarUrl: '',
      ),
      TransactionItem(
        name: 'Douglas Rice',
        description: 'Winston buy 3 ticket for your GENfest event',
        date: 'Wed 22/03',
        time: '08:30 PM',
        amount: '\$120.00',
        avatarUrl: '',
      ),
      TransactionItem(
        name: 'Wesley Watsica',
        description: 'Winston buy 1 ticket for your GENfest event',
        date: 'Wed 22/03',
        time: '08:30 PM',
        amount: '\$40.00',
        avatarUrl: '',
      ),
      TransactionItem(
        name: 'Mona Schmidt II',
        description: 'Winston buy 2 ticket for your GENfest event',
        date: 'Wed 22/03',
        time: '08:30 PM',
        amount: '\$80.00',
        avatarUrl: '',
      ),
    ];

    return Column(
      children: transactions
          .map((transaction) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildTransactionCard(context, transaction),
              ))
          .toList(),
    );
  }

  Widget _buildTransactionCard(
    BuildContext context,
    TransactionItem transaction,
  ) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        children: [
          Container(
            width: 49,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFFC4C4C4),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 4.62),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.name,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 16,
                    fontWeight: AppTypography.regular,
                    color: AppColors.onSurface,
                    letterSpacing: 0.02 * 16,
                  ),
                ),
                const SizedBox(height: -3),
                Text(
                  transaction.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 13,
                    fontWeight: AppTypography.regular,
                    color: AppColors.textSecondary,
                    letterSpacing: 0.02 * 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      transaction.date,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 12,
                        fontWeight: AppTypography.regular,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 3,
                      height: 3,
                      decoration: const BoxDecoration(
                        color: AppColors.dotSeparator,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      transaction.time,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 12,
                        fontWeight: AppTypography.regular,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 3,
                      height: 3,
                      decoration: const BoxDecoration(
                        color: AppColors.dotSeparator,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      transaction.amount,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 12,
                        fontWeight: AppTypography.regular,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoneButton(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(27, 0, 27, 71),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          height: 69,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(34.5),
          ),
          child: Center(
            child: Text(
              'Done',
              style: theme.textTheme.labelLarge?.copyWith(
                fontFamily: AppTypography.modicaPro,
                fontSize: 18,
                fontWeight: AppTypography.semiBold,
                color: AppColors.onPrimary,
              ),
            ),
          ),
        ),
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
  final String avatarUrl;

  TransactionItem({
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.amount,
    required this.avatarUrl,
  });
}
