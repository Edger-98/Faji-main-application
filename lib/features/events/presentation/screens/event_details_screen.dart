import 'package:cached_network_image/cached_network_image.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/core/services/toast_service.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/presentation/providers/favorites_provider.dart';
import 'package:fajimobileapp/features/events/presentation/viewmodels/event_details_viewmodel.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/tickets_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

/// Event Details Screen
class EventDetailsScreen extends ConsumerStatefulWidget {

  const EventDetailsScreen({
    super.key,
    required this.eventId,
  });
  final String eventId;

  @override
  ConsumerState<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends ConsumerState<EventDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        ref.read(eventDetailsViewModelProvider.notifier).getEventById(widget.eventId);
        // Check purchase status using new API
        ref.read(purchaseStatusProvider(widget.eventId).notifier).checkStatus(widget.eventId);
      }
    });
  }

  Future<void> _toggleFavorite(EventEntity event) async {
    final FavoritesNotifier favoritesNotifier = ref.read(favoritesProvider.notifier);
    final bool isFavorite = ref.read(favoritesProvider).contains(event.id);
    
    // Optimistically update UI
    favoritesNotifier.toggleFavorite(event.id);
    
    // Call API
    final bool success = await ref
        .read(eventDetailsViewModelProvider.notifier)
        .toggleFavorite(event.id, isFavorite);

    if (success) {
      ToastService.showSuccess(
        context: context,
        message: isFavorite ? 'Removed from favorites' : 'Added to favorites',
      );
    } else {
      // Revert on failure
      favoritesNotifier.toggleFavorite(event.id);
      ToastService.showError(
        context: context,
        message: 'Failed to update favorites',
      );
    }
  }

  void _buyTickets(EventEntity event) {
    if (event.isSoldOut) {
      ToastService.showError(
        context: context,
        message: 'This event is sold out',
      );
      return;
    }

    // Navigate to checkout screen for paid events
    if (event.isPaidEvent) {
      context.push(RouteManager.checkout, extra: event);
    } else {
      // For free tickets, claim directly
      _claimFreeTicket(event);
    }
  }

  Future<void> _claimFreeTicket(EventEntity event) async {
    // TODO: Implement free ticket claiming API call
    if (!mounted) return;
    
    ToastService.showSuccess(
      context: context,
      message: 'Free ticket claimed successfully!',
    );
    
    // Refresh purchase status
    ref.invalidate(purchaseStatusProvider(widget.eventId));
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
        success: (EventEntity event) => _buildEventDetails(context, event),
        error: (Failure failure) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
        success: (EventEntity event) {
          // Check purchase status
          final purchaseStatus = ref.watch(purchaseStatusProvider(widget.eventId));
          final hasPurchased = purchaseStatus.status?.hasPurchased ?? false;
          final ticketCount = purchaseStatus.status?.ticketCount ?? 0;
          final isEventFree = event.isFreeEvent;
          
          // If user has tickets, show "View Tickets" button
          if (hasPurchased) {
            return Container(
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
              decoration: BoxDecoration(
                color: context.colors.surface,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
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
                  children: <Widget>[
                    Icon(Icons.confirmation_number, size: 20.sp),
                    SizedBox(width: 8.w),
                    AppText.titleMedium(
                      ticketCount > 1 ? 'View Tickets ($ticketCount)' : 'View My Ticket',
                      color: context.colors.onPrimary,
                    ),
                  ],
                ),
              ),
            );
          }

          // Show buy/claim button
          return Container(
            padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
            decoration: BoxDecoration(
              color: context.colors.surface,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                // Price - only show for paid events
                if (!isEventFree) ...<Widget>[
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppText.bodySmall(
                          'Price',
                          color: context.colors.onSurfaceVariant,
                        ),
                        SizedBox(height: 4.h),
                        if (event.hasDiscount)
                          Row(
                            children: <Widget>[
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
                  child: ElevatedButton(
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
    final favorites = ref.watch(favoritesProvider);
    
    return CustomScrollView(
      slivers: <Widget>[
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
          actions: <Widget>[
            IconButton(
              icon: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  favorites.contains(event.id) ? Icons.favorite : Icons.favorite_border,
                  color: favorites.contains(event.id) ? AppColors.error : Colors.white,
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
              placeholder: (BuildContext context, String url) => ColoredBox(
                color: context.colors.surfaceContainerHighest,
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.colors.primary,
                  ),
                ),
              ),
              errorWidget: (BuildContext context, String url, Object error) => ColoredBox(
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
              children: <Widget>[
                // Title and Category
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                  children: <Widget>[
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
                      children: <Widget>[
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
                GestureDetector(
                  onTap: () async {
                    // Open location in Google Maps
                    final encodedLocation = Uri.encodeComponent(event.location);
                    final mapsUrl = 'https://www.google.com/maps/search/?api=1&query=$encodedLocation';
                    final uri = Uri.parse(mapsUrl);
                    
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    } else {
                      if (context.mounted) {
                        ToastService.showError(
                          context: context,
                          message: 'Could not open maps',
                        );
                      }
                    }
                  },
                  child: _buildInfoRow(
                    context,
                    Icons.location_on,
                    'Location',
                    event.location,
                    isClickable: true,
                  ),
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
                if (event.tags != null && event.tags!.isNotEmpty) ...<Widget>[
                  AppText.titleMedium(
                    'Tags',
                    color: context.colors.onSurface,
                  ),
                  SizedBox(height: 8.h),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: event.tags!.map((String tag) => Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: context.colors.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: AppText.bodySmall(
                          tag,
                          color: context.colors.onSurfaceVariant,
                        ),
                      )).toList(),
                  ),
                  SizedBox(height: 120.h), // Increased space for bottom button and scrolling
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value, {
    bool isClickable = false,
  }) =>
      Row(
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
                Row(
                  children: [
                    Expanded(
                      child: AppText.bodyLarge(
                        value,
                        color: context.colors.onSurface,
                      ),
                    ),
                    if (isClickable)
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 14.sp,
                        color: context.colors.onSurfaceVariant,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  String _formatDateTime(DateTime start, DateTime end) {
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    
    final weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    
    // Helper to format time in 12-hour format
    String formatTime(DateTime dt) {
      final hour = dt.hour == 0 ? 12 : (dt.hour > 12 ? dt.hour - 12 : dt.hour);
      final minute = dt.minute.toString().padLeft(2, '0');
      final period = dt.hour >= 12 ? 'PM' : 'AM';
      return '$hour:$minute $period';
    }
    
    final startDay = weekdays[start.weekday - 1];
    final startMonth = months[start.month - 1];
    final startDate = '${start.day}';
    final startYear = start.year;
    final startTime = formatTime(start);
    
    // Same day event
    if (start.day == end.day && start.month == end.month && start.year == end.year) {
      final endTime = formatTime(end);
      return '$startDay, $startMonth $startDate, $startYear\n$startTime - $endTime';
    }
    
    // Multi-day event
    final endDay = weekdays[end.weekday - 1];
    final endMonth = months[end.month - 1];
    final endDate = '${end.day}';
    final endYear = end.year;
    final endTime = formatTime(end);
    
    return '$startDay, $startMonth $startDate, $startYear at $startTime\nto $endDay, $endMonth $endDate, $endYear at $endTime';
  }
}
