import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/purchase_ticket_response.dart';
import 'package:fajimobileapp/features/tickets/domain/usecases/purchase_tickets_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/services/stripe_service.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/tickets/domain/entities/purchase_ticket_request.dart';
import 'package:fajimobileapp/features/tickets/presentation/providers/ticket_providers.dart';

/// Bottom sheet for buying tickets
class BuyTicketBottomSheet extends ConsumerStatefulWidget {

  const BuyTicketBottomSheet({
    super.key,
    required this.event,
  });
  final EventEntity event;

  @override
  ConsumerState<BuyTicketBottomSheet> createState() => _BuyTicketBottomSheetState();

  static Future<void> show(BuildContext context, EventEntity event) => showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BuyTicketBottomSheet(event: event),
    );
}

class _BuyTicketBottomSheetState extends ConsumerState<BuyTicketBottomSheet> {
  int _ticketCount = 1;
  final TextEditingController _promoController = TextEditingController();
  bool _promoApplied = false;
  double _discount = 0;
  bool _isProcessing = false;

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  double get _subtotal => widget.event.price * _ticketCount;
  double get _total => _subtotal - _discount;

  void _incrementTickets() {
    if (_ticketCount < widget.event.availableTickets && _ticketCount < 10) {
      setState(() => _ticketCount++);
      HapticFeedback.lightImpact();
    }
  }

  void _decrementTickets() {
    if (_ticketCount > 1) {
      setState(() => _ticketCount--);
      HapticFeedback.lightImpact();
    }
  }

  void _applyPromo() {
    // TODO: Implement promo code validation
    setState(() {
      _promoApplied = true;
      _discount = _subtotal * 0.1; // 10% discount for demo
    });
    HapticFeedback.mediumImpact();
  }

  Future<void> _proceedToPayment() async {
    if (_isProcessing) return;
    
    setState(() => _isProcessing = true);
    HapticFeedback.mediumImpact();

    try {
      print('🎫 Purchasing tickets...');
      print('   Event ID: ${widget.event.id}');
      print('   Quantity: $_ticketCount');
      print('   Promo Code: ${_promoController.text.isEmpty ? "none" : _promoController.text}');

      final PurchaseTicketsUseCase purchaseUseCase = ref.read(purchaseTicketsUseCaseProvider);
      
      final PurchaseTicketRequest request = PurchaseTicketRequest(
        eventId: widget.event.id,
        quantity: _ticketCount,
        promoCode: _promoController.text.isEmpty ? null : _promoController.text,
        paymentMethod: 'stripe', // Use Stripe as required by backend
      );

      final Either<Failure, PurchaseTicketResponse> result = await purchaseUseCase(request);

      if (!mounted) return;

      result.fold(
        (Failure failure) {
          print('❌ Purchase failed: ${failure.message}');
          setState(() => _isProcessing = false);
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.message ?? 'Failed to purchase tickets'),
              backgroundColor: context.colors.error,
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        (PurchaseTicketResponse response) async {
          print('✅ Purchase successful!');
          print('   Order ID: ${response.orderId}');
          print('   Tickets: ${response.tickets.length}');
          print('   Payment URL: ${response.payment.paymentUrl}');
          print('   Client Secret: ${response.payment.clientSecret}');
          print('   Total: ${response.payment.total} ${response.payment.currency}');

          // Check if this is a free event
          if (response.payment.total == 0 || widget.event.isFree) {
            // Free ticket - no payment needed
            Navigator.pop(context);
            
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Free tickets claimed successfully! Order: ${response.orderId}'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 3),
                ),
              );
            }
            
            setState(() => _isProcessing = false);
            return;
          }

          // Check if we have a client secret for Stripe payment
          if (response.payment.clientSecret != null && response.payment.clientSecret!.isNotEmpty) {
            print('💳 Processing Stripe payment with client secret');
            print('💳 Client Secret: ${response.payment.clientSecret}');
            
            try {
              // Create Stripe service instance
              final StripeService stripeService = StripeService();
              
              print('💳 Calling presentPaymentSheet...');
              
              // Present Stripe payment sheet
              final bool success = await stripeService.presentPaymentSheet(
                clientSecret: response.payment.clientSecret!,
              );

              print('💳 Payment sheet result: $success');

              if (!mounted) return;

              if (success) {
                // Payment successful
                Navigator.pop(context);
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Payment successful! Order: ${response.orderId}'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 3),
                  ),
                );
              } else {
                // Payment failed or cancelled
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Payment cancelled or failed'),
                    backgroundColor: context.colors.error,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            } catch (e, stackTrace) {
              print('❌ Stripe payment error: $e');
              print('❌ Stack trace: $stackTrace');
              
              if (mounted) {
                var errorMessage = 'Payment error occurred';
                
                // Check for specific Stripe configuration errors
                if (e.toString().contains('STRIPE NOT CONFIGURED') || 
                    e.toString().contains('Publishable key')) {
                  errorMessage = '''
Stripe payment is not configured properly.

To fix this:
1. Get your Stripe publishable key from https://dashboard.stripe.com/test/apikeys
2. Update the .env file with your real key
3. Hot restart the app

Contact support if you need help setting up payments.
                  ''';
                } else if (e.toString().contains('StripeConfigException')) {
                  errorMessage = 'Payment system configuration error. Please contact support.';
                } else if (e.toString().contains('not initialized')) {
                  errorMessage = 'Payment system not initialized. Please restart the app.';
                } else {
                  errorMessage = 'Payment failed: ${e}';
                }
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(errorMessage),
                    backgroundColor: context.colors.error,
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(seconds: 8),
                  ),
                );
              }
            }
          } else if (response.payment.paymentUrl != null && response.payment.paymentUrl!.isNotEmpty) {
            // Fallback: Use payment URL if no client secret
            print('🌐 Opening payment URL (fallback)');
            
            Navigator.pop(context);
            
            final Uri uri = Uri.parse(response.payment.paymentUrl!);
            if (await canLaunchUrl(uri)) {
              await launchUrl(
                uri,
                mode: LaunchMode.externalApplication,
              );
              
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Opening payment page...'),
                    backgroundColor: context.colors.primary,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            } else {
              print('❌ Cannot launch payment URL');
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Failed to open payment page'),
                    backgroundColor: context.colors.error,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            }
          } else {
            // No payment method available
            print('❌ No payment method available');
            
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Payment configuration error'),
                  backgroundColor: context.colors.error,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          }

          setState(() => _isProcessing = false);
        },
      );
    } catch (e, stackTrace) {
      print('💥 Exception during purchase: $e');
      print('Stack trace: $stackTrace');
      
      if (mounted) {
        setState(() => _isProcessing = false);
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e}'),
            backgroundColor: context.colors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if event is sold out or free
    final bool isSoldOut = widget.event.isSoldOut;
    final bool isFree = widget.event.isFree;
    
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) => Column(
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

              // Content
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
                  children: [
                    // Header
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isSoldOut ? 'Sold Out' : (isFree ? 'Free Event' : 'Buy Tickets'),
                                style: AppTypography.headlineMedium.copyWith(
                                  color: isSoldOut ? context.colors.error : context.colors.onSurface,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                widget.event.title,
                                style: AppTypography.bodyMedium.copyWith(
                                  color: context.colors.onSurfaceVariant,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
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

                    SizedBox(height: 24.h),

                    // Event image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.network(
                        widget.event.imageUrl,
                        height: 120.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 120.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                context.colors.primary.withOpacity(0.3),
                                context.colors.primary.withOpacity(0.1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Icon(
                            Icons.image_outlined,
                            size: 48.sp,
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Ticket quantity selector
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: context.colors.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Number of Tickets',
                                    style: AppTypography.titleMedium.copyWith(
                                      color: context.colors.onSurface,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    '${widget.event.availableTickets} available',
                                    style: AppTypography.bodySmall.copyWith(
                                      color: context.colors.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  // Decrement button
                                  GestureDetector(
                                    onTap: _decrementTickets,
                                    child: Container(
                                      width: 36.w,
                                      height: 36.h,
                                      decoration: BoxDecoration(
                                        color: _ticketCount > 1
                                            ? context.colors.primary
                                            : context.colors.onSurfaceVariant.withOpacity(0.2),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: _ticketCount > 1
                                            ? Colors.white
                                            : context.colors.onSurfaceVariant,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  // Count
                                  Container(
                                    width: 48.w,
                                    alignment: Alignment.center,
                                    child: Text(
                                      _ticketCount.toString().padLeft(2, '0'),
                                      style: AppTypography.headlineMedium.copyWith(
                                        color: context.colors.onSurface,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  // Increment button
                                  GestureDetector(
                                    onTap: _incrementTickets,
                                    child: Container(
                                      width: 36.w,
                                      height: 36.h,
                                      decoration: BoxDecoration(
                                        color: context.colors.primary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Promo code
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: context.colors.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _promoController,
                              enabled: !_promoApplied,
                              decoration: InputDecoration(
                                hintText: 'Enter promo code',
                                hintStyle: AppTypography.bodyMedium.copyWith(
                                  color: context.colors.onSurfaceVariant,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                prefixIcon: Icon(
                                  Icons.local_offer_outlined,
                                  color: context.colors.primary,
                                  size: 20.sp,
                                ),
                              ),
                              style: AppTypography.bodyMedium.copyWith(
                                color: context.colors.onSurface,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: _promoApplied ? null : _applyPromo,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              decoration: BoxDecoration(
                                color: _promoApplied
                                    ? Colors.green
                                    : context.colors.primary,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                _promoApplied ? 'Applied' : 'Apply',
                                style: AppTypography.bodyMedium.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 24.h),

                    // Price breakdown
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: context.colors.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        children: [
                          _buildPriceRow(
                            'Subtotal',
                            '\$${_subtotal.toStringAsFixed(2)}',
                            context,
                          ),
                          if (_promoApplied) ...[
                            SizedBox(height: 12.h),
                            _buildPriceRow(
                              'Discount',
                              '-\$${_discount.toStringAsFixed(2)}',
                              context,
                              color: Colors.green,
                            ),
                          ],
                          SizedBox(height: 12.h),
                          Divider(color: context.colors.onSurfaceVariant.withOpacity(0.2)),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: AppTypography.titleLarge.copyWith(
                                  color: context.colors.onSurface,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                '\$${_total.toStringAsFixed(2)}',
                                style: AppTypography.titleLarge.copyWith(
                                  color: context.colors.primary,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Info note
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: context.colors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: context.colors.primary,
                            size: 20.sp,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              'Payment held in escrow until event verification',
                              style: AppTypography.bodySmall.copyWith(
                                color: context.colors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 80.h), // Space for button
                  ],
                ),
              ),

              // Bottom button
              Container(
                padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
                decoration: BoxDecoration(
                  color: context.colors.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isProcessing ? null : _proceedToPayment,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isProcessing 
                            ? context.colors.primary.withOpacity(0.5)
                            : context.colors.primary,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: _isProcessing
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20.w,
                                  height: 20.h,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  'Processing...',
                                  style: AppTypography.titleMedium.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Proceed to Payment',
                                  style: AppTypography.titleMedium.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 20.sp,
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, BuildContext context, {Color? color}) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.bodyMedium.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: AppTypography.bodyLarge.copyWith(
            color: color ?? context.colors.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
}
