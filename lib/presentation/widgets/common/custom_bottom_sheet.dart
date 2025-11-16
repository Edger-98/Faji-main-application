import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fajimobileapp/core/design_system/design_system.dart';

class CustomBottomSheet {
  /// Show a custom bottom sheet
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    double? height,
  }) {
    HapticFeedback.lightImpact();
    
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              if (enableDrag) ...[
                SizedBox(height: 12.h),
                Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.textSecondary.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
                SizedBox(height: 12.h),
              ],
              // Content
              Flexible(child: child),
            ],
          ),
        ),
      ),
    );
  }

  /// Show action sheet
  static Future<T?> showActionSheet<T>({
    required BuildContext context,
    required String title,
    required List<ActionSheetItem> actions,
    bool showCancel = true,
  }) {
    return show<T>(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: AppTypography.neueHaasDisplay,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
              ),
            ),
          ),
          Divider(height: 1, color: AppColors.textSecondary.withOpacity(0.2)),
          ...actions.map((action) => _buildActionItem(context, action)),
          if (showCancel) ...[
            Divider(height: 1, color: AppColors.textSecondary.withOpacity(0.2)),
            _buildActionItem(
              context,
              ActionSheetItem(
                label: 'Cancel',
                onTap: () => Navigator.pop(context),
                isDestructive: false,
              ),
            ),
          ],
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  static Widget _buildActionItem(BuildContext context, ActionSheetItem action) {
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.pop(context);
        action.onTap();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Row(
          children: [
            if (action.icon != null) ...[
              Icon(
                action.icon,
                size: 20.sp,
                color: action.isDestructive
                    ? Colors.red
                    : AppColors.onSurface,
              ),
              SizedBox(width: 12.w),
            ],
            Text(
              action.label,
              style: TextStyle(
                fontFamily: AppTypography.ppNeueMontreal,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: action.isDestructive
                    ? Colors.red
                    : AppColors.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionSheetItem {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final bool isDestructive;

  ActionSheetItem({
    required this.label,
    required this.onTap,
    this.icon,
    this.isDestructive = false,
  });
}
