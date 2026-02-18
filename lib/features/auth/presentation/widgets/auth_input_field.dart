import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Input field component matching Figma design system
class AuthInputField extends StatelessWidget {
  const AuthInputField({
    required this.hintText, super.key,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.prefixWidget,
    this.suffixWidget,
  });

  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) => Container(
      width: double.infinity,
      height: 69.h, // Responsive height from Figma
      decoration: BoxDecoration(
        color: context.colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(34.5),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w), // Responsive padding
        child: Row(
          children: [
            if (prefixWidget != null) ...[
              prefixWidget!,
              const SizedBox(width: 12),
            ],
            Expanded(
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                keyboardType: keyboardType,
                inputFormatters: inputFormatters,
                onChanged: onChanged,
                style: TextStyle(
                  fontFamily: AppTypography.modicaPro,
                  fontSize: 17.sp, // Responsive font size
                  fontWeight: FontWeight.w100,
                  height: 1.2,
                  letterSpacing: 0,
                  color: context.colors.onSurface,
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontFamily: AppTypography.modicaPro,
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
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            if (suffixWidget != null) ...[
              const SizedBox(width: 12),
              suffixWidget!,
            ],
          ],
        ),
      ),
    );
}