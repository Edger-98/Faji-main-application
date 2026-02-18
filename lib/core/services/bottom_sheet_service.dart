import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Reusable bottom sheet service for consistent bottom sheets across the app
class BottomSheetService {
  BottomSheetService._();

  /// Show a custom bottom sheet with consistent styling
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    double? height,
    String? title,
  }) => showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: height,
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.r),
            topRight: Radius.circular(28.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            if (enableDrag)
              Container(
                margin: EdgeInsets.only(top: 12.h, bottom: 8.h),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: context.colors.onSurfaceVariant.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            
            // Title
            if (title != null) ...[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.titleLarge(
                      title,
                      color: context.colors.onSurface,
                    ),
                    if (isDismissible)
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close,
                          color: context.colors.onSurface,
                        ),
                      ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: context.colors.outlineVariant,
              ),
            ],
            
            // Content
            Flexible(
              child: child,
            ),
          ],
        ),
      ),
    );

  /// Show a list bottom sheet
  static Future<T?> showList<T>({
    required BuildContext context,
    required String title,
    required List<BottomSheetItem<T>> items,
    T? selectedValue,
  }) => show<T>(
      context: context,
      title: title,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = item.value == selectedValue;
          
          return ListTile(
            leading: item.icon != null
                ? Icon(
                    item.icon,
                    color: isSelected
                        ? context.colors.primary
                        : context.colors.onSurface,
                  )
                : null,
            title: AppText.bodyLarge(
              item.label,
              color: isSelected
                  ? context.colors.primary
                  : context.colors.onSurface,
            ),
            trailing: isSelected
                ? Icon(
                    Icons.check,
                    color: context.colors.primary,
                  )
                : null,
            onTap: () => Navigator.pop(context, item.value),
          );
        },
      ),
    );

  /// Show a confirmation bottom sheet
  static Future<bool?> showConfirmation({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    bool isDangerous = false,
  }) => show<bool>(
      context: context,
      title: title,
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText.bodyLarge(
              message,
              textAlign: TextAlign.center,
              color: context.colors.onSurface,
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(cancelText),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: isDangerous
                        ? ElevatedButton.styleFrom(
                            backgroundColor: context.colors.error,
                          )
                        : null,
                    child: Text(confirmText),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
}

/// Bottom sheet item model
class BottomSheetItem<T> {

  const BottomSheetItem({
    required this.label,
    required this.value,
    this.icon,
  });
  final String label;
  final T value;
  final IconData? icon;
}
