import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/home/presentation/widgets/widgets.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';

/// Upcoming events horizontal scrollable section - Connected to API
class UpcomingEventsSection extends ConsumerWidget {
  const UpcomingEventsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingEvents = ref.watch(upcomingEventsProvider);

    return Column(
      children: [
        SectionHeader(
          title: 'Upcoming Events',
          onViewAll: () {
            context.push(RouteManager.eventsList);
          },
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 267.h,
          child: upcomingEvents.when(
            data: (events) {
              if (events.isEmpty) {
                return Center(
                  child: AppText.bodyMedium(
                    'No upcoming events available',
                    color: context.colors.onSurfaceVariant,
                  ),
                );
              }
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                scrollDirection: Axis.horizontal,
                itemCount: events.length,
                separatorBuilder: (context, index) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  final event = events[index];
                  final months = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
                  return UpcomingEventCard(
                    imageUrl: event.imageUrl,
                    month: months[event.startDate.month - 1],
                    day: event.startDate.day.toString(),
                    organizerName: event.organizerName,
                    organizerLocation: event.location,
                    organizerAvatar: event.organizerImage ?? '',
                    isLive: false,
                    onTap: () {
                      context.push('${RouteManager.eventDetails}/${event.id}');
                    },
                  );
                },
              );
            },
            loading: () => Center(
              child: CircularProgressIndicator(
                color: context.colors.primary,
              ),
            ),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: context.colors.error,
                    size: 32.sp,
                  ),
                  SizedBox(height: 8.h),
                  AppText.bodySmall(
                    'Failed to load upcoming events',
                    color: context.colors.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
