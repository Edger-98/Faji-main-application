import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';
import 'package:fajimobileapp/features/events/presentation/widgets/event_list.dart';
import 'package:fajimobileapp/features/events/presentation/widgets/event_card.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/tickets_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fajimobileapp/features/tickets/data/models/my_tickets_response_model.dart';

/// My Events Screen - User's purchased/attended events
class MyEventsScreen extends ConsumerStatefulWidget {
  const MyEventsScreen({super.key});

  @override
  ConsumerState<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends ConsumerState<MyEventsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _ticketsTabLoaded = false;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_onTabChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserEvents();
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    // Load tickets when Tickets tab (index 3) is selected
    if (_tabController.index == 3 && !_ticketsTabLoaded) {
      _ticketsTabLoaded = true;
      ref.read(myTicketsProvider.notifier).loadTickets(refresh: true);
    }
  }

  void _loadUserEvents() {
    ref.read(userEventsProvider.notifier).getUserEvents();
  }

  void _onEventTap(EventEntity event) {
    context.push('${RouteManager.eventDetails}/${event.id}');
  }

  void _onEventDashboardTap(EventEntity event) {
    context.push(
      RouteManager.eventDashboard,
      extra: {'eventId': event.id, 'eventName': event.title},
    );
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<EventEntity>> userEventsState = ref.watch(userEventsProvider);

    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            // Header with Back + Create Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: <Widget>[
                  // Back button
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new,
                        size: 18.sp, color: context.colors.onSurface),
                    onPressed: () => context.pop(),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: context.colors.primary.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
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
                tabs: const <Widget>[
                  Tab(text: 'Upcoming'),
                  Tab(text: 'Past'),
                  Tab(text: 'Cancelled'),
                  Tab(text: 'Tickets'),
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
                  children: <Widget>[
                    // Upcoming Events
                    _buildEventsList(userEventsState, 'upcoming'),
                    // Past Events
                    _buildEventsList(userEventsState, 'past'),
                    // Cancelled Events
                    _buildEventsList(userEventsState, 'cancelled'),
                    // Bought Tickets
                    _buildTicketsTab(),
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

  Widget _buildEventsList(AsyncValue<List<EventEntity>> state, String filter) => state.when(
      data: (events) {
        final now = DateTime.now();
        List<EventEntity> filteredEvents;
        
        switch (filter) {
          case 'upcoming':
            filteredEvents = events.where((e) => e.startDate.isAfter(now)).toList();
          case 'past':
            filteredEvents = events.where((e) => e.endDate.isBefore(now)).toList();
          case 'cancelled':
            filteredEvents = events.where((e) => e.isCancelled).toList();
          default:
            filteredEvents = events;
        }

        if (filteredEvents.isEmpty) {
          return _buildEmptyState(filter);
        }

        // For upcoming paid events, show dashboard button
        if (filter == 'upcoming') {
          return ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: filteredEvents.length,
            itemBuilder: (context, index) {
              final event = filteredEvents[index];
              return Column(
                children: [
                  EventCard(
                    event: event,
                    onTap: () => _onEventTap(event),
                    showFavoriteButton: false,
                  ),
                  if (event.isPaidEvent)
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.h, left: 4.w, right: 4.w),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () => _onEventDashboardTap(event),
                          icon: const Icon(Icons.bar_chart, size: 18),
                          label: const Text('Event Dashboard'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: context.colors.primary,
                            side: BorderSide(color: context.colors.primary),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          );
        }

        return EventList(
          events: filteredEvents,
          isGridView: false,
          onEventTap: _onEventTap,
          showFavoriteButton: false,
        );
      },
      loading: () => const EventList(
        events: [],
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

  Widget _buildEmptyState(String filter) {
    String title;
    String message;
    
    switch (filter) {
      case 'upcoming':
        title = 'No Upcoming Events';
        message = "You don't have any upcoming events. Browse events and book tickets!";
      case 'past':
        title = 'No Past Events';
        message = "You haven't attended any events yet.";
      case 'cancelled':
        title = 'No Cancelled Events';
        message = "You don't have any cancelled events.";
      default:
        title = 'No Events';
        message = "You don't have any events.";
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            if (filter == 'upcoming') ...<Widget>[
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

  Widget _buildTicketsTab() {
    final ticketsState = ref.watch(myTicketsProvider);

    if (ticketsState.isLoading && ticketsState.tickets == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (ticketsState.error != null) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(32.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error_outline,
                size: 64.sp,
                color: context.colors.error,
              ),
              SizedBox(height: 16.h),
              AppText.titleLarge('Error Loading Tickets'),
              SizedBox(height: 8.h),
              AppText.bodyMedium(
                ticketsState.error!,
                color: context.colors.onSurfaceVariant,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  ref.read(myTicketsProvider.notifier).loadTickets(refresh: true);
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (ticketsState.tickets == null || ticketsState.tickets!.tickets.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(32.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.confirmation_number_outlined,
                size: 64.sp,
                color: context.colors.onSurfaceVariant,
              ),
              SizedBox(height: 24.h),
              AppText.headlineSmall(
                'No Tickets Yet',
                textAlign: TextAlign.center,
                color: context.colors.onSurface,
              ),
              SizedBox(height: 8.h),
              AppText.bodyMedium(
                'Your purchased tickets will appear here',
                color: context.colors.onSurfaceVariant,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () => context.push(RouteManager.eventsList),
                child: const Text('Browse Events'),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(myTicketsProvider.notifier).loadTickets(refresh: true);
      },
      child: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: ticketsState.tickets!.tickets.length,
        itemBuilder: (context, index) {
          final ticketWithEvent = ticketsState.tickets!.tickets[index];
          return _buildTicketCard(ticketWithEvent);
        },
      ),
    );
  }

  Widget _buildTicketCard(TicketWithEventModel ticketWithEvent) {
    final ticket = ticketWithEvent.ticket;
    final event = ticketWithEvent.event;
    final imageUrl = event.imageUrl ?? event.media.poster;

    return GestureDetector(
      onTap: () {
        context.push('/ticket-details/${ticket.id}');
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image
            if (imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 150.h,
                    color: context.colors.surfaceContainerHighest,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 150.h,
                    color: context.colors.surfaceContainerHighest,
                    child: Icon(
                      Icons.image_not_supported,
                      color: context.colors.onSurfaceVariant,
                      size: 48.sp,
                    ),
                  ),
                ),
              ),

            // Ticket Info
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Name
                  Row(
                    children: [
                      if (event.emoji != null) ...[
                        Text(
                          event.emoji!,
                          style: TextStyle(fontSize: 20.sp),
                        ),
                        SizedBox(width: 8.w),
                      ],
                      Expanded(
                        child: AppText.titleMedium(
                          event.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8.h),

                  // Ticket Number
                  Row(
                    children: [
                      Icon(
                        Icons.confirmation_number,
                        size: 16.sp,
                        color: context.colors.onSurfaceVariant,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: AppText.bodySmall(
                          ticket.ticketNumber,
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8.h),

                  // Date
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16.sp,
                        color: context.colors.onSurfaceVariant,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: AppText.bodySmall(
                          _formatDate(event.startDate),
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  // Status and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatusBadge(ticket.status),
                      AppText.titleMedium(
                        '\$${ticket.price.toStringAsFixed(2)}',
                        color: context.colors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color backgroundColor;
    Color textColor;
    String label;

    switch (status.toLowerCase()) {
      case 'valid':
        backgroundColor = Colors.green.withValues(alpha: 0.1);
        textColor = Colors.green;
        label = 'Valid';
      case 'used':
        backgroundColor = Colors.orange.withValues(alpha: 0.1);
        textColor = Colors.orange;
        label = 'Used';
      case 'cancelled':
        backgroundColor = Colors.red.withValues(alpha: 0.1);
        textColor = Colors.red;
        label = 'Cancelled';
      case 'refunded':
        backgroundColor = Colors.blue.withValues(alpha: 0.1);
        textColor = Colors.blue;
        label = 'Refunded';
      default:
        backgroundColor = context.colors.surfaceContainerHighest;
        textColor = context.colors.onSurfaceVariant;
        label = status;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: AppText.bodySmall(
        label,
        color: textColor,
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      final months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];
      return '${months[date.month - 1]} ${date.day}, ${date.year}';
    } on Exception {
      return dateStr;
    }
  }
}
