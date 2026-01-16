import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/design_system/design_system.dart';
import '../../domain/entities/event_entity.dart';

/// Reusable Event Card Widget
class EventCard extends StatelessWidget {
  final EventEntity event;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;
  final bool isFavorite;
  final bool showFavoriteButton; // Defaults to false now

  const EventCard({
    super.key,
    required this.event,
    this.onTap,
    this.onFavorite,
    this.isFavorite = false,
    this.showFavoriteButton = false, // Changed default to false
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                  child: CachedNetworkImage(
                    imageUrl: event.imageUrl,
                    height: 120.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 120.h,
                      color: context.colors.surfaceContainerHighest,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: context.colors.primary,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 120.h,
                      color: context.colors.surfaceContainerHighest,
                      child: Icon(
                        Icons.image_not_supported,
                        color: context.colors.onSurfaceVariant,
                        size: 32.sp,
                      ),
                    ),
                  ),
                ),
                
                // Badges
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: Row(
                    children: [
                      if (event.isFeatured == true)
                        _buildBadge('Featured', AppColors.primary),
                      if (event.isFlashDeal == true)
                        Padding(
                          padding: EdgeInsets.only(left: 4.w),
                          child: _buildBadge('Flash Deal', AppColors.error),
                        ),
                    ],
                  ),
                ),
                
                // Favorite Button
                if (showFavoriteButton)
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: GestureDetector(
                      onTap: onFavorite,
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? AppColors.error : AppColors.onSurfaceVariant,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            
            // Event Details
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  AppText.titleMedium(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    color: context.colors.onSurface,
                  ),
                  
                  SizedBox(height: 4.h),
                  
                  // Date and Location
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 12.sp,
                        color: context.colors.onSurfaceVariant,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: AppText.bodySmall(
                          _formatDate(event.startDate),
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 2.h),
                  
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 12.sp,
                        color: context.colors.onSurfaceVariant,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: AppText.bodySmall(
                          event.location,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          color: context.colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 8.h),
                  
                  // Price and Availability
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      if (event.price > 0)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (event.hasDiscount)
                              AppText.bodySmall(
                                '\$${event.price.toStringAsFixed(2)}',
                                decoration: TextDecoration.lineThrough,
                                color: context.colors.onSurfaceVariant,
                              ),
                            AppText.titleSmall(
                              event.hasDiscount
                                  ? '\$${event.discountedPrice.toStringAsFixed(2)}'
                                  : '\$${event.price.toStringAsFixed(2)}',
                              color: AppColors.primary,
                            ),
                          ],
                        )
                      else
                        AppText.titleSmall(
                          'Free',
                          color: AppColors.success,
                        ),
                      
                      // Availability
                      if (event.isSoldOut)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.error.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: AppText.bodySmall(
                            'Sold Out',
                            color: AppColors.error,
                          ),
                        )
                      else
                        AppText.bodySmall(
                          '${event.availableTickets} left',
                          color: context.colors.onSurfaceVariant,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: AppText.bodySmall(
        text,
        color: Colors.white,
      ),
    );
  }

  Widget _buildPriceDisplay(BuildContext context) {
    // Check if event has price info
    final price = event.price;
    final isFree = price == 0;
    
    if (isFree) {
      return AppText.titleSmall(
        'FREE',
        color: AppColors.success,
      );
    }
    
    // Show price with discount if applicable
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (event.hasDiscount)
          AppText.bodySmall(
            '\$${event.price.toStringAsFixed(2)}',
            decoration: TextDecoration.lineThrough,
            color: context.colors.onSurfaceVariant,
          ),
        AppText.titleSmall(
          event.hasDiscount
              ? '\$${event.discountedPrice.toStringAsFixed(2)}'
              : '\$${event.price.toStringAsFixed(2)}',
          color: AppColors.primary,
        ),
      ],
    );
  }

  Widget _buildAvailabilityDisplay(BuildContext context) {
    if (event.isSoldOut) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.error.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: AppText.bodySmall(
          'SOLD OUT',
          color: AppColors.error,
        //  fontWeight: FontWeight.w600,
        ),
      );
    }
    
    final available = event.availableTickets;
    if (available <= 10) {
      // Show urgency for low availability
      return AppText.bodySmall(
        '$available left',
        color: AppColors.warning,
       // fontWeight: FontWeight.w600,
      );
    }
    
    return AppText.bodySmall(
      '$available left',
      color: context.colors.onSurfaceVariant,
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
