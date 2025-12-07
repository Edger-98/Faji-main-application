import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/plan_tab_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_providers.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/task_providers.dart';

/// PLAN Tab - Shows event planning tools and sections with REAL API DATA
class PlanTab extends ConsumerWidget {
  final String eventId;

  const PlanTab({super.key, required this.eventId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch event details for event info card
    final eventAsync = ref.watch(eventDetailsProvider(eventId));
    
    return eventAsync.when(
      data: (event) => ListView(
        padding: EdgeInsets.all(14.w),
        children: [
          _buildEventInfoCard(context, ref, event),
          SizedBox(height: 12.h),
          _buildBudgetCard(context, ref),
          SizedBox(height: 12.h),
          _buildTaskTrackerCard(context, ref),
          SizedBox(height: 12.h),
          _buildVendorsCard(context, ref),
          SizedBox(height: 12.h),
          _buildLocationCard(context),
          SizedBox(height: 12.h),
          _buildPlannersCard(context, ref),
          SizedBox(height: 12.h),
          _buildSellTicketsCard(context),
          SizedBox(height: 12.h),
          _buildMoreToolsCard(context),
          SizedBox(height: 80.h),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
            SizedBox(height: 16.h),
            Text('Failed to load event data'),
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

  Widget _buildEventInfoCard(BuildContext context, WidgetRef ref, event) {
    // Calculate time remaining
    final now = DateTime.now();
    final diff = event.endDate.difference(now);
    final hours = diff.inHours;
    final mins = diff.inMinutes % 60;
    final secs = diff.inSeconds % 60;
    
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFB8E986), Color(0xFF8FD14F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  event.settings.websiteLink.toUpperCase(),
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.access_time, size: 13.sp, color: Colors.black),
                  SizedBox(width: 3.w),
                  Text(
                    '$hours Hours',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.calendar_today, size: 13.sp, color: Colors.black),
                  SizedBox(width: 3.w),
                  Text(
                    '$mins Mins',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.people, size: 13.sp, color: Colors.black),
                  SizedBox(width: 3.w),
                  Text(
                    '$secs Secs',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Host:',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          event.host.name,
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    '${event.stats.confirmedGuests} / ${event.stats.expectedGuests}',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Create budget feature coming soon'),
                      backgroundColor: AppColors.primary,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Create',
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.add, size: 14.sp),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetCard(BuildContext context, WidgetRef ref) {
    final budgetAsync = ref.watch(budgetProvider(eventId));
    
    return budgetAsync.when(
      data: (budget) => GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Opening budget management...'),
              backgroundColor: AppColors.primary,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Budget',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onSurface,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Icon(Icons.auto_awesome, size: 14.sp, color: const Color(0xFFFF8C42)),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Budget options'),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                    },
                    icon: Icon(Icons.more_horiz, color: AppColors.onSurfaceVariant, size: 20.sp),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${budget.currencySymbol} ${budget.total.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.onSurface,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Spent: ${budget.currencySymbol}${budget.spent.toStringAsFixed(0)}',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50.w,
                    height: 50.h,
                    child: CircularProgressIndicator(
                      value: budget.progress,
                      strokeWidth: 5,
                      backgroundColor: const Color(0xFF2A2A2A),
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      loading: () => Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: Text('Failed to load budget', style: TextStyle(color: Colors.red)),
      ),
    );
  }

  Widget _buildTaskTrackerCard(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(planTabTasksProvider(eventId));
    
    return tasksAsync.when(
      data: (taskResponse) {
        final tasks = taskResponse.tasks;
        final stats = taskResponse.stats;
        
        return GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Opening task tracker...'),
                backgroundColor: AppColors.primary,
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: const Color(0xFF2A2A2A)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_circle_outline, size: 18.sp, color: const Color(0xFFFF8C42)),
                        SizedBox(width: 8.w),
                        Text(
                          'Task Tracker',
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onSurface,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          '${stats.completed}/${stats.total}',
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Task options'),
                            backgroundColor: AppColors.primary,
                          ),
                        );
                      },
                      icon: Icon(Icons.more_horiz, color: AppColors.onSurfaceVariant, size: 20.sp),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                ...tasks.take(3).map((task) => Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // Toggle task status
                          final newStatus = task.status == 'completed' ? 'not_started' : 'completed';
                          try {
                            await ref.read(taskUpdateProvider.notifier)
                                .updateTaskStatus(eventId, task.id, newStatus);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Task ${newStatus == 'completed' ? 'completed' : 'reopened'}'),
                                backgroundColor: const Color(0xFF4CAF50),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Failed to update task'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: task.status == 'completed' ? AppColors.primary : Colors.transparent,
                            border: Border.all(
                              color: task.status == 'completed' ? AppColors.primary : AppColors.onSurfaceVariant,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: task.status == 'completed'
                              ? Icon(Icons.check, size: 14.sp, color: Colors.black)
                              : null,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          task.title,
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.onSurface,
                            decoration: task.status == 'completed' ? TextDecoration.lineThrough : null,
                          ),
                        ),
                      ),
                      Text(
                        _getTaskStatusText(task.status),
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: _getTaskStatusColor(task.status),
                        ),
                      ),
                    ],
                  ),
                )).toList(),
              ],
            ),
          ),
        );
      },
      loading: () => Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: Text('Failed to load tasks', style: TextStyle(color: Colors.red)),
      ),
    );
  }
  
  String _getTaskStatusText(String status) {
    switch (status) {
      case 'completed':
        return 'Completed';
      case 'in_progress':
        return 'In Progress';
      default:
        return 'Not Started';
    }
  }
  
  Color _getTaskStatusColor(String status) {
    switch (status) {
      case 'completed':
        return const Color(0xFF4CAF50);
      case 'in_progress':
        return const Color(0xFFFF8C42);
      default:
        return AppColors.onSurfaceVariant;
    }
  }

  Widget _buildVendorsCard(BuildContext context, WidgetRef ref) {
    final vendorsAsync = ref.watch(vendorsProvider(eventId));
    
    return vendorsAsync.when(
      data: (vendors) => GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Opening vendors list...'),
              backgroundColor: AppColors.primary,
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFF2A2A2A)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Vendors (${vendors.length})',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Vendor options'),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                    },
                    icon: Icon(Icons.more_horiz, color: AppColors.onSurfaceVariant, size: 20.sp),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              if (vendors.isEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Text(
                    'No vendors added yet',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 12.sp,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                )
              else
                ...vendors.map((vendor) => Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: _buildVendorItem(vendor.name, isOnline: vendor.isOnline),
                )).toList(),
            ],
          ),
        ),
      ),
      loading: () => Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: Text('Failed to load vendors', style: TextStyle(color: Colors.red)),
      ),
    );
  }

  Widget _buildVendorItem(String name, {required bool isOnline}) {
    return Row(
      children: [
        Container(
          width: 36.w,
          height: 36.h,
          decoration: const BoxDecoration(
            color: Color(0xFF5B9BD5),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              name[0],
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            name,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.onSurface,
            ),
          ),
        ),
        if (isOnline)
          Container(
            width: 8.w,
            height: 8.h,
            decoration: const BoxDecoration(
              color: Color(0xFF4CAF50),
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }

  Widget _buildLocationCard(BuildContext context) {
    return Container(
      height: 110.h,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF2A2A2A)),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2A3A4A),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          Positioned(
            top: 10.h,
            left: 10.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Icon(Icons.more_horiz, color: Colors.white, size: 16.sp),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 10.w,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Add location feature coming soon'),
                    backgroundColor: const Color(0xFF5B9BD5),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B9BD5),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              ),
              child: Text(
                'Tap to Add',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            right: 10.w,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Date & Time',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 6.w),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Edit date & time'),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlannersCard(BuildContext context, WidgetRef ref) {
    final plannersAsync = ref.watch(plannersProvider(eventId));
    
    return plannersAsync.when(
      data: (planners) => GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Opening planners list...'),
              backgroundColor: AppColors.primary,
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: const Color(0xFF2A2A2A)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Planners (${planners.length})',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Planner options'),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                    },
                    icon: Icon(Icons.more_horiz, color: AppColors.onSurfaceVariant, size: 20.sp),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              if (planners.isEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Text(
                    'No planners added yet',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 12.sp,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                )
              else
                ...planners.map((planner) => Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Row(
                    children: [
                      Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: planner.role == 'host' ? const Color(0xFFFF8C42) : const Color(0xFF5B9BD5),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            planner.name[0].toUpperCase(),
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          planner.name,
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.onSurface,
                          ),
                        ),
                      ),
                      if (planner.role == 'host')
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF8C42).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            'HOST',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFFFF8C42),
                            ),
                          ),
                        ),
                    ],
                  ),
                )).toList(),
            ],
          ),
        ),
      ),
      loading: () => Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: Text('Failed to load planners', style: TextStyle(color: Colors.red)),
      ),
    );
  }

  Widget _buildSellTicketsCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Opening ticket sales...'),
            backgroundColor: AppColors.primary,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.confirmation_number_outlined, size: 18.sp, color: const Color(0xFFFF8C42)),
                    SizedBox(width: 8.w),
                    Text(
                      'Sell Tickets or Anything',
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.auto_awesome, size: 14.sp, color: const Color(0xFFFF8C42)),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Ticket options'),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  },
                  icon: Icon(Icons.more_horiz, color: AppColors.onSurfaceVariant, size: 20.sp),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(Icons.payment, size: 40.sp, color: AppColors.onSurfaceVariant.withOpacity(0.3)),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  'Collect payments from your Guests',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoreToolsCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Opening wishlist & registry...'),
            backgroundColor: AppColors.primary,
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFF2A2A2A)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'More Tools For You',
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Container(
                  width: 36.w,
                  height: 36.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFF176),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.red, size: 18.sp),
                ),
                SizedBox(width: 10.w),
                Text(
                  'Add Wishlist & Registry',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurface,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
