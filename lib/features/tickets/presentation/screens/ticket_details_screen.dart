import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/tickets_provider.dart';
import 'package:fajimobileapp/features/tickets/data/models/ticket_details_model.dart';

class TicketDetailsScreen extends ConsumerStatefulWidget {
  const TicketDetailsScreen({
    super.key,
    required this.ticketId,
  });

  final String ticketId;

  @override
  ConsumerState<TicketDetailsScreen> createState() =>
      _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends ConsumerState<TicketDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(ticketDetailsProvider.notifier).loadDetails(widget.ticketId);
    });
  }

  void _shareTicket() {
    final details = ref.read(ticketDetailsProvider).details;
    if (details != null) {
      final event = details.event;
      final ticket = details.ticket;
      
      final shareText = '''
🎟️ ${event.name}

📅 ${_formatDate(event.startDate)}
⏰ ${_formatTime(event.startDate)}
📍 ${event.location.address}

Ticket: ${ticket.ticketNumber}
Status: ${ticket.status}

Hosted by ${event.host.name}
''';
      
      Share.share(
        shareText,
        subject: 'My ticket for ${event.name}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailsState = ref.watch(ticketDetailsProvider);

    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        title: AppText.titleLarge('Ticket Details'),
        backgroundColor: context.colors.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          if (detailsState.details != null)
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: _shareTicket,
            ),
        ],
      ),
      body: detailsState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : detailsState.error != null
              ? _buildError(detailsState.error!)
              : detailsState.details == null
                  ? const Center(child: Text('No ticket details'))
                  : _buildTicketDetails(detailsState.details!),
    );
  }

  Widget _buildTicketDetails(TicketDetailsModel details) {
    final ticket = details.ticket;
    final event = details.event;
    final order = details.order;
    final imageUrl = event.imageUrl ?? event.media.poster;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Image
          if (imageUrl.isNotEmpty)
            CachedNetworkImage(
              imageUrl: imageUrl,
              height: 250.h,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                height: 250.h,
                color: context.colors.surfaceContainerHighest,
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                height: 250.h,
                color: context.colors.surfaceContainerHighest,
                child: Icon(
                  Icons.image_not_supported,
                  color: context.colors.onSurfaceVariant,
                  size: 64.sp,
                ),
              ),
            ),

          Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event Name
                AppText.headlineMedium(
                  event.name,
                  color: context.colors.onSurface,
                ),
                SizedBox(height: 8.h),
                
                // Status Badge
                _buildStatusBadge(ticket.status),
                
                SizedBox(height: 32.h),

                // QR Code Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    children: [
                      if (ticket.qrCode != null && ticket.qrCode!.isNotEmpty)
                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Image.network(
                            ticket.qrCode!,
                            width: 200.w,
                            height: 200.w,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => _buildQRPlaceholder(),
                          ),
                        )
                      else
                        _buildQRPlaceholder(),
                      SizedBox(height: 16.h),
                      AppText.titleMedium(
                        ticket.ticketNumber,
                        textAlign: TextAlign.center,
                        color: context.colors.onSurface,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32.h),

                // Event Details Section
                AppText.titleLarge(
                  'Event Details',
                  color: context.colors.onSurface,
                ),
                SizedBox(height: 16.h),
                
                _buildInfoRow(
                  Icons.calendar_today,
                  'Date',
                  _formatDate(event.startDate),
                ),
                SizedBox(height: 12.h),
                _buildInfoRow(
                  Icons.access_time,
                  'Time',
                  _formatTime(event.startDate),
                ),
                SizedBox(height: 12.h),
                _buildInfoRow(
                  Icons.location_on,
                  'Location',
                  event.location.address,
                ),
                SizedBox(height: 12.h),
                _buildInfoRow(
                  Icons.person,
                  'Host',
                  event.host.name,
                ),

                SizedBox(height: 32.h),

                // Order Details Section
                AppText.titleLarge(
                  'Order Details',
                  color: context.colors.onSurface,
                ),
                SizedBox(height: 16.h),
                
                _buildInfoRow(
                  Icons.receipt,
                  'Order Number',
                  order.orderNumber,
                ),
                SizedBox(height: 12.h),
                _buildInfoRow(
                  Icons.payment,
                  'Total Paid',
                  '\$${order.total.toStringAsFixed(2)} ${order.currency}',
                ),
                SizedBox(height: 12.h),
                _buildInfoRow(
                  Icons.check_circle,
                  'Purchase Date',
                  _formatDate(ticket.purchaseDate),
                ),

                SizedBox(height: 32.h),

                // Action Buttons
                if (ticket.status.toLowerCase() == 'valid') ...[
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push('/event-details/${event.id}');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: context.colors.primary,
                        foregroundColor: context.colors.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: AppText.titleMedium(
                        'View Event Details',
                        color: context.colors.onPrimary,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: OutlinedButton.icon(
                      onPressed: _shareTicket,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: context.colors.primary,
                        side: BorderSide(color: context.colors.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      icon: const Icon(Icons.share),
                      label: AppText.titleMedium(
                        'Share Ticket',
                        color: context.colors.primary,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQRPlaceholder() => Container(
        width: 200.w,
        height: 200.w,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.qr_code,
                size: 80.sp,
                color: context.colors.onSurfaceVariant,
              ),
              SizedBox(height: 8.h),
              AppText.bodySmall(
                'QR Code',
                color: context.colors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      );

  Widget _buildInfoRow(IconData icon, String label, String value) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20.sp,
            color: context.colors.primary,
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
                AppText.bodyMedium(
                  value,
                  color: context.colors.onSurface,
                ),
              ],
            ),
          ),
        ],
      );

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
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: AppText.bodySmall(
        label,
        color: textColor,
      ),
    );
  }

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
            AppText.titleLarge('Error Loading Ticket'),
            SizedBox(height: 8.h),
            AppText.bodyMedium(
              error,
              color: context.colors.onSurfaceVariant,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(ticketDetailsProvider.notifier)
                    .loadDetails(widget.ticketId);
              },
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
    if (dateStr.isEmpty) return 'N/A';
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

  String _formatTime(String dateStr) {
    if (dateStr.isEmpty) return 'N/A';
    try {
      final date = DateTime.parse(dateStr);
      final hour = date.hour > 12 ? date.hour - 12 : date.hour;
      final period = date.hour >= 12 ? 'PM' : 'AM';
      final minute = date.minute.toString().padLeft(2, '0');
      return '$hour:$minute $period';
    } catch (e) {
      return dateStr;
    }
  }
}
