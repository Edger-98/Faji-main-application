import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Standardized text field component following Faji design system
class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.hintText, super.key,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.prefixWidget,
    this.suffixWidget,
    this.enabled = true,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
  });

  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool enabled;
  final bool obscureText;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) => Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A), // Darker, more visible background
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: const Color(0xFF3A3A3A), // Subtle border for definition
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          if (prefixWidget != null) ...[
            prefixWidget!,
            SizedBox(width: 12.w),
          ],
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              enabled: enabled,
              obscureText: obscureText,
              textCapitalization: textCapitalization,
              style: TextStyle(
                fontFamily: AppTypography.modicaPro,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: context.colors.onSurface,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: context.colors.onSurfaceVariant.withOpacity(0.4),
                  fontStyle: FontStyle.italic,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
              ),
            ),
          ),
          if (suffixWidget != null) ...[
            SizedBox(width: 12.w),
            SizedBox(
              height: 24.h,
              width: 24.w,
              child: suffixWidget!,
            ),
          ],
        ],
      ),
    );
}