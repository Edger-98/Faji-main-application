import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Category filter chips section
class CategoryFilterSection extends StatefulWidget {
  const CategoryFilterSection({super.key});

  @override
  State<CategoryFilterSection> createState() => _CategoryFilterSectionState();
}

class _CategoryFilterSectionState extends State<CategoryFilterSection> {
  int _selectedIndex = 0;
  final List<String> _categories = ['All', 'Concert', 'Sports', 'Music', 'Artist'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 6.w),
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedIndex = index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: context.colors.categoryChipBackground,
                borderRadius: BorderRadius.circular(34.5.r),
              ),
              child: Center(
                child: AppText.bodyLarge(
                  _categories[index],
                  color: isSelected
                      ? context.colors.primary
                      : context.colors.textTertiary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
