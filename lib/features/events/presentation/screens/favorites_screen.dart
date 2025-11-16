import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/routing/route_manager.dart';
import '../../domain/entities/event_entity.dart';
import '../viewmodels/favorites_viewmodel.dart';
import '../widgets/event_list.dart';

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

  void _onFavoriteTap(EventEntity event) {
    // Refresh the list after removing favorite
    _loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesState = ref.watch(favoritesViewModelProvider);

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
          loading: () => EventList(
            events: const [],
            isLoading: true,
            isGridView: false,
          ),
          success: (events) {
            if (events.isEmpty) {
              return _buildEmptyState();
            }
            return EventList(
              events: events,
              isGridView: false,
              onEventTap: _onEventTap,
              onFavoriteTap: _onFavoriteTap,
              favoriteEventIds: events.map((e) => e.id).toSet(),
            );
          },
          error: (failure) => EventList(
            events: const [],
            error: failure.message,
            isGridView: false,
            onRetry: _loadFavorites,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
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
}
