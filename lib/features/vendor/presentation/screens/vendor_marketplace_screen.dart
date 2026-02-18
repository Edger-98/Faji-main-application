import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/features/marketplace/presentation/viewmodels/marketplace_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/vendor/presentation/screens/vendor_detail_screen.dart';
import 'package:fajimobileapp/features/marketplace/presentation/providers/marketplace_providers.dart';
import 'package:fajimobileapp/features/marketplace/domain/entities/marketplace_resource.dart';

/// Vendor Marketplace - Public discovery only
/// Purpose: Fiverr/Airbnb-style marketplace for discovering vendors and services
/// Contains: Public vendor profiles, vendor services, search and filters
/// Does NOT contain: Vendor onboarding, service creation, booking management
class VendorMarketplaceScreen extends HookConsumerWidget {
  const VendorMarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MarketplaceViewModel marketplaceViewModel = ref.watch(marketplaceViewModelProvider.notifier);
    final MarketplaceState marketplaceState = ref.watch(marketplaceViewModelProvider);
    final ValueNotifier<String> selectedCategory = useState('All');
    final ValueNotifier<bool> isGridView = useState(true);
    final TextEditingController searchController = useTextEditingController();

    final List<String> categories = <String>[
      'All',
      'Photography',
      'Catering',
      'Decoration',
      'Entertainment',
      'Security',
      'Transportation',
    ];

    // Load resources on mount
    useEffect(() {
      Future.microtask(() => marketplaceViewModel.getMarketplaceResources(
        category: selectedCategory.value == 'All' ? 'all' : selectedCategory.value,
      ));
      return null;
    }, <Object?>[]);

    Future<void> refreshVendors() async {
      HapticFeedback.lightImpact();
      await marketplaceViewModel.getMarketplaceResources(
        category: selectedCategory.value == 'All' ? 'all' : selectedCategory.value,
      );
    }

    void onCategoryChanged(String category) {
      HapticFeedback.lightImpact();
      selectedCategory.value = category;
      marketplaceViewModel.getMarketplaceResources(
        category: category == 'All' ? 'all' : category,
      );
    }

    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: refreshVendors,
          color: AppColors.primary,
          backgroundColor: AppColors.surfaceContainerHighest,
          child: CustomScrollView(
            slivers: <Widget>[
              // Header
              SliverToBoxAdapter(
                child: AppHeader(
                  title: 'Vendors',
                  subtitle: 'Discover and book services for your events',
                  trailing: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.colors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.grid_view_rounded,
                            color: isGridView.value ? context.colors.primary : context.colors.onSurfaceVariant,
                          ),
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            isGridView.value = true;
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.view_list_rounded,
                            color: !isGridView.value ? context.colors.primary : context.colors.onSurfaceVariant,
                          ),
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            isGridView.value = false;
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
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search vendors or services...',
                      prefixIcon: Icon(Icons.search, color: context.colors.onSurfaceVariant),
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear, color: context.colors.onSurfaceVariant),
                              onPressed: searchController.clear,
                            )
                          : null,
                    ),
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
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemBuilder: (BuildContext context, int index) {
                      final String category = categories[index];
                      final bool isSelected = selectedCategory.value == category;
                      
                      return FilterChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (bool selected) => onCategoryChanged(category),
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
              marketplaceState.resourcesState.when(
                initial: () => _buildEmptyState(context),
                loading: () => _buildLoadingState(context, isGridView.value),
                success: (MarketplaceResourcesResponse resourcesResponse) {
                  if (resourcesResponse.resources.isEmpty) {
                    return _buildEmptyState(context);
                  }
                  return isGridView.value
                      ? _buildVendorGrid(context, resourcesResponse.resources)
                      : _buildVendorList(context, resourcesResponse.resources);
                },
                error: (Failure failure) => _buildErrorState(context, failure.message, refreshVendors),
              ),

              // Bottom padding for nav bar
              SliverToBoxAdapter(child: SizedBox(height: 120.h)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVendorGrid(BuildContext context, List<MarketplaceResource> resources) => SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 0.68,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildVendorCard(context, resources[index]),
          childCount: resources.length,
        ),
      ),
    );

  Widget _buildVendorList(BuildContext context, List<MarketplaceResource> resources) => SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildVendorListTile(context, resources[index]),
          childCount: resources.length,
        ),
      ),
    );

  Widget _buildLoadingState(BuildContext context, bool isGrid) {
    if (isGrid) {
      return SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 0.68,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => _buildVendorCardSkeleton(context),
            childCount: 6,
          ),
        ),
      );
    } else {
      return SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => _buildVendorListSkeleton(context),
            childCount: 5,
          ),
        ),
      );
    }
  }

  Widget _buildEmptyState(BuildContext context) => SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 40.w),
        child: Column(
          children: [
            Icon(
              Icons.store_outlined,
              size: 64.sp,
              color: context.colors.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            SizedBox(height: 16.h),
            Text(
              'No vendors found',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Try adjusting your filters or check back later',
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onSurfaceVariant.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

  Widget _buildErrorState(BuildContext context, String message, VoidCallback onRetry) => SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 40.w),
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              size: 64.sp,
              color: context.colors.error,
            ),
            SizedBox(height: 16.h),
            Text(
              'Failed to load vendors',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              message,
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onSurfaceVariant.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: onRetry,
              child: Text('Retry'),
            ),
          ],
        ),
      ),
    );

  Widget _buildVendorCardSkeleton(BuildContext context) => Container(
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.h,
            decoration: BoxDecoration(
              color: context.colors.surfaceContainerHighest,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 14.h,
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 80.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  Widget _buildVendorListSkeleton(BuildContext context) => Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: context.colors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 100.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: context.colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  Widget _buildVendorCard(BuildContext context, MarketplaceResource resource) => GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        // TODO: Navigate to vendor detail with resource data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VendorDetailScreen(vendor: {
              'name': resource.vendorName,
              'category': resource.category,
              'rating': resource.rating,
              'reviews': resource.reviewCount,
              'price': 'From \$${resource.basePrice.toStringAsFixed(0)}',
              'image': resource.photos.isNotEmpty ? resource.photos.first : '',
              'verified': resource.isVerified,
            }),
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
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: context.colors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                    image: resource.photos.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(resource.photos.first),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: resource.photos.isEmpty
                      ? Center(
                          child: Icon(
                            Icons.store,
                            size: 40.sp,
                            color: context.colors.primary,
                          ),
                        )
                      : null,
                ),
                if (resource.isVerified)
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
                if (!resource.isAvailable)
                  Positioned(
                    top: 8.h,
                    left: 8.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: AppColors.error,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        'Unavailable',
                        style: AppTypography.bodySmall.copyWith(
                          color: Colors.white,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                        ),
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
                            resource.title,
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
                            resource.category,
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
                              resource.rating.toStringAsFixed(1),
                              style: AppTypography.bodySmall.copyWith(
                                color: context.colors.onSurface,
                                fontWeight: FontWeight.w600,
                                fontSize: 11.sp,
                              ),
                            ),
                            SizedBox(width: 3.w),
                            Flexible(
                              child: Text(
                                '(${resource.reviewCount})',
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
                          'From \$${resource.basePrice.toStringAsFixed(0)}',
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

  Widget _buildVendorListTile(BuildContext context, MarketplaceResource resource) => GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VendorDetailScreen(vendor: {
              'name': resource.vendorName,
              'category': resource.category,
              'rating': resource.rating,
              'reviews': resource.reviewCount,
              'price': 'From \$${resource.basePrice.toStringAsFixed(0)}',
              'image': resource.photos.isNotEmpty ? resource.photos.first : '',
              'verified': resource.isVerified,
            }),
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
                    color: context.colors.primary.withValues(alpha: 0.1),
                    image: resource.photos.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(resource.photos.first),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: resource.photos.isEmpty
                      ? Center(
                          child: Icon(
                            Icons.store,
                            size: 40.sp,
                            color: context.colors.primary,
                          ),
                        )
                      : null,
                ),
                if (resource.isVerified)
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
                    resource.title,
                    style: AppTypography.titleMedium.copyWith(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    resource.category,
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
                        resource.rating.toStringAsFixed(1),
                        style: AppTypography.bodySmall.copyWith(
                          color: context.colors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '(${resource.reviewCount})',
                        style: AppTypography.bodySmall.copyWith(
                          color: context.colors.onSurfaceVariant,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        'From \$${resource.basePrice.toStringAsFixed(0)}',
                        style: AppTypography.bodyMedium.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (!resource.isAvailable) ...[
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: AppColors.error.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'Unavailable',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.error,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
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
