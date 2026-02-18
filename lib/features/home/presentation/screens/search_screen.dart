import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:geolocator/geolocator.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/routing/route_manager.dart';
import 'package:fajimobileapp/core/services/location_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
                              onChanged: (value) => setState(() {}),
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
    // Mock search results
    final List<Map<String, String>> results = <Map<String, String>>[
      <String, String>{
        'title': 'Summer Music Festival 2025',
        'subtitle': 'Central Park, New York',
        'date': 'Jul 15, 2025',
        'price': r'$45.00',
        'image': 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=400',
      },
      <String, String>{
        'title': 'Tech Innovation Summit',
        'subtitle': 'Convention Center, SF',
        'date': 'Aug 20, 2025',
        'price': r'$120.00',
        'image': 'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=400',
      },
      <String, String>{
        'title': 'Food & Wine Tasting',
        'subtitle': 'Downtown Plaza',
        'date': 'Sep 5, 2025',
        'price': r'$65.00',
        'image': 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400',
      },
    ];

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      itemCount: results.length,
      separatorBuilder: (_, __) => SizedBox(height: 16.h),
      itemBuilder: (BuildContext context, int index) {
        final Map<String, String> result = results[index];
        return _buildResultCard(result);
      },
    );
  }

  Widget _buildResultCard(Map<String, String> result) => GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        // TODO: Navigate to event details with actual event ID
        context.push('${RouteManager.eventDetails}/event_123');
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
                image: DecorationImage(
                  image: NetworkImage(result['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result['title']!,
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
                            result['subtitle']!,
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
                          result['date']!,
                          style: AppTypography.bodySmall.copyWith(
                            color: context.colors.onSurfaceVariant,
                          ),
                        ),
                        Text(
                          'From ${result['price']!}',
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
}
