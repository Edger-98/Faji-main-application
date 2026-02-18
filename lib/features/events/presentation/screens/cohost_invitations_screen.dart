import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Screen showing co-host invitations
/// Users can accept or decline invitations to become co-hosts
class CoHostInvitationsScreen extends StatefulWidget {
  const CoHostInvitationsScreen({super.key});

  @override
  State<CoHostInvitationsScreen> createState() => _CoHostInvitationsScreenState();
}

class _CoHostInvitationsScreenState extends State<CoHostInvitationsScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: context.colors.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Co-Host Invitations',
          style: AppTypography.titleLarge.copyWith(
            color: context.colors.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(24.w),
        itemCount: 3, // TODO: Replace with actual invitations
        itemBuilder: (context, index) => _buildInvitationCard(
          eventId: 'event_$index',
          eventName: 'Summer Music Festival ${index + 1}',
          hostName: 'John Doe',
          eventDate: 'Jul 15, 2025',
          revenueShare: '50%',
          invitedDate: '2 days ago',
        ),
      ),
    );

  Widget _buildInvitationCard({
    required String eventId,
    required String eventName,
    required String hostName,
    required String eventDate,
    required String revenueShare,
    required String invitedDate,
  }) => Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.colors.primary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: context.colors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  'CO-HOST INVITATION',
                  style: AppTypography.labelSmall.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                invitedDate,
                style: AppTypography.bodySmall.copyWith(
                  color: context.colors.onSurfaceVariant,
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Event name
          Text(
            eventName,
            style: AppTypography.titleMedium.copyWith(
              color: context.colors.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 12.h),

          // Host info
          Row(
            children: [
              Icon(
                Icons.person_rounded,
                size: 16.sp,
                color: context.colors.onSurfaceVariant,
              ),
              SizedBox(width: 6.w),
              Text(
                'Invited by $hostName',
                style: AppTypography.bodySmall.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          // Event date
          Row(
            children: [
              Icon(
                Icons.calendar_today_rounded,
                size: 16.sp,
                color: context.colors.onSurfaceVariant,
              ),
              SizedBox(width: 6.w),
              Text(
                eventDate,
                style: AppTypography.bodySmall.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          // Revenue share
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet_rounded,
                size: 16.sp,
                color: context.colors.primary,
              ),
              SizedBox(width: 6.w),
              Text(
                'Revenue share: ',
                style: AppTypography.bodySmall.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              Text(
                revenueShare,
                style: AppTypography.bodySmall.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Action buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _declineInvitation(eventId),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: context.colors.onSurfaceVariant),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: Text(
                    'Decline',
                    style: AppTypography.labelMedium.copyWith(
                      color: context.colors.onSurface,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _acceptInvitation(eventId),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: Text(
                    'Accept',
                    style: AppTypography.labelMedium.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

  void _acceptInvitation(String eventId) {
    HapticFeedback.mediumImpact();
    // TODO: Implement API call
    // POST /api/co-host/invitations/{invitationId}/accept
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Invitation accepted! You are now a co-host.'),
        backgroundColor: context.colors.primary,
      ),
    );
    
    setState(() {
      // Remove invitation from list
    });
  }

  void _declineInvitation(String eventId) {
    HapticFeedback.lightImpact();
    // TODO: Implement API call
    // POST /api/co-host/invitations/{invitationId}/decline
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Invitation declined'),
        backgroundColor: context.colors.surfaceContainerHighest,
      ),
    );
    
    setState(() {
      // Remove invitation from list
    });
  }
}
