import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/withdraw_request.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/wallet/presentation/providers/wallet_providers.dart';
import 'package:fajimobileapp/features/wallet/presentation/viewmodels/withdraw_viewmodel.dart';

class ReviewWithdrawalScreen extends HookConsumerWidget {

  const ReviewWithdrawalScreen({
    super.key,
    required this.amount,
  });
  final String amount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final WithdrawViewModel withdrawViewModel = ref.watch(withdrawViewModelProvider.notifier);
    
    const double transactionFee = 10.0;
    final double amountValue = double.tryParse(amount) ?? 0.0;
    final double totalAmount = amountValue - transactionFee;

    // Listen to withdrawal state changes
    ref.listen(withdrawViewModelProvider, (WithdrawState? previous, WithdrawState next) {
      next.when(
        initial: () {},
        loading: () {},
        success: (WithdrawResponse response) {
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Withdrawal successful!'),
              backgroundColor: AppColors.successGreen,
            ),
          );
          // Navigate back to wallet
          context.go('/wallet');
        },
        error: (Failure failure) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.message),
              backgroundColor: AppColors.error,
            ),
          );
        },
      );
    });

    void onWithdraw() {
      // TODO: Get actual bank account details from user's saved accounts
      // For now, using placeholder values
      withdrawViewModel.withdrawFunds(
        amount: amountValue,
        accountNumber: '********454',
        bankCode: 'REPUBLIC_BANK',
        accountName: 'John Doe',
      );
    }
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 32),
                    _buildWithdrawingToSection(context),
                    const SizedBox(height: 24),
                    _buildBankInfo(context),
                    const SizedBox(height: 20),
                    _buildWithdrawalAmountCard(context),
                    const SizedBox(height: 32),
                    _buildTransactionDetails(
                      context,
                      transactionFee,
                      totalAmount,
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            _buildWithdrawButton(context, ref, onWithdraw),
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
            'Withdrawals',
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

  Widget _buildWithdrawingToSection(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return Text(
      'Withdrawing To: ',
      style: theme.textTheme.titleLarge?.copyWith(
        fontFamily: AppTypography.modicaPro,
        fontSize: 20,
        fontWeight: AppTypography.regular,
        color: AppColors.onBackground,
      ),
    );
  }

  Widget _buildBankInfo(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return Row(
      children: <Widget>[
        Container(
          width: 54,
          height: 55,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(27),
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
                'Republic Bank',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 18,
                  fontWeight: AppTypography.medium,
                  color: AppColors.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'John Doe ********454',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 15,
                  fontWeight: AppTypography.regular,
                  color: AppColors.onBackground,
                  height: 1.092,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWithdrawalAmountCard(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 26),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(31),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 54,
                height: 55,
                decoration: BoxDecoration(
                  color: const Color(0xFF1B1B1B),
                  borderRadius: BorderRadius.circular(27),
                ),
                child: const Icon(
                  Icons.account_balance_wallet,
                  color: AppColors.onSurface,
                  size: 24,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Withdrawal Amount',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 22,
                        fontWeight: AppTypography.medium,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'John Doe ********454',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 15,
                        fontWeight: AppTypography.regular,
                        color: AppColors.onSurface,
                        height: 1.092,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 59),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                amount,
                style: theme.textTheme.displayLarge?.copyWith(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 50,
                  fontWeight: AppTypography.medium,
                  color: AppColors.eventCardYellow,
                  height: 0.75,
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  r'TTD$',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 18,
                    fontWeight: AppTypography.regular,
                    color: AppColors.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionDetails(
    BuildContext context,
    double fee,
    double total,
  ) {
    final ThemeData theme = Theme.of(context);
    
    return Column(
      children: <Widget>[
        _buildDetailRow(
          context,
          'Transection fee',
          'USD\$ ${fee.toStringAsFixed(2)}',
          theme,
        ),
        const SizedBox(height: 9),
        CustomPaint(
          size: const Size(double.infinity, 1),
          painter: DashedLinePainter(),
        ),
        const SizedBox(height: 9),
        _buildDetailRow(
          context,
          'Amount You Get',
          'USD\$ ${total.toStringAsFixed(2)}',
          theme,
        ),
      ],
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    String label,
    String value,
    ThemeData theme,
  ) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontFamily: AppTypography.modicaPro,
            fontSize: 18,
            fontWeight: AppTypography.regular,
            color: AppColors.onSurface,
            height: 1.092,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontFamily: AppTypography.modicaPro,
            fontSize: 18,
            fontWeight: AppTypography.regular,
            color: AppColors.onSurface,
            height: 1.092,
          ),
        ),
      ],
    );

  Widget _buildWithdrawButton(BuildContext context, WidgetRef ref, VoidCallback onWithdraw) {
    final ThemeData theme = Theme.of(context);
    final WithdrawState withdrawState = ref.watch(withdrawViewModelProvider);
    final bool isLoading = withdrawState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 20),
      child: GestureDetector(
        onTap: isLoading ? null : onWithdraw,
        child: Container(
          width: double.infinity,
          height: 69,
          decoration: BoxDecoration(
            color: isLoading 
                ? AppColors.primary.withValues(alpha: 0.5)
                : AppColors.primary,
            borderRadius: BorderRadius.circular(34.5),
          ),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: AppColors.onPrimary,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    'Withdraw',
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

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.onSurface
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5.0;
    const double dashSpace = 5.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
