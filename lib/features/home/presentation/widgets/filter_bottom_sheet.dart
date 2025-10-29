import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Filter options model
class FilterOptions {
  final String? category;
  final String? location;
  final DateTimeRange? dateRange;
  final RangeValues? priceRange;
  final String? sortBy;

  const FilterOptions({
    this.category,
    this.location,
    this.dateRange,
    this.priceRange,
    this.sortBy,
  });

  FilterOptions copyWith({
    String? category,
    String? location,
    DateTimeRange? dateRange,
    RangeValues? priceRange,
    String? sortBy,
  }) {
    return FilterOptions(
      category: category ?? this.category,
      location: location ?? this.location,
      dateRange: dateRange ?? this.dateRange,
      priceRange: priceRange ?? this.priceRange,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  bool get hasFilters =>
      category != null ||
      location != null ||
      dateRange != null ||
      priceRange != null ||
      sortBy != null;

  void clear() {}
}

/// Filter bottom sheet widget
class FilterBottomSheet extends StatefulWidget {
  final FilterOptions? initialFilters;

  const FilterBottomSheet({
    super.key,
    this.initialFilters,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late FilterOptions _filters;

  final List<String> _categories = [
    'All',
    'Concert',
    'Sports',
    'Music',
    'Artist',
    'Festival',
    'Theater',
    'Comedy',
  ];

  final List<String> _sortOptions = [
    'Relevance',
    'Date (Newest)',
    'Date (Oldest)',
    'Price (Low to High)',
    'Price (High to Low)',
    'Popularity',
  ];

  @override
  void initState() {
    super.initState();
    _filters = widget.initialFilters ?? const FilterOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header (no drag handle - provided by BottomSheetService)
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.titleLarge(
                'Filters',
                color: context.colors.onSurface,
              ),
              TextButton(
                onPressed: _clearFilters,
                child: AppText.bodyLarge(
                  'Clear All',
                  color: context.colors.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category
                  _buildSectionTitle('Category'),
                  SizedBox(height: 12.h),
                  _buildCategoryChips(),
                  SizedBox(height: 24.h),

                  // Sort By
                  _buildSectionTitle('Sort By'),
                  SizedBox(height: 12.h),
                  _buildSortOptions(),
                  SizedBox(height: 24.h),

                  // Price Range
                  _buildSectionTitle('Price Range'),
                  SizedBox(height: 12.h),
                  _buildPriceRange(),
                  SizedBox(height: 24.h),

                  // Date Range
                  _buildSectionTitle('Date Range'),
                  SizedBox(height: 12.h),
                  _buildDateRange(),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),

          // Apply Button
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context, _filters),
                  child: AppText.labelLarge(
                    'Apply Filters',
                    color: context.colors.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return AppText.headlineMedium(
      title,
      color: context.colors.onSurface,
    );
  }

  Widget _buildCategoryChips() {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: _categories.map((category) {
        final isSelected = _filters.category == category;
        return GestureDetector(
          onTap: () {
            setState(() {
              _filters = _filters.copyWith(
                category: isSelected ? null : category,
              );
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: isSelected
                  ? context.colors.primary
                  : context.colors.categoryChipBackground,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: AppText.bodyMedium(
              category,
              color: isSelected
                  ? context.colors.onPrimary
                  : context.colors.onSurface,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSortOptions() {
    return Column(
      children: _sortOptions.map((option) {
        final isSelected = _filters.sortBy == option;
        return RadioListTile<String>(
          value: option,
          groupValue: _filters.sortBy,
          onChanged: (value) {
            setState(() {
              _filters = _filters.copyWith(sortBy: value);
            });
          },
          title: AppText.bodyLarge(
            option,
            color: context.colors.onSurface,
          ),
          activeColor: context.colors.primary,
          contentPadding: EdgeInsets.zero,
        );
      }).toList(),
    );
  }

  Widget _buildPriceRange() {
    final currentRange = _filters.priceRange ?? const RangeValues(0, 500);
    return Column(
      children: [
        RangeSlider(
          values: currentRange,
          min: 0,
          max: 500,
          divisions: 50,
          activeColor: context.colors.primary,
          labels: RangeLabels(
            '\$${currentRange.start.round()}',
            '\$${currentRange.end.round()}',
          ),
          onChanged: (values) {
            setState(() {
              _filters = _filters.copyWith(priceRange: values);
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.bodyMedium(
              '\$${currentRange.start.round()}',
              color: context.colors.onSurface,
            ),
            AppText.bodyMedium(
              '\$${currentRange.end.round()}',
              color: context.colors.onSurface,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDateRange() {
    return OutlinedButton(
      onPressed: _selectDateRange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.bodyLarge(
            _filters.dateRange != null
                ? '${_formatDate(_filters.dateRange!.start)} - ${_formatDate(_filters.dateRange!.end)}'
                : 'Select Date Range',
            color: context.colors.onSurface,
          ),
          Icon(
            Icons.calendar_today,
            color: context.colors.onSurface,
            size: 20.sp,
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> _selectDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange: _filters.dateRange,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: context.colors.primary,
              onPrimary: context.colors.onPrimary,
              surface: context.colors.surface,
              onSurface: context.colors.onSurface,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _filters = _filters.copyWith(dateRange: picked);
      });
    }
  }

  void _clearFilters() {
    setState(() {
      _filters = const FilterOptions();
    });
  }
}
