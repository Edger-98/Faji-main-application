import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/wallet/presentation/providers/wallet_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FundWalletScreen extends ConsumerStatefulWidget {
  const FundWalletScreen({super.key});

  @override
  ConsumerState<FundWalletScreen> createState() => _FundWalletScreenState();
}

class _FundWalletScreenState extends ConsumerState<FundWalletScreen> {
  String _amount = '';

  void _onNumberPressed(String number) {
    setState(() {
      if (_amount.length < 10) _amount += number;
    });
  }

  void _onBackspacePressed() {
    setState(() {
      if (_amount.isNotEmpty) _amount = _amount.substring(0, _amount.length - 1);
    });
  }

  double? get _parsedAmount => double.tryParse(_amount);

  Future<void> _fundWallet() async {
    final amount = _parsedAmount;
    if (amount == null || amount <= 0) return;

    final paid = await ref.read(topupViewModelProvider.notifier).fundWallet(amount: amount);

    if (!mounted) return;

    if (paid) {
      // Reset topup state and refresh wallet balance so it reflects immediately
      ref.read(topupViewModelProvider.notifier).reset();
      ref.read(walletViewModelProvider.notifier).refreshAll();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Wallet funded with \$$amount successfully'),
          backgroundColor: AppColors.successGreen,
        ),
      );
      Navigator.pop(context);
    }
    // error is shown via state listener below
  }

  @override
  Widget build(BuildContext context) {
    final topupState = ref.watch(topupViewModelProvider);

    // Show error snackbar
    ref.listen(topupViewModelProvider, (previous, next) {
      next.whenOrNull(
        error: (failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.message),
              backgroundColor: AppColors.error,
            ),
          );
        },
      );
    });

    final isLoading = topupState.isLoading;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter amount to fund',
                        style: AppTypography.titleMedium.copyWith(
                          color: AppColors.onSurface,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 48.h),
                  _buildAmountDisplay(context),
                  const Spacer(),
                  _buildNumericKeypad(context),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            _buildFundButton(context, isLoading),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) => Padding(
        padding: EdgeInsets.all(24.w),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 50.w,
                height: 50.h,
                decoration: const BoxDecoration(
                  color: AppColors.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_new, color: AppColors.onSurface, size: 16),
              ),
            ),
            const Spacer(),
            Text(
              'Fund Wallet',
              style: AppTypography.titleLarge.copyWith(color: AppColors.onSurface),
            ),
            const Spacer(),
            SizedBox(width: 50.w),
          ],
        ),
      );

  Widget _buildAmountDisplay(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            _amount.isEmpty ? '0' : _amount,
            style: AppTypography.displayLarge.copyWith(
              fontSize: 50.sp,
              color: AppColors.eventCardYellow,
              height: 0.75,
            ),
          ),
          SizedBox(width: 10.w),
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              'USD',
              style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface),
            ),
          ),
        ],
      );

  Widget _buildNumericKeypad(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            _buildKeypadRow(['1', '2', '3']),
            SizedBox(height: 4.h),
            _buildKeypadRow(['4', '5', '6']),
            SizedBox(height: 4.h),
            _buildKeypadRow(['7', '8', '9']),
            SizedBox(height: 4.h),
            _buildKeypadRow(['', '0', 'backspace']),
          ],
        ),
      );

  Widget _buildKeypadRow(List<String> keys) => Row(
        children: keys.map((key) {
          if (key.isEmpty) return const Expanded(child: SizedBox());
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child: _buildKeypadButton(key),
            ),
          );
        }).toList(),
      );

  Widget _buildKeypadButton(String value) {
    final isBackspace = value == 'backspace';
    return GestureDetector(
      onTap: () => isBackspace ? _onBackspacePressed() : _onNumberPressed(value),
      child: Container(
        height: 72.h,
        decoration: BoxDecoration(
          color: const Color(0xFF111111),
          borderRadius: BorderRadius.circular(21.r),
        ),
        child: Center(
          child: isBackspace
              ? const Icon(Icons.backspace_outlined, color: AppColors.onSurface, size: 20)
              : Text(
                  value,
                  style: AppTypography.headlineMedium.copyWith(
                    color: AppColors.onSurface,
                    height: 1,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildFundButton(BuildContext context, bool isLoading) => Padding(
        padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 20.h),
        child: GestureDetector(
          onTap: (!isLoading && _parsedAmount != null && _parsedAmount! > 0) ? _fundWallet : null,
          child: Container(
            width: double.infinity,
            height: 69.h,
            decoration: BoxDecoration(
              color: (_parsedAmount != null && _parsedAmount! > 0)
                  ? AppColors.primary
                  : AppColors.primary.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(34.5.r),
            ),
            child: Center(
              child: isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                    )
                  : Text(
                      'Fund Wallet',
                      style: AppTypography.labelLarge.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.onPrimary,
                      ),
                    ),
            ),
          ),
        ),
      );
}
