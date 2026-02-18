import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/core/services/bottom_sheet_service.dart';
import 'package:fajimobileapp/features/home/presentation/widgets/filter_bottom_sheet.dart';

/// Search bar for home screen
class HomeSearchBar extends StatelessWidget {

  const HomeSearchBar({
    super.key,
    this.onSearchTap,
    this.onFilterTap,
  });
  final VoidCallback? onSearchTap;
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) => Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onSearchTap ?? () => _showSearch(context),
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
                    child: Text(
                      'Search events, hosts...',
                      style: AppTypography.bodyMedium.copyWith(
                        color: context.colors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        GestureDetector(
          onTap: onFilterTap ?? () => _showFilter(context),
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: context.colors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Icon(
              Icons.tune_rounded,
              color: context.colors.onSurface,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );

  void _showSearch(BuildContext context) {
    context.push('/search');
  }

  Future<void> _showFilter(BuildContext context) async {
    final FilterOptions? result = await BottomSheetService.show<FilterOptions>(
      context: context,
      child: const FilterBottomSheet(),
    );

    if (result != null) {
      // TODO: Apply filters to event list
    }
  }
}
