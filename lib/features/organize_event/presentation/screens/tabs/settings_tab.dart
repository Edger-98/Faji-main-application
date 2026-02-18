import 'package:fajimobileapp/core/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/settings_providers.dart';
import 'package:fajimobileapp/features/organize_event/data/repositories/event_repository.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart' as events_providers;

/// SETTINGS Tab - Event settings and preferences with REAL API DATA
class SettingsTab extends ConsumerWidget {

  const SettingsTab({super.key, required this.eventId});
  final String eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<EventModel> eventAsync = ref.watch(eventDetailsProvider(eventId));

    return eventAsync.when(
      data: (EventModel event) => ListView(
        padding: EdgeInsets.all(16.w),
        children: <Widget>[
          _buildPublicitySection(context, ref, event),
          SizedBox(height: 24.h),
          _buildEventLinkSection(context, event),
          SizedBox(height: 24.h),
          _buildRSVPSection(context, ref, event),
          // SizedBox(height: 24.h),
          // _buildPosterSection(context, ref, event),
          // SizedBox(height: 24.h),
          // _buildMediaSection(context, ref),
          // SizedBox(height: 24.h),
          // _buildNoteSection(context, ref, event),
          // SizedBox(height: 24.h),
          // _buildPreferencesSection(context, ref, event),
          SizedBox(height: 24.h),
          _buildDangerZoneSection(context, ref, event),
          SizedBox(height: 100.h),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (Object error, StackTrace stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
            SizedBox(height: 16.h),
            const Text('Failed to load settings'),
            SizedBox(height: 8.h),
            ElevatedButton(
              onPressed: () => ref.invalidate(eventDetailsProvider(eventId)),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPublicitySection(BuildContext context, WidgetRef ref, event) => _buildSettingItem(
      title: 'Make Event Public - Faji 🔥',
      subtitle: 'Let your event be visible & searchable on the Partyverse',
      trailing: Switch(
        value: event.settings.isPublic,
        onChanged: (value) => _updateSetting(
          context,
          ref,
          'isPublic',
          value,
          'Event visibility updated',
        ),
        activeColor: const Color(0xFF4CAF50),
      ),
    );

  Widget _buildEventLinkSection(BuildContext context, event) {
    final websiteLink = event.settings.websiteLink;
    final String fullLink = 'https://faji.com/$websiteLink';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Event Website Link (shared with guests)',
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: fullLink));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Link copied: $fullLink'),
                backgroundColor: AppColors.primary,
                duration: const Duration(seconds: 2),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFF2A2A2A)),
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.link, size: 20.sp, color: const Color(0xFFFF8C42)),
                SizedBox(width: 8.w),
                Text(
                  'faji.com/',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                Expanded(
                  child: Text(
                    websiteLink,
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 8.w),
                Icon(Icons.content_copy,
                    size: 20.sp, color: AppColors.onSurfaceVariant),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRSVPSection(BuildContext context, WidgetRef ref, event) {
    final rsvpButtonText = event.settings.rsvpButtonText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'RSVP Button Title (for your event link)',
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          onTap: () => _showRSVPButtonDialog(context, ref, rsvpButtonText),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFF2A2A2A)),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    rsvpButtonText,
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down,
                    size: 20.sp, color: AppColors.onSurfaceVariant),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPosterSection(BuildContext context, WidgetRef ref, event) {
    final posterUrl = event.media.poster;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Event Poster',
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Image picker feature coming soon'),
              ),
            );
          },
          child: Container(
            height: 120.h,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFF2A2A2A)),
              image: posterUrl != null && posterUrl.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(posterUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: posterUrl == null || posterUrl.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.image_outlined,
                            size: 48.sp,
                            color: AppColors.onSurfaceVariant.withOpacity(0.3)),
                        SizedBox(height: 8.h),
                        Text(
                          'Tap to upload',
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 12.sp,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildMediaSection(BuildContext context, WidgetRef ref) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pre Event Media',
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Media upload feature coming soon'),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFF2A2A2A)),
            ),
            child: Row(
              children: [
                Icon(Icons.cloud_upload_outlined,
                    size: 24.sp, color: AppColors.onSurfaceVariant),
                SizedBox(width: 12.w),
                Text(
                  'Upload Media',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

  Widget _buildNoteSection(BuildContext context, WidgetRef ref, event) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RSVP Note',
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        SizedBox(height: 12.h),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('RSVP note editor coming soon'),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFF2A2A2A)),
            ),
            child: Text(
              'What would you like to say to your guests?',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.onSurfaceVariant.withOpacity(0.5),
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ],
    );

  Widget _buildPreferencesSection(BuildContext context, WidgetRef ref, event) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preferences',
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.onSurface,
          ),
        ),
        SizedBox(height: 16.h),
        _buildSettingItem(
          title: 'Keep Memories Private',
          subtitle:
              'Only you and invited guests can view photos & videos. Prevents public access to event photos.',
          trailing: Switch(
            value: event.settings.keepMemoriesPrivate,
            onChanged: (value) => _updateSetting(
              context,
              ref,
              'keepMemoriesPrivate',
              value,
              'Memory privacy updated',
            ),
            activeColor: const Color(0xFF4CAF50),
          ),
        ),
        SizedBox(height: 16.h),
        _buildSettingItem(
          title: 'Disable Guest Memories',
          subtitle:
              'Only event creators and planners can share photos & videos. Prevents guests from uploading photos and videos to this event.',
          trailing: Switch(
            value: event.settings.disableGuestMemories,
            onChanged: (value) => _updateSetting(
              context,
              ref,
              'disableGuestMemories',
              value,
              'Guest memories setting updated',
            ),
            activeColor: const Color(0xFF4CAF50),
          ),
        ),
        SizedBox(height: 16.h),
        _buildSettingItem(
          title: 'Accept Guest Contributions',
          subtitle:
              'Allow guests to contribute to your event. They can add items to your RSVP to your event. Guests can choose to make a monetary contribution during the RSVP process.',
          trailing: Switch(
            value: event.settings.acceptGuestContributions,
            onChanged: (value) => _updateSetting(
              context,
              ref,
              'acceptGuestContributions',
              value,
              'Guest contributions setting updated',
            ),
            activeColor: const Color(0xFFFF8C42),
          ),
        ),
        SizedBox(height: 16.h),
        _buildSettingItem(
          title: 'Disable Public RSVP',
          subtitle:
              'Prevent the general public from RSVPing to this event. Only invited guests can RSVP.',
          trailing: Switch(
            value: event.settings.disablePublicRSVP,
            onChanged: (value) => _updateSetting(
              context,
              ref,
              'disablePublicRSVP',
              value,
              'Public RSVP setting updated',
            ),
            activeColor: const Color(0xFF4CAF50),
          ),
        ),
        SizedBox(height: 16.h),
        _buildSettingItem(
          title: 'Enable Webhook',
          subtitle:
              'Receive real-time notifications about RSVP events via webhook.',
          trailing: Switch(
            value: event.settings.enableWebhook,
            onChanged: (value) => _updateSetting(
              context,
              ref,
              'enableWebhook',
              value,
              'Webhook setting updated',
            ),
            activeColor: const Color(0xFF4CAF50),
          ),
        ),
      ],
    );

  Widget _buildSettingItem({
    required String title,
    required String subtitle,
    required Widget trailing,
  }) => Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                SizedBox(height: 6.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.onSurfaceVariant.withOpacity(0.7),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          trailing,
        ],
      ),
    );

  Future<void> _updateSetting(
    BuildContext context,
    WidgetRef ref,
    String key,
    value,
    String successMessage,
  ) async {
    try {
      await ref.read(settingsUpdateProvider.notifier).updateSingleSetting(
            eventId: eventId,
            key: key,
            value: value,
          );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(successMessage),
            backgroundColor: const Color(0xFF4CAF50),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update setting: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  void _showRSVPButtonDialog(
    BuildContext context,
    WidgetRef ref,
    String currentText,
  ) {
    final List<String> options = <String>[
      'Celebrate With Us',
      'Join Us',
      'RSVP Now',
      'Save Your Spot',
      'Count Me In',
      'Be There',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Choose RSVP Button Text',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.onSurface,
              ),
            ),
            SizedBox(height: 20.h),
            ...options.map((String option) => ListTile(
                  title: Text(
                    option,
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.onSurface,
                    ),
                  ),
                  trailing: currentText == option
                      ? const Icon(Icons.check, color: AppColors.primary)
                      : null,
                  onTap: () {
                    Navigator.pop(context);
                    _updateSetting(
                      context,
                      ref,
                      'rsvpButtonText',
                      option,
                      'RSVP button text updated',
                    );
                  },
                )),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  static Widget _buildDangerZoneSection(BuildContext context, WidgetRef ref, event) => Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.error.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning_rounded,
                color: AppColors.error,
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Text(
                'Danger Zone',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.error,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'Once you delete this event, there is no going back. Please be certain.',
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () => _showDeleteConfirmation(context, ref, event),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                color: AppColors.error,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  'Delete Event',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  static void _showDeleteConfirmation(BuildContext context, WidgetRef ref, event) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text(
          'Delete Event?',
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.onSurface,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Are you sure you want to delete "${event.name}"?',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'This action cannot be undone. All event data, guests, and memories will be permanently deleted.',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.error,
                height: 1.5,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              _deleteEvent(context, ref, event.id);
            },
            child: Text(
              'Delete',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> _deleteEvent(BuildContext context, WidgetRef ref, String eventId) async {
    // Get the root navigator state BEFORE showing any dialogs
    final navigator = Navigator.of(context, rootNavigator: true);
    
    // Show loading
    navigator.push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      ),
    );

    try {
      // Call delete API
      await ref.read(eventRepositoryProvider).deleteEvent(eventId);
      
      // Close loading
      navigator.pop();

      // Refresh all event lists immediately after deletion
      ref.invalidate(filteredEventsProvider);
      ref.invalidate(events_providers.userEventsProvider);
      
      // Trigger immediate refetch
      ref.read(events_providers.userEventsProvider.notifier).getUserEvents();

      // Navigate to home and show success - wrap in Consumer to have access to ref
      navigator.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext ctx) => Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) => Scaffold(
              backgroundColor: AppColors.background,
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: AppColors.success.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_circle,
                          size: 60.sp,
                          color: AppColors.success,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Text(
                        'Event Deleted',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.onSurface,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'The event has been permanently deleted',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 15.sp,
                          color: AppColors.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 48.h),
                      GestureDetector(
                        onTap: () {
                          // Invalidate all event providers to force refresh
                          ref.invalidate(filteredEventsProvider);
                          ref.invalidate(currentTabProvider);
                          ref.invalidate(events_providers.userEventsProvider);
                          
                          // Trigger immediate refetch
                          ref.read(events_providers.userEventsProvider.notifier).getUserEvents();
                          
                          // Go to home - this will trigger the providers to reload
                          navigator.popUntil((Route route) => route.isFirst);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(28.r),
                          ),
                          child: Center(
                            child: Text(
                              'Go to Home',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        (Route route) => route.isFirst,
      );
    } catch (e) {
      // Close loading
      navigator.pop();

      // Show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }
}
