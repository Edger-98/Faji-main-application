import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/tabs/plan_tab.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/tabs/guest_tab.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/tabs/chat_tab.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/tabs/settings_tab.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/tabs/edit_tab.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/tabs/promote_tab.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_providers.dart';

/// Event Details Screen with Tabs (PLAN, GUEST, CHAT, SETTINGS, EDIT, PROMOTE)
class EventDetailsTabbedScreen extends ConsumerStatefulWidget {
  final String eventId;
  final String? eventName;

  const EventDetailsTabbedScreen({
    super.key,
    required this.eventId,
    this.eventName,
  });

  @override
  ConsumerState<EventDetailsTabbedScreen> createState() =>
      _EventDetailsTabbedScreenState();
}

class _EventDetailsTabbedScreenState
    extends ConsumerState<EventDetailsTabbedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabs = [
    'PLAN',
    'GUEST',
    'CHAT',
    'SETTINGS',
    'EDIT',
    'PROMOTE',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final eventAsync = ref.watch(eventDetailsProvider(widget.eventId));

    return eventAsync.when(
      data: (event) => Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              // Header with event name
              _buildHeader(event.name),

              // Tab Bar
              _buildTabBar(),

              // Tab Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    PlanTab(eventId: widget.eventId),
                    GuestTab(eventId: widget.eventId),
                    ChatTab(eventId: widget.eventId),
                    SettingsTab(eventId: widget.eventId),
                    EditTab(eventId: widget.eventId),
                    PromoteTab(eventId: widget.eventId),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      loading: () => Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(widget.eventName ?? 'Loading...'),
              _buildTabBar(),
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
      error: (error, stack) => Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(widget.eventName ?? 'Error'),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64.sp,
                          color: Colors.red.withOpacity(0.7),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Failed to load event',
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onSurface,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          error.toString(),
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton.icon(
                          onPressed: () => ref.invalidate(eventDetailsProvider(widget.eventId)),
                          icon: const Icon(Icons.refresh),
                          label: const Text('Retry'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Go Back'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String eventName) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 8.h),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          bottom: BorderSide(
            color: AppColors.surfaceContainerHighest.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHighest.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 16.sp,
                  color: AppColors.onSurface,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // Event name
          Expanded(
            child: Text(
              eventName,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.onSurface,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 12.w),

          // Share button
          GestureDetector(
            onTap: () => _shareEvent(),
            child: Container(
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: const Color(0xFFFF8C42).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.ios_share,
                  size: 18.sp,
                  color: const Color(0xFFFF8C42),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _shareEvent() {
    final eventAsync = ref.read(eventDetailsProvider(widget.eventId));
    eventAsync.whenData((event) {
      final websiteLink = event.settings.websiteLink;
      final shareText = websiteLink.isNotEmpty 
          ? 'https://faji.app/events/$websiteLink'
          : 'Check out ${event.name}!';
      
      Clipboard.setData(ClipboardData(text: shareText));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Event link copied to clipboard!'),
          duration: const Duration(seconds: 2),
          backgroundColor: AppColors.primary,
        ),
      );
    });
  }

  String _formatDate(DateTime date) {
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  Widget _buildTabBar() {
    return Stack(
      children: [
        Container(
          height: 44.h,
          decoration: BoxDecoration(
            color: AppColors.background,
            border: Border(
              bottom: BorderSide(
                color: AppColors.surfaceContainerHighest.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            indicatorColor: AppColors.primary,
            indicatorWeight: 2.5,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.onSurface,
            unselectedLabelColor: AppColors.onSurfaceVariant.withOpacity(0.5),
            labelPadding: EdgeInsets.symmetric(horizontal: 16.w),
            labelStyle: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
            tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
          ),
        ),
        // Stronger gradient indicator for more content on the right
        Positioned(
          right: 0,
          top: 0,
          bottom: 1,
          child: IgnorePointer(
            child: Container(
              width: 60.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.background.withOpacity(0),
                    AppColors.background.withOpacity(0.7),
                    AppColors.background,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
        ),
        // Visual indicator - small dots or arrow
        Positioned(
          right: 8.w,
          top: 0,
          bottom: 1,
          child: IgnorePointer(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(4.w),
                child: Icon(
                  Icons.chevron_right,
                  size: 16.sp,
                  color: AppColors.onSurfaceVariant.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
