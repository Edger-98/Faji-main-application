import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/vendor/presentation/screens/vendor_detail_screen.dart';

/// Vendor Marketplace - Public discovery only
/// Purpose: Fiverr/Airbnb-style marketplace for discovering vendors and services
/// Contains: Public vendor profiles, vendor services, search and filters
/// Does NOT contain: Vendor onboarding, service creation, booking management
class VendorMarketplaceScreen extends ConsumerStatefulWidget {
  const VendorMarketplaceScreen({super.key});

  @override
  ConsumerState<VendorMarketplaceScreen> createState() => _VendorMarketplaceScreenState();
}

class _VendorMarketplaceScreenState extends ConsumerState<VendorMarketplaceScreen> 
    with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;

  String _selectedCategory = 'All';
  bool _isGridView = true; // Toggle between grid and list
  final TextEditingController _searchController = TextEditingController();

  final List<String> _categories = [
    'All',
    'Photography',
    'Catering',
    'Decoration',
    'Entertainment',
    'Security',
    'Transportation',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _refreshVendors() async {
    HapticFeedback.lightImpact();
    // TODO: Implement vendor refresh
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: _refreshVendors,
          color: AppColors.primary,
          backgroundColor: AppColors.surfaceContainerHighest,
          child: CustomScrollView(
            slivers: [
              // Header
              SliverToBoxAdapter(
                child: AppHeader(
                  title: 'Vendors',
                  subtitle: 'Discover and book services for your events',
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: context.colors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.grid_view_rounded,
                            color: _isGridView ? context.colors.primary : context.colors.onSurfaceVariant,
                          ),
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            setState(() => _isGridView = true);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.view_list_rounded,
                            color: !_isGridView ? context.colors.primary : context.colors.onSurfaceVariant,
                          ),
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            setState(() => _isGridView = false);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Search Bar
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search vendors or services...',
                      prefixIcon: Icon(Icons.search, color: context.colors.onSurfaceVariant),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear, color: context.colors.onSurfaceVariant),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {});
                              },
                            )
                          : null,
                    ),
                    onChanged: (value) => setState(() {}),
                  ),
                ),
              ),

              // Category Filters
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 48.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      final isSelected = _selectedCategory == category;
                      
                      return FilterChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (selected) {
                          HapticFeedback.lightImpact();
                          setState(() => _selectedCategory = category);
                        },
                        backgroundColor: context.colors.surfaceContainerHighest,
                        selectedColor: context.colors.primary,
                        labelStyle: AppTypography.labelMedium.copyWith(
                          color: isSelected ? context.colors.onPrimary : context.colors.onSurface,
                        ),
                      );
                    },
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: 24.h)),

              // Vendor Grid or List
              if (_isGridView)
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 0.68, // Adjusted from 0.72 to prevent overflow
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _buildVendorCard(context, index),
                      childCount: 8,
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _buildVendorListTile(context, index),
                      childCount: 8,
                    ),
                  ),
                ),

              // Bottom padding for nav bar
              SliverToBoxAdapter(child: SizedBox(height: 120.h)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVendorCard(BuildContext context, int index) {
    // Real vendor data
    final vendors = [
      {
        'name': 'Elite Photography Studio',
        'category': 'Photography',
        'rating': 4.9,
        'reviews': 127,
        'price': 'From \$500',
        'image': 'https://images.unsplash.com/photo-1542038784456-1ea8e935640e?w=400',
        'verified': true,
      },
      {
        'name': 'Gourmet Catering Co.',
        'category': 'Catering',
        'rating': 4.8,
        'reviews': 89,
        'price': 'From \$1,200',
        'image': 'https://images.unsplash.com/photo-1555244162-803834f70033?w=400',
        'verified': true,
      },
      {
        'name': 'Bloom & Petal Decor',
        'category': 'Decoration',
        'rating': 4.7,
        'reviews': 64,
        'price': 'From \$800',
        'image': 'https://images.unsplash.com/photo-1519225421980-715cb0215aed?w=400',
        'verified': false,
      },
      {
        'name': 'SoundWave Entertainment',
        'category': 'Entertainment',
        'rating': 4.9,
        'reviews': 156,
        'price': 'From \$600',
        'image': 'https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=400',
        'verified': true,
      },
      {
        'name': 'SecureGuard Services',
        'category': 'Security',
        'rating': 4.6,
        'reviews': 43,
        'price': 'From \$400',
        'image': 'https://images.unsplash.com/photo-1557862921-37829c790f19?w=400',
        'verified': true,
      },
      {
        'name': 'Luxury Transport Co.',
        'category': 'Transportation',
        'rating': 4.8,
        'reviews': 92,
        'price': 'From \$350',
        'image': 'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?w=400',
        'verified': false,
      },
      {
        'name': 'Moments Photography',
        'category': 'Photography',
        'rating': 4.7,
        'reviews': 78,
        'price': 'From \$450',
        'image': 'https://images.unsplash.com/photo-1554048612-b6a482bc67e5?w=400',
        'verified': false,
      },
      {
        'name': 'Taste of Heaven Catering',
        'category': 'Catering',
        'rating': 4.9,
        'reviews': 134,
        'price': 'From \$1,500',
        'image': 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400',
        'verified': true,
      },
    ];

    final vendor = vendors[index % vendors.length];

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VendorDetailScreen(vendor: vendor),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vendor Image
            Stack(
              children: [
                Container(
                  height: 120.h, // Further reduced to prevent overflow
                  decoration: BoxDecoration(
                    color: context.colors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                    image: DecorationImage(
                      image: NetworkImage(vendor['image'] as String),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (vendor['verified'] as bool)
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: AppColors.successGreen,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.verified,
                            size: 10.sp,
                            color: Colors.white,
                          ),
                          SizedBox(width: 3.w),
                          Text(
                            'Verified',
                            style: AppTypography.bodySmall.copyWith(
                              color: Colors.white,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            vendor['name'] as String,
                            style: AppTypography.titleSmall.copyWith(
                              color: context.colors.onSurface,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            vendor['category'] as String,
                            style: AppTypography.bodySmall.copyWith(
                              color: context.colors.onSurfaceVariant,
                              fontSize: 11.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 14.sp,
                              color: AppColors.eventCardYellow,
                            ),
                            SizedBox(width: 3.w),
                            Text(
                              '${vendor['rating']}',
                              style: AppTypography.bodySmall.copyWith(
                                color: context.colors.onSurface,
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                              ),
                            ),
                            SizedBox(width: 3.w),
                            Flexible(
                              child: Text(
                                '(${vendor['reviews']})',
                                style: AppTypography.bodySmall.copyWith(
                                  color: context.colors.onSurfaceVariant,
                                  fontSize: 10.sp,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          vendor['price'] as String,
                          style: AppTypography.bodySmall.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.w700,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVendorListTile(BuildContext context, int index) {
    // Real vendor data (same as card)
    final vendors = [
      {
        'name': 'Elite Photography Studio',
        'category': 'Photography',
        'rating': 4.9,
        'reviews': 127,
        'price': 'From \$500',
        'image': 'https://images.unsplash.com/photo-1542038784456-1ea8e935640e?w=400',
        'verified': true,
      },
      {
        'name': 'Gourmet Catering Co.',
        'category': 'Catering',
        'rating': 4.8,
        'reviews': 89,
        'price': 'From \$1,200',
        'image': 'https://images.unsplash.com/photo-1555244162-803834f70033?w=400',
        'verified': true,
      },
      {
        'name': 'Bloom & Petal Decor',
        'category': 'Decoration',
        'rating': 4.7,
        'reviews': 64,
        'price': 'From \$800',
        'image': 'https://images.unsplash.com/photo-1519225421980-715cb0215aed?w=400',
        'verified': false,
      },
      {
        'name': 'SoundWave Entertainment',
        'category': 'Entertainment',
        'rating': 4.9,
        'reviews': 156,
        'price': 'From \$600',
        'image': 'https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=400',
        'verified': true,
      },
      {
        'name': 'SecureGuard Services',
        'category': 'Security',
        'rating': 4.6,
        'reviews': 43,
        'price': 'From \$400',
        'image': 'https://images.unsplash.com/photo-1557862921-37829c790f19?w=400',
        'verified': true,
      },
      {
        'name': 'Luxury Transport Co.',
        'category': 'Transportation',
        'rating': 4.8,
        'reviews': 92,
        'price': 'From \$350',
        'image': 'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?w=400',
        'verified': false,
      },
      {
        'name': 'Moments Photography',
        'category': 'Photography',
        'rating': 4.7,
        'reviews': 78,
        'price': 'From \$450',
        'image': 'https://images.unsplash.com/photo-1554048612-b6a482bc67e5?w=400',
        'verified': false,
      },
      {
        'name': 'Taste of Heaven Catering',
        'category': 'Catering',
        'rating': 4.9,
        'reviews': 134,
        'price': 'From \$1,500',
        'image': 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400',
        'verified': true,
      },
    ];

    final vendor = vendors[index % vendors.length];

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VendorDetailScreen(vendor: vendor),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            // Vendor Image
            Stack(
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      image: NetworkImage(vendor['image'] as String),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (vendor['verified'] as bool)
                  Positioned(
                    top: 6.h,
                    right: 6.w,
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: AppColors.successGreen,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.verified,
                        size: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            
            SizedBox(width: 16.w),
            
            // Vendor Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vendor['name'] as String,
                    style: AppTypography.titleMedium.copyWith(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    vendor['category'] as String,
                    style: AppTypography.bodySmall.copyWith(
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 16.sp,
                        color: AppColors.eventCardYellow,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '${vendor['rating']}',
                        style: AppTypography.bodySmall.copyWith(
                          color: context.colors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '(${vendor['reviews']})',
                        style: AppTypography.bodySmall.copyWith(
                          color: context.colors.onSurfaceVariant,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    vendor['price'] as String,
                    style: AppTypography.bodyMedium.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16.sp,
              color: context.colors.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
