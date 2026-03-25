import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/core/services/location_service.dart';
import 'package:fajimobileapp/features/events/domain/entities/event_entity.dart';
import 'package:fajimobileapp/features/events/presentation/viewmodels/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  Position? _userLocation;
  bool _isLoadingLocation = false;
  
  final List<String> _categories = <String>[
    'All',
    'Events',
    'Hosts',
    'Venues',
  ];
  
  final List<String> _recentSearches = <String>[
    'Music Festival',
    'Tech Conference',
    'Food & Wine',
  ];
  
  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }
  
  Future<void> _getUserLocation() async {
    setState(() => _isLoadingLocation = true);
    
    final Position? position = await LocationService.getCurrentLocation();
    
    if (mounted) {
      setState(() {
        _userLocation = position;
        _isLoadingLocation = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with back button
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      context.pop();
                    },
                    child: Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: context.colors.surfaceContainerHighest,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: context.colors.onSurface,
                        size: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        color: context.colors.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: context.colors.onSurfaceVariant,
                            size: 20.sp,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              autofocus: true,
                              style: AppTypography.bodyMedium.copyWith(
                                color: context.colors.onSurface,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Search events, hosts, venues...',
                                hintStyle: AppTypography.bodyMedium.copyWith(
                                  color: context.colors.onSurfaceVariant,
                                ),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {});
                                if (value.trim().isNotEmpty) {
                                  // Debounce search
                                  Future.delayed(const Duration(milliseconds: 500), () {
                                    if (_searchController.text == value) {
                                      ref.read(searchViewModelProvider.notifier).search(
                                        query: value,
                                        latitude: _userLocation?.latitude,
                                        longitude: _userLocation?.longitude,
                                        limit: 20,
                                      );
                                    }
                                  });
                                } else {
                                  ref.read(searchViewModelProvider.notifier).clear();
                                }
                              },
                            ),
                          ),
                          if (_searchController.text.isNotEmpty)
                            GestureDetector(
                              onTap: () {
                                HapticFeedback.lightImpact();
                                _searchController.clear();
                                setState(() {});
                              },
                              child: Icon(
                                Icons.clear,
                                color: context.colors.onSurfaceVariant,
                                size: 20.sp,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  if (_userLocation != null)
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: context.colors.primary.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: context.colors.primary,
                        size: 20.sp,
                      ),
                    )
                  else if (_isLoadingLocation)
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: context.colors.surfaceContainerHighest,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.w),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation(context.colors.primary),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Category filters
            SizedBox(
              height: 48.h,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (_, __) => SizedBox(width: 12.w),
                itemBuilder: (context, index) {
                  final category = _categories[index];
                  final isSelected = _selectedCategory == category;
                  
                  return FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      HapticFeedback.lightImpact();
                      setState(() => _selectedCategory = category);
                    },
                    backgroundColor: context.colors.surfaceContainerHighest,
                    selectedColor: context.colors.primary,
                    labelStyle: AppTypography.labelMedium.copyWith(
                      color: isSelected ? context.colors.onPrimary : context.colors.onSurface,
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 24.h),

            // Content
            Expanded(
              child: _searchController.text.isEmpty
                  ? _buildRecentSearches()
                  : _buildSearchResults(),
            ),
          ],
        ),
      ),
    );

  Widget _buildRecentSearches() {
    if (_recentSearches.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.search_rounded,
              size: 64.sp,
              color: context.colors.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            SizedBox(height: 16.h),
            Text(
              'Search for events',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Find events, hosts, and venues',
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Recent Searches',
                style: AppTypography.titleMedium.copyWith(
                  color: context.colors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {
                  HapticFeedback.lightImpact();
                  setState(_recentSearches.clear);
                },
                child: Text(
                  'Clear',
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ..._recentSearches.map(_buildRecentSearchItem),
        ],
      ),
    );
  }

  Widget _buildRecentSearchItem(String search) => GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        _searchController.text = search;
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(
              Icons.history_rounded,
              color: context.colors.onSurfaceVariant,
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                search,
                style: AppTypography.bodyMedium.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ),
            Icon(
              Icons.arrow_outward_rounded,
              color: context.colors.onSurfaceVariant,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );

  Widget _buildSearchResults() {
    final searchState = ref.watch(searchViewModelProvider);

    return searchState.when(
      initial: () => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.search_rounded,
              size: 64.sp,
              color: context.colors.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            SizedBox(height: 16.h),
            Text(
              'Start searching',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(context.colors.primary),
        ),
      ),
      success: (events) {
        if (events.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.search_off_rounded,
                  size: 64.sp,
                  color: context.colors.onSurfaceVariant.withValues(alpha: 0.5),
                ),
                SizedBox(height: 16.h),
                Text(
                  'No results found',
                  style: AppTypography.titleMedium.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Try adjusting your search',
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          itemCount: events.length,
          separatorBuilder: (_, __) => SizedBox(height: 16.h),
          itemBuilder: (BuildContext context, int index) {
            final event = events[index];
            return _buildEventCard(event);
          },
        );
      },
      error: (failure) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.error_outline_rounded,
              size: 64.sp,
              color: context.colors.error,
            ),
            SizedBox(height: 16.h),
            Text(
              'Something went wrong',
              style: AppTypography.titleMedium.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              failure.message,
              style: AppTypography.bodySmall.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                if (_searchController.text.trim().isNotEmpty) {
                  ref.read(searchViewModelProvider.notifier).search(
                    query: _searchController.text,
                    latitude: _userLocation?.latitude,
                    longitude: _userLocation?.longitude,
                    limit: 20,
                  );
                }
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(EventEntity event) => GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        context.push('${RouteManager.eventDetails}/${event.id}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(16.r)),
                color: context.colors.surfaceContainerHighest,
                image: event.imageUrl.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(event.imageUrl),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: event.imageUrl.isEmpty
                  ? Icon(
                      Icons.event,
                      size: 40.sp,
                      color: context.colors.onSurfaceVariant,
                    )
                  : null,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.title,
                      style: AppTypography.bodyMedium.copyWith(
                        color: context.colors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 14.sp,
                          color: context.colors.onSurfaceVariant,
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            _formatLocation(event.location),
                            style: AppTypography.bodySmall.copyWith(
                              color: context.colors.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('MMM dd, yyyy').format(event.startDate),
                          style: AppTypography.bodySmall.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                        if (event.price > 0)
                          Text(
                            'From ${event.currency} ${event.price.toStringAsFixed(0)}',
                            style: AppTypography.bodySmall.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        else
                          Text(
                            'Free',
                            style: AppTypography.bodySmall.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _formatLocation(String location) {
    // Check if location looks like coordinates (contains "Lat:" or numbers with commas)
    if (location.contains('Lat:') || location.contains('Lng:') || 
        RegExp(r'^\d+\.\d+,\s*-?\d+\.\d+$').hasMatch(location)) {
      return 'Location available';
    }
    return location;
  }
}
