import 'package:cached_network_image/cached_network_image.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/booking.dart';
import 'package:fajimobileapp/features/marketplace/presentation/providers/marketplace_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VendorDetailScreen extends ConsumerStatefulWidget {

  const VendorDetailScreen({
    super.key,
    required this.vendor,
  });
  final Map<String, dynamic> vendor;

  @override
  ConsumerState<VendorDetailScreen> createState() => _VendorDetailScreenState();
}

class _VendorDetailScreenState extends ConsumerState<VendorDetailScreen> {
  int _selectedTab = 0;

  void _showBookingDialog() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _BookingDialog(vendor: widget.vendor),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> vendor = widget.vendor;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: <Widget>[
          // App Bar with Image
          SliverAppBar(
            expandedHeight: 300.h,
            pinned: true,
            backgroundColor: AppColors.surface,
            leading: Container(
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.surface.withValues(alpha: 0.9),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                color: AppColors.onSurface,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.surface.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, size: 20),
                  color: AppColors.onSurface,
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Added to favorites')),
                    );
                  },
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: vendor['image'] as String,
                    fit: BoxFit.cover,
                    placeholder: (BuildContext context, String url) => ColoredBox(
                      color: AppColors.surfaceContainerHighest,
                      child: const Center(
                        child: CircularProgressIndicator(color: AppColors.primary),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.transparent,
                          AppColors.background.withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Header
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Flexible(
                                  child: Text(
                                    vendor['name'] as String,
                                    style: AppTypography.headlineMedium.copyWith(
                                      color: AppColors.onSurface,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                if (vendor['verified'] as bool) ...<Widget>[
                                  SizedBox(width: 8.w),
                                  Icon(
                                    Icons.verified,
                                    color: AppColors.successGreen,
                                    size: 24.sp,
                                  ),
                                ],
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              vendor['category'] as String,
                              style: AppTypography.bodyLarge.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // Rating & Reviews
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star_rounded,
                        color: AppColors.eventCardYellow,
                        size: 24.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '${vendor['rating'].toStringAsFixed(1)}',
                        style: AppTypography.titleLarge.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        '(${vendor['reviews']} reviews)',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // Price
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Starting Price',
                          style: AppTypography.bodyLarge.copyWith(
                            color: AppColors.onSurface,
                          ),
                        ),
                        Text(
                          vendor['price'] as String,
                          style: AppTypography.titleLarge.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // Tabs
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: _buildTab('About', 0),
                        ),
                        Expanded(
                          child: _buildTab('Services', 1),
                        ),
                        Expanded(
                          child: _buildTab('Reviews', 2),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Tab Content
                  if (_selectedTab == 0) _buildAboutTab(),
                  if (_selectedTab == 1) _buildServicesTab(),
                  if (_selectedTab == 2) _buildReviewsTab(),

                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: _showBookingDialog,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Text(
              'Book Now',
              style: AppTypography.labelLarge.copyWith(
                color: AppColors.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final bool isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() => _selectedTab = index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTypography.bodyMedium.copyWith(
            color: isSelected ? AppColors.onPrimary : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildAboutTab() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'Professional ${widget.vendor['category'].toString().toLowerCase()} services for your special events. We bring years of experience and dedication to make your event memorable.',
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'Specialties',
          style: AppTypography.titleMedium.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        _buildSpecialtyChip('Weddings'),
        SizedBox(height: 8.h),
        _buildSpecialtyChip('Corporate Events'),
        SizedBox(height: 8.h),
        _buildSpecialtyChip('Birthday Parties'),
        SizedBox(height: 8.h),
        _buildSpecialtyChip('Private Events'),
      ],
    );

  Widget _buildSpecialtyChip(String text) => Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: AppColors.primary,
            size: 20.sp,
          ),
          SizedBox(width: 12.w),
          Text(
            text,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.onSurface,
            ),
          ),
        ],
      ),
    );

  Widget _buildServicesTab() {
    final List<Map<String, String>> services = <Map<String, String>>[
      <String, String>{'name': 'Basic Package', 'price': r'$500', 'duration': '4 hours'},
      <String, String>{'name': 'Standard Package', 'price': r'$800', 'duration': '6 hours'},
      <String, String>{'name': 'Premium Package', 'price': r'$1,200', 'duration': '8 hours'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Available Packages',
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        ...services.map((Map<String, String> service) => Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      service['name']!,
                      style: AppTypography.titleMedium.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      service['duration']!,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                service['price']!,
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _buildReviewsTab() {
    final List<Map<String, Object>> reviews = <Map<String, Object>>[
      <String, Object>{
        'name': 'Sarah Johnson',
        'rating': 5,
        'date': '2 weeks ago',
        'comment': 'Absolutely amazing service! Highly professional and exceeded our expectations.',
      },
      <String, Object>{
        'name': 'Michael Chen',
        'rating': 5,
        'date': '1 month ago',
        'comment': 'Great experience from start to finish. Would definitely recommend!',
      },
      <String, Object>{
        'name': 'Emily Davis',
        'rating': 4,
        'date': '2 months ago',
        'comment': 'Very good service, minor delays but overall satisfied with the results.',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Customer Reviews',
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16.h),
        ...reviews.map((Map<String, Object> review) => Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                    child: Text(
                      (review['name']! as String).substring(0, 1),
                      style: AppTypography.titleMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          review['name']! as String,
                          style: AppTypography.bodyLarge.copyWith(
                            color: AppColors.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          review['date']! as String,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (int index) => Icon(
                        index < (review['rating']! as int)
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        color: AppColors.eventCardYellow,
                        size: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                review['comment']! as String,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}

class _BookingDialog extends ConsumerStatefulWidget {
  const _BookingDialog({required this.vendor});
  
  final Map<String, dynamic> vendor;

  @override
  ConsumerState<_BookingDialog> createState() => _BookingDialogState();
}

class _BookingDialogState extends ConsumerState<_BookingDialog> {
  String? _selectedEventId;
  String _paymentOption = 'upfrontPayment';
  bool _isSubmitting = false;
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _percentageSplitController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userEventsProvider.notifier).getUserEvents();
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _priceController.dispose();
    _percentageSplitController.dispose();
    super.dispose();
  }

  Future<void> _submitBooking() async {
    if (_selectedEventId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an event')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      if (_paymentOption == 'ticketSalesSplit') {
        final pct = double.tryParse(_percentageSplitController.text);
        if (pct == null || pct <= 0 || pct >= 100) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Enter a valid percentage split (1–99)')),
          );
          setState(() => _isSubmitting = false);
          return;
        }
      }

      print('🎯 BOOKING: vendorId=${widget.vendor['vendorId']}, resourceId=${widget.vendor['id']}, eventId=$_selectedEventId');

      final CreateBookingRequest request = CreateBookingRequest(
        eventId: _selectedEventId!,
        vendorId: widget.vendor['vendorId'] as String,
        resourceId: widget.vendor['id'] as String,
        paymentOption: _paymentOption,
        offeredPrice: double.tryParse(_priceController.text),
        percentageSplit: _paymentOption == 'ticketSalesSplit'
            ? double.tryParse(_percentageSplitController.text)
            : null,
        message: _messageController.text.isNotEmpty ? _messageController.text : null,
      );

      print('🎯 BOOKING: Sending request: ${request.toJson()}');
      await ref.read(marketplaceViewModelProvider.notifier).createBooking(request: request);
      print('🎯 BOOKING: createBooking() returned');

      if (!mounted) return;

      final bookingState = ref.read(marketplaceViewModelProvider).createBookingState;
      bookingState.when(
        initial: () {},
        loading: () {},
        success: (_) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Booking request sent to ${widget.vendor['name']}'),
              backgroundColor: AppColors.successGreen,
            ),
          );
        },
        error: (failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${failure.message}'),
              backgroundColor: AppColors.error,
            ),
          );
        },
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<dynamic> userEventsAsync = ref.watch(userEventsProvider);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Book ${widget.vendor['name']}',
                    style: AppTypography.titleLarge.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Select Event
              Text(
                'Select Event',
                style: AppTypography.labelLarge.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12.h),
              userEventsAsync.when(
                data: (dynamic events) {
                  final List<dynamic> eventsList = events as List<dynamic>;
                  if (eventsList.isEmpty) {
                    return Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.event_busy_outlined,
                            size: 40.sp,
                            color: AppColors.onSurfaceVariant,
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'No events yet',
                            style: AppTypography.titleSmall.copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Create an event first, then come back to book this vendor',
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppColors.onSurfaceVariant,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                                // Navigate back to continue event creation
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                              label: const Text('Continue Event Creation'),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return DropdownButtonFormField<String>(
                    initialValue: _selectedEventId,
                    decoration: InputDecoration(
                      hintText: 'Choose an event',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    items: eventsList.map((dynamic event) => DropdownMenuItem<String>(
                      value: event.id as String,
                      child: Text(event.title as String),
                    )).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedEventId = value;
                      });
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (dynamic err, dynamic __) => Column(
                  children: [
                    Text('Failed to load events: $err', style: TextStyle(color: AppColors.error)),
                    TextButton(
                      onPressed: () => ref.read(userEventsProvider.notifier).getUserEvents(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),

              // Only show booking fields if user has events
              if (userEventsAsync.hasValue && 
                  (userEventsAsync.value as List<dynamic>).isNotEmpty) ...<Widget>[
                SizedBox(height: 20.h),

                // Payment Option
                Text(
                  'Payment Option',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12.h),
                DropdownButtonFormField<String>(
                  value: _paymentOption,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(value: 'upfrontPayment', child: Text('Upfront Payment')),
                    DropdownMenuItem<String>(value: 'ticketSalesSplit', child: Text('Ticket Sales Split')),
                  ],
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() {
                        _paymentOption = value;
                      });
                    }
                  },
                ),

                // Percentage split — required for ticketSalesSplit
                if (_paymentOption == 'ticketSalesSplit') ...[
                  SizedBox(height: 20.h),
                  Text(
                    'Percentage Split (%)',
                    style: AppTypography.labelLarge.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  TextField(
                    controller: _percentageSplitController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: 'e.g. 20 (your share of ticket sales)',
                      suffixText: '%',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ],

                SizedBox(height: 20.h),

                // Offered Price
                Text(
                  'Offered Price (Optional)',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12.h),
                TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your offer (Base: ${widget.vendor['basePrice']})',
                    prefixText: '${widget.vendor['currency'] ?? 'NGN'} ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // Message
                Text(
                  'Message (Optional)',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12.h),
                TextField(
                  controller: _messageController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Add a message to the vendor...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _submitBooking,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Send Booking Request',
                            style: AppTypography.labelLarge.copyWith(
                              color: AppColors.onPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
