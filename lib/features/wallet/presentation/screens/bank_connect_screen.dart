import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/wallet/data/services/stripe_connect_service.dart';
import 'package:fajimobileapp/features/wallet/domain/entities/stripe_connect_status.dart';
import 'package:fajimobileapp/features/wallet/presentation/providers/stripe_connect_providers.dart';

class BankConnectScreen extends ConsumerStatefulWidget {
  const BankConnectScreen({super.key});

  @override
  ConsumerState<BankConnectScreen> createState() => _BankConnectScreenState();
}

class _BankConnectScreenState extends ConsumerState<BankConnectScreen> {
  bool _isLoading = false;
  String? _error;

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        setState(() => _error = 'Could not open URL. Please try again.');
      }
    }
  }

  Future<void> _startOnboarding() async {
    setState(() { _isLoading = true; _error = null; });
    try {
      final StripeConnectService service = ref.read(stripeConnectServiceProvider);
      final String url = await service.startOnboarding();
      await _openUrl(url);
      // Refresh status after returning from browser
      ref.invalidate(stripeConnectStatusProvider);
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _refreshOnboarding() async {
    setState(() { _isLoading = true; _error = null; });
    try {
      final StripeConnectService service = ref.read(stripeConnectServiceProvider);
      final String url = await service.refreshOnboarding();
      await _openUrl(url);
      ref.invalidate(stripeConnectStatusProvider);
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _openDashboard() async {
    setState(() { _isLoading = true; _error = null; });
    try {
      final StripeConnectService service = ref.read(stripeConnectServiceProvider);
      final String url = await service.getDashboardUrl();
      await _openUrl(url);
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusAsync = ref.watch(stripeConnectStatusProvider);
    final transfersAsync = ref.watch(stripeTransfersProvider);

    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new,
                        size: 18.sp, color: context.colors.onSurface),
                    onPressed: () => context.pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    'Bank Account',
                    style: AppTypography.headlineMedium.copyWith(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: statusAsync.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
                error: (e, __) => _buildError(context, e.toString()),
                data: (StripeConnectStatus? status) =>
                    _buildContent(context, status, transfersAsync),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    StripeConnectStatus? status,
    AsyncValue<List<StripeTransfer>> transfersAsync,
  ) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      children: [
        SizedBox(height: 8.h),

        // Status Card
        _buildStatusCard(context, status),

        if (_error != null) ...[
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: context.colors.errorContainer,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              _error!,
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onErrorContainer,
              ),
            ),
          ),
        ],

        SizedBox(height: 24.h),

        // Action Buttons
        _buildActionButtons(context, status),

        SizedBox(height: 32.h),

        // Transfer History
        Text(
          'Payout History',
          style: AppTypography.titleMedium.copyWith(
            color: context.colors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        transfersAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
          error: (_, __) => Text(
            'Could not load transfer history.',
            style: AppTypography.bodySmall.copyWith(
              color: context.colors.onSurfaceVariant,
            ),
          ),
          data: (List<StripeTransfer> transfers) =>
              transfers.isEmpty ? _buildEmptyTransfers(context) : _buildTransferList(context, transfers),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }

  Widget _buildStatusCard(BuildContext context, StripeConnectStatus? status) {
    final bool isReady = status?.isReady ?? false;
    final bool connected = status?.connected ?? false;

    Color bgColor;
    Color iconColor;
    IconData icon;
    String title;
    String subtitle;

    if (isReady) {
      bgColor = AppColors.successGreen.withValues(alpha: 0.1);
      iconColor = AppColors.successGreen;
      icon = Icons.verified_rounded;
      title = 'Bank Account Connected';
      subtitle = 'Your payouts are enabled. Stripe auto-pays your bank every 2 days, or withdraw on demand below.';
    } else if (connected) {
      bgColor = AppColors.eventCardYellow.withValues(alpha: 0.1);
      iconColor = AppColors.eventCardYellow;
      icon = Icons.pending_rounded;
      title = 'Setup Incomplete';
      subtitle = status?.message.isNotEmpty == true
          ? status!.message
          : 'Please finish your Stripe onboarding to enable payouts.';
    } else {
      bgColor = context.colors.surfaceContainerHighest;
      iconColor = context.colors.onSurfaceVariant;
      icon = Icons.account_balance_outlined;
      title = 'No Bank Account Linked';
      subtitle = 'Connect your bank account to receive payouts from events, vendor bookings, and co-hosting.';
    }

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.titleMedium.copyWith(
                    color: context.colors.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  subtitle,
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, StripeConnectStatus? status) {
    final bool isReady = status?.isReady ?? false;
    final bool connected = status?.connected ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!connected) ...[
          _buildPrimaryButton(
            context: context,
            icon: Icons.link_rounded,
            label: 'Connect Bank Account',
            onTap: _startOnboarding,
          ),
        ] else if (!isReady) ...[
          _buildPrimaryButton(
            context: context,
            icon: Icons.open_in_browser_rounded,
            label: 'Finish Stripe Setup',
            onTap: _refreshOnboarding,
          ),
        ],
        if (isReady) ...[
          _buildSecondaryButton(
            context: context,
            icon: Icons.dashboard_rounded,
            label: 'View Stripe Dashboard',
            onTap: _openDashboard,
          ),
        ],
      ],
    );
  }

  Widget _buildPrimaryButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) =>
      GestureDetector(
        onTap: _isLoading ? null : () { HapticFeedback.lightImpact(); onTap(); },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: _isLoading
                ? AppColors.primary.withValues(alpha: 0.5)
                : AppColors.primary,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: _isLoading
              ? Center(
                  child: SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      color: context.colors.onPrimary,
                      strokeWidth: 2,
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: context.colors.onPrimary, size: 20.sp),
                    SizedBox(width: 8.w),
                    Text(
                      label,
                      style: AppTypography.titleSmall.copyWith(
                        color: context.colors.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
        ),
      );

  Widget _buildSecondaryButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) =>
      GestureDetector(
        onTap: _isLoading ? null : () { HapticFeedback.lightImpact(); onTap(); },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: context.colors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.primary, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                label,
                style: AppTypography.titleSmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildEmptyTransfers(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          children: [
            Icon(
              Icons.swap_horiz_rounded,
              size: 48.sp,
              color: context.colors.onSurfaceVariant.withValues(alpha: 0.4),
            ),
            SizedBox(height: 12.h),
            Text(
              'No payouts yet',
              style: AppTypography.bodyMedium.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Stripe transfers will appear here once you receive payouts.',
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onSurfaceVariant.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  Widget _buildTransferList(BuildContext context, List<StripeTransfer> transfers) =>
      Column(
        children: transfers.map((StripeTransfer t) {
          final String label = t.eventName ?? _formatType(t.type);
          final String dateStr = _formatDate(t.created);

          return Container(
            margin: EdgeInsets.only(bottom: 10.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: context.colors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.successGreen.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_downward_rounded,
                      color: AppColors.successGreen, size: 18.sp),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: AppTypography.bodyMedium.copyWith(
                          color: context.colors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        dateStr,
                        style: AppTypography.bodySmall.copyWith(
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '+\$${t.amount.toStringAsFixed(2)}',
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.successGreen,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      );

  Widget _buildError(BuildContext context, String message) => Center(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48.sp, color: context.colors.error),
              SizedBox(height: 12.h),
              Text('Failed to load account status',
                  style: AppTypography.titleMedium
                      .copyWith(color: context.colors.onSurface)),
              SizedBox(height: 8.h),
              Text(message,
                  style: AppTypography.bodySmall
                      .copyWith(color: context.colors.onSurfaceVariant),
                  textAlign: TextAlign.center),
              SizedBox(height: 24.h),
              TextButton(
                onPressed: () => ref.invalidate(stripeConnectStatusProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );

  String _formatType(String? type) {
    switch (type) {
      case 'escrow_release':
        return 'Escrow Release';
      case 'vendor_payment':
        return 'Vendor Payment';
      default:
        return 'Stripe Transfer';
    }
  }

  String _formatDate(String raw) {
    try {
      final DateTime dt = DateTime.parse(raw);
      const List<String> months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
      ];
      return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
    } catch (_) {
      return raw;
    }
  }
}
