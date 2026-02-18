import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class QuickFilters extends StatefulWidget {

  const QuickFilters({
    super.key,
    required this.onFilterSelected,
  });
  final Function(String) onFilterSelected;

  @override
  State<QuickFilters> createState() => _QuickFiltersState();
}

class _QuickFiltersState extends State<QuickFilters> {
  final String _selectedFilter = 'All';

  final List<Map<String, dynamic>> _filters = <Map<String, dynamic>>[
    <String, dynamic>{'label': 'All', 'icon': Icons.grid_view},
    <String, dynamic>{'label': 'Today', 'icon': Icons.today},
    <String, dynamic>{'label': 'This Week', 'icon': Icons.date_range},
    <String, dynamic>{'label': 'Free', 'icon': Icons.money_off},
    <String, dynamic>{'label': 'Popular', 'icon': Icons.trending_up},
  ];

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemCount: _filters.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final isSelected = _selectedFilter == filter['label'];

          return GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              // setState(() => _selectedFilter = filter['label']);
              // widget.onFilterSelected(filter['label']);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colors.primary
                    : AppColors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                ],
              ),
            ),
          );

        },
      ),
    );
}
