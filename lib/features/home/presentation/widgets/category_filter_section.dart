import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Category filter chips section with improved UX
class CategoryFilterSection extends StatefulWidget {
  const CategoryFilterSection({super.key});

  @override
  State<CategoryFilterSection> createState() => _CategoryFilterSectionState();
}

class _CategoryFilterSectionState extends State<CategoryFilterSection> {
  int _selectedIndex = 0;
  final List<Map<String, String>> _categories = [
    {'name': 'All', 'icon': '🎯'},
    {'name': 'Concert', 'icon': '🎵'},
    {'name': 'Sports', 'icon': '⚽'},
    {'name': 'Music', 'icon': '🎸'},
    {'name': 'Art', 'icon': '🎨'},
    {'name': 'Food', 'icon': '🍽️'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            'Categories',
            style: AppTypography.titleMedium.copyWith(
              color: context.colors.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 44.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              final isSelected = _selectedIndex == index;
              final category = _categories[index];
              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? context.colors.primary
                        : context.colors.categoryChipBackground,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(
                      color: isSelected
                          ? context.colors.primary
                          : Colors.transparent,
                      width: 1.5,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: context.colors.primary.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        category['icon']!,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        category['name']!,
                        style: AppTypography.bodyMedium.copyWith(
                          color: isSelected
                              ? Colors.white
                              : context.colors.onSurface,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
