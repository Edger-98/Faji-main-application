import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/resource_category.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/cohost_resource_entity.dart';
import 'package:fajimobileapp/features/cohost_marketplace/presentation/providers/marketplace_providers.dart';
import 'package:fajimobileapp/features/cohost_marketplace/presentation/screens/vendor_profile_screen.dart';

/// Screen showing list of co-hosts for a specific category
class CohostListScreen extends ConsumerWidget {
  const CohostListScreen({
    required this.category,
    this.eventId,
    super.key,
  });

  final ResourceCategory category;
  final String? eventId;

  String _formatPrice(double price) {
    if (price >= 1000000) {
      return '₦${(price / 1000000).toStringAsFixed(1)}M';
    } else if (price >= 1000) {
      return '₦${(price / 1000).toStringAsFixed(0)}K';
    }
    return '₦${price.toStringAsFixed(0)}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = VendorFetchParams(
      eventId: eventId,
      category: category,
    );
    final resourcesAsync = ref.watch(vendorsProvider(params));

    return Scaffold(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: category.color.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(
                                category.iconData,
                                color: category.color,
                                size: 20.sp,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            AppText.headlineSmall(category.displayName),
                          ],
                        ),
                        resourcesAsync.when(
                          data: (resources) => AppText.bodySmall(
                            '${resources.length} available',
                            color: AppColors.onSurfaceVariant,
                          ),
                          loading: () => AppText.bodySmall(
                            'Loading...',
                            color: AppColors.onSurfaceVariant,
                          ),
                          error: (_, __) => AppText.bodySmall(
                            'Error loading',
                            color: AppColors.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: resourcesAsync.when(
                data: (resources) {
                  if (resources.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inbox_outlined,
                            size: 64.sp,
                            color: AppColors.onSurfaceVariant.withOpacity(0.5),
                          ),
                          SizedBox(height: 16.h),
                          AppText.bodyLarge(
                            'No vendors available',
                            color: AppColors.onSurfaceVariant,
                          ),
                          SizedBox(height: 8.h),
                          AppText.bodySmall(
                            'Check back later for ${category.displayName} vendors',
                            color: AppColors.onSurfaceVariant.withOpacity(0.7),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                    itemCount: resources.length,
                    separatorBuilder: (context, index) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final CohostResourceEntity resource = resources[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.r),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VendorProfileScreen(
                                resource: resource,
                                eventId: eventId,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header row
                              Row(
                                children: [
                                  // Profile photo placeholder
                                  Container(
                                    width: 50.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        resource.cohostName[0],
                                        style: TextStyle(
                                          fontFamily: AppTypography.modicaPro,
                                          fontSize: 20.sp,
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
                                        Row(
                                          children: [
                                            Expanded(
                                              child: AppText.titleMedium(
                                                resource.cohostName,
                                                color: AppColors.onSurface,
                                              ),
                                            ),
                                            if (resource.isVerified ?? false)
                                              Icon(
                                                Icons.verified,
                                                color: AppColors.primary,
                                                size: 18.sp,
                                              ),
                                          ],
                                        ),
                                        SizedBox(height: 2.h),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: AppColors.eventCardYellow,
                                              size: 14.sp,
                                            ),
                                            SizedBox(width: 4.w),
                                            AppText.bodySmall(
                                              '${resource.rating} (${resource.reviewCount} reviews)',
                                              color: AppColors.onSurfaceVariant,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h),

                              // Title
                              AppText.titleSmall(
                                resource.title,
                                color: AppColors.onSurface,
                              ),
                              SizedBox(height: 6.h),

                              // Description
                              AppText.bodySmall(
                                resource.description,
                                color: AppColors.onSurfaceVariant,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 12.h),

                              // Stats row
                              Row(
                                children: [
                                  Icon(
                                    Icons.event_available,
                                    color: AppColors.onSurfaceVariant,
                                    size: 14.sp,
                                  ),
                                  SizedBox(width: 4.w),
                                  AppText.bodySmall(
                                    '${resource.eventsCompleted} events',
                                    color: AppColors.onSurfaceVariant,
                                  ),
                                  SizedBox(width: 16.w),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.w,
                                      vertical: 4.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.success.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: AppText.bodySmall(
                                      'Available',
                                      color: AppColors.success,
                                    ),
                                  ),
                                  const Spacer(),
                                  AppText.titleMedium(
                                    _formatPrice(resource.basePrice),
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: AppColors.primary),
                      SizedBox(height: 16.h),
                      AppText.bodyMedium(
                        'Loading vendors...',
                        color: AppColors.onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
                error: (error, stackTrace) {
                  print('❌ UI Error: $error');
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64.sp,
                          color: AppColors.error,
                        ),
                        SizedBox(height: 16.h),
                        AppText.bodyLarge(
                          'Failed to load vendors',
                          color: AppColors.error,
                        ),
                        SizedBox(height: 8.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 48.w),
                          child: AppText.bodySmall(
                            error.toString(),
                            color: AppColors.onSurfaceVariant,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton(
                          onPressed: () {
                            final params = VendorFetchParams(
                              eventId: eventId,
                              category: category,
                            );
                            ref.invalidate(vendorsProvider(params));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: AppColors.onPrimary,
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.w,
                              vertical: 12.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: AppText.labelLarge('Retry'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
