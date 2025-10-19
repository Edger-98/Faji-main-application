import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';
import 'package:fajimobileapp/presentation/providers/theme_provider.dart';

/// Screen size breakpoints
class ScreenBreakpoints {
  static const double mobile = 600;
  static const double tablet = 1200;
  static const double desktop = 1920;
}

/// Screen size categories
enum ScreenSize {
  mobile,
  tablet,
  desktop,
}

/// Get screen size category based on width
ScreenSize getScreenSize(double width) {
  if (width < ScreenBreakpoints.mobile) {
    return ScreenSize.mobile;
  }
  if (width < ScreenBreakpoints.tablet) {
    return ScreenSize.tablet;
  }
  return ScreenSize.desktop;
}

/// Responsive theme provider that adapts to screen size
final Provider<ThemeData> Function(BuildContext) responsiveThemeProvider = Provider.family<ThemeData, BuildContext>((ProviderRef<ThemeData> ref, BuildContext context) {
  final ThemeState themeState = ref.watch(themeProvider);
  return FajiAppTheme.getResponsiveTheme(context, themeState.effectiveBrightness);
});

/// Current screen size provider
final Provider<ScreenSize> Function(BuildContext) screenSizeProvider = Provider.family<ScreenSize, BuildContext>((ProviderRef<ScreenSize> ref, BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;
  return getScreenSize(screenWidth);
});

/// Is mobile provider
final Provider<bool> Function(BuildContext) isMobileProvider = Provider.family<bool, BuildContext>((ProviderRef<bool> ref, BuildContext context) {
  final ScreenSize screenSize = ref.watch(screenSizeProvider(context));
  return screenSize == ScreenSize.mobile;
});

/// Is tablet provider
final Provider<bool> Function(BuildContext) isTabletProvider = Provider.family<bool, BuildContext>((ProviderRef<bool> ref, BuildContext context) {
  final ScreenSize screenSize = ref.watch(screenSizeProvider(context));
  return screenSize == ScreenSize.tablet;
});

/// Is desktop provider
final Provider<bool> Function(BuildContext) isDesktopProvider = Provider.family<bool, BuildContext>((ProviderRef<bool> ref, BuildContext context) {
  final ScreenSize screenSize = ref.watch(screenSizeProvider(context));
  return screenSize == ScreenSize.desktop;
});

/// Responsive spacing provider
final Provider<double> Function(({BuildContext context, double baseSpacing})) responsiveSpacingProvider = Provider.family<double, ({BuildContext context, double baseSpacing})>((ProviderRef<double> ref, ({BuildContext context, double baseSpacing}) params) {
  final double screenWidth = MediaQuery.of(params.context).size.width;
  return AppSpacing.getResponsiveSpacing(params.baseSpacing, screenWidth);
});

/// Responsive typography provider
final Provider<TextTheme> Function(BuildContext) responsiveTypographyProvider = Provider.family<TextTheme, BuildContext>((ProviderRef<TextTheme> ref, BuildContext context) => AppTypography.getResponsiveTextTheme(context));