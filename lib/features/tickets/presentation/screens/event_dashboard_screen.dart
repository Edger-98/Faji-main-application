import 'dart:async';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/tickets/data/models/event_dashboard_model.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/event_dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EventDashboardScreen extends ConsumerStatefulWidget {
  const EventDashboardScreen({super.key, required this.eventId, required this.eventName});

  final String eventId;
  final String eventName;

  @override
  ConsumerState<EventDashboardScreen> createState() => _EventDashboardScreenState();
}

class _EventDashboardScreenState extends ConsumerState<EventDashboardScreen> {
  Timer? _pollTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(eventDashboardProvider.notifier).load(widget.eventId);
      // Poll every 30s while screen is open
      _pollTimer = Timer.periodic(const Duration(seconds: 30), (_) {
        if (mounted) ref.read(eventDashboardProvider.notifier).load(widget.eventId);
      });
    });
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(eventDashboardProvider);

    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: AppText.titleLarge('Event Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(eventDashboardProvider.notifier).load(widget.eventId),
          ),
        ],
      ),
      body: state.isLoading && state.dashboard == null
          ? const Center(child: CircularProgressIndicator())
          : state.error != null && state.dashboard == null
              ? _buildError(state.error!)
              : state.dashboard == null
                  ? const SizedBox()
                  : _buildDashboard(state.dashboard!),
    );
  }

  Widget _buildDashboard(EventDashboardModel d) {
    final v = d.verification;
    final progress = (v.checkInPercentage / 30).clamp(0.0, 1.0);

    return RefreshIndicator(
      onRefresh: () => ref.read(eventDashboardProvider.notifier).load(widget.eventId),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Verification banner
            if (v.isVerified)
              _buildVerifiedBanner(d)
            else
              _buildVerificationProgress(d, progress),

            SizedBox(height: 20.h),

            // Stats grid
            Row(
              children: [
                Expanded(child: _statCard('Tickets Sold', '${d.ticketing.soldTickets}', Icons.confirmation_number, AppColors.primary)),
                SizedBox(width: 12.w),
                Expanded(child: _statCard('Checked In', '${d.guests.checkedIn}', Icons.how_to_reg, AppColors.successGreen)),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(child: _statCard('Revenue', '${d.ticketing.currency} ${d.ticketing.netRevenue.toStringAsFixed(0)}', Icons.attach_money, AppColors.eventCardYellow)),
                SizedBox(width: 12.w),
                Expanded(child: _statCard('Check-in Rate', '${v.checkInPercentage.toStringAsFixed(0)}%', Icons.percent, AppColors.eventCardBlue)),
              ],
            ),

            SizedBox(height: 24.h),

            // Revenue breakdown
            _buildSectionTitle('Revenue Breakdown'),
            SizedBox(height: 12.h),
            _buildRevenueCard(d.ticketing),

            SizedBox(height: 24.h),

            // Recent activity
            if (d.recentActivity.isNotEmpty) ...[
              _buildSectionTitle('Recent Activity'),
              SizedBox(height: 12.h),
              ...d.recentActivity.take(5).map(_buildActivityItem),
            ],

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildVerifiedBanner(EventDashboardModel d) => Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.successGreen, AppColors.successGreen.withValues(alpha: 0.7)],
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.verified, color: Colors.white, size: 24),
                SizedBox(width: 8.w),
                AppText.titleLarge('Event Verified', color: Colors.white),
              ],
            ),
            SizedBox(height: 8.h),
            AppText.bodyMedium(
              d.verification.paymentsReleased
                  ? '✅ Payment of ${d.ticketing.currency} ${d.ticketing.netRevenue.toStringAsFixed(2)} has been released to your wallet'
                  : 'Verification complete — payment release in progress',
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ],
        ),
      );

  Widget _buildVerificationProgress(EventDashboardModel d, double progress) {
    final remaining = ((30 - d.verification.checkInPercentage) / 100 * d.ticketing.soldTickets).ceil();
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.titleMedium('Verification Progress'),
              AppText.titleMedium(
                '${d.verification.checkInPercentage.toStringAsFixed(0)}% / 30%',
                color: context.colors.primary,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 12.h,
              backgroundColor: context.colors.surface,
              valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary),
            ),
          ),
          SizedBox(height: 12.h),
          AppText.bodySmall(
            remaining > 0
                ? '$remaining more check-in${remaining == 1 ? '' : 's'} needed to release payment'
                : 'Threshold reached — verifying...',
            color: context.colors.onSurfaceVariant,
          ),
          SizedBox(height: 4.h),
          AppText.bodySmall(
            '💰 Payment held in escrow until 30% check-in threshold',
            color: context.colors.onSurfaceVariant,
          ),
        ],
      ),
    );
  }

  Widget _statCard(String label, String value, IconData icon, Color color) => Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 24.sp),
            SizedBox(height: 8.h),
            AppText.headlineSmall(value, color: context.colors.onSurface),
            SizedBox(height: 4.h),
            AppText.bodySmall(label, color: context.colors.onSurfaceVariant),
          ],
        ),
      );

  Widget _buildRevenueCard(DashboardTicketing t) => Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            _revenueRow('Gross Revenue', '${t.currency} ${t.revenue.toStringAsFixed(2)}'),
            Divider(height: 20.h),
            _revenueRow('Platform Fee', '- ${t.currency} ${t.platformFee.toStringAsFixed(2)}', isDeduction: true),
            Divider(height: 20.h),
            _revenueRow('Net Revenue', '${t.currency} ${t.netRevenue.toStringAsFixed(2)}', isBold: true),
          ],
        ),
      );

  Widget _revenueRow(String label, String value, {bool isDeduction = false, bool isBold = false}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.bodyMedium(label, color: context.colors.onSurface),
          AppText.bodyMedium(
            value,
            color: isDeduction
                ? context.colors.error
                : isBold
                    ? AppColors.successGreen
                    : context.colors.onSurface,
          ),
        ],
      );

  Widget _buildSectionTitle(String title) => AppText.titleMedium(title, color: context.colors.onSurface);

  Widget _buildActivityItem(DashboardActivity a) {
    final icon = a.type == 'check_in' ? Icons.how_to_reg : Icons.confirmation_number;
    final color = a.type == 'check_in' ? AppColors.successGreen : context.colors.primary;
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20.sp),
          SizedBox(width: 12.w),
          Expanded(child: AppText.bodyMedium(a.description)),
          AppText.bodySmall(_formatTime(a.timestamp), color: context.colors.onSurfaceVariant),
        ],
      ),
    );
  }

  Widget _buildError(String error) => Center(
        child: Padding(
          padding: EdgeInsets.all(32.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64.sp, color: context.colors.error),
              SizedBox(height: 16.h),
              AppText.titleLarge('Failed to load dashboard'),
              SizedBox(height: 8.h),
              AppText.bodyMedium(error, color: context.colors.onSurfaceVariant, textAlign: TextAlign.center),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () => ref.read(eventDashboardProvider.notifier).load(widget.eventId),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );

  String _formatTime(String ts) {
    try {
      final dt = DateTime.parse(ts).toLocal();
      final h = dt.hour > 12 ? dt.hour - 12 : dt.hour == 0 ? 12 : dt.hour;
      final m = dt.minute.toString().padLeft(2, '0');
      final period = dt.hour >= 12 ? 'PM' : 'AM';
      return '$h:$m $period';
    } catch (_) {
      return '';
    }
  }
}
