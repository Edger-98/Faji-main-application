import 'dart:ui';
import 'package:fajimobileapp/core/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_details_tabbed_screen.dart';
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_creation_flow_screen.dart';
import 'package:fajimobileapp/features/organize_event/presentation/providers/event_providers.dart';

class TicketsContent extends ConsumerStatefulWidget {
  const TicketsContent({super.key});

  @override
  ConsumerState<TicketsContent> createState() => _TicketsContentState();
}

class _TicketsContentState extends ConsumerState<TicketsContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      setState(() {
        // Update tab state
        final List<String> tabs = <String>['upcoming', 'bookmarked', 'past'];
        ref.read(currentTabProvider.notifier).state = tabs[_tabController.index];
      });
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onFilterChanged(String filter) {
    setState(() {
      _selectedFilter = filter;
      // Map filter to role
      final Map<String, String> roleMap = <String, String>{
        'All': 'all',
        'Guest': 'guest',
        'Creator': 'creator',
        'Co-Planner': 'co-planner',
      };
      ref.read(currentRoleFilterProvider.notifier).state = roleMap[filter] ?? 'all';
    });
  }

  @override
  Widget build(BuildContext context) => SafeArea(
      bottom: false,
      child: Column(
        children: [
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Events',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onSurface,
                  ),
                ),
                Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHighest.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.history, size: 22.sp),
                    color: AppColors.onSurface,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          // Tab Bar
          Container(
            height: 44.h,
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.surfaceContainerHighest.withOpacity(0.2),
                  width: 1,
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: AppColors.primary,
              indicatorWeight: 2.5,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.onSurface,
              unselectedLabelColor: AppColors.onSurfaceVariant.withOpacity(0.5),
              labelStyle: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
              ),
              unselectedLabelStyle: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
              tabs: const [
                Tab(text: 'UPCOMING'),
                Tab(text: 'BOOKMARKED'),
                Tab(text: 'PAST'),
              ],
            ),
          ),

          SizedBox(height: 16.h),

          // Filter chips
          _buildFilterChips(),

          SizedBox(height: 16.h),

          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildUpcomingTab(),
                _buildBookmarkedTab(),
                _buildPastTab(),
              ],
            ),
          ),

          SizedBox(height: 100.h), // Space for bottom nav
        ],
      ),
    );

  Widget _buildFilterChips() {
    final List<String> filters = <String>['All', 'Guest', 'Creator', 'Co-Planner'];
    final Map<String, IconData> icons = <String, IconData>{
      'Guest': Icons.person_outline,
      'Creator': Icons.verified_outlined,
      'Co-Planner': Icons.people_outline,
    };

    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemCount: filters.length,
        separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10.w),
        itemBuilder: (BuildContext context, int index) {
          final String filter = filters[index];
          final bool isSelected = _selectedFilter == filter;

          return GestureDetector(
            onTap: () => _onFilterChanged(filter),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(18.r),
                border: Border.all(
                  color: isSelected
                      ? Colors.white
                      : const Color(0xFF2A2A2A),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (icons.containsKey(filter)) ...<Widget>[
                    Icon(
                      icons[filter],
                      size: 15.sp,
                      color: isSelected ? Colors.black : AppColors.onSurface.withOpacity(0.8),
                    ),
                    SizedBox(width: 5.w),
                  ],
                  Text(
                    filter,
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? Colors.black : AppColors.onSurface.withOpacity(0.8),
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildUpcomingTab() {
    final AsyncValue<List<EventModel>> eventsAsync = ref.watch(filteredEventsProvider);

    return eventsAsync.when(
      data: (List<EventModel> events) => Stack(
        children: <Widget>[
          if (events.isEmpty) _buildEmptyState(
                  icon: Icons.event_available,
                  title: 'No upcoming events',
                  subtitle: 'Create your first event to get started',
                ) else RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(filteredEventsProvider);
                  },
                  child: ListView.separated(
                    padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 100.h),
                    itemCount: events.length,
                    separatorBuilder: (context, index) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return _buildEventCard(
                        eventId: event.id,
                        role: _formatRole(event.role),
                        eventName: event.name,
                        emoji: event.emoji,
                        date: _formatDate(event.startDate),
                        countdown: _calculateCountdown(event.endDate),
                      );
                    },
                  ),
                ),
          _buildCreateEventButton(),
        ],
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (Object error, StackTrace stack) => _buildErrorState(error),
    );
  }

  Widget _buildBookmarkedTab() {
    final AsyncValue<List<EventModel>> eventsAsync = ref.watch(filteredEventsProvider);

    return eventsAsync.when(
      data: (List<EventModel> events) => events.isEmpty
          ? _buildEmptyState(
              icon: Icons.bookmark_border,
              title: 'No bookmarked events',
              subtitle: 'Bookmark events to see them here',
            )
          : RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(filteredEventsProvider);
              },
              child: ListView.separated(
                padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 100.h),
                itemCount: events.length,
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 16.h),
                itemBuilder: (BuildContext context, int index) {
                  final EventModel event = events[index];
                  return _buildEventCard(
                    eventId: event.id,
                    role: _formatRole(event.role),
                    eventName: event.name,
                    emoji: event.emoji,
                    date: _formatDate(event.startDate),
                    countdown: _calculateCountdown(event.endDate),
                  );
                },
              ),
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (Object error, StackTrace stack) => _buildErrorState(error),
    );
  }

  Widget _buildPastTab() {
    final AsyncValue<List<EventModel>> eventsAsync = ref.watch(filteredEventsProvider);

    return eventsAsync.when(
      data: (List<EventModel> events) => events.isEmpty
          ? _buildEmptyState(
              icon: Icons.event_busy_outlined,
              title: 'No past events',
              subtitle: 'Your completed events will appear here',
            )
          : RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(filteredEventsProvider);
              },
              child: ListView.separated(
                padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 100.h),
                itemCount: events.length,
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 16.h),
                itemBuilder: (BuildContext context, int index) {
                  final EventModel event = events[index];
                  return _buildEventCard(
                    eventId: event.id,
                    role: _formatRole(event.role),
                    eventName: event.name,
                    emoji: event.emoji,
                    date: _formatDate(event.startDate),
                    countdown: 'Event ended',
                  );
                },
              ),
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (Object error, StackTrace stack) => _buildErrorState(error),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
  }) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64.sp,
            color: AppColors.onSurfaceVariant.withOpacity(0.3),
          ),
          SizedBox(height: 16.h),
          Text(
            title,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

  Widget _buildErrorState(Object error) => Center(
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
              'Failed to load events',
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
              onPressed: () => ref.invalidate(filteredEventsProvider),
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              ),
            ),
          ],
        ),
      ),
    );

  Widget _buildCreateEventButton() => Positioned(
      right: 24.w,
      bottom: 24.h,
      child: GestureDetector(
        onTap: () {
          // Show bottom sheet instead of navigating
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            isDismissible: true,
            enableDrag: true,
            builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.95,
              decoration: BoxDecoration(
                color: context.colors.surface,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: Column(
                children: [
                  // Drag handle
                  Container(
                    margin: EdgeInsets.only(top: 12.h),
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: context.colors.onSurfaceVariant.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                  
                  // Header
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Create Event',
                            style: AppTypography.headlineMedium.copyWith(
                              color: context.colors.onSurface,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Divider
                  Divider(
                    height: 1,
                    color: context.colors.onSurfaceVariant.withOpacity(0.2),
                  ),
                  
                  // Event creation flow
                  Expanded(
                    child: Navigator(
                      onGenerateRoute: (settings) {
                        return MaterialPageRoute(
                          builder: (context) => EventCreationFlowScreen(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add, size: 20.sp, color: Colors.black),
              SizedBox(width: 8.w),
              Text(
                'Create Event',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  String _formatRole(String role) => role[0].toUpperCase() + role.substring(1).replaceAll('_', ' ').replaceAll('-', ' ');

  String _formatDate(DateTime date) {
    final List<String> months = <String>[
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.day}${_getDaySuffix(date.day)}';
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  String _calculateCountdown(DateTime endDate) {
    final DateTime now = DateTime.now();
    final Duration diff = endDate.difference(now);

    if (diff.isNegative) return 'Event ended';

    final int hours = diff.inHours;
    final int mins = diff.inMinutes % 60;
    final int secs = diff.inSeconds % 60;

    return '$hours Hours $mins Mins $secs Secs';
  }

  Widget _buildEventCard({
    required String eventId,
    required String role,
    required String eventName,
    required String emoji,
    required String date,
    required String countdown,
  }) => GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailsTabbedScreen(
              eventId: eventId,
              eventName: eventName,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFB8E986), Color(0xFF8FD14F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Role badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    role,
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                // Emoji
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF9C4),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(emoji, style: TextStyle(fontSize: 28.sp)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            // Event name
            Text(
              eventName,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 26.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                height: 1.2,
              ),
            ),
            SizedBox(height: 6.h),

            // Date
            Text(
              date,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.65),
              ),
            ),
            SizedBox(height: 12.h),

            // Countdown
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.75),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.access_time, size: 14.sp, color: Colors.white),
                  SizedBox(width: 6.w),
                  Text(
                    'Ends:',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    countdown,
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  Widget _buildTicketCard(BuildContext context, {required bool isLiked}) => Container(
      height: 267.h,
      decoration: BoxDecoration(
        color: AppColors.eventCardBlue,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Stack(
        children: [
          // Background image placeholder
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.r),
              child: Container(
                color: AppColors.eventCardBlue,
              ),
            ),
          ),
          // Gradient overlay
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 88.h,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.overlayBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.r),
                  bottomRight: Radius.circular(40.r),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.r),
                  bottomRight: Radius.circular(40.r),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 18.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GENfest Music Festival 2024 - Multi - \nsensorial Audio Interface',
                          style: TextStyle(
                            fontFamily: 'PP Neue Montreal',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.onSurface,
                          ),
                          maxLines: 2,
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            Text(
                              'Wed 22/03',
                              style: TextStyle(
                                fontFamily: 'PP Neue Montreal',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              width: 3.w,
                              height: 3.h,
                              decoration: const BoxDecoration(
                                color: AppColors.dotSeparator,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              '08:30 PM',
                              style: TextStyle(
                                fontFamily: 'PP Neue Montreal',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              width: 3.w,
                              height: 3.h,
                              decoration: const BoxDecoration(
                                color: AppColors.dotSeparator,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'From \$40.00',
                              style: TextStyle(
                                fontFamily: 'PP Neue Montreal',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Like button
          Positioned(
            right: 16.w,
            top: 16.h,
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: isLiked ? Colors.black : Colors.black.withOpacity(0.38),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: AppColors.onSurface,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
}
