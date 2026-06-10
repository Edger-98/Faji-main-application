import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/services/location_service.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/check_in_request.dart';
import 'package:fajimobileapp/features/tickets/presentation/viewmodels/check_in_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class CheckInScreen extends ConsumerStatefulWidget {
  const CheckInScreen({
    super.key,
    required this.ticketId,
    required this.eventId,
    required this.eventName,
  });

  final String ticketId;
  final String eventId;
  final String eventName;

  @override
  ConsumerState<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends ConsumerState<CheckInScreen> {
  bool _isGettingLocation = false;

  @override
  void initState() {
    super.initState();
    ref.read(checkInViewModelProvider.notifier).resetState();
  }

  Future<void> _doCheckIn() async {
    setState(() => _isGettingLocation = true);

    // Get GPS
    final position = await LocationService.getCurrentLocation();

    if (!mounted) return;
    setState(() => _isGettingLocation = false);

    if (position == null) {
      // Check if permanently denied
      final status = await Permission.location.status;
      if (!mounted) return;
      if (status.isPermanentlyDenied) {
        _showLocationPermissionSheet();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location is required to check in. Please enable it.')),
        );
      }
      return;
    }

    await ref.read(checkInViewModelProvider.notifier).checkInGuest(
          ticketId: widget.ticketId,
          eventId: widget.eventId,
          latitude: position.latitude,
          longitude: position.longitude,
          accuracy: position.accuracy,
        );
  }

  void _showLocationPermissionSheet() {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24.r))),
      builder: (_) => Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_off, size: 48.sp, color: context.colors.error),
            SizedBox(height: 16.h),
            AppText.titleLarge('Location Required'),
            SizedBox(height: 8.h),
            AppText.bodyMedium(
              'Location permission is required to verify you are at the venue. Please enable it in Settings.',
              textAlign: TextAlign.center,
              color: context.colors.onSurfaceVariant,
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  openAppSettings();
                },
                child: const Text('Open Settings'),
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final checkInState = ref.watch(checkInViewModelProvider);

    // Listen for result
    ref.listen(checkInViewModelProvider, (prev, next) {
      next.whenOrNull(
        error: (failure) => _handleError(failure.message),
      );
    });

    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: AppText.titleLarge('Check In'),
      ),
      body: checkInState.maybeWhen(
        success: (response) => _buildSuccess(response),
        orElse: () => _buildCheckInUI(checkInState.isLoading || _isGettingLocation),
      ),    );
  }

  Widget _buildCheckInUI(bool isLoading) => Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.location_on, size: 56.sp, color: context.colors.primary),
            ),
            SizedBox(height: 32.h),
            AppText.headlineMedium(widget.eventName, textAlign: TextAlign.center),
            SizedBox(height: 12.h),
            AppText.bodyMedium(
              'Tap the button below to verify your location and check in at the venue.',
              textAlign: TextAlign.center,
              color: context.colors.onSurfaceVariant,
            ),
            SizedBox(height: 8.h),
            AppText.bodySmall(
              'You must be within 200m of the venue.',
              textAlign: TextAlign.center,
              color: context.colors.onSurfaceVariant,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton.icon(
                onPressed: isLoading ? null : _doCheckIn,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.primary,
                  foregroundColor: context.colors.onPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                ),
                icon: isLoading
                    ? SizedBox(
                        width: 20.w,
                        height: 20.w,
                        child: CircularProgressIndicator(color: context.colors.onPrimary, strokeWidth: 2),
                      )
                    : const Icon(Icons.how_to_reg),
                label: AppText.titleMedium(
                  isLoading ? 'Getting location...' : 'Check In Now',
                  color: context.colors.onPrimary,
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      );

  Widget _buildSuccess(CheckInResponse response) => Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120.w,
              height: 120.w,
              decoration: const BoxDecoration(color: AppColors.successGreen, shape: BoxShape.circle),
              child: Icon(Icons.check, size: 64.sp, color: Colors.white),
            ),
            SizedBox(height: 32.h),
            AppText.headlineMedium("You're In! 🎉", textAlign: TextAlign.center),
            SizedBox(height: 12.h),
            AppText.bodyMedium(
              'Successfully checked in to ${widget.eventName}',
              textAlign: TextAlign.center,
              color: context.colors.onSurfaceVariant,
            ),
            if (response.eventVerification.isVerified) ...[
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.successGreen.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.successGreen.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.verified, color: AppColors.successGreen),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: AppText.bodyMedium(
                        '🎉 Event verified! The 30% check-in threshold has been reached.',
                        color: AppColors.successGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 40.h),
            SizedBox(
              width: double.infinity,
              height: 56.h,
              child: ElevatedButton(
                onPressed: () => context.pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                ),
                child: AppText.titleMedium('Done', color: context.colors.onPrimary),
              ),
            ),
          ],
        ),
      );

  void _handleError(String message) {
    // Parse specific error codes for better UX
    String displayMessage = message;
    if (message.contains('already checked in') || message.contains('TICKET_ALREADY_USED')) {
      displayMessage = 'You already checked in to this event.';
    } else if (message.contains('too far') || message.contains('LOCATION_VERIFICATION_FAILED')) {
      // Extract distance if present
      final distMatch = RegExp(r'(\d+)m away').firstMatch(message);
      final dist = distMatch?.group(1);
      displayMessage = dist != null
          ? 'You are ${dist}m away from the venue. Move closer (within 200m) to check in.'
          : 'You are too far from the venue. Move closer to check in.';
    } else if (message.contains('not open yet') || message.contains('Opens')) {
      displayMessage = message; // Already descriptive
    } else if (message.contains('ended')) {
      displayMessage = 'This event has ended. Check-in is closed.';
    } else if (message.contains('cancelled') || message.contains('INVALID_TICKET')) {
      displayMessage = 'This ticket is no longer valid.';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(displayMessage),
        backgroundColor: context.colors.error,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
