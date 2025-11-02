import 'package:flutter/material.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'dart:ui';

class WithdrawalConfirmationScreen extends StatelessWidget {
  final String amount;

  const WithdrawalConfirmationScreen({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Stack(
        children: [
          // Blurred background
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
              child: Container(
                color: const Color(0x4A0F0E0E),
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                _buildSuccessCard(context),
                const Spacer(),
                _buildDoneButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessCard(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 43),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(43),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSuccessIcon(),
          const SizedBox(height: 11),
          Text(
            'Withdraw Successful',
            style: theme.textTheme.headlineLarge?.copyWith(
              fontFamily: AppTypography.neueHaasDisplay,
              fontSize: 28,
              fontWeight: AppTypography.medium,
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'You have successfully withdraw USD\$ $amount\nto your Republic bank account. *** *** 454',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: AppTypography.ppNeueMontreal,
                fontSize: 15,
                fontWeight: AppTypography.regular,
                color: AppColors.textSecondary,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Container(
      width: 72,
      height: 72,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check,
        color: AppColors.primary,
        size: 40,
      ),
    );
  }

  Widget _buildDoneButton(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 101),
      child: GestureDetector(
        onTap: () {
          // Navigate back to wallet home or main screen
          Navigator.of(context).popUntil((route) => route.isFirst);
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
