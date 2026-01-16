import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Screen for inviting co-hosts to an event
/// Co-hosts are invited collaborators who share revenue
/// NOT vendors or bookable resources
class InviteCoHostScreen extends StatefulWidget {
  final String eventId;

  const InviteCoHostScreen({
    super.key,
    required this.eventId,
  });

  @override
  State<InviteCoHostScreen> createState() => _InviteCoHostScreenState();
}

class _InviteCoHostScreenState extends State<InviteCoHostScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _selectedUsers = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: context.colors.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Invite Co-Hosts',
          style: AppTypography.titleLarge.copyWith(
            color: context.colors.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: EdgeInsets.all(24.w),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name or email...',
                prefixIcon: Icon(Icons.search, color: context.colors.onSurfaceVariant),
                filled: true,
                fillColor: context.colors.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) => setState(() {}),
            ),
          ),

          // Info banner
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: context.colors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: context.colors.primary.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: context.colors.primary,
                  size: 20.sp,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    'Co-hosts share event management and revenue (default 50/50 split)',
                    style: AppTypography.bodySmall.copyWith(
                      color: context.colors.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 24.h),

          // User list
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              itemCount: 5, // TODO: Replace with actual user list
              itemBuilder: (context, index) => _buildUserItem(
                userId: 'user_$index',
                name: 'User ${index + 1}',
                email: 'user${index + 1}@example.com',
                avatarUrl: '',
              ),
            ),
          ),

          // Selected count and invite button
          if (_selectedUsers.isNotEmpty)
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: context.colors.surfaceContainerHighest,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${_selectedUsers.length} co-host${_selectedUsers.length > 1 ? 's' : ''} selected',
                      style: AppTypography.bodyMedium.copyWith(
                        color: context.colors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: _sendInvitations,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.colors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                        ),
                        child: Text(
                          'Send Invitations',
                          style: AppTypography.labelLarge.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildUserItem({
    required String userId,
    required String name,
    required String email,
    required String avatarUrl,
  }) {
    final isSelected = _selectedUsers.contains(userId);

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() {
          if (isSelected) {
            _selectedUsers.remove(userId);
          } else {
            _selectedUsers.add(userId);
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colors.primary.withValues(alpha: 0.1)
              : context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected
                ? context.colors.primary
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  name[0].toUpperCase(),
                  style: AppTypography.titleMedium.copyWith(
                    color: context.colors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            SizedBox(width: 12.w),

            // User info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTypography.bodyMedium.copyWith(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    email,
                    style: AppTypography.bodySmall.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            // Checkbox
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: isSelected ? context.colors.primary : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? context.colors.primary
                      : context.colors.onSurfaceVariant,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 16.sp,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  void _sendInvitations() {
    HapticFeedback.mediumImpact();
    // TODO: Implement API call to send invitations
    // POST /api/events/{eventId}/co-hosts
    // Body: { userIds: _selectedUsers }
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Invitations sent to ${_selectedUsers.length} user(s)'),
        backgroundColor: context.colors.primary,
      ),
    );
    
    context.pop();
  }
}
