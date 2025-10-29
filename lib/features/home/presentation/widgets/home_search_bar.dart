import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/services/bottom_sheet_service.dart';
import 'package:fajimobileapp/features/home/presentation/widgets/filter_bottom_sheet.dart';

/// Search bar for home screen
class HomeSearchBar extends StatelessWidget {
  final VoidCallback? onSearchTap;
  final VoidCallback? onFilterTap;

  const HomeSearchBar({
    super.key,
    this.onSearchTap,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSearchTap ?? () => _showSearch(context),
      child: Container(
        height: 69.h,
        decoration: BoxDecoration(
          color: context.colors.searchBarBackground,
          borderRadius: BorderRadius.circular(34.5.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 24.w),
            Icon(
              Icons.search,
              color: context.colors.onSurfaceVariant,
              size: 18.sp,
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: AppText.labelLarge(
                'Search on Faji',
                color: context.colors.onSurfaceVariant,
              ),
            ),
            GestureDetector(
              onTap: onFilterTap ?? () => _showFilter(context),
              child: Container(
                padding: EdgeInsets.all(8.w),
                child: Icon(
                  Icons.tune,
                  color: context.colors.iconGray,
                  size: 18.sp,
                ),
              ),
            ),
            SizedBox(width: 16.w),
          ],
        ),
      ),
    );
  }

  void _showSearch(BuildContext context) {
    showSearch(
      context: context,
      delegate: EventSearchDelegate(),
    );
  }

  void _showFilter(BuildContext context) async {
    final result = await BottomSheetService.show<FilterOptions>(
      context: context,
      child: const FilterBottomSheet(),
    );

    if (result != null) {
      // TODO: Apply filters to event list
      debugPrint('Filters applied: ${result.category}, ${result.sortBy}');
    }
  }
}

/// Search delegate for event search
class EventSearchDelegate extends SearchDelegate<String> {
  final List<String> _mockEvents = [
    'GENfest Music Festival 2024',
    'Rock Concert Live',
    'Jazz Night',
    'Sports Championship',
    'Comedy Show',
    'Theater Performance',
    'Art Exhibition',
    'Food Festival',
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: context.colors.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: context.colors.onSurface),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: context.colors.onSurfaceVariant,
          fontSize: 18.sp,
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: context.colors.onSurface,
          fontSize: 18.sp,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _mockEvents
        .where((event) => event.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildResultsList(context, results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? _mockEvents
        : _mockEvents
            .where((event) => event.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return _buildResultsList(context, suggestions);
  }

  Widget _buildResultsList(BuildContext context, List<String> items) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64.sp,
              color: context.colors.onSurfaceVariant,
            ),
            SizedBox(height: 16.h),
            AppText.bodyLarge(
              'No events found',
              color: context.colors.onSurfaceVariant,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final event = items[index];
        return ListTile(
          leading: Icon(
            Icons.event,
            color: context.colors.primary,
          ),
          title: AppText.bodyLarge(
            event,
            color: context.colors.onSurface,
          ),
          onTap: () {
            close(context, event);
            // TODO: Navigate to event details
          },
        );
      },
    );
  }
}

