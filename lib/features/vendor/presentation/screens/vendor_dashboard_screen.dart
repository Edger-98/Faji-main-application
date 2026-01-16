import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import '../../data/providers/vendor_providers.dart';

class VendorDashboardScreen extends ConsumerStatefulWidget {
  const VendorDashboardScreen({super.key});

  @override
  ConsumerState<VendorDashboardScreen> createState() =>
      _VendorDashboardScreenState();
}

class _VendorDashboardScreenState extends ConsumerState<VendorDashboardScreen> {
  bool _isLoading = true;
  Map<String, dynamic>? _stats;

  @override
  void initState() {
    super.initState();
    _fetchStats();
  }

  Future<void> _fetchStats() async {
    setState(() => _isLoading = true);

    try {
      final datasource = ref.read(vendorRemoteDataSourceProvider);
      final response = await datasource.getVendorStats();

      if (!mounted) return;

      if (response.response.statusCode == 200) {
        setState(() {
          _stats = response.data['data'] ?? response.data;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load stats');
      }
    } catch (e) {
      print('Error fetching stats: $e');
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        // Use mock data as fallback
        _stats = _getMockStats();
      });
    }
  }

  Map<String, dynamic> _getMockStats() {
    return {
      'totalBookings': 24,
      'totalEarnings': 4850000,
      'pendingRequests': 3,
      'activeResources': 8,
      'completedBookings': 21,
      'averageRating': 4.8,
    };
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }

    final mockStats = _stats ?? _getMockStats();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Row(
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, size: 16.sp),
                      color: AppColors.onSurface,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    'Vendor Dashboard',
                    style: AppTypography.headlineMedium.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w600,
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
                  // Stats Cards Row 1
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          icon: Icons.monetization_on,
                          label: 'Total Earnings',
                          value: '₦${_formatPrice((mockStats['totalEarnings'] as num?)?.toInt() ?? 0)}',
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _StatCard(
                          icon: Icons.event_available,
                          label: 'Total Bookings',
                          value: '${mockStats['totalBookings'] ?? 0}',
                          color: AppColors.success,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  // Stats Cards Row 2
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          icon: Icons.pending_actions,
                          label: 'Pending Requests',
                          value: '${mockStats['pendingRequests'] ?? 0}',
                          color: const Color(0xFFFEB822),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _StatCard(
                          icon: Icons.inventory_2,
                          label: 'Active Services',
                          value: '${mockStats['activeResources'] ?? 0}',
                          color: const Color(0xFF6C63FF),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  // Quick Actions
                  Text(
                    'Quick Actions',
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _QuickActionCard(
                    icon: Icons.add_business,
                    title: 'Add New Service',
                    subtitle: 'Create a new service offering',
                    onTap: () {
                      HapticFeedback.lightImpact();
                      context.push(RouteManager.vendorAddResource);
                    },
                  ),
                  SizedBox(height: 12.h),
                  _QuickActionCard(
                    icon: Icons.request_page,
                    title: 'View Booking Requests',
                    subtitle: '${mockStats['pendingRequests'] ?? 0} pending requests',
                    onTap: () {
                      HapticFeedback.lightImpact();
                      context.push(RouteManager.vendorBookingsList);
                    },
                  ),
                  SizedBox(height: 12.h),
                  _QuickActionCard(
                    icon: Icons.inventory_2_outlined,
                    title: 'Manage Services',
                    subtitle: 'Edit or update your services',
                    onTap: () {
                      HapticFeedback.lightImpact();
                      context.push(RouteManager.vendorResourcesList);
                    },
                  ),
                  SizedBox(height: 24.h),
                  // Recent Activity
                  Text(
                    'Recent Activity',
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _buildRecentActivity(),
                  SizedBox(height: 120.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity() {
    // TODO: Fetch from API
    final mockActivity = [
      {
        'type': 'booking',
        'title': 'New booking request',
        'subtitle': 'Wedding Reception - Sarah Smith',
        'time': '2 hours ago',
        'icon': Icons.event_note,
      },
      {
        'type': 'completed',
        'title': 'Booking completed',
        'subtitle': 'Corporate Event - Mike Johnson',
        'time': '1 day ago',
        'icon': Icons.check_circle,
      },
      {
        'type': 'resource',
        'title': 'Service updated',
        'subtitle': 'Grand Ballroom - Price updated',
        'time': '2 days ago',
        'icon': Icons.edit,
      },
    ];

    return Column(
      children: mockActivity.map((activity) {
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.searchBarBackground,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: [
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF2E2E2E),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  activity['icon'] as IconData,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity['title'] as String,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      activity['subtitle'] as String,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                activity['time'] as String,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _formatPrice(int price) {
    return price.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.searchBarBackground,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 20.sp,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: AppTypography.titleLarge.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.searchBarBackground,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.textSecondary,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
