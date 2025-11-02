import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class EnterWithdrawalAmountScreen extends StatefulWidget {
  const EnterWithdrawalAmountScreen({super.key});

  @override
  State<EnterWithdrawalAmountScreen> createState() =>
      _EnterWithdrawalAmountScreenState();
}

class _EnterWithdrawalAmountScreenState
    extends State<EnterWithdrawalAmountScreen> {
  String _amount = '';

  void _onNumberPressed(String number) {
    setState(() {
      if (_amount.length < 10) {
        _amount += number;
      }
    });
  }

  void _onBackspacePressed() {
    setState(() {
      if (_amount.isNotEmpty) {
        _amount = _amount.substring(0, _amount.length - 1);
      }
    });
  }

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
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  _buildTitle(context),
                  const SizedBox(height: 97),
                  _buildAmountDisplay(context),
                  const Spacer(),
                  _buildNumericKeypad(context),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            _buildReviewButton(context),
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

  Widget _buildTitle(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Enter Withdrawal amount',
          style: theme.textTheme.titleLarge?.copyWith(
            fontFamily: AppTypography.ppNeueMontreal,
            fontSize: 20,
            fontWeight: AppTypography.regular,
            color: AppColors.onBackground,
          ),
        ),
      ),
    );
  }

  Widget _buildAmountDisplay(BuildContext context) {
    final theme = Theme.of(context);
    final displayAmount = _amount.isEmpty ? '0.00' : _amount;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          displayAmount,
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
            'USD\$',
            style: theme.textTheme.titleMedium?.copyWith(
              fontFamily: AppTypography.ppNeueMontreal,
              fontSize: 18,
              fontWeight: AppTypography.regular,
              color: AppColors.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNumericKeypad(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _buildKeypadRow(['1', '2', '3'], theme),
          const SizedBox(height: 4),
          _buildKeypadRow(['4', '5', '6'], theme),
          const SizedBox(height: 4),
          _buildKeypadRow(['7', '8', '9'], theme),
          const SizedBox(height: 4),
          _buildKeypadRow(['', '0', 'backspace'], theme),
        ],
      ),
    );
  }

  Widget _buildKeypadRow(List<String> numbers, ThemeData theme) {
    return Row(
      children: numbers.map((number) {
        if (number.isEmpty) {
          return const Expanded(child: SizedBox());
        }
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: _buildKeypadButton(number, theme),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildKeypadButton(String value, ThemeData theme) {
    final isBackspace = value == 'backspace';
    
    return GestureDetector(
      onTap: () {
        if (isBackspace) {
          _onBackspacePressed();
        } else {
          _onNumberPressed(value);
        }
      },
      child: Container(
        height: isBackspace ? 72 : (value == '0' ? 72 : 72),
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(21),
        ),
        child: Center(
          child: isBackspace
              ? const Icon(
                  Icons.backspace_outlined,
                  color: AppColors.onSurface,
                  size: 20,
                )
              : Text(
                  value,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontFamily: AppTypography.ppNeueMontreal,
                    fontSize: 25,
                    fontWeight: AppTypography.regular,
                    color: AppColors.onSurface,
                    height: 1,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildReviewButton(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
      child: GestureDetector(
        onTap: _amount.isNotEmpty
            ? () {
                context.push('/wallet/review', extra: _amount);
              }
            : null,
        child: Container(
          width: double.infinity,
          height: 69,
          decoration: BoxDecoration(
            color: _amount.isNotEmpty
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(34.5),
          ),
          child: Center(
            child: Text(
              'Review',
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
