import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/services/toast_service.dart';
import '../../../../core/routing/route_manager.dart';
import '../../domain/entities/event_entity.dart';
import '../viewmodels/event_details_viewmodel.dart';
import '../widgets/buy_ticket_bottom_sheet.dart';
import '../../../tickets/presentation/viewmodels/my_tickets_viewmodel.dart';

/// Event Details Screen
class EventDetailsScreen extends ConsumerStatefulWidget {
  final String eventId;

  const EventDetailsScreen({
    super.key,
    required this.eventId,
  });

  @override
  ConsumerState<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends ConsumerState<EventDetailsScreen> {
  bool _isFavorite = false;
  bool _hasTicket = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(eventDetailsViewModelProvider.notifier).getEventById(widget.eventId);
      _checkIfUserHasTicket();
    });
  }

  Future<void> _checkIfUserHasTicket() async {
    // Fetch user's tickets and check if they have one for this event
    await ref.read(myTicketsViewModelProvider.notifier).loadMyTickets();
    
    final ticketsState = ref.read(myTicketsViewModelProvider);
    ticketsState.maybeWhen(
      success: (ticketsResponse) {
        final hasTicketForEvent = ticketsResponse.tickets.any(
          (ticket) => ticket.event.id == widget.eventId,
        );
        if (mounted) {
          setState(() {
            _hasTicket = hasTicketForEvent;
          });
        }
      },
      orElse: () {},
    );
  }

  void _toggleFavorite(EventEntity event) async {
    final success = await ref
        .read(eventDetailsViewModelProvider.notifier)
        .toggleFavorite(event.id, _isFavorite);

    if (success) {
      setState(() {
        _isFavorite = !_isFavorite;
      });
      ToastService.showSuccess(
        context: context,
        message: _isFavorite ? 'Added to favorites' : 'Removed from favorites',
      );
    } else {
      ToastService.showError(
        context: context,
        message: 'Failed to update favorites',
      );
    }
  }

  void _buyTickets(EventEntity event) {
    final isEventFree = event.price == 0 || event.isFree;
    
    print('🎫 _buyTickets called');
    print('   Event: ${event.title}');
    print('   Price: ${event.price}');
    print('   isFree field: ${event.isFree}');
    print('   isEventFree: $isEventFree');
    print('   isSoldOut: ${event.isSoldOut}');
    
    if (event.isSoldOut) {
      ToastService.showError(
        context: context,
        message: 'This event is sold out',
      );
      return;
    }

    // Check if event is actually free (price is 0)
    if (isEventFree) {
      print('🎫 Event is FREE - claiming ticket');
      // For free events, claim ticket directly
      _claimFreeTicket(event);
    } else {
      print('🎫 Event is PAID - showing payment sheet');
      // For paid events, show payment bottom sheet
      BuyTicketBottomSheet.show(context, event);
    }
  }

  Future<void> _claimFreeTicket(EventEntity event) async {
    // TODO: Implement free ticket claiming
    ToastService.showSuccess(
      context: context,
      message: 'Free ticket claimed successfully!',
    );
    
    // Refresh ticket status
    await _checkIfUserHasTicket();
  }

  void _viewTicket() {
    context.push(RouteManager.myTickets);
  }

  @override
  Widget build(BuildContext context) {
    final eventState = ref.watch(eventDetailsViewModelProvider);

    return Scaffold(
      backgroundColor: context.colors.surface,
      extendBody: true,
      body: eventState.when(
        initial: () => const Center(
          child: CircularProgressIndicator(),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        success: (event) => _buildEventDetails(context, event),
        error: (failure) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48.sp,
                color: context.colors.error,
              ),
              SizedBox(height: 16.h),
              AppText.bodyLarge(
                failure.message,
                textAlign: TextAlign.center,
                color: context.colors.onSurfaceVariant,
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {
                  ref.read(eventDetailsViewModelProvider.notifier)
                      .getEventById(widget.eventId);
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: eventState.maybeWhen(
        success: (event) {
          // Check if event is actually free
          final isEventFree = event.price == 0 || event.isFree;
          
          // Don't show button for free events if user already has ticket
          if (isEventFree && _hasTicket) {
            return Container(
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
              decoration: BoxDecoration(
                color: context.colors.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: _viewTicket,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.primary,
                  foregroundColor: context.colors.onPrimary,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.confirmation_number, size: 20.sp),
                    SizedBox(width: 8.w),
                    AppText.titleMedium(
                      'View My Ticket',
                      color: context.colors.onPrimary,
                    ),
                  ],
                ),
              ),
            );
          }

          return Container(
            padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
            decoration: BoxDecoration(
              color: context.colors.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                // Price - only show for paid events
                if (!isEventFree) ...[
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.bodySmall(
                          'Price',
                          color: context.colors.onSurfaceVariant,
                        ),
                        SizedBox(height: 4.h),
                        if (event.hasDiscount)
                          Row(
                            children: [
                              AppText.titleLarge(
                                '\$${event.discountedPrice.toStringAsFixed(2)}',
                                color: context.colors.primary,
                              ),
                              SizedBox(width: 8.w),
                              AppText.bodyMedium(
                                '\$${event.price.toStringAsFixed(2)}',
                                color: context.colors.onSurfaceVariant,
                              ),
                            ],
                          )
                        else
                          AppText.titleLarge(
                            '\$${event.price.toStringAsFixed(2)}',
                            color: context.colors.primary,
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                ],
                // Button
                Expanded(
                  flex: isEventFree ? 1 : 2,
                  child: _hasTicket
                      ? ElevatedButton(
                          onPressed: _viewTicket,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.colors.primary,
                            foregroundColor: context.colors.onPrimary,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.confirmation_number, size: 20.sp),
                              SizedBox(width: 8.w),
                              AppText.titleMedium(
                                'View Ticket',
                                color: context.colors.onPrimary,
                              ),
                            ],
                          ),
                        )
                      : ElevatedButton(
                          onPressed: event.isSoldOut ? null : () => _buyTickets(event),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: event.isSoldOut
                                ? context.colors.onSurfaceVariant
                                : context.colors.primary,
                            foregroundColor: event.isSoldOut
                                ? context.colors.surface
                                : context.colors.onPrimary,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: AppText.titleMedium(
                            event.isSoldOut
                                ? 'Sold Out'
                                : isEventFree
                                    ? 'Claim Free Ticket'
                                    : 'Buy Tickets',
                            color: event.isSoldOut
                                ? context.colors.surface
                                : context.colors.onPrimary,
                          ),
                        ),
                ),
              ],
            ),
          );
        },
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildEventDetails(BuildContext context, EventEntity event) {
    return CustomScrollView(
      slivers: [
        // App Bar with Image
        SliverAppBar(
          expandedHeight: 300.h,
          pinned: true,
          backgroundColor: context.colors.surface,
          leading: IconButton(
            icon: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
            onPressed: () => context.pop(),
          ),
          actions: [
            IconButton(
              icon: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? AppColors.error : Colors.white,
                  size: 20.sp,
                ),
              ),
              onPressed: () => _toggleFavorite(event),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: CachedNetworkImage(
              imageUrl: event.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: context.colors.surfaceContainerHighest,
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.colors.primary,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: context.colors.surfaceContainerHighest,
                child: Icon(
                  Icons.image_not_supported,
                  color: context.colors.onSurfaceVariant,
                  size: 48.sp,
                ),
              ),
            ),
          ),
        ),
        
        // Event Details
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Category
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AppText.headlineMedium(
                        event.title,
                        color: context.colors.onSurface,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: context.colors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: AppText.bodySmall(
                        event.category,
                        color: context.colors.primary,
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 16.h),
                
                // Host
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: context.colors.primary.withOpacity(0.1),
                      backgroundImage: event.hostImage != null
                          ? CachedNetworkImageProvider(event.hostImage!)
                          : null,
                      child: event.hostImage == null
                          ? Icon(
                              Icons.person,
                              color: context.colors.primary,
                              size: 20.sp,
                            )
                          : null,
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.bodySmall(
                          'Hosted by',
                          color: context.colors.onSurfaceVariant,
                        ),
                        AppText.bodyLarge(
                          event.hostName,
                          color: context.colors.onSurface,
                        ),
                      ],
                    ),
                  ],
                ),
                
                SizedBox(height: 24.h),
                
                // Date and Time
                _buildInfoRow(
                  context,
                  Icons.calendar_today,
                  'Date & Time',
                  _formatDateTime(event.startDate, event.endDate),
                ),
                
                SizedBox(height: 16.h),
                
                // Location
                _buildInfoRow(
                  context,
                  Icons.location_on,
                  'Location',
                  event.location,
                ),
                
                SizedBox(height: 16.h),
                
                // Price
                _buildInfoRow(
                  context,
                  Icons.local_offer,
                  'Price',
                  event.price > 0
                      ? event.hasDiscount
                          ? '\$${event.discountedPrice.toStringAsFixed(2)} (${event.discountPercentage!.toInt()}% off)'
                          : '\$${event.price.toStringAsFixed(2)}'
                      : 'Free',
                ),
                
                SizedBox(height: 24.h),
                
                // Description
                AppText.titleMedium(
                  'About Event',
                  color: context.colors.onSurface,
                ),
                SizedBox(height: 8.h),
                AppText.bodyMedium(
                  event.description,
                  color: context.colors.onSurfaceVariant,
                ),
                
                SizedBox(height: 24.h),
                
                // Tags
                if (event.tags != null && event.tags!.isNotEmpty) ...[
                  AppText.titleMedium(
                    'Tags',
                    color: context.colors.onSurface,
                  ),
                  SizedBox(height: 8.h),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: event.tags!.map((tag) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: context.colors.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: AppText.bodySmall(
                          tag,
                          color: context.colors.onSurfaceVariant,
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 100.h), // Space for bottom button
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: context.colors.primary,
          size: 20.sp,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.bodySmall(
                label,
                color: context.colors.onSurfaceVariant,
              ),
              SizedBox(height: 2.h),
              AppText.bodyLarge(
                value,
                color: context.colors.onSurface,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDateTime(DateTime start, DateTime end) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    
    final startStr = '${months[start.month - 1]} ${start.day}, ${start.year}';
    final startTime = '${start.hour.toString().padLeft(2, '0')}:${start.minute.toString().padLeft(2, '0')}';
    
    if (start.day == end.day && start.month == end.month && start.year == end.year) {
      final endTime = '${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}';
      return '$startStr\n$startTime - $endTime';
    }
    
    final endStr = '${months[end.month - 1]} ${end.day}, ${end.year}';
    final endTime = '${end.hour.toString().padLeft(2, '0')}:${end.minute.toString().padLeft(2, '0')}';
    return '$startStr $startTime\nto $endStr $endTime';
  }
}
