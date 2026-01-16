import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/services/notification_providers.dart';

/// Notification settings screen
class NotificationSettingsScreen extends ConsumerStatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  ConsumerState<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends ConsumerState<NotificationSettingsScreen> {
  bool _eventReminders = true;
  bool _bookingUpdates = true;
  bool _vendorMessages = true;
  bool _paymentNotifications = true;
  bool _marketingEmails = false;

  @override
  Widget build(BuildContext context) {
    final permissionAsync = ref.watch(notificationPermissionProvider);
    final fcmTokenAsync = ref.watch(fcmTokenProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Row(
                children: [
                  // Back button
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                      color: AppColors.onSurface,
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    'Notifications',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onSurface,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  SizedBox(height: 8.h),

                  // Permission status
                  permissionAsync.when(
                    data: (isGranted) => _buildPermissionCard(isGranted),
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),

                  SizedBox(height: 24.h),

                  // Notification preferences
                  Text(
                    'Notification Preferences',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  _buildNotificationToggle(
                    icon: Icons.event_outlined,
                    title: 'Event Reminders',
                    subtitle: 'Get notified about upcoming events',
                    value: _eventReminders,
                    onChanged: (value) => setState(() => _eventReminders = value),
                  ),

                  _buildNotificationToggle(
                    icon: Icons.bookmark_outline,
                    title: 'Booking Updates',
                    subtitle: 'Updates on your bookings and requests',
                    value: _bookingUpdates,
                    onChanged: (value) => setState(() => _bookingUpdates = value),
                  ),

                  _buildNotificationToggle(
                    icon: Icons.message_outlined,
                    title: 'Vendor Messages',
                    subtitle: 'Messages from vendors and hosts',
                    value: _vendorMessages,
                    onChanged: (value) => setState(() => _vendorMessages = value),
                  ),

                  _buildNotificationToggle(
                    icon: Icons.payment_outlined,
                    title: 'Payment Notifications',
                    subtitle: 'Payment confirmations and receipts',
                    value: _paymentNotifications,
                    onChanged: (value) => setState(() => _paymentNotifications = value),
                  ),

                  _buildNotificationToggle(
                    icon: Icons.campaign_outlined,
                    title: 'Marketing & Promotions',
                    subtitle: 'Special offers and new features',
                    value: _marketingEmails,
                    onChanged: (value) => setState(() => _marketingEmails = value),
                  ),

                  SizedBox(height: 24.h),

                  // FCM Token (for debugging)
                  if (fcmTokenAsync.hasValue && fcmTokenAsync.value != null) ...[
                    Text(
                      'Device Token',
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: AppColors.searchBarBackground,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        fcmTokenAsync.value!,
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.onSurfaceVariant,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionCard(bool isGranted) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isGranted
            ? AppColors.primary.withOpacity(0.1)
            : AppColors.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isGranted ? AppColors.primary : AppColors.error,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isGranted ? Icons.check_circle : Icons.warning,
            color: isGranted ? AppColors.primary : AppColors.error,
            size: 24.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isGranted ? 'Notifications Enabled' : 'Notifications Disabled',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onSurface,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  isGranted
                      ? 'You\'ll receive notifications for important updates'
                      : 'Enable notifications in Settings to stay updated',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (!isGranted)
            TextButton(
              onPressed: () async {
                final service = ref.read(firebaseNotificationServiceProvider);
                await service.requestPermission();
                ref.invalidate(notificationPermissionProvider);
              },
              child: Text(
                'Enable',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNotificationToggle({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.searchBarBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onSurface,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
