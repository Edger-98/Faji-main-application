import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/routing/route_manager.dart';
import '../../domain/entities/event_entity.dart';
import '../providers/event_providers.dart';
import '../widgets/event_list.dart';

/// My Events Screen - User's purchased/attended events
class MyEventsScreen extends ConsumerStatefulWidget {
  const MyEventsScreen({super.key});

  @override
  ConsumerState<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends ConsumerState<MyEventsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserEvents();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _loadUserEvents() {
    ref.read(userEventsProvider.notifier).getUserEvents();
  }

  void _onEventTap(EventEntity event) {
    context.push('${RouteManager.eventDetails}/${event.id}');
  }

  @override
  Widget build(BuildContext context) {
    final userEventsState = ref.watch(userEventsProvider);

    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Header with Create Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.headlineMedium(
                        'My Events',
                        color: context.colors.onSurface,
                      ),
                      SizedBox(height: 4.h),
                      AppText.bodySmall(
                        'Your upcoming and past events',
                        color: context.colors.onSurfaceVariant,
                      ),
                    ],
                  ),
                  // CREATE EVENT BUTTON
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      context.push(RouteManager.eventCreationFlow);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        borderRadius: BorderRadius.circular(36.r),
                        boxShadow: [
                          BoxShadow(
                            color: context.colors.primary.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add,
                            color: context.colors.onPrimary,
                            size: 20.sp,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            'create',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: context.colors.onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Tabs
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              height: 48.h,
              decoration: BoxDecoration(
                color: context.colors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: context.colors.onPrimary,
                unselectedLabelColor: context.colors.onSurfaceVariant,
                labelStyle: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
                unselectedLabelStyle: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
                tabs: const [
                  Tab(text: 'Upcoming'),
                  Tab(text: 'Past'),
                  Tab(text: 'Cancelled'),
                ],
              ),
            ),
            
            SizedBox(height: 16.h),
            
            // Content
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  _loadUserEvents();
                },
                color: context.colors.primary,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Upcoming Events
                    _buildEventsList(userEventsState, 'upcoming'),
            // Past Events
            _buildEventsList(userEventsState, 'past'),
            // Cancelled Events
            _buildEventsList(userEventsState, 'cancelled'),
          ],
        ),
              ),
            ),
          ],
        ),
      ),
      // FAB for Create Event

    );
  }

  Widget _buildEventsList(AsyncValue<List<EventEntity>> state, String filter) {
    return state.when(
      data: (events) {
        final now = DateTime.now();
        List<EventEntity> filteredEvents;
        
        switch (filter) {
          case 'upcoming':
            filteredEvents = events.where((e) => e.startDate.isAfter(now)).toList();
            break;
          case 'past':
            filteredEvents = events.where((e) => e.endDate.isBefore(now)).toList();
            break;
          case 'cancelled':
            filteredEvents = events.where((e) => e.isCancelled).toList();
            break;
          default:
            filteredEvents = events;
        }

        if (filteredEvents.isEmpty) {
          return _buildEmptyState(filter);
        }

        return EventList(
          events: filteredEvents,
          isGridView: false,
          onEventTap: _onEventTap,
          showFavoriteButton: false,
        );
      },
      loading: () => EventList(
        events: const [],
        isLoading: true,
        isGridView: false,
      ),
      error: (error, stack) => EventList(
        events: const [],
        error: error.toString(),
        isGridView: false,
        onRetry: _loadUserEvents,
      ),
    );
  }

  Widget _buildEmptyState(String filter) {
    String title;
    String message;
    
    switch (filter) {
      case 'upcoming':
        title = 'No Upcoming Events';
        message = 'You don\'t have any upcoming events. Browse events and book tickets!';
        break;
      case 'past':
        title = 'No Past Events';
        message = 'You haven\'t attended any events yet.';
        break;
      case 'cancelled':
        title = 'No Cancelled Events';
        message = 'You don\'t have any cancelled events.';
        break;
      default:
        title = 'No Events';
        message = 'You don\'t have any events.';
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 64.sp,
              color: context.colors.onSurfaceVariant,
            ),
            SizedBox(height: 24.h),
            AppText.headlineSmall(
              title,
              textAlign: TextAlign.center,
              color: context.colors.onSurface,
            ),
            SizedBox(height: 8.h),
            AppText.bodyMedium(
              message,
              textAlign: TextAlign.center,
              color: context.colors.onSurfaceVariant,
            ),
            if (filter == 'upcoming') ...[
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  context.push(RouteManager.eventsList);
                },
                child: const Text('Browse Events'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
