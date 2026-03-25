import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/tickets_provider.dart';
import 'package:fajimobileapp/features/tickets/data/models/my_tickets_response_model.dart';

class MyTicketsScreenV2 extends ConsumerStatefulWidget {
  const MyTicketsScreenV2({super.key});

  @override
  ConsumerState<MyTicketsScreenV2> createState() => _MyTicketsScreenV2State();
}

class _MyTicketsScreenV2State extends ConsumerState<MyTicketsScreenV2>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_onTabChanged);
    _scrollController.addListener(_onScroll);
    
    // Load initial tickets
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(myTicketsProvider.notifier).loadTickets(refresh: true);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      final status = _getStatusForTab(_tabController.index);
      ref.read(myTicketsProvider.notifier).loadTickets(
            status: status,
            refresh: true,
          );
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(myTicketsProvider.notifier).loadMore();
    }
  }

  String _getStatusForTab(int index) {
    switch (index) {
      case 0:
        return 'all';
      case 1:
        return 'valid';
      case 2:
        return 'used';
      case 3:
        return 'cancelled';
      default:
        return 'all';
    }
  }

  Future<void> _onRefresh() async {
    final status = _getStatusForTab(_tabController.index);
    await ref.read(myTicketsProvider.notifier).loadTickets(
          status: status,
          refresh: true,
        );
  }

  @override
  Widget build(BuildContext context) {
    final ticketsState = ref.watch(myTicketsProvider);

    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        title: AppText.titleLarge('My Tickets'),
        backgroundColor: context.colors.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(RouteManager.home);
            }
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: context.colors.primary,
          unselectedLabelColor: context.colors.onSurfaceVariant,
          indicatorColor: context.colors.primary,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Valid'),
            Tab(text: 'Used'),
            Tab(text: 'Cancelled'),
          ],
        ),
      ),
      body: ticketsState.isLoading && ticketsState.tickets == null
          ? const Center(child: CircularProgressIndicator())
          : ticketsState.error != null
              ? _buildError(ticketsState.error!)
              : ticketsState.tickets == null ||
                      ticketsState.tickets!.tickets.isEmpty
                  ? _buildEmptyState()
                  : RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.all(16.w),
                        itemCount: ticketsState.tickets!.tickets.length +
                            (ticketsState.hasMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == ticketsState.tickets!.tickets.length) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          final ticketWithEvent =
                              ticketsState.tickets!.tickets[index];
                          return _buildTicketCard(
                            context,
                            ticketWithEvent,
                          );
                        },
                      ),
                    ),
    );
  }

  Widget _buildTicketCard(
    BuildContext context,
    TicketWithEventModel ticketWithEvent,
  ) {
    final ticket = ticketWithEvent.ticket;
    final event = ticketWithEvent.event;
    final imageUrl = event.imageUrl ?? event.media.poster;

    return GestureDetector(
      onTap: () {
        // Navigate to ticket details
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

                  // Date and Location
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

                  SizedBox(height: 8.h),

                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16.sp,
                        color: context.colors.onSurfaceVariant,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: AppText.bodySmall(
                          event.location.address,
                          color: context.colors.onSurfaceVariant,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
        break;
      case 'used':
        backgroundColor = Colors.orange.withValues(alpha: 0.1);
        textColor = Colors.orange;
        label = 'Used';
        break;
      case 'cancelled':
        backgroundColor = Colors.red.withValues(alpha: 0.1);
        textColor = Colors.red;
        label = 'Cancelled';
        break;
      case 'refunded':
        backgroundColor = Colors.blue.withValues(alpha: 0.1);
        textColor = Colors.blue;
        label = 'Refunded';
        break;
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

  Widget _buildEmptyState() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.confirmation_number_outlined,
              size: 64.sp,
              color: context.colors.onSurfaceVariant,
            ),
            SizedBox(height: 16.h),
            AppText.titleLarge('No Tickets Yet'),
            SizedBox(height: 8.h),
            AppText.bodyMedium(
              'Your purchased tickets will appear here',
              color: context.colors.onSurfaceVariant,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () => context.go(RouteManager.home),
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.primary,
                foregroundColor: context.colors.onPrimary,
              ),
              child: const Text('Browse Events'),
            ),
          ],
        ),
      );

  Widget _buildError(String error) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: context.colors.error,
            ),
            SizedBox(height: 16.h),
            AppText.titleLarge('Error Loading Tickets'),
            SizedBox(height: 8.h),
            AppText.bodyMedium(
              error,
              color: context.colors.onSurfaceVariant,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: _onRefresh,
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.primary,
                foregroundColor: context.colors.onPrimary,
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      );

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ];
      return '${months[date.month - 1]} ${date.day}, ${date.year}';
    } catch (e) {
      return dateStr;
    }
  }
}
