import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/presentation/widgets/event_card.dart';
import 'package:fajimobileapp/features/events/presentation/widgets/event_empty_state.dart';

/// Event List Widget with Grid/List view
class EventList extends StatelessWidget { // Defaults to false now

  const EventList({
    super.key,
    required this.events,
    this.isLoading = false,
    this.error,
    this.isGridView = true,
    this.onEventTap,
    this.onFavoriteTap,
    this.favoriteEventIds = const {},
    this.onRetry,
    this.showFavoriteButton = false, // Changed default to false
  });
  final List<EventEntity> events;
  final bool isLoading;
  final String? error;
  final bool isGridView;
  final Function(EventEntity)? onEventTap;
  final Function(EventEntity)? onFavoriteTap;
  final Set<String> favoriteEventIds;
  final VoidCallback? onRetry;
  final bool showFavoriteButton;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: context.colors.primary,
        ),
      );
    }

    if (error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.error_outline,
              size: 48.sp,
              color: context.colors.error,
            ),
            SizedBox(height: 16.h),
            AppText.bodyLarge(
              error!,
              textAlign: TextAlign.center,
              color: context.colors.onSurfaceVariant,
            ),
            if (onRetry != null) ...<Widget>[
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      );
    }

    if (events.isEmpty) {
      return const EventEmptyState();
    }

    if (isGridView) {
      return GridView.builder(
        padding: EdgeInsets.all(16.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
        ),
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          final EventEntity event = events[index];
          return EventCard(
            event: event,
            onTap: () => onEventTap?.call(event),
            onFavorite: () => onFavoriteTap?.call(event),
            isFavorite: favoriteEventIds.contains(event.id),
            showFavoriteButton: showFavoriteButton,
          );
        },
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: events.length,
      itemBuilder: (BuildContext context, int index) {
        final EventEntity event = events[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: EventCard(
            event: event,
            onTap: () => onEventTap?.call(event),
            onFavorite: () => onFavoriteTap?.call(event),
            isFavorite: favoriteEventIds.contains(event.id),
            showFavoriteButton: showFavoriteButton,
          ),
        );
      },
    );
  }
}
