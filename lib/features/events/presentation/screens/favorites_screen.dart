import 'package:fajimobileapp/core/base/base_state.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/core/services/toast_service.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/presentation/viewmodels/favorites_viewmodel.dart';
import 'package:fajimobileapp/features/events/presentation/widgets/event_list.dart';

/// Favorites Screen
class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadFavorites();
    });
  }

  void _loadFavorites() {
    ref.read(favoritesViewModelProvider.notifier).getFavorites();
  }

  void _onEventTap(EventEntity event) {
    context.push('${RouteManager.eventDetails}/${event.id}');
  }

  Future<void> _onFavoriteTap(EventEntity event) async {
    final bool success = await ref.read(favoritesViewModelProvider.notifier).removeFromFavorites(event.id);
    
    if (success && mounted) {
      ToastService.showSuccess(
        context: context,
        message: 'Removed from favorites',
      );
    } else if (mounted) {
      ToastService.showError(
        context: context,
        message: 'Failed to remove from favorites',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final BaseState<List<EventEntity>> favoritesState = ref.watch(favoritesViewModelProvider);

    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        title: AppText.titleLarge(
          'Favorites',
          color: context.colors.onSurface,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _loadFavorites();
        },
        child: favoritesState.when(
          initial: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loading: () => const EventList(
            events: <EventEntity>[],
            isLoading: true,
            isGridView: false,
          ),
          success: (List<EventEntity> events) {
            if (events.isEmpty) {
              return _buildEmptyState();
            }
            return EventList(
              events: events,
              isGridView: false,
              onEventTap: _onEventTap,
              onFavoriteTap: _onFavoriteTap,
              favoriteEventIds: events.map((EventEntity e) => e.id).toSet(),
            );
          },
          error: (Failure failure) => EventList(
            events: const <EventEntity>[],
            error: failure.message,
            isGridView: false,
            onRetry: _loadFavorites,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() => Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 64.sp,
              color: context.colors.onSurfaceVariant,
            ),
            SizedBox(height: 24.h),
            AppText.headlineSmall(
              'No Favorites Yet',
              textAlign: TextAlign.center,
              color: context.colors.onSurface,
            ),
            SizedBox(height: 8.h),
            AppText.bodyMedium(
              'Start exploring events and add them to your favorites to see them here.',
              textAlign: TextAlign.center,
              color: context.colors.onSurfaceVariant,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                context.push(RouteManager.eventsList);
              },
              child: const Text('Explore Events'),
            ),
          ],
        ),
      ),
    );
}
