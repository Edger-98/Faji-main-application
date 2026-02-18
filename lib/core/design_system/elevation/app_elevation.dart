import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Material 3 compliant elevation system
/// Provides consistent shadows and depth across the application
class AppElevation {
  AppElevation._();

  // Elevation levels
  static const double level0 = 0;   // No elevation
  static const double level1 = 1;   // Subtle elevation
  static const double level2 = 3;   // Low elevation
  static const double level3 = 6;   // Medium elevation
  static const double level4 = 8;   // High elevation
  static const double level5 = 12;  // Very high elevation

  // Semantic elevation mapping
  static const double surface = level0;
  static const double card = level1;
  static const double button = level1;
  static const double navigationBar = level2;
  static const double fab = level3;
  static const double navigationDrawer = level1;
  static const double modal = level3;
  static const double navigationRail = level0;
  static const double appBar = level0;
  static const double topAppBar = level0;
  static const double bottomAppBar = level2;
  static const double bottomSheet = level1;
  static const double dialog = level3;
  static const double fullscreenDialog = level0;
  static const double menu = level2;
  static const double searchBar = level0;
  static const double searchView = level0;
  static const double snackbar = level3;
  static const double tooltip = level2;

  /// Get shadow for elevation level
  static List<BoxShadow> getShadow(double elevation) {
    if (elevation <= 0) {
      return <BoxShadow>[];
    }

    return <BoxShadow>[
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.2),
        offset: Offset(0, elevation / 2),
        blurRadius: elevation,
      ),
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.14),
        offset: Offset(0, elevation),
        blurRadius: elevation * 2,
      ),
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.12),
        offset: Offset(0, elevation / 2),
        blurRadius: elevation * 3,
      ),
    ];
  }

  /// Get Material 3 surface tint overlay for elevation
  static Color getSurfaceTint(Color surfaceColor, Color tintColor, double elevation) {
    if (elevation <= 0) {
      return surfaceColor;
    }

    // Material 3 surface tint opacity based on elevation
    double opacity;
    if (elevation <= 1) {
      opacity = 0.05;
    } else if (elevation <= 3) {
      opacity = 0.08;
    } else if (elevation <= 6) {
      opacity = 0.11;
    } else if (elevation <= 8) {
      opacity = 0.12;
    } else {
      opacity = 0.14;
    }

    return Color.alphaBlend(
      tintColor.withValues(alpha: opacity),
      surfaceColor,
    );
  }

  /// Get elevation overlay color for dark theme
  static Color getElevationOverlay(Color surfaceColor, double elevation) {
    if (elevation <= 0) {
      return surfaceColor;
    }

    // Calculate overlay opacity based on elevation
    final opacity = (4.5 * math.log(elevation + 1) + 2) / 100;
    
    return Color.alphaBlend(
      Colors.white.withValues(alpha: opacity.clamp(0.0, 1.0)),
      surfaceColor,
    );
  }

  /// Get all elevation values as a map for debugging/documentation
  static Map<String, double> get allElevations => <String, double>{
        'level0': level0,
        'level1': level1,
        'level2': level2,
        'level3': level3,
        'level4': level4,
        'level5': level5,
        'surface': surface,
        'card': card,
        'button': button,
        'navigationBar': navigationBar,
        'fab': fab,
        'modal': modal,
        'dialog': dialog,
        'menu': menu,
        'snackbar': snackbar,
        'tooltip': tooltip,
      };
}