import 'package:fajimobileapp/core/network/api_result.dart';
import 'package:fajimobileapp/features/cohost_marketplace/data/repositories/marketplace_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/cohost_resource_entity.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/booking_entity.dart';
import 'package:fajimobileapp/features/cohost_marketplace/presentation/providers/marketplace_providers.dart';

/// Screen for negotiating booking terms with a vendor
class BookingNegotiationScreen extends ConsumerStatefulWidget {
  const BookingNegotiationScreen({
    required this.resource,
    required this.eventId,
    super.key,
  });

  final CohostResourceEntity resource;
  final String eventId;

  @override
  ConsumerState<BookingNegotiationScreen> createState() => _BookingNegotiationScreenState();
}

class _BookingNegotiationScreenState extends ConsumerState<BookingNegotiationScreen> {
  PaymentOption _selectedPaymentOption = PaymentOption.upfrontPayment;
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _percentageController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _priceController.text = widget.resource.basePrice.toStringAsFixed(0);
  }

  @override
  void dispose() {
    _priceController.dispose();
    _percentageController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  String _formatPrice(double price) {
    if (price >= 1000000) {
      return '₦${(price / 1000000).toStringAsFixed(1)}M';
    } else if (price >= 1000) {
      return '₦${(price / 1000).toStringAsFixed(0)}K';
    }
    return '₦${price.toStringAsFixed(0)}';
  }

  Future<void> _sendBookingRequest() async {
    if (_selectedPaymentOption == PaymentOption.upfrontPayment && _priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter an offer amount'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (_selectedPaymentOption == PaymentOption.ticketSalesSplit && _percentageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a percentage split'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final MarketplaceRepository repository = ref.read(marketplaceRepositoryProvider);
      
      final ApiResult<BookingEntity> result = await repository.createBooking(
        eventId: widget.eventId,
        cohostId: widget.resource.cohostId,
        resourceId: widget.resource.id,
        paymentOption: _selectedPaymentOption,
        offeredPrice: _selectedPaymentOption == PaymentOption.upfrontPayment
            ? double.parse(_priceController.text)
            : 0.0,
        percentageSplit: _selectedPaymentOption == PaymentOption.ticketSalesSplit
            ? double.parse(_percentageController.text)
            : null,
        message: _messageController.text.isNotEmpty ? _messageController.text : null,
      );

      if (!mounted) return;

      result.when(
        success: (BookingEntity booking) {
          // Show success dialog
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext dialogContext) => AlertDialog(
              backgroundColor: AppColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: AppColors.success.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      size: 50.sp,
                      color: AppColors.success,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Request Sent!',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.onSurface,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Your booking request has been sent to ${widget.resource.cohostName}',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 14.sp,
                      color: AppColors.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.onPrimary,
                      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 32.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'Done',
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        failure: (String error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
              backgroundColor: AppColors.error,
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              child: Row(
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: const BoxDecoration(
                      color: AppColors.searchBarBackground,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                      color: AppColors.onSurface,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      'Send Booking Request',
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  SizedBox(height: 20.h),

                  // Vendor summary card
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: const Color(0xFF3A3A3A),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: widget.resource.category.color.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              widget.resource.cohostName[0],
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: widget.resource.category.color,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.resource.cohostName,
                                style: TextStyle(
                                  fontFamily: AppTypography.modicaPro,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.onSurface,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                widget.resource.title,
                                style: TextStyle(
                                  fontFamily: AppTypography.modicaPro,
                                  fontSize: 13.sp,
                                  color: AppColors.onSurfaceVariant,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Base Price',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 11.sp,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                            Text(
                              _formatPrice(widget.resource.basePrice),
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // Payment option selection
                  Text(
                    'Choose Payment Option',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // Option A: Upfront Payment
                  GestureDetector(
                    onTap: () => setState(() => _selectedPaymentOption = PaymentOption.upfrontPayment),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.all(18.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: _selectedPaymentOption == PaymentOption.upfrontPayment
                              ? AppColors.primary
                              : const Color(0xFF3A3A3A),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4CAF50).withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Icon(
                                  Icons.payments_rounded,
                                  color: const Color(0xFF4CAF50),
                                  size: 20.sp,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Text(
                                  'Pay Upfront',
                                  style: TextStyle(
                                    fontFamily: AppTypography.modicaPro,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.onSurface,
                                  ),
                                ),
                              ),
                              if (_selectedPaymentOption == PaymentOption.upfrontPayment)
                                Icon(
                                  Icons.check_circle,
                                  color: AppColors.primary,
                                  size: 24.sp,
                                ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Pay a fixed amount directly to the vendor',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 13.sp,
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // Option B: Ticket Sales Split
                  GestureDetector(
                    onTap: () => setState(() => _selectedPaymentOption = PaymentOption.ticketSalesSplit),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.all(18.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: _selectedPaymentOption == PaymentOption.ticketSalesSplit
                              ? AppColors.primary
                              : const Color(0xFF3A3A3A),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: AppColors.eventCardYellow.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Icon(
                                  Icons.percent_rounded,
                                  color: AppColors.eventCardYellow,
                                  size: 20.sp,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Text(
                                  'Revenue Split',
                                  style: TextStyle(
                                    fontFamily: AppTypography.modicaPro,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.onSurface,
                                  ),
                                ),
                              ),
                              if (_selectedPaymentOption == PaymentOption.ticketSalesSplit)
                                Icon(
                                  Icons.check_circle,
                                  color: AppColors.primary,
                                  size: 24.sp,
                                ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Pay a percentage of ticket sales revenue',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 13.sp,
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // Price/Percentage input
                  if (_selectedPaymentOption == PaymentOption.upfrontPayment) ...[
                    Text(
                      'Your Offer',
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: const Color(0xFF3A3A3A),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '₦',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onSurface,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: TextField(
                              controller: _priceController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurface,
                              ),
                              decoration: InputDecoration(
                                hintText: '0',
                                hintStyle: TextStyle(
                                  color: AppColors.onSurfaceVariant.withOpacity(0.5),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    Text(
                      'Revenue Split Percentage',
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: const Color(0xFF3A3A3A),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _percentageController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                FilteringTextInputFormatter.allow(RegExp(r'^\d{0,2}$')),
                              ],
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurface,
                              ),
                              decoration: InputDecoration(
                                hintText: '0',
                                hintStyle: TextStyle(
                                  color: AppColors.onSurfaceVariant.withOpacity(0.5),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
                              ),
                            ),
                          ),
                          Text(
                            '%',
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  SizedBox(height: 32.h),

                  // Message (optional)
                  Text(
                    'Message (Optional)',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: const Color(0xFF3A3A3A),
                        width: 1.5,
                      ),
                    ),
                    child: TextField(
                      controller: _messageController,
                      maxLines: 4,
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 14.sp,
                        color: AppColors.onSurface,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Add a message to the vendor...',
                        hintStyle: TextStyle(
                          color: AppColors.onSurfaceVariant.withOpacity(0.5),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),

                  // Send request button
                  GestureDetector(
                    onTap: _isLoading ? null : _sendBookingRequest,
                    child: Container(
                      height: 64.h,
                      decoration: BoxDecoration(
                        color: _isLoading ? AppColors.onSurfaceVariant : Colors.white,
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                      child: Center(
                        child: _isLoading
                            ? SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Send Request',
                                    style: TextStyle(
                                      fontFamily: AppTypography.modicaPro,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Icon(
                                    Icons.send_rounded,
                                    color: Colors.black,
                                    size: 20.sp,
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
}
