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
import 'package:fajimobileapp/features/organize_event/presentation/screens/event_details_tabbed_screen.dart';

/// Your events horizontal scrollable section - Connected to API
class YourEventsSection extends ConsumerStatefulWidget {
  const YourEventsSection({super.key});

  @override
  ConsumerState<YourEventsSection> createState() => _YourEventsSectionState();
}

class _YourEventsSectionState extends ConsumerState<YourEventsSection> {
  bool _hasInitialized = false;
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasInitialized) {
        ref.read(userEventsProvider.notifier).getUserEvents();
        _hasInitialized = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<EventEntity>> yourEvents = ref.watch(userEventsProvider);

    return Column(
      children: <Widget>[
        SectionHeader(
          title: 'Your Events',
          subtitle: "Events you're hosting",
          onViewAll: () {
            // Navigate to create event instead of view all
            context.push(RouteManager.eventCreationFlow);
          },
          viewAllText: '+ Create',
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 280.h,
          child: yourEvents.when(
            data: (List<EventEntity> events) {
              if (events.isEmpty) {
                return _buildEmptyState(context);
              }
              return _buildEventsList(context, events);
            },
            loading: () => _buildLoadingState(context),
            error: (Object error, StackTrace stack) => _buildErrorState(context),
          ),
        ),
      ],
    );
  }

  Widget _buildEventsList(BuildContext context, List<EventEntity> events) => ListView.separated(
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
          isLive: event.isLiveOrTrending,
          onTap: () {
            // Navigate to tabbed event details for organized events
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => EventDetailsTabbedScreen(
                  eventId: event.id,
                  eventName: event.title,
                ),
              ),
            );
          },
          onFavorite: () {
            // TODO: Implement favorite toggle
          },
        );
      },
    );

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
                Icons.add_circle_outline_rounded,
                color: context.colors.primary,
                size: 40.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'No Events Yet',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Create your first event to get started',
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            ElevatedButton.icon(
              onPressed: () {
                context.push(RouteManager.eventCreationFlow);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.primary,
                foregroundColor: context.colors.onPrimary,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
                elevation: 2,
              ),
              icon: Icon(Icons.add, size: 20.sp),
              label: Text(
                'Create Event',
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  Widget _buildErrorState(BuildContext context) => Center(
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
              'Failed to load your events',
              style: AppTypography.bodyMedium.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 12.h),
            TextButton.icon(
              onPressed: () {
                // Retry loading
                ref.read(userEventsProvider.notifier).getUserEvents();
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

  String _formatDate(DateTime date) {
    final List<String> days = <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final String dayName = days[date.weekday - 1];
    return '$dayName ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}';
  }

  String _formatTime(DateTime date) {
    final int hour = date.hour > 12 ? date.hour - 12 : date.hour;
    final String period = date.hour >= 12 ? 'PM' : 'AM';
    return '${hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')} $period';
  }
}
