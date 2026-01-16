import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/routing/route_manager.dart';
import '../../../../core/services/location_service.dart';
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
  
  Position? _userLocation;
  bool _isLoadingLocation = false;
  bool _sortByDistance = false;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  
  Future<void> _getUserLocation() async {
    setState(() => _isLoadingLocation = true);
    
    final position = await LocationService.getCurrentLocation();
    
    if (mounted) {
      setState(() {
        _userLocation = position;
        _isLoadingLocation = false;
        if (position != null) {
          _sortByDistance = true;
        }
      });
    }
  }
  
  List<EventEntity> _sortEventsByDistance(List<EventEntity> events) {
    if (_userLocation == null || !_sortByDistance) return events;
    
    final sortedEvents = List<EventEntity>.from(events);
    sortedEvents.sort((a, b) {
      final distA = LocationService.calculateDistance(
        _userLocation!.latitude,
        _userLocation!.longitude,
        a.latitude,
        a.longitude,
      );
      
      final distB = LocationService.calculateDistance(
        _userLocation!.latitude,
        _userLocation!.longitude,
        b.latitude,
        b.longitude,
      );
      
      return distA.compareTo(distB);
    });
    
    return sortedEvents;
  }
  
  double? _getEventDistance(EventEntity event) {
    if (_userLocation == null) return null;
    
    return LocationService.calculateDistance(
      _userLocation!.latitude,
      _userLocation!.longitude,
      event.latitude,
      event.longitude,
    );
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
          hintText: 'Search events, hosts, locations...',
        ),
        actions: [
          if (_userLocation != null)
            IconButton(
              icon: Icon(
                _sortByDistance ? Icons.location_on : Icons.location_off,
                color: _sortByDistance ? context.colors.primary : context.colors.onSurfaceVariant,
              ),
              onPressed: () {
                setState(() {
                  _sortByDistance = !_sortByDistance;
                });
              },
              tooltip: _sortByDistance ? 'Sorting by distance' : 'Sort by distance',
            )
          else if (_isLoadingLocation)
            Padding(
              padding: EdgeInsets.all(16.w),
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(context.colors.primary),
                ),
              ),
            )
          else
            IconButton(
              icon: Icon(Icons.location_off, color: context.colors.onSurfaceVariant),
              onPressed: _getUserLocation,
              tooltip: 'Enable location',
            ),
        ],
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
          
          final sortedEvents = _sortEventsByDistance(events);
          
          return Column(
            children: [
              if (_userLocation != null && _sortByDistance)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  color: context.colors.primary.withValues(alpha: 0.1),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16.sp,
                        color: context.colors.primary,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Showing nearby events',
                        style: AppTypography.bodySmall.copyWith(
                          color: context.colors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: EventList(
                  events: sortedEvents,
                  isGridView: false,
                  onEventTap: _onEventTap,
                ),
              ),
            ],
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
