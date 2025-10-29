import 'package:flutter/material.dart';

/// Responsive spacing system based on screen size
class ResponsiveSpacing {
  ResponsiveSpacing._();

  /// Get responsive spacing based on screen width
  static double getSpacing(BuildContext context, double baseSpacing) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    if (screenWidth < 600) {
      return baseSpacing; // Mobile
    } else if (screenWidth < 1200) {
      return baseSpacing * 1.2; // Tablet
    } else {
      return baseSpacing * 1.4; // Desktop
    }
  }

  /// Predefined spacing values (based on 8px grid system)
  static double xs(BuildContext context) => getSpacing(context, 4);
  static double sm(BuildContext context) => getSpacing(context, 8);
  static double md(BuildContext context) => getSpacing(context, 16);
  static double lg(BuildContext context) => getSpacing(context, 24);
  static double xl(BuildContext context) => getSpacing(context, 32);
  static double xxl(BuildContext context) => getSpacing(context, 48);
  static double xxxl(BuildContext context) => getSpacing(context, 64);

  /// Custom spacing values from Figma
  static double spacing12(BuildContext context) => getSpacing(context, 12);
  static double spacing20(BuildContext context) => getSpacing(context, 20);
  static double spacing28(BuildContext context) => getSpacing(context, 28);
  static double spacing40(BuildContext context) => getSpacing(context, 40);
  static double spacing56(BuildContext context) => getSpacing(context, 56);
  static double spacing72(BuildContext context) => getSpacing(context, 72);
}

/// Extension for easy access to responsive spacing
extension ResponsiveSpacingExtension on BuildContext {
  // Predefined spacing getters
  double get spaceXS => ResponsiveSpacing.xs(this);
  double get spaceSM => ResponsiveSpacing.sm(this);
  double get spaceMD => ResponsiveSpacing.md(this);
  double get spaceLG => ResponsiveSpacing.lg(this);
  double get spaceXL => ResponsiveSpacing.xl(this);
  double get spaceXXL => ResponsiveSpacing.xxl(this);
  double get spaceXXXL => ResponsiveSpacing.xxxl(this);
  
  // Custom spacing getters
  double get spacing12 => ResponsiveSpacing.spacing12(this);
  double get spacing20 => ResponsiveSpacing.spacing20(this);
  double get spacing28 => ResponsiveSpacing.spacing28(this);
  double get spacing40 => ResponsiveSpacing.spacing40(this);
  double get spacing56 => ResponsiveSpacing.spacing56(this);
  double get spacing72 => ResponsiveSpacing.spacing72(this);
  
  // Generic responsive spacing method
  double responsiveSpacing(double baseSpacing) => ResponsiveSpacing.getSpacing(this, baseSpacing);
}