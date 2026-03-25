import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/core/services/toast_service.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';
import 'package:fajimobileapp/features/events/presentation/viewmodels/events_list_viewmodel.dart';
import 'package:fajimobileapp/features/events/presentation/viewmodels/favorites_viewmodel.dart';
import 'package:fajimobileapp/features/events/presentation/widgets/event_card.dart';
import 'package:fajimobileapp/features/events/presentation/widgets/event_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

/// Events List Screen with filters
class EventsListScreen extends ConsumerStatefulWidget {
  const EventsListScreen({super.key});

  @override
  ConsumerState<EventsListScreen> createState() => _EventsListScreenState();
}

class _EventsListScreenState extends ConsumerState<EventsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isGridView = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadEvents();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadEvents() {
    final selectedCategory = ref.read(selectedCategoryProvider);
    print('🔍 EventsListScreen: Loading events with category ID: $selectedCategory');
    print('🔍 EventsListScreen: Search query: ${_searchController.text}');
    
    ref.read(eventsListViewModelProvider.notifier).getEvents(
      category: selectedCategory,
      search: _searchController.text.isNotEmpty ? _searchController.text : null,
      limit: 20,
    );
  }

  void _onSearchChanged(String query) {
    // Debounce search
    Future.delayed(const Duration(milliseconds: 500), () {
      if (_searchController.text == query) {
        _loadEvents();
      }
    });
  }

  void _onEventTap(EventEntity event) {
    context.push('${RouteManager.eventDetails}/${event.id}');
  }

  Future<void> _onFavoriteTap(EventEntity event) async {
    final bool success = await ref.read(favoritesViewModelProvider.notifier).toggleFavorite(event);
    
    if (success && mounted) {
      final bool isFavorite = ref.read(favoritesViewModelProvider.notifier).isFavorite(event.id);
      ToastService.showSuccess(
        context: context,
        message: isFavorite ? 'Added to favorites' : 'Removed from favorites',
      );
    } else if (mounted) {
      ToastService.showError(
        context: context,
        message: 'Failed to update favorites',
      );
    }
  }

  void _toggleViewMode() {
    setState(() {
      _isGridView = !_isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventsState = ref.watch(eventsListViewModelProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

    // Listen to category changes and reload
    ref.listen<String?>(selectedCategoryProvider, (previous, next) {
      if (previous != next) {
        _loadEvents();
      }
    });

    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        title: AppText.titleLarge(
          'Events',
          color: context.colors.onSurface,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              _isGridView ? Icons.view_list : Icons.grid_view,
              color: context.colors.onSurface,
            ),
            onPressed: _toggleViewMode,
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: context.colors.onSurface,
            ),
            onPressed: () {
              context.push(RouteManager.searchEvents);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _loadEvents();
        },
        child: CustomScrollView(
          slivers: <Widget>[
            // Search Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: EventSearchBar(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  hintText: 'Search events...',
                ),
              ),
            ),
            
            // Category Filter - Using the same component as dashboard
            SliverToBoxAdapter(
              child: categoriesAsync.when(
                data: (categories) {
                  final allCategories = [
                    {'id': null, 'name': 'All', 'icon': '🎯'},
                    ...categories.map((cat) => {
                      'id': cat.name, // Use name instead of id for API
                      'name': cat.name,
                      'icon': cat.icon,
                    }),
                  ];

                  return SizedBox(
                    height: 44.h,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: allCategories.length,
                      separatorBuilder: (_, __) => SizedBox(width: 10.w),
                      itemBuilder: (context, index) {
                        final category = allCategories[index];
                        final isSelected = selectedCategory == category['id'];
                        
                        return GestureDetector(
                          onTap: () {
                            ref.read(selectedCategoryProvider.notifier).state = category['id'];
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? context.colors.primary
                                  : context.colors.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(24.r),
                              border: Border.all(
                                color: isSelected
                                    ? context.colors.primary
                                    : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  category['icon'] as String,
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  category['name'] as String,
                                  style: AppTypography.bodyMedium.copyWith(
                                    color: isSelected
                                        ? Colors.white
                                        : context.colors.onSurface,
                                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),
            
            SliverToBoxAdapter(
              child: SizedBox(height: 8.h),
            ),
            
            // Events List
            eventsState.when(
              initial: () => SliverFillRemaining(
                child: const Center(
                  child: Text('Pull to refresh or search for events'),
                ),
              ),
              loading: () => SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.colors.primary,
                  ),
                ),
              ),
              success: (List<EventEntity> events) {
                if (events.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text('No events found'),
                    ),
                  );
                }
                
                if (_isGridView) {
                  return SliverPadding(
                    padding: EdgeInsets.all(16.w),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final event = events[index];
                          return EventCard(
                            event: event,
                            onTap: () => _onEventTap(event),
                            onFavorite: () => _onFavoriteTap(event),
                            isFavorite: ref.read(favoritesViewModelProvider.notifier).isFavorite(event.id),
                            showFavoriteButton: true,
                          );
                        },
                        childCount: events.length,
                      ),
                    ),
                  );
                }
                
                return SliverPadding(
                  padding: EdgeInsets.all(16.w),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final event = events[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: EventCard(
                            event: event,
                            onTap: () => _onEventTap(event),
                            onFavorite: () => _onFavoriteTap(event),
                            isFavorite: ref.read(favoritesViewModelProvider.notifier).isFavorite(event.id),
                            showFavoriteButton: true,
                          ),
                        );
                      },
                      childCount: events.length,
                    ),
                  ),
                );
              },
              error: (Failure failure) => SliverFillRemaining(
                child: Center(
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
                        failure.message,
                        textAlign: TextAlign.center,
                        color: context.colors.onSurfaceVariant,
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: _loadEvents,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
