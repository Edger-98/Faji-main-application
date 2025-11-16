import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
    context.push('/search');
  }

  void _showFilter(BuildContext context) async {
    final result = await BottomSheetService.show<FilterOptions>(
      context: context,
      child: const FilterBottomSheet(),
    );

    if (result != null) {
      // TODO: Apply filters to event list
    }
  }
}
