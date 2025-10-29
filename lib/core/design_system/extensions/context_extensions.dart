import 'package:flutter/material.dart';

import 'package:fajimobileapp/core/design_system/colors/app_colors.dart';

/// Modern context extensions for clean styling
extension BuildContextExtensions on BuildContext {
  /// Access theme styles with context.styles
  AppStyles get styles => AppStyles.of(this);
  
  /// Access theme colors with context.colors
  AppColorsExtension get colors => AppColorsExtension.of(this);
}

/// Clean styles accessor
class AppStyles {
  final BuildContext context;
  
  AppStyles.of(this.context);
  
  TextTheme get _textTheme => Theme.of(context).textTheme;
  
  // Display styles
  TextStyle get displayLarge => _textTheme.displayLarge!;
  TextStyle get displayMedium => _textTheme.displayMedium!;
  TextStyle get displaySmall => _textTheme.displaySmall!;
  
  // Headline styles
  TextStyle get headlineLarge => _textTheme.headlineLarge!;
  TextStyle get headlineMedium => _textTheme.headlineMedium!;
  TextStyle get headlineSmall => _textTheme.headlineSmall!;
  
  // Title styles
  TextStyle get titleLarge => _textTheme.titleLarge!;
  TextStyle get titleMedium => _textTheme.titleMedium!;
  TextStyle get titleSmall => _textTheme.titleSmall!;
  
  // Label styles
  TextStyle get labelLarge => _textTheme.labelLarge!;
  TextStyle get labelMedium => _textTheme.labelMedium!;
  TextStyle get labelSmall => _textTheme.labelSmall!;
  
  // Body styles
  TextStyle get bodyLarge => _textTheme.bodyLarge!;
  TextStyle get bodyMedium => _textTheme.bodyMedium!;
  TextStyle get bodySmall => _textTheme.bodySmall!;
}

/// Clean colors accessor
class AppColorsExtension {
  final BuildContext context;
  
  AppColorsExtension.of(this.context);
  
  ColorScheme get _colorScheme => Theme.of(context).colorScheme;
  
  // Primary colors
  Color get primary => _colorScheme.primary;
  Color get onPrimary => _colorScheme.onPrimary;
  Color get primaryContainer => _colorScheme.primaryContainer;
  Color get onPrimaryContainer => _colorScheme.onPrimaryContainer;
  
  // Secondary colors
  Color get secondary => _colorScheme.secondary;
  Color get onSecondary => _colorScheme.onSecondary;
  Color get secondaryContainer => _colorScheme.secondaryContainer;
  Color get onSecondaryContainer => _colorScheme.onSecondaryContainer;
  
  // Surface colors
  Color get surface => _colorScheme.surface;
  Color get onSurface => _colorScheme.onSurface;
  Color get surfaceContainerHighest => _colorScheme.surfaceContainerHighest;
  Color get onSurfaceVariant => _colorScheme.onSurfaceVariant;
  
  // Error colors
  Color get error => _colorScheme.error;
  Color get onError => _colorScheme.onError;
  Color get errorContainer => _colorScheme.errorContainer;
  Color get onErrorContainer => _colorScheme.onErrorContainer;
  
  // Outline colors
  Color get outline => _colorScheme.outline;
  Color get outlineVariant => _colorScheme.outlineVariant;
  
  // Background (alias for surface)
  Color get background => surface;
  Color get onBackground => onSurface;

  // Home Feature Specific Colors
  Color get eventCardBlue => AppColors.eventCardBlue;
  Color get liveRed => AppColors.liveRed;
  Color get textSecondary => AppColors.textSecondary;
  Color get textTertiary => AppColors.textTertiary;
  Color get searchBarBackground => AppColors.searchBarBackground;
  Color get categoryChipBackground => AppColors.categoryChipBackground;
  Color get bottomNavBackground => AppColors.bottomNavBackground;
  Color get overlayBackground => AppColors.overlayBackground;
  Color get dotSeparator => AppColors.dotSeparator;
  Color get iconGray => AppColors.iconGray;
  Color get successGreen => AppColors.successGreen;
}