import 'package:fajimobileapp/core/design_system/typography/app_fonts.dart';
import 'package:flutter/material.dart';

/// Faji App typography system based on Figma designs
/// Provides hierarchical text styles with responsive scaling
class AppTypography {
  AppTypography._();

  // Alias kept for backward compatibility — change font in AppFonts.primary
  static const String modicaPro = AppFonts.primary;

  // Font weights
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight black = FontWeight.w900;

  // Display styles
  static const TextStyle displayLarge = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 32,
    fontWeight: bold, // 700
    height: 1.2,
    letterSpacing: -0.5,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 28,
    fontWeight: bold,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 24,
    fontWeight: bold,
    height: 1.2,
    letterSpacing: 0,
  );

  // Headlines - Using Modica Pro SemiBold for hierarchy
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 24,
    fontWeight: semiBold, // 600
    height: 1.2,
    letterSpacing: -0.5,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 20,
    fontWeight: semiBold,
    height: 1.2,
    letterSpacing: 0,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 18,
    fontWeight: semiBold,
    height: 1.2,
    letterSpacing: 0,
  );

  // Titles - Using Modica Pro Medium for emphasis
  static const TextStyle titleLarge = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 18,
    fontWeight: semiBold,
    height: 1.3,
    letterSpacing: 0,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 16,
    fontWeight: medium,
    height: 1.3,
    letterSpacing: 0,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: medium,
    height: 1.3,
    letterSpacing: 0,
  );

  // Labels/Buttons - Using Modica Pro SemiBold for clarity
  static const TextStyle labelLarge = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 16,
    fontWeight: semiBold, // 600
    height: 1.2,
    letterSpacing: 0,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: semiBold,
    height: 1.2,
    letterSpacing: 0,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 12,
    fontWeight: medium,
    height: 1.2,
    letterSpacing: 0,
  );

  // Body Text - Using Modica Pro Regular for readability
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 15,
    fontWeight: regular, // 400
    height: 1.5,
    letterSpacing: 0,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 14,
    fontWeight: regular, // 400
    height: 1.5,
    letterSpacing: 0,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.primary,
    fontSize: 12,
    fontWeight: regular, // 400
    height: 1.5,
    letterSpacing: 0,
  );

  /// Get Material 3 text theme
  static TextTheme get textTheme => const TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
      );

  /// Responsive text scaling based on screen size
  static double getResponsiveFontSize(double baseFontSize, BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    
    // Mobile: base size
    if (screenWidth < 600) return baseFontSize;
    
    // Tablet: 10% larger
    if (screenWidth < 1200) return baseFontSize * 1.1;
    
    // Desktop: 20% larger
    return baseFontSize * 1.2;
  }

  /// Get responsive text theme based on screen size
  static TextTheme getResponsiveTextTheme(BuildContext context) {
    final scale = _getTextScaleFactor(context);
    
    return TextTheme(
      displayLarge: displayLarge.copyWith(fontSize: displayLarge.fontSize! * scale),
      displayMedium: displayMedium.copyWith(fontSize: displayMedium.fontSize! * scale),
      displaySmall: displaySmall.copyWith(fontSize: displaySmall.fontSize! * scale),
      headlineLarge: headlineLarge.copyWith(fontSize: headlineLarge.fontSize! * scale),
      headlineMedium: headlineMedium.copyWith(fontSize: headlineMedium.fontSize! * scale),
      headlineSmall: headlineSmall.copyWith(fontSize: headlineSmall.fontSize! * scale),
      titleLarge: titleLarge.copyWith(fontSize: titleLarge.fontSize! * scale),
      titleMedium: titleMedium.copyWith(fontSize: titleMedium.fontSize! * scale),
      titleSmall: titleSmall.copyWith(fontSize: titleSmall.fontSize! * scale),
      labelLarge: labelLarge.copyWith(fontSize: labelLarge.fontSize! * scale),
      labelMedium: labelMedium.copyWith(fontSize: labelMedium.fontSize! * scale),
      labelSmall: labelSmall.copyWith(fontSize: labelSmall.fontSize! * scale),
      bodyLarge: bodyLarge.copyWith(fontSize: bodyLarge.fontSize! * scale),
      bodyMedium: bodyMedium.copyWith(fontSize: bodyMedium.fontSize! * scale),
      bodySmall: bodySmall.copyWith(fontSize: bodySmall.fontSize! * scale),
    );
  }

  static double _getTextScaleFactor(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    if (screenWidth < 600) {
      return 1;      // Mobile
    }
    if (screenWidth < 1200) {
      return 1.1;     // Tablet
    }
    return 1.2;                             // Desktop
  }
}