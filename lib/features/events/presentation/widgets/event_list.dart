import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design_system/design_system.dart';
import '../../domain/entities/event_entity.dart';
import 'event_card.dart';
import 'event_loading_shimmer.dart';
import 'event_empty_state.dart';

/// Event List Widget with Grid/List view
class EventList extends StatelessWidget {
  final List<EventEntity> events;
  final bool isLoading;
  final String? error;
  final bool isGridView;
  final Function(EventEntity)? onEventTap;
  final Function(EventEntity)? onFavoriteTap;
  final Set<String> favoriteEventIds;
  final VoidCallback? onRetry;
  final bool showFavoriteButton;

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
    this.showFavoriteButton = true,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return EventLoadingShimmer(isGridView: isGridView);
    }

    if (error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            if (onRetry != null) ...[
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
        itemBuilder: (context, index) {
          final event = events[index];
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
      itemBuilder: (context, index) {
        final event = events[index];
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
