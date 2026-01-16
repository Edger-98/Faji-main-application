import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/cohost_marketplace/data/repositories/marketplace_repository.dart';
import 'package:fajimobileapp/features/cohost_marketplace/presentation/providers/marketplace_providers.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/booking_entity.dart';

/// Screen for hosts to send booking requests to vendors
/// CRITICAL: Only hosts can initiate bookings (vendors are passive)
class VendorBookingRequestScreen extends ConsumerStatefulWidget {
  final String vendorId;
  final String serviceId;

  const VendorBookingRequestScreen({
    super.key,
    required this.vendorId,
    required this.serviceId,
  });

  @override
  ConsumerState<VendorBookingRequestScreen> createState() => _VendorBookingRequestScreenState();
}

class _VendorBookingRequestScreenState extends ConsumerState<VendorBookingRequestScreen> {
  final TextEditingController _messageController = TextEditingController();
  String? _selectedEventId;
  bool _isLoading = false;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: context.colors.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Send Booking Request',
          style: AppTypography.titleLarge.copyWith(
            color: context.colors.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vendor info
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: context.colors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.eventCardYellow.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.store_rounded,
                      color: AppColors.eventCardYellow,
                      size: 28.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Elite Photography Studio',
                          style: AppTypography.titleSmall.copyWith(
                            color: context.colors.onSurface,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Event Photography Package',
                          style: AppTypography.bodySmall.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '\$500.00',
                          style: AppTypography.bodyMedium.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),

            // Select event
            Text(
              'Select Event',
              style: AppTypography.titleSmall.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 12.h),

            // Event list (only host's events)
            _buildEventOption(
              eventId: 'event_1',
              eventName: 'Summer Music Festival 2025',
              eventDate: 'Jul 15, 2025',
            ),
            _buildEventOption(
              eventId: 'event_2',
              eventName: 'Tech Conference 2025',
              eventDate: 'Aug 20, 2025',
            ),

            SizedBox(height: 32.h),

            // Message
            Text(
              'Message to Vendor',
              style: AppTypography.titleSmall.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 12.h),

            TextField(
              controller: _messageController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Tell the vendor about your event and requirements...',
                filled: true,
                fillColor: context.colors.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 32.h),

            // Info banner
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: context.colors.primary.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: context.colors.primary,
                    size: 20.sp,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      'The vendor will review your request and can accept or decline. Payment is processed after event completion.',
                      style: AppTypography.bodySmall.copyWith(
                        color: context.colors.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Send button
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: (_selectedEventId != null && !_isLoading) ? _sendBookingRequest : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.primary,
                  disabledBackgroundColor: context.colors.onSurfaceVariant.withValues(alpha: 0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                child: _isLoading
                    ? SizedBox(
                        width: 20.w,
                        height: 20.h,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        'Send Booking Request',
                        style: AppTypography.labelLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventOption({
    required String eventId,
    required String eventName,
    required String eventDate,
  }) {
    final isSelected = _selectedEventId == eventId;

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() => _selectedEventId = eventId);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colors.primary.withValues(alpha: 0.1)
              : context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected
                ? context.colors.primary
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colors.primary.withValues(alpha: 0.2)
                    : context.colors.onSurfaceVariant.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                Icons.event_rounded,
                color: isSelected
                    ? context.colors.primary
                    : context.colors.onSurfaceVariant,
                size: 20.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: AppTypography.bodyMedium.copyWith(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    eventDate,
                    style: AppTypography.bodySmall.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle_rounded,
                color: context.colors.primary,
                size: 24.sp,
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendBookingRequest() async {
    if (_selectedEventId == null) return;
    
    setState(() => _isLoading = true);
    HapticFeedback.mediumImpact();
    
    try {
      print('📤 Sending booking request...');
      print('   vendorId: ${widget.vendorId}');
      print('   serviceId: ${widget.serviceId}');
      print('   eventId: $_selectedEventId');
      print('   message: ${_messageController.text}');
      
      final repository = ref.read(marketplaceRepositoryProvider);
      
      // Create booking with upfront payment option (default)
      final result = await repository.createBooking(
        eventId: _selectedEventId!,
        cohostId: widget.vendorId,
        resourceId: widget.serviceId,
        paymentOption: PaymentOption.upfrontPayment,
        offeredPrice: 500.0, // TODO: Get actual price from vendor service
        message: _messageController.text.isNotEmpty ? _messageController.text : null,
        eventDate: DateTime.now().add(const Duration(days: 30)), // TODO: Get from selected event
      );
      
      if (!mounted) return;
      
      setState(() => _isLoading = false);
      
      result.when(
        success: (booking) {
          print('✅ Booking request sent successfully');
          print('   bookingId: ${booking.id}');
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Booking request sent! The vendor will review it.'),
              backgroundColor: context.colors.primary,
              duration: const Duration(seconds: 3),
            ),
          );
          
          context.pop();
        },
        failure: (error) {
          print('❌ Booking request failed: $error');
          
          // Show user-friendly error message
          String errorMessage = 'Failed to send booking request';
          if (error.contains('Network') || error.contains('Connection')) {
            errorMessage = 'Network error. Please check your connection.';
          } else if (error.contains('401') || error.contains('Unauthorized')) {
            errorMessage = 'Session expired. Please login again.';
          } else if (error.contains('400') || error.contains('Bad Request')) {
            errorMessage = 'Invalid booking data. Please try again.';
          } else if (error.contains('404')) {
            errorMessage = 'Vendor or service not found.';
          } else if (error.contains('500')) {
            errorMessage = 'Server error. Please try again later.';
          }
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: context.colors.error,
              duration: const Duration(seconds: 4),
            ),
          );
        },
      );
    } catch (e, stackTrace) {
      print('💥 Exception in _sendBookingRequest: $e');
      print('Stack trace: $stackTrace');
      
      if (!mounted) return;
      
      setState(() => _isLoading = false);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: context.colors.error,
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }
}
