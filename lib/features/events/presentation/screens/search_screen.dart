import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/routing/route_manager.dart';
import '../../domain/entities/event_entity.dart';
import '../viewmodels/search_viewmodel.dart';
import '../widgets/event_search_bar.dart';
import '../widgets/event_list.dart';

/// Search Events Screen
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _searchController = TextEditingController();
  final List<String> _recentSearches = [];
  final List<String> _popularSearches = [
    'Music concerts',
    'Tech conferences',
    'Food festivals',
    'Sports events',
    'Art exhibitions',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (query.trim().isNotEmpty) {
      // Debounce search
      Future.delayed(const Duration(milliseconds: 500), () {
        if (_searchController.text == query) {
          ref.read(searchViewModelProvider.notifier).search(query);
        }
      });
    } else {
      ref.read(searchViewModelProvider.notifier).clear();
    }
  }

  void _onSearchSubmitted(String query) {
    if (query.trim().isNotEmpty) {
      ref.read(searchViewModelProvider.notifier).search(query);
      
      // Add to recent searches
      if (!_recentSearches.contains(query)) {
        setState(() {
          _recentSearches.insert(0, query);
          if (_recentSearches.length > 5) {
            _recentSearches.removeLast();
          }
        });
      }
    }
  }

  void _onSuggestionTap(String suggestion) {
    _searchController.text = suggestion;
    _onSearchSubmitted(suggestion);
  }

  void _onEventTap(EventEntity event) {
    context.push('${RouteManager.eventDetails}/${event.id}');
  }

  void _clearSearch() {
    _searchController.clear();
    ref.read(searchViewModelProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchViewModelProvider);

    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        title: EventSearchBar(
          controller: _searchController,
          onChanged: _onSearchChanged,
          onSubmitted: _onSearchSubmitted,
          onClear: _clearSearch,
          autofocus: true,
          hintText: 'Search events, organizers, locations...',
        ),
      ),
      body: searchState.when(
        initial: () => _buildSuggestions(),
        loading: () => EventList(
          events: const [],
          isLoading: true,
          isGridView: false,
        ),
        success: (events) {
          if (events.isEmpty && _searchController.text.isNotEmpty) {
            return _buildNoResults();
          }
          return EventList(
            events: events,
            isGridView: false,
            onEventTap: _onEventTap,
          );
        },
        error: (failure) => Center(
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
                failure.message,
                textAlign: TextAlign.center,
                color: context.colors.onSurfaceVariant,
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {
                  if (_searchController.text.isNotEmpty) {
                    ref.read(searchViewModelProvider.notifier)
                        .search(_searchController.text);
                  }
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recent Searches
          if (_recentSearches.isNotEmpty) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.titleMedium(
                  'Recent Searches',
                  color: context.colors.onSurface,
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _recentSearches.clear();
                    });
                  },
                  child: AppText.bodySmall(
                    'Clear All',
                    color: context.colors.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            ..._recentSearches.map((search) => _buildSuggestionTile(
              search,
              Icons.history,
              () => _onSuggestionTap(search),
            )),
            SizedBox(height: 24.h),
          ],
          
          // Popular Searches
          AppText.titleMedium(
            'Popular Searches',
            color: context.colors.onSurface,
          ),
          SizedBox(height: 8.h),
          ..._popularSearches.map((search) => _buildSuggestionTile(
            search,
            Icons.trending_up,
            () => _onSuggestionTap(search),
          )),
        ],
      ),
    );
  }

  Widget _buildSuggestionTile(String text, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: context.colors.onSurfaceVariant,
        size: 20.sp,
      ),
      title: AppText.bodyLarge(
        text,
        color: context.colors.onSurface,
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64.sp,
              color: context.colors.onSurfaceVariant,
            ),
            SizedBox(height: 24.h),
            AppText.headlineSmall(
              'No Events Found',
              textAlign: TextAlign.center,
              color: context.colors.onSurface,
            ),
            SizedBox(height: 8.h),
            AppText.bodyMedium(
              'We couldn\'t find any events matching "${_searchController.text}". Try different keywords.',
              textAlign: TextAlign.center,
              color: context.colors.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
