import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/cohost_resource_entity.dart';
import 'package:fajimobileapp/features/cohost_marketplace/presentation/screens/booking_negotiation_screen.dart';

/// Screen showing detailed vendor profile with ratings and reviews
class VendorProfileScreen extends StatefulWidget {
  const VendorProfileScreen({
    required this.resource,
    this.eventId,
    super.key,
  });

  final CohostResourceEntity resource;
  final String? eventId;

  @override
  State<VendorProfileScreen> createState() => _VendorProfileScreenState();
}

class _VendorProfileScreenState extends State<VendorProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Minimal App Bar
          SliverAppBar(
            expandedHeight: 200.h,
            pinned: true,
            backgroundColor: AppColors.background,
            elevation: 0,
            leading: Container(
              margin: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.background.withOpacity(0.8),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF3A3A3A),
                  width: 1,
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                color: AppColors.onSurface,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.background.withOpacity(0.8),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF3A3A3A),
                    width: 1,
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.ios_share_rounded, size: 18),
                  color: AppColors.onSurface,
                  onPressed: () {},
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      widget.resource.category.color.withOpacity(0.15),
                      AppColors.background,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Vendor header - asymmetric layout
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile photo - larger, more prominent
                      Container(
                        width: 80.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              widget.resource.category.color.withOpacity(0.3),
                              widget.resource.category.color.withOpacity(0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Center(
                          child: Text(
                            widget.resource.cohostName[0],
                            style: TextStyle(
                              fontFamily: AppTypography.modicaPro,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w700,
                              color: widget.resource.category.color,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    widget.resource.cohostName,
                                    style: TextStyle(
                                      fontFamily: AppTypography.modicaPro,
                                      fontSize: 26.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.onSurface,
                                      height: 1.1,
                                    ),
                                  ),
                                ),
                                if (widget.resource.isVerified ?? false) ...[
                                  SizedBox(width: 6.w),
                                  Container(
                                    padding: EdgeInsets.all(4.w),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withOpacity(0.15),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.verified_rounded,
                                      color: AppColors.primary,
                                      size: 18.sp,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: widget.resource.category.color.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                widget.resource.category.displayName,
                                style: TextStyle(
                                  fontFamily: AppTypography.modicaPro,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: widget.resource.category.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 28.h),

                  // Stats row - horizontal scroll for better mobile UX
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildCompactStat(
                          '${widget.resource.rating}',
                          '⭐ Rating',
                        ),
                        SizedBox(width: 12.w),
                        _buildCompactStat(
                          '${widget.resource.eventsCompleted ?? 0}+',
                          'Events Done',
                        ),
                        SizedBox(width: 12.w),
                        _buildCompactStat(
                          '${widget.resource.reviewCount}',
                          'Reviews',
                        ),
                        SizedBox(width: 12.w),
                        _buildCompactStat(
                          '< 2hrs',
                          'Response',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // Service title with price inline
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.resource.title,
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColors.onSurface,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Text(
                                  _formatPrice(widget.resource.basePrice),
                                  style: TextStyle(
                                    fontFamily: AppTypography.modicaPro,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.onSurface,
                                  ),
                                ),
                                Text(
                                  ' /event',
                                  style: TextStyle(
                                    fontFamily: AppTypography.modicaPro,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: widget.resource.isAvailable
                              ? const Color(0xFF4CAF50).withOpacity(0.15)
                              : const Color(0xFFFF6B6B).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                color: widget.resource.isAvailable
                                    ? const Color(0xFF4CAF50)
                                    : const Color(0xFFFF6B6B),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              widget.resource.isAvailable ? 'Open' : 'Busy',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: widget.resource.isAvailable
                                    ? const Color(0xFF4CAF50)
                                    : const Color(0xFFFF6B6B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Description
                  AnimatedCrossFade(
                    firstChild: Text(
                      widget.resource.description,
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.onSurfaceVariant.withOpacity(0.9),
                        height: 1.6,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    secondChild: Text(
                      widget.resource.description,
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.onSurfaceVariant.withOpacity(0.9),
                        height: 1.6,
                      ),
                    ),
                    crossFadeState: _isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 300),
                  ),
                  if (widget.resource.description.length > 100)
                    GestureDetector(
                      onTap: () => setState(() => _isExpanded = !_isExpanded),
                      child: Padding(
                        padding: EdgeInsets.only(top: 6.h),
                        child: Row(
                          children: [
                            Text(
                              _isExpanded ? 'Show less' : 'Read more',
                              style: TextStyle(
                                fontFamily: AppTypography.modicaPro,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurface.withOpacity(0.6),
                              ),
                            ),
                            Icon(
                              _isExpanded
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              size: 18.sp,
                              color: AppColors.onSurface.withOpacity(0.6),
                            ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(height: 32.h),

                  // Tabs - minimal design
                  Row(
                    children: [
                      _buildTab('Reviews', 0),
                      SizedBox(width: 8.w),
                      _buildTab('Work', 1),
                      SizedBox(width: 8.w),
                      _buildTab('Info', 2),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  // Tab content
                  SizedBox(
                    height: 400.h,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildReviewsTab(),
                        _buildPortfolioTab(),
                        _buildAboutTab(),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border(
            top: BorderSide(
              color: const Color(0xFF3A3A3A),
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              if (widget.eventId != null) {
                // Navigate to booking negotiation screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingNegotiationScreen(
                      resource: widget.resource,
                      eventId: widget.eventId!,
                    ),
                  ),
                );
              } else {
                // Show message if no event ID
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Please create an event first'),
                    backgroundColor: AppColors.error,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                );
              }
            },
            child: Container(
              height: 56.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Send Booking Request',
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompactStat(String value, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: const Color(0xFF3A3A3A),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.onSurfaceVariant.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = _tabController.index == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _tabController.animateTo(index);
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.onSurface
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? AppColors.background
                    : AppColors.onSurfaceVariant.withOpacity(0.6),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewsTab() {
    // Mock reviews data
    final reviews = [
      {
        'name': 'Sarah Johnson',
        'rating': 5.0,
        'date': '2 weeks ago',
        'comment':
            'Absolutely amazing service! Made our wedding unforgettable. Highly professional and creative.',
      },
      {
        'name': 'Michael Chen',
        'rating': 4.5,
        'date': '1 month ago',
        'comment':
            'Great experience overall. Very responsive and delivered exactly what we needed.',
      },
      {
        'name': 'Emma Williams',
        'rating': 5.0,
        'date': '2 months ago',
        'comment':
            'Best decision we made for our event! Worth every penny. Will definitely book again.',
      },
    ];

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: reviews.length,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: const Color(0xFF3A3A3A),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        review['name'].toString()[0],
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
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
                          review['name'] as String,
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onSurface,
                          ),
                        ),
                        Text(
                          review['date'] as String,
                          style: TextStyle(
                            fontFamily: AppTypography.modicaPro,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: const Color(0xFFFFB800),
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        review['rating'].toString(),
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onSurface,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                review['comment'] as String,
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPortfolioTab() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: widget.resource.category.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: const Color(0xFF3A3A3A),
              width: 1.5,
            ),
          ),
          child: Center(
            child: Icon(
              widget.resource.category.iconData,
              size: 48.sp,
              color: widget.resource.category.color.withOpacity(0.5),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAboutTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Experience', '${widget.resource.eventsCompleted ?? 0}+ events'),
          SizedBox(height: 16.h),
          _buildInfoRow('Category', widget.resource.category.displayName),
          SizedBox(height: 16.h),
          _buildInfoRow('Response Time', 'Within 2 hours'),
          SizedBox(height: 16.h),
          _buildInfoRow('Availability', widget.resource.isAvailable ? 'Available' : 'Booked'),
          SizedBox(height: 24.h),
          Text(
            'Services Included',
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.onSurface,
            ),
          ),
          SizedBox(height: 12.h),
          ...[
            'Professional equipment',
            'Setup and breakdown',
            'On-site support',
            'Consultation included',
          ].map((service) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      color: const Color(0xFF4CAF50),
                      size: 20.sp,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      service,
                      style: TextStyle(
                        fontFamily: AppTypography.modicaPro,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFF3A3A3A),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.onSurfaceVariant,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: AppTypography.modicaPro,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
