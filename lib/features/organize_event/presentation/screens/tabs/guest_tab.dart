import 'package:fajimobileapp/features/organize_event/data/repositories/guest_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/guest_providers.dart';

/// GUEST Tab - Shows guest list and management with REAL API DATA
class GuestTab extends ConsumerStatefulWidget {

  const GuestTab({super.key, required this.eventId});
  final String eventId;

  @override
  ConsumerState<GuestTab> createState() => _GuestTabState();
}

class _GuestTabState extends ConsumerState<GuestTab> {
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GuestFilters filters = ref.watch(currentGuestFiltersProvider(widget.eventId));
    final AsyncValue<GuestListResponse> guestsAsync = ref.watch(guestListProvider(filters));
    
    return Column(
      children: <Widget>[
        // Search and action buttons
        _buildSearchBar(),

        // Filter chips with stats
        guestsAsync.when(
          data: (GuestListResponse response) => _buildFilterChips(response.stats),
          loading: () => _buildFilterChips(null),
          error: (_, __) => _buildFilterChips(null),
        ),

        // Guest list
        Expanded(
          child: guestsAsync.when(
            data: (GuestListResponse response) => _buildGuestList(response.guests),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (Object error, StackTrace stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
                  SizedBox(height: 16.h),
                  const Text('Failed to load guests'),
                  SizedBox(height: 8.h),
                  ElevatedButton(
                    onPressed: () => ref.invalidate(guestListProvider(filters)),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Bottom action buttons
        _buildBottomActions(),
      ],
    );
  }

  Widget _buildSearchBar() => Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFF2A2A2A)),
              ),
              child: Row(
                children: [
                  Icon(Icons.search,
                      size: 20.sp, color: AppColors.onSurfaceVariant),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 14.sp,
                        color: AppColors.onSurface,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search by name, email, phone...',
                        hintStyle: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.onSurfaceVariant.withOpacity(0.6),
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      onChanged: (value) {
                        // Debounce search
                        Future.delayed(const Duration(milliseconds: 500), () {
                          if (_searchController.text == value) {
                            ref.read(currentGuestSearchProvider.notifier).state = value;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFF2A2A2A)),
            ),
            child: IconButton(
              icon: Icon(Icons.mail_outline,
                  size: 20.sp, color: AppColors.onSurface),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Send invites feature coming soon')),
                );
              },
              padding: EdgeInsets.zero,
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFF2A2A2A)),
            ),
            child: IconButton(
              icon: Icon(Icons.file_download_outlined,
                  size: 20.sp, color: AppColors.onSurface),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Export guests feature coming soon')),
                );
              },
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );

  Widget _buildFilterChips(stats) {
    final String currentStatus = ref.watch(currentGuestStatusProvider);
    
    final List<Map<String, dynamic>> filters = <Map<String, dynamic>>[
      <String, dynamic>{'label': 'All', 'value': 'all', 'count': stats?.total ?? 0},
      <String, dynamic>{'label': 'Confirmed', 'value': 'confirmed', 'count': stats?.confirmed ?? 0},
      <String, dynamic>{'label': 'Invited', 'value': 'invited', 'count': stats?.invited ?? 0},
      <String, dynamic>{'label': 'Declined', 'value': 'declined', 'count': stats?.declined ?? 0},
    ];

    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (BuildContext context, int index) => SizedBox(width: 8.w),
        itemBuilder: (BuildContext context, int index) {
          final Map<String, dynamic> filter = filters[index];
          final bool isSelected = currentStatus == filter['value'];

          return GestureDetector(
            onTap: () {
              ref.read(currentGuestStatusProvider.notifier).state = filter['value'] as String;
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFFF8C42)
                    : const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFFF8C42)
                      : const Color(0xFF2A2A2A),
                ),
              ),
              child: Text(
                '${filter['label']}: ${filter['count']}',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.black : AppColors.onSurface,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGuestList(List guests) {
    if (guests.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.people_outline, size: 64.sp, color: AppColors.onSurfaceVariant.withOpacity(0.3)),
            SizedBox(height: 16.h),
            Text(
              'No guests yet',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Add your first guest to get started',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 14.sp,
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        final GuestFilters filters = ref.read(currentGuestFiltersProvider(widget.eventId));
        ref.invalidate(guestListProvider(filters));
      },
      child: ListView.separated(
        padding: EdgeInsets.all(16.w),
        itemCount: guests.length,
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 12.h),
        itemBuilder: (BuildContext context, int index) {
          final guest = guests[index];
          return _buildGuestItem(guest);
        },
      ),
    );
  }

  Widget _buildGuestItem(guest) {
    final name = guest.name;
    final phone = guest.phone ?? 'No phone';
    final status = guest.status.toUpperCase();
    final isOnline = guest.isOnline;
    
    // Generate avatar initials from name
    final nameParts = name.split(' ');
    final avatar = nameParts.length > 1
        ? '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase()
        : name.substring(0, name.length > 1 ? 2 : 1).toUpperCase();
    
    // Generate color based on name
    final List<Color> colors = <Color>[
      const Color(0xFFFF8C42),
      const Color(0xFF5B9BD5),
      const Color(0xFFB8E986),
      const Color(0xFFFF6B9D),
    ];
    final Color color = colors[name.hashCode % colors.length];
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Row(
        children: <Widget>[
          // Avatar
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                avatar,
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // Guest info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                      ),
                    ),
                    if (isOnline) ...<Widget>[
                      SizedBox(width: 8.w),
                      Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: const BoxDecoration(
                          color: Color(0xFF4CAF50),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  phone,
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          // Status badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: _getStatusColor(status).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: _getStatusColor(status)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(_getStatusIcon(status),
                    size: 14.sp, color: _getStatusColor(status)),
                SizedBox(width: 4.w),
                Text(
                  status,
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: _getStatusColor(status),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Icon(Icons.keyboard_arrow_down,
              size: 20.sp, color: AppColors.onSurfaceVariant),
        ],
      ),
    );
  }

  Widget _buildBottomActions() => Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('QR scanner feature coming soon')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A1A1A),
                foregroundColor: AppColors.onSurface,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                  side: const BorderSide(color: Color(0xFF2A2A2A)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code_scanner, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'Scan QR',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: ElevatedButton(
              onPressed: () => _showAddGuestDialog(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_add, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'Add Guest',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  
  void _showAddGuestDialog() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    var isLoading = false;
    
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) => StatefulBuilder(
        builder: (BuildContext context, setState) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text(
          'Add Guest',
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            color: AppColors.onSurface,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: nameController,
              style: const TextStyle(color: AppColors.onSurface),
              decoration: const InputDecoration(
                labelText: 'Name *',
                labelStyle: TextStyle(color: AppColors.onSurfaceVariant),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF2A2A2A)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: phoneController,
              style: const TextStyle(color: AppColors.onSurface),
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone',
                labelStyle: TextStyle(color: AppColors.onSurfaceVariant),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF2A2A2A)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: emailController,
              style: const TextStyle(color: AppColors.onSurface),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: AppColors.onSurfaceVariant),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF2A2A2A)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: isLoading ? null : () => Navigator.pop(dialogContext),
            child: const Text('Cancel', style: TextStyle(color: AppColors.onSurfaceVariant)),
          ),
          ElevatedButton(
            onPressed: isLoading ? null : () async {
              if (nameController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Name is required')),
                );
                return;
              }
              
              final String guestName = nameController.text;
              
              // Set loading state
              setState(() {
                isLoading = true;
              });
              
              try {
                await ref.read(guestAddProvider.notifier).addGuest(
                  eventId: widget.eventId,
                  name: guestName,
                  phone: phoneController.text.isEmpty ? null : phoneController.text,
                  email: emailController.text.isEmpty ? null : emailController.text,
                );
                
                // Close dialog
                if (mounted) Navigator.pop(dialogContext);
                
                // Refresh the guest list immediately
                final GuestFilters filters = ref.read(currentGuestFiltersProvider(widget.eventId));
                ref.invalidate(guestListProvider(filters));
                
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Guest "$guestName" added successfully!'),
                      backgroundColor: const Color(0xFF4CAF50),
                    ),
                  );
                }
              } catch (e) {
                // Reset loading state
                setState(() {
                  isLoading = false;
                });
                
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to add guest: $e'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isLoading 
                  ? AppColors.primary.withOpacity(0.6)
                  : AppColors.primary,
              foregroundColor: Colors.black,
            ),
            child: isLoading
                ? SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: const CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 2,
                    ),
                  )
                : const Text('Add'),
          ),
        ],
        ),
      ),
    );
  }
  
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return const Color(0xFF4CAF50);
      case 'invited':
        return const Color(0xFF5B9BD5);
      case 'declined':
        return Colors.red;
      default:
        return AppColors.onSurfaceVariant;
    }
  }
  
  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return Icons.check_circle_outline;
      case 'invited':
        return Icons.person_add_outlined;
      case 'declined':
        return Icons.cancel_outlined;
      default:
        return Icons.help_outline;
    }
  }
}
