import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class ReviewWithdrawalScreen extends StatelessWidget {
  final String amount;

  const ReviewWithdrawalScreen({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final transactionFee = 10.0;
    final amountValue = double.tryParse(amount) ?? 0.0;
    final totalAmount = amountValue - transactionFee;
    
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
            _buildWithdrawButton(context),
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
            'Withdrawals',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontFamily: AppTypography.neueHaasDisplay,
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
    final theme = Theme.of(context);
    
    return Text(
      'Withdrawing To: ',
      style: theme.textTheme.titleLarge?.copyWith(
        fontFamily: AppTypography.ppNeueMontreal,
        fontSize: 20,
        fontWeight: AppTypography.regular,
        color: AppColors.onBackground,
      ),
    );
  }

  Widget _buildBankInfo(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      children: [
        Container(
          width: 54,
          height: 55,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(27),
          ),
          child: Center(
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
            children: [
              Text(
                'Republic Bank',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontFamily: AppTypography.ppNeueMontreal,
                  fontSize: 18,
                  fontWeight: AppTypography.medium,
                  color: AppColors.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'John Doe ********454',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontFamily: AppTypography.ppNeueMontreal,
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
    final theme = Theme.of(context);
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 26),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(31),
      ),
      child: Column(
        children: [
          Row(
            children: [
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
                  children: [
                    Text(
                      'Withdrawal Amount',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontFamily: AppTypography.ppNeueMontreal,
                        fontSize: 22,
                        fontWeight: AppTypography.medium,
                        color: AppColors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'John Doe ********454',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontFamily: AppTypography.ppNeueMontreal,
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
            children: [
              Text(
                amount,
                style: theme.textTheme.displayLarge?.copyWith(
                  fontFamily: AppTypography.ppNeueMontreal,
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
                  'TTD\$',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontFamily: AppTypography.ppNeueMontreal,
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
    final theme = Theme.of(context);
    
    return Column(
      children: [
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
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontFamily: AppTypography.ppNeueMontreal,
            fontSize: 18,
            fontWeight: AppTypography.regular,
            color: AppColors.onSurface,
            height: 1.092,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontFamily: AppTypography.ppNeueMontreal,
            fontSize: 18,
            fontWeight: AppTypography.regular,
            color: AppColors.onSurface,
            height: 1.092,
          ),
        ),
      ],
    );
  }

  Widget _buildWithdrawButton(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 20),
      child: GestureDetector(
        onTap: () {
          context.push('/wallet/confirmation', extra: amount);
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
              'Withdaw',
              style: theme.textTheme.labelLarge?.copyWith(
                fontFamily: AppTypography.neueHaasDisplay,
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
    final paint = Paint()
      ..color = AppColors.onSurface
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 5.0;
    const dashSpace = 5.0;
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
