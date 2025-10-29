import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Standardized text field component following Faji design system
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
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
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 69.h, // Responsive height from Figma
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(34.5.r), // Responsive border radius
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w), // Responsive padding
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
                  fontFamily: AppTypography.ppNeueMontreal,
                  fontSize: 17.sp, // Responsive font size
                  fontWeight: FontWeight.w100,
                  height: 1.2,
                  letterSpacing: 0,
                  color: context.colors.onSurface,
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontFamily: AppTypography.ppNeueMontreal,
                    fontSize: 17.sp, // Responsive font size
                    fontWeight: FontWeight.w100,
                    height: 1.2,
                    letterSpacing: 0,
                    color: context.colors.onSurfaceVariant,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            if (suffixWidget != null) ...[
              SizedBox(width: 12.w),
              suffixWidget!,
            ],
          ],
        ),
      ),
    );
  }
}