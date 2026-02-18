import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class BalanceDetailScreen extends StatelessWidget {
  const BalanceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildAppBar(context),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  // Simulate refresh
                  await Future.delayed(const Duration(seconds: 1));
                  // TODO: Fetch latest balance from API
                },
                color: AppColors.primary,
                backgroundColor: AppColors.surface,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 32),
                    _buildBalanceCard(context),
                    const SizedBox(height: 27),
                    _buildWithdrawSection(context),
                    const SizedBox(height: 24),
                    _buildBankSelection(context),
                    const SizedBox(height: 24),
                    _buildAddNewBankButton(context),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
                ),
            ),
            _buildReviewButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
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
            'Balance Detail',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontFamily: AppTypography.modicaPro,
              fontSize: 25,
              fontWeight: AppTypography.medium,
              color: AppColors.onSurface,
            ),
          ),
          const Spacer(),
          Stack(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: AppColors.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: AppColors.onSurface,
                  size: 19,
                ),
              ),
              Positioned(
                right: 3,
                top: 2,
                child: Container(
                  width: 11,
                  height: 11,
                  decoration: const BoxDecoration(
                    color: AppColors.liveRed,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Current Balance',
            style: theme.textTheme.titleLarge?.copyWith(
              fontFamily: AppTypography.modicaPro,
              fontSize: 22,
              fontWeight: AppTypography.regular,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '230.00',
                style: theme.textTheme.displayLarge?.copyWith(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 30,
                  fontWeight: AppTypography.medium,
                  color: AppColors.onBackground,
                  height: 1.2,
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  r'USD$',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 18,
                    fontWeight: AppTypography.regular,
                    color: AppColors.eventCardYellow,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWithdrawSection(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return Text(
      'Withdraw to Bank.',
      style: theme.textTheme.headlineSmall?.copyWith(
        fontFamily: AppTypography.modicaPro,
        fontSize: 25,
        fontWeight: AppTypography.medium,
        color: AppColors.onSurface,
        height: 0.948,
      ),
    );
  }

  Widget _buildBankSelection(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Select your Bank',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontFamily: AppTypography.modicaPro,
            fontSize: 17,
            fontWeight: AppTypography.regular,
            color: AppColors.onSurface,
          ),
        ),
        const SizedBox(height: 12),
        _buildBankOption(
          context,
          'Republic Bank',
          'John Doe ********454',
          isSelected: true,
        ),
        const SizedBox(height: 8),
        _buildBankOption(
          context,
          'PayPal',
          'John Doe ********454',
          isSelected: false,
        ),
      ],
    );
  }

  Widget _buildBankOption(
    BuildContext context,
    String bankName,
    String accountInfo, {
    required bool isSelected,
  }) {
    final ThemeData theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(54),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 54,
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xFF1B1B1B),
              borderRadius: BorderRadius.circular(46),
            ),
            child: const Center(
              child: Icon(
                Icons.account_balance,
                color: AppColors.onSurface,
                size: 26,
              ),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  bankName,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 18,
                    fontWeight: AppTypography.medium,
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  accountInfo,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 15,
                    fontWeight: AppTypography.regular,
                    color: AppColors.textSecondary,
                    height: 1.092,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 23,
            height: 23,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primary : const Color(0xFF707070),
              ),
              color: isSelected
                  ? AppColors.primary.withValues(alpha: 0.1)
                  : Colors.transparent,
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 13,
                      height: 13,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildAddNewBankButton(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return GestureDetector(
      onTap: () {
        // Navigate to add bank screen
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(39.5),
        ),
        child: Center(
          child: Text(
            'Add New Bank',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontFamily: AppTypography.modicaPro,
              fontSize: 16,
              fontWeight: AppTypography.regular,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewButton(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(27, 0, 27, 51),
      child: GestureDetector(
        onTap: () {
          context.push('/wallet/enter-amount');
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
              'Review',
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
