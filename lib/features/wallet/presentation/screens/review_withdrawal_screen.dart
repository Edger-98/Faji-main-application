import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/stripe_connect_status.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/withdraw_request.dart';
import 'package:fajimobileapp/features/wallet/presentation/providers/stripe_connect_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
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
    final double amountValue = double.tryParse(amount) ?? 0.0;
    final WithdrawViewModel withdrawViewModel =
        ref.watch(withdrawViewModelProvider.notifier);
    final AsyncValue<StripeConnectStatus?> stripeStatusAsync =
        ref.watch(stripeConnectStatusProvider);

    // Navigate to bank setup if Stripe is not ready
    useEffect(() {
      Future.microtask(() {
        final StripeConnectStatus? status = stripeStatusAsync.value;
        if (status != null && !status.isReady) {
          context.pushReplacement(RouteManager.walletBankConnect);
        }
      });
      return null;
    }, [stripeStatusAsync]);

    // Listen to withdrawal state changes
    ref.listen(withdrawViewModelProvider,
        (WithdrawState? previous, WithdrawState next) {
      next.when(
        initial: () {},
        loading: () {},
        success: (WithdrawResponse response) {
          context.pushReplacement(
            RouteManager.walletConfirmation,
            extra: <String, String>{
              'amount': amountValue.toStringAsFixed(2),
              'estimatedArrival': response.estimatedArrival,
              'currency': response.currency,
            },
          );
        },
        error: (Failure failure) {
          final String msg = failure.message.contains('NO_STRIPE_ACCOUNT') ||
                  failure.message.contains('STRIPE_ONBOARDING_INCOMPLETE')
              ? 'Your bank account is not fully set up. Please complete Stripe onboarding.'
              : failure.message;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(msg),
              backgroundColor: AppColors.error,
              action: failure.message.contains('NO_STRIPE_ACCOUNT') ||
                      failure.message.contains('STRIPE_ONBOARDING_INCOMPLETE')
                  ? SnackBarAction(
                      label: 'Set up',
                      textColor: Colors.white,
                      onPressed: () =>
                          context.push(RouteManager.walletBankConnect),
                    )
                  : null,
            ),
          );
        },
      );
    });

    final WithdrawState withdrawState = ref.watch(withdrawViewModelProvider);
    final bool isLoading = withdrawState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    final StripeConnectStatus? stripeStatus = stripeStatusAsync.value;
    final bool stripeReady = stripeStatus?.isReady ?? false;

    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 44.w,
                      height: 44.h,
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
                  SizedBox(width: 16.w),
                  Text(
                    'Review Withdrawal',
                    style: AppTypography.headlineMedium.copyWith(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),

                    // Amount card
                    Container(
                      width: double.infinity,
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
                            'Withdrawal Amount',
                            style: AppTypography.bodyMedium.copyWith(
                              color: context.colors.onPrimary
                                  .withValues(alpha: 0.85),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            '\$${amountValue.toStringAsFixed(2)}',
                            style: AppTypography.displayLarge.copyWith(
                              color: context.colors.onPrimary,
                              fontSize: 44.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'USD',
                            style: AppTypography.bodySmall.copyWith(
                              color: context.colors.onPrimary
                                  .withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Destination
                    Text(
                      'Destination',
                      style: AppTypography.titleMedium.copyWith(
                        color: context.colors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    stripeStatusAsync.when(
                      loading: () => _buildDestinationSkeleton(context),
                      error: (_, __) => _buildNoBank(context),
                      data: (StripeConnectStatus? status) => status?.isReady == true
                          ? _buildBankConnected(context, status!)
                          : _buildNoBank(context),
                    ),

                    SizedBox(height: 24.h),

                    // Summary
                    _buildSummaryRow(context, 'You withdraw', '\$${amountValue.toStringAsFixed(2)}'),
                    SizedBox(height: 8.h),
                    Divider(color: context.colors.surfaceContainerHighest),
                    SizedBox(height: 8.h),
                    _buildSummaryRow(
                      context,
                      'Estimated arrival',
                      '2 business days',
                      valueColor: AppColors.successGreen,
                    ),

                    SizedBox(height: 16.h),

                    Container(
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        color: context.colors.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline,
                              size: 16.sp,
                              color: context.colors.onSurfaceVariant),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              'Stripe auto-pays your linked bank every 2 days. '
                              'This withdrawal moves funds from your Faji wallet to your Stripe account immediately.',
                              style: AppTypography.bodySmall.copyWith(
                                color: context.colors.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),

            // Withdraw button
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
              child: GestureDetector(
                onTap: (!isLoading && stripeReady)
                    ? () => withdrawViewModel.withdrawFunds(amount: amountValue)
                    : (!stripeReady
                        ? () => context.push(RouteManager.walletBankConnect)
                        : null),
                child: Container(
                  width: double.infinity,
                  height: 58.h,
                  decoration: BoxDecoration(
                    color: isLoading
                        ? AppColors.primary.withValues(alpha: 0.5)
                        : AppColors.primary,
                    borderRadius: BorderRadius.circular(29.h),
                  ),
                  child: Center(
                    child: isLoading
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: context.colors.onPrimary,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            stripeReady
                                ? 'Confirm Withdrawal'
                                : 'Connect Bank Account First',
                            style: AppTypography.titleSmall.copyWith(
                              color: context.colors.onPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankConnected(BuildContext context, StripeConnectStatus status) =>
      Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.successGreen.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16.r),
          border:
              Border.all(color: AppColors.successGreen.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: AppColors.successGreen.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.account_balance_rounded,
                  color: AppColors.successGreen, size: 22.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stripe Connected Account',
                    style: AppTypography.bodyMedium.copyWith(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    status.accountId != null
                        ? '${status.accountId!.substring(0, 12)}...'
                        : 'Bank account linked via Stripe',
                    style: AppTypography.bodySmall.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.verified_rounded,
                color: AppColors.successGreen, size: 20.sp),
          ],
        ),
      );

  Widget _buildNoBank(BuildContext context) => Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: context.colors.errorContainer.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
              color: context.colors.error.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Icon(Icons.warning_amber_rounded,
                color: context.colors.error, size: 22.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                'No bank account connected. Tap below to set up Stripe.',
                style: AppTypography.bodySmall.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildDestinationSkeleton(BuildContext context) => Container(
        height: 76.h,
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
        ),
      );

  Widget _buildSummaryRow(
    BuildContext context,
    String label,
    String value, {
    Color? valueColor,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          Text(
            value,
            style: AppTypography.bodyMedium.copyWith(
              color: valueColor ?? context.colors.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
}
