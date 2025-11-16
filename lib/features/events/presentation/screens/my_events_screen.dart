import 'package:flutter/material.dart';
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
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        title: AppText.titleLarge(
          'My Events',
          color: context.colors.onSurface,
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: context.colors.primary,
          unselectedLabelColor: context.colors.onSurfaceVariant,
          indicatorColor: context.colors.primary,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _loadUserEvents();
        },
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
