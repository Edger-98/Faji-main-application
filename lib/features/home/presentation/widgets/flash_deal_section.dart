import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';

/// Flash deal promotional section - Connected to API
class FlashDealSection extends ConsumerWidget {
  const FlashDealSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<EventEntity>> flashDealEvents = ref.watch(flashDealEventsProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppText.headlineMedium(
                'Flash Deal',
                color: context.colors.onSurface,
              ),
              AppText.labelLarge(
                '03 : 09 : 24',
                color: context.colors.primary,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          flashDealEvents.when(
            data: (List<EventEntity> events) {
              if (events.isEmpty) {
                return Container(
                  height: 193.h,
                  decoration: BoxDecoration(
                    color: context.colors.eventCardBlue,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Center(
                    child: AppText.bodyMedium(
                      'No flash deals available',
                      color: context.colors.onSurfaceVariant,
                    ),
                  ),
                );
              }
              
              final EventEntity flashEvent = events.first;
              final int discount = flashEvent.discountPercentage?.toInt() ?? 20;
              
              return GestureDetector(
                onTap: () {
                  context.push('${RouteManager.eventDetails}/${flashEvent.id}');
                },
                child: Container(
                  height: 193.h,
                  decoration: BoxDecoration(
                    color: context.colors.eventCardBlue,
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                  child: Stack(
                    children: <Widget>[
                      // Background image
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.r),
                          child: Image.network(
                            flashEvent.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) => Container(
                              color: context.colors.eventCardBlue,
                            ),
                          ),
                        ),
                      ),
                      
                      // Gradient overlay
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.r),
                            gradient: LinearGradient(
                              end: Alignment.centerRight,
                              colors: <Color>[
                                Colors.black.withOpacity(0.7),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      // Content
                      Padding(
                        padding: EdgeInsets.all(29.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 14.w,
                                  height: 14.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: context.colors.successGreen,
                                      width: 1.75,
                                    ),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 10.5.w,
                                      height: 10.5.h,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                AppText.bodySmall(
                                  'Flash Deal',
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            AppText.displayMedium(
                              '$discount% OFF',
                              color: context.colors.primary,
                            ),
                            SizedBox(height: 8.h),
                            SizedBox(
                              width: 179.w,
                              child: AppText.bodySmall(
                                flashEvent.title,
                                color: Colors.white,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Price badge
                      Positioned(
                        right: 16.w,
                        bottom: 16.h,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Column(
                            children: <Widget>[
                              AppText.bodySmall(
                                'Was \$${flashEvent.price.toStringAsFixed(0)}',
                                decoration: TextDecoration.lineThrough,
                                color: context.colors.onSurfaceVariant,
                              ),
                              AppText.titleLarge(
                                '\$${flashEvent.discountedPrice.toStringAsFixed(0)}',
                                color: context.colors.primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            loading: () => Container(
              height: 193.h,
              decoration: BoxDecoration(
                color: context.colors.eventCardBlue,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  color: context.colors.primary,
                ),
              ),
            ),
            error: (Object error, StackTrace stack) => Container(
              height: 193.h,
              decoration: BoxDecoration(
                color: context.colors.eventCardBlue,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Center(
                child: AppText.bodyMedium(
                  'Failed to load flash deals',
                  color: context.colors.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
