import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/resource_category.dart';
import 'package:fajimobileapp/features/cohost_marketplace/domain/entities/cohost_resource_entity.dart';
import 'package:fajimobileapp/features/cohost_marketplace/data/mock_cohost_data.dart';
import 'package:fajimobileapp/features/cohost_marketplace/presentation/screens/vendor_profile_screen.dart';

/// Screen showing list of co-hosts for a specific category
class CohostListScreen extends StatefulWidget {
  const CohostListScreen({
    required this.category,
    super.key,
  });

  final ResourceCategory category;

  @override
  State<CohostListScreen> createState() => _CohostListScreenState();
}

class _CohostListScreenState extends State<CohostListScreen> {
  late List<CohostResourceEntity> _resources;

  @override
  void initState() {
    super.initState();
    _resources = MockCohostData.getMockResources(category: widget.category);
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
                                color: widget.category.color.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(
                                widget.category.iconData,
                                color: widget.category.color,
                                size: 20.sp,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            AppText.headlineSmall(widget.category.displayName),
                          ],
                        ),
                        AppText.bodySmall(
                          '${_resources.length} available',
                          color: AppColors.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                itemCount: _resources.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  final CohostResourceEntity resource = _resources[index];

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
                                          fontFamily: AppTypography.neueHaasDisplay,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
