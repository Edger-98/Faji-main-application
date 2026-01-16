import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity_extensions.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart' as events_providers;
import 'package:fajimobileapp/features/home/presentation/widgets/widgets.dart';

/// Trending events horizontal scrollable section - Connected to API
class TrendingEventsSection extends ConsumerWidget {
  const TrendingEventsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingEvents = ref.watch(trendingEventsProvider);

    return Column(
      children: [
        SectionHeader(
          title: 'Trending Now',
          subtitle: 'Popular events in your area',
          onViewAll: () {
            context.push(RouteManager.eventsList);
          },
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 280.h,
          child: trendingEvents.when(
            data: (events) {
              // If no trending events, show user's events instead
              if (events.isEmpty) {
                final userEvents = ref.watch(events_providers.userEventsProvider);
                return userEvents.when(
                  data: (myEvents) {
                    if (myEvents.isEmpty) {
                      return _buildEmptyState(context);
                    }
                    return _buildEventsList(context, myEvents);
                  },
                  loading: () => _buildLoadingState(context),
                  error: (_, __) => _buildEmptyState(context),
                );
              }
              return _buildEventsList(context, events);
            },
            loading: () => _buildLoadingState(context),
            error: (error, stack) => _buildErrorState(context),
          ),
        ),
      ],
    );
  }

  Widget _buildEventsList(BuildContext context, List<EventEntity> events) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: events.length,
      separatorBuilder: (context, index) => SizedBox(width: 16.w),
      itemBuilder: (context, index) {
        final event = events[index];
        return EventCard(
          imageUrl: event.displayImageUrl,
          title: event.title,
          date: _formatDate(event.startDate),
          time: _formatTime(event.startDate),
          price: event.displayPrice,
          isLive: event.isTrending == true,
          onTap: () {
            context.push('${RouteManager.eventDetails}/${event.id}');
          },
          onFavorite: () {
            // TODO: Implement favorite toggle
          },
        );
      },
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: context.colors.primary,
        strokeWidth: 3,
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
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
                Icons.trending_up_rounded,
                color: context.colors.primary,
                size: 40.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'No Trending Events',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Check back soon for popular events',
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

  Widget _buildErrorState(BuildContext context) {
    return Center(
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
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final dayName = days[date.weekday - 1];
    return '$dayName ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}';
  }

  String _formatTime(DateTime date) {
    final hour = date.hour > 12 ? date.hour - 12 : date.hour;
    final period = date.hour >= 12 ? 'PM' : 'AM';
    return '${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} $period';
  }
}
