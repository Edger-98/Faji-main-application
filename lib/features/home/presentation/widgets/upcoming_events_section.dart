import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity_extensions.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';
import 'package:fajimobileapp/features/home/presentation/widgets/widgets.dart';

/// Upcoming events horizontal scrollable section - Connected to API
class UpcomingEventsSection extends ConsumerWidget {
  const UpcomingEventsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<EventEntity>> upcomingEvents = ref.watch(upcomingEventsProvider);
    final String? selectedCategory = ref.watch(selectedCategoryProvider);

    return Column(
      children: <Widget>[
        SectionHeader(
          title: 'Upcoming Events',
          subtitle: "Don't miss out on these",
          onViewAll: () {
            context.push(RouteManager.eventsList);
          },
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 280.h,
          child: upcomingEvents.when(
            data: (List<EventEntity> events) {
              // If no events and a category is selected, show category-specific empty state
              if (events.isEmpty && selectedCategory != null) {
                return _buildCategoryEmptyState(context, selectedCategory);
              }
              
              // If no events and "All" is selected, show general empty state
              if (events.isEmpty) {
                return _buildEmptyState(context);
              }
              
              return _buildEventsList(context, events);
            },
            loading: () => _buildLoadingState(context),
            error: (Object error, StackTrace stack) => _buildErrorState(context, ref),
          ),
        ),
      ],
    );
  }

  Widget _buildEventsList(BuildContext context, List<EventEntity> events) {
    final List<String> months = <String>['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: events.length,
      separatorBuilder: (BuildContext context, int index) => SizedBox(width: 12.w),
      itemBuilder: (BuildContext context, int index) {
        final EventEntity event = events[index];
        return UpcomingEventCard(
          imageUrl: event.displayImageUrl,
          month: months[event.startDate.month - 1],
          day: event.startDate.day.toString(),
          organizerName: event.hostName,
          organizerLocation: event.location,
          organizerAvatar: event.hostImage ?? '',
          isLive: event.isLiveOrTrending,
          onTap: () {
            context.push('${RouteManager.eventDetails}/${event.id}');
          },
        );
      },
    );
  }

  Widget _buildLoadingState(BuildContext context) => Center(
      child: CircularProgressIndicator(
        color: context.colors.primary,
        strokeWidth: 3,
      ),
    );

  Widget _buildEmptyState(BuildContext context) => Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.event_rounded,
                color: context.colors.primary,
                size: 40.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'No Upcoming Events',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'New events will appear here',
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

  Widget _buildCategoryEmptyState(BuildContext context, String categoryId) {
    // Get category name from ID (capitalize first letter)
    final String categoryName = categoryId.split('-').map((word) => 
      word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1)
    ).join(' ');
    
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search_off_rounded,
                color: context.colors.primary,
                size: 40.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'No Results',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'No upcoming $categoryName events found',
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref) => Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: context.colors.error,
              size: 40.sp,
            ),
            SizedBox(height: 12.h),
            Text(
              'Failed to load events',
              style: AppTypography.bodyMedium.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 12.h),
            TextButton.icon(
              onPressed: () {
                // Retry loading
                ref.invalidate(upcomingEventsProvider);
              },
              icon: Icon(Icons.refresh, size: 18.sp),
              label: Text(
                'Retry',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: context.colors.primary,
              ),
            ),
          ],
        ),
      ),
    );
}
