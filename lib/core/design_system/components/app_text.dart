import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Standardized text component following Faji design system
class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  // Predefined text styles with responsive sizing
  static Widget headlineLarge(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Builder(
      builder: (context) => AppText(
        text,
        style: TextStyle(
          fontFamily: AppTypography.neueHaasDisplay,
          fontSize: 28.sp, // Responsive font size
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: 0,
          color: color ?? context.colors.onSurface,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }

  static Widget displayLarge(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Builder(
      builder: (context) => AppText(
        text,
        style: TextStyle(
          fontFamily: AppTypography.neueHaasDisplay,
          fontSize: 34.sp, // Responsive font size - EXACT from Figma for "Hi, Chineme!"
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: 0,
          color: color ?? context.colors.onSurface,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }

  static Widget bodyLarge(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Builder(
      builder: (context) => AppText(
        text,
        style: TextStyle(
          fontFamily: AppTypography.ppNeueMontreal,
          fontSize: 17.sp, // Responsive font size
          fontWeight: FontWeight.w400, // EXACT from Figma
          height: 1.2,
          letterSpacing: 0,
          color: color ?? context.colors.onSurfaceVariant,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }

  static Widget bodyMedium(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Builder(
      builder: (context) => AppText(
        text,
        style: TextStyle(
          fontFamily: AppTypography.ppNeueMontreal,
          fontSize: 15.sp, // Responsive font size - EXACT from Figma for event titles
          fontWeight: FontWeight.w400, // EXACT from Figma
          height: 1.2,
          letterSpacing: 0,
          color: color ?? context.colors.onSurfaceVariant,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }

  static Widget labelLarge(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Builder(
      builder: (context) => AppText(
        text,
        style: TextStyle(
          fontFamily: AppTypography.neueHaasDisplay,
          fontSize: 18.sp, // Responsive font size
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: 0,
          color: color ?? context.colors.onSurface,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }

  static Widget titleLarge(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Builder(
      builder: (context) => AppText(
        text,
        style: TextStyle(
          fontFamily: AppTypography.neueHaasDisplay,
          fontSize: 22.sp, // Responsive font size
          fontWeight: FontWeight.w600,
          height: 1.2,
          letterSpacing: 0,
          color: color ?? context.colors.onSurface,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }

  static Widget headlineMedium(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Builder(
      builder: (context) => AppText(
        text,
        style: TextStyle(
          fontFamily: AppTypography.neueHaasDisplay,
          fontSize: 25.sp, // Responsive font size - EXACT from Figma
          fontWeight: FontWeight.w500, // EXACT from Figma
          height: 1.2,
          letterSpacing: 0,
          color: color ?? context.colors.onSurface,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }

  static Widget displayMedium(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Builder(
      builder: (context) => AppText(
        text,
        style: TextStyle(
          fontFamily: AppTypography.ppNeueMontreal,
          fontSize: 32.sp, // Responsive font size - EXACT from Figma for "Tap for $20"
          fontWeight: FontWeight.w500, // EXACT from Figma
          height: 1.2,
          letterSpacing: 0,
          color: color ?? context.colors.onSurface,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }

  static Widget bodySmall(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextDecoration? decoration,
    TextOverflow? overflow,
  }) {
    return Builder(
      builder: (context) => AppText(
        text,
        style: TextStyle(
          fontFamily: AppTypography.ppNeueMontreal,
          fontSize: 12.sp, // Responsive font size - EXACT from Figma for date/time
          fontWeight: FontWeight.w400, // EXACT from Figma
          height: 1.2,
          letterSpacing: 0,
          color: color ?? context.colors.onSurfaceVariant,
          decoration: decoration,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }

  static Widget titleMedium(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Builder(
      builder: (context) => AppText(
        text,
        style: TextStyle(
          fontFamily: AppTypography.ppNeueMontreal,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          height: 1.3,
          letterSpacing: 0,
          color: color ?? context.colors.onSurface,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }

  static Widget titleSmall(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Builder(
      builder: (context) => AppText(
        text,
        style: TextStyle(
          fontFamily: AppTypography.ppNeueMontreal,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          height: 1.3,
          letterSpacing: 0,
          color: color ?? context.colors.onSurface,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }

  static Widget headlineSmall(
    String text, {
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Builder(
      builder: (context) => AppText(
        text,
        style: TextStyle(
          fontFamily: AppTypography.ppNeueMontreal,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          height: 1.2,
          letterSpacing: 0,
          color: color ?? context.colors.onSurface,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}
