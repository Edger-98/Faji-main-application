import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Filter options model
class FilterOptions {
  final String? sortBy;
  final String? priceRange;
  final double? distance;
  final String? eventDate;

  const FilterOptions({
    this.sortBy,
    this.priceRange,
    this.distance,
    this.eventDate,
  });

  FilterOptions copyWith({
    String? sortBy,
    String? priceRange,
    double? distance,
    String? eventDate,
  }) {
    return FilterOptions(
      sortBy: sortBy ?? this.sortBy,
      priceRange: priceRange ?? this.priceRange,
      distance: distance ?? this.distance,
      eventDate: eventDate ?? this.eventDate,
    );
  }

  bool get hasFilters =>
      sortBy != null ||
      priceRange != null ||
      distance != null ||
      eventDate != null;

  void clear() {}
}

/// Filter bottom sheet widget matching Figma design
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
  String? _selectedSort;
  String? _selectedPrice;
  double _distance = 10.0;
  String? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedSort = widget.initialFilters?.sortBy ?? 'Most popular';
    _selectedPrice = widget.initialFilters?.priceRange;
    _distance = widget.initialFilters?.distance ?? 10.0;
    _selectedDate = widget.initialFilters?.eventDate ?? 'Anytime';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 852.h,
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 64.h),
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHighest,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: context.colors.onSurface,
                      size: 16.sp,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'Sort and Filters',
                  style: TextStyle(
                    fontFamily: AppTypography.modicaPro,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                    color: context.colors.onSurface,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: _resetFilters,
                  child: AppText.bodyMedium(
                    'Restart',
                    color: context.colors.primary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 31.h),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sort by
                  AppText.headlineMedium(
                    'Sort by',
                    color: context.colors.onSurface,
                  ),
                  SizedBox(height: 9.h),
                  _buildSortOption('Most popular'),
                  SizedBox(height: 8.h),
                  _buildSortOption('Price - Low to High'),
                  SizedBox(height: 8.h),
                  _buildSortOption('Price - High to low'),
                  SizedBox(height: 17.h),
                  // Price
                  AppText.headlineMedium(
                    'Price',
                    color: context.colors.onSurface,
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      _buildPriceChip('\$'),
                      SizedBox(width: 7.w),
                      _buildPriceChip('\$\$'),
                      SizedBox(width: 7.w),
                      _buildPriceChip('\$\$\$'),
                      SizedBox(width: 7.w),
                      _buildPriceChip('\$\$\$\$'),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  // Distance away
                  AppText.headlineMedium(
                    'Distance away',
                    color: context.colors.onSurface,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'See events based on your current location',
                    style: TextStyle(
                      fontFamily: AppTypography.modicaPro,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w100,
                      height: 1.2,
                      color: const Color(0xFFB9B9B9),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Expanded(
                        child: SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 11.h,
                            activeTrackColor: const Color(0xFFFFD0E7),
                            inactiveTrackColor: AppColors.surfaceContainerHighest,
                            thumbColor: context.colors.primary,
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 9.5.r,
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 0.r,
                            ),
                            trackShape: const RoundedRectSliderTrackShape(),
                          ),
                          child: Slider(
                            value: _distance,
                            min: 0,
                            max: 50,
                            onChanged: (value) {
                              setState(() => _distance = value);
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '${_distance.toInt()}km',
                        style: TextStyle(
                          fontFamily: AppTypography.modicaPro,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w100,
                          height: 1.2,
                          color: const Color(0xFFB9B9B9),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  // Event date
                  AppText.headlineMedium(
                    'Event date',
                    color: context.colors.onSurface,
                  ),
                  SizedBox(height: 10.h),
                  _buildDateOption('Anytime'),
                  SizedBox(height: 8.h),
                  _buildDateOption('Today'),
                  SizedBox(height: 8.h),
                  _buildDateOption('Price - High to low'),
                  SizedBox(height: 91.h),
                ],
              ),
            ),
          ),
          // Show results button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GestureDetector(
              onTap: _applyFilters,
              child: Container(
                width: 337.w,
                height: 69.h,
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: BorderRadius.circular(34.5.r),
                ),
                alignment: Alignment.center,
                child: AppText.labelLarge(
                  'Show results',
                  color: context.colors.background,
                ),
              ),
            ),
          ),
          SizedBox(height: 18.h),
        ],
      ),
    );
  }

  Widget _buildSortOption(String option) {
    final isSelected = _selectedSort == option;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedSort = option);
      },
      child: Container(
        width: 337.w,
        height: 69.h,
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(37.r),
        ),
        child: Row(
          children: [
            Text(
              option,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 16.sp,
                fontWeight: FontWeight.w100,
                height: 1.2,
                color: const Color(0xFFB9B9B9),
              ),
            ),
            const Spacer(),
            Container(
              width: 19.w,
              height: 19.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? context.colors.primary
                      : const Color(0x33FFFFFF),
                  width: 1.w,
                ),
                color: isSelected
                    ? const Color(0x26FD99C9)
                    : Colors.transparent,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.74.w,
                        height: 10.74.h,
                        decoration: BoxDecoration(
                          color: context.colors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceChip(String price) {

    return GestureDetector(
      onTap: () {
        setState(() => _selectedPrice = price);
      },
      child: Container(
        width: 79.w,
        height: 55.h,
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(37.r),
        ),
        alignment: Alignment.center,
        child: Text(
          price,
          style: TextStyle(
            fontFamily: AppTypography.modicaPro,
            fontSize: 16.sp,
            fontWeight: FontWeight.w100,
            height: 1.2,
            color: const Color(0xFFB9B9B9),
          ),
        ),
      ),
    );
  }

  Widget _buildDateOption(String option) {
    final isSelected = _selectedDate == option;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedDate = option);
      },
      child: Container(
        width: 337.w,
        height: 69.h,
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(37.r),
        ),
        child: Row(
          children: [
            Text(
              option,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 16.sp,
                fontWeight: FontWeight.w100,
                height: 1.2,
                color: const Color(0xFFB9B9B9),
              ),
            ),
            const Spacer(),
            Container(
              width: 19.w,
              height: 19.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? context.colors.primary
                      : const Color(0x33FFFFFF),
                  width: 1.w,
                ),
                color: isSelected
                    ? const Color(0x26FD99C9)
                    : Colors.transparent,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10.74.w,
                        height: 10.74.h,
                        decoration: BoxDecoration(
                          color: context.colors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  void _resetFilters() {
    setState(() {
      _selectedSort = 'Most popular';
      _selectedPrice = null;
      _distance = 10.0;
      _selectedDate = 'Anytime';
    });
  }

  void _applyFilters() {
    final filters = FilterOptions(
      sortBy: _selectedSort,
      priceRange: _selectedPrice,
      distance: _distance,
      eventDate: _selectedDate,
    );
    Navigator.pop(context, filters);
  }
}
