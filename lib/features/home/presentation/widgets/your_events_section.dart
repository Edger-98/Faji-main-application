import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/home/presentation/widgets/widgets.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';

/// Your events horizontal scrollable section - Connected to API
class YourEventsSection extends ConsumerStatefulWidget {
  const YourEventsSection({super.key});

  @override
  ConsumerState<YourEventsSection> createState() => _YourEventsSectionState();
}

class _YourEventsSectionState extends ConsumerState<YourEventsSection> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userEventsProvider.notifier).getUserEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final yourEvents = ref.watch(userEventsProvider);

    return Column(
      children: [
        SectionHeader(
          title: 'Your Events',
          onViewAll: () {
            context.push(RouteManager.eventsList);
          },
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 267.h,
          child: yourEvents.when(
            data: (events) {
              if (events.isEmpty) {
                return Center(
                  child: AppText.bodyMedium(
                    'No events available',
                    color: context.colors.onSurfaceVariant,
                  ),
                );
              }
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                scrollDirection: Axis.horizontal,
                itemCount: events.length,
                separatorBuilder: (context, index) => SizedBox(width: 16.w),
                itemBuilder: (context, index) {
                  final event = events[index];
                  return EventCard(
                    imageUrl: event.imageUrl,
                    title: event.title,
                    date: _formatDate(event.startDate),
                    time: _formatTime(event.startDate),
                    price: event.price > 0 
                        ? 'From \${event.price.toStringAsFixed(2)}' 
                        : 'Free',
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
                    'Failed to load your events',
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
