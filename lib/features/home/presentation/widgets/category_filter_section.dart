import 'package:fajimobileapp/features/events/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/features/events/presentation/providers/event_providers.dart';

/// Category filter chips section with improved UX
class CategoryFilterSection extends ConsumerWidget {
  const CategoryFilterSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<CategoryEntity>> categoriesAsync = ref.watch(categoriesProvider);
    final String? selectedCategory = ref.watch(selectedCategoryProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
          child: categoriesAsync.when(
            data: (List<CategoryEntity> categories) {
              // Add "All" category at the beginning and limit to 5 categories
              final List<Map<String, String?>> allCategories = <Map<String, String?>>[
                <String, String?>{'id': null, 'name': 'All', 'icon': '🎯'},
                ...categories.take(5).map((CategoryEntity cat) => <String, String>{
                  'id': cat.name, // Use name for API filtering
                  'name': cat.name,
                  'icon': cat.icon,
                }),
              ];

              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                scrollDirection: Axis.horizontal,
                itemCount: allCategories.length,
                separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10.w),
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, String?> category = allCategories[index];
                  final bool isSelected = selectedCategory == category['id'];
                  
                  return GestureDetector(
                    onTap: () => ref.read(selectedCategoryProvider.notifier).state = category['id'],
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
                            ? <BoxShadow>[
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
                        children: <Widget>[
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
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (Object error, StackTrace stack) => Center(
              child: Text(
                'Failed to load categories',
                style: AppTypography.bodySmall.copyWith(
                  color: context.colors.error,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
