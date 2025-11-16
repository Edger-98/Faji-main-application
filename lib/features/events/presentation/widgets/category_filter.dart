import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design_system/design_system.dart';

/// Category filter chips
class CategoryFilter extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final Function(String?) onCategorySelected;

  const CategoryFilter({
    super.key,
    required this.categories,
    this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: categories.length + 1, // +1 for "All" chip
        itemBuilder: (context, index) {
          if (index == 0) {
            // "All" chip
            return Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: _buildCategoryChip(
                context,
                'All',
                selectedCategory == null,
                () => onCategorySelected(null),
              ),
            );
          }
          
          final category = categories[index - 1];
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: _buildCategoryChip(
              context,
              category,
              selectedCategory == category,
              () => onCategorySelected(category),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryChip(
    BuildContext context,
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? context.colors.primary : Colors.transparent,
          border: Border.all(
            color: isSelected ? context.colors.primary : context.colors.outline,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: AppText.bodyMedium(
          label,
          color: isSelected ? Colors.white : context.colors.onSurface,
        ),
      ),
    );
  }
}
