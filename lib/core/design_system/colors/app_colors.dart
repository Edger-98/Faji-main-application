import 'package:flutter/material.dart';

/// Faji App color palette based on Figma designs
/// Provides comprehensive color tokens for light and dark themes
class AppColors {
  AppColors._();

  // Primary Colors (From Figma: #FD99C9)
  static const Color primary = Color(0xFFFD99C9);
  static const Color onPrimary = Color(0xFF1F1F1F);
  static const Color primaryContainer = Color(0xFFFD99C9);
  static const Color onPrimaryContainer = Color(0xFF1F1F1F);

  // Secondary Colors
  static const Color secondary = Color(0xFF625B71);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFE8DEF8);
  static const Color onSecondaryContainer = Color(0xFF1D192B);

  // Tertiary Colors
  static const Color tertiary = Color(0xFF7D5260);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFFFD8E4);
  static const Color onTertiaryContainer = Color(0xFF31111D);

  // Error Colors
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF410002);

  // Surface Colors (From Figma: Dark theme)
  static const Color surface = Color(0xFF1F1F1F);
  static const Color onSurface = Color(0xFFF8F8F8);
  static const Color surfaceContainerHighest = Color(0x52282828); // rgba(40, 40, 40, 0.81)
  static const Color onSurfaceVariant = Color(0xFFA1A1A1);
  static const Color surfaceTint = primary;

  // Background Colors (From Figma: Dark theme)
  static const Color background = Color(0xFF1F1F1F);
  static const Color onBackground = Color(0xFFF8F8F8);

  // Outline Colors
  static const Color outline = Color(0xFF79747E);
  static const Color outlineVariant = Color(0xFFCAC4D0);

  // Inverse Colors
  static const Color inverseSurface = Color(0xFF313033);
  static const Color onInverseSurface = Color(0xFFF4EFF4);
  static const Color inversePrimary = Color(0xFFD0BCFF);

  // Shadow and Scrim
  static const Color shadow = Color(0xFF000000);
  static const Color scrim = Color(0xFF000000);

  // Light Theme Colors (Inverted for light mode)
  static const Color lightPrimary = Color(0xFFFD99C9);
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightPrimaryContainer = Color(0xFFFD99C9);
  static const Color lightOnPrimaryContainer = Color(0xFFFFFFFF);

  static const Color lightSecondary = Color(0xFFA1A1A1);
  static const Color lightOnSecondary = Color(0xFFFFFFFF);
  static const Color lightSecondaryContainer = Color(0xFFF8F8F8);
  static const Color lightOnSecondaryContainer = Color(0xFF1F1F1F);

  static const Color lightTertiary = Color(0xFFA1A1A1);
  static const Color lightOnTertiary = Color(0xFFFFFFFF);
  static const Color lightTertiaryContainer = Color(0xFFF8F8F8);
  static const Color lightOnTertiaryContainer = Color(0xFF1F1F1F);

  static const Color lightError = Color(0xFFFF5449);
  static const Color lightOnError = Color(0xFFFFFFFF);
  static const Color lightErrorContainer = Color(0xFFFFDAD6);
  static const Color lightOnErrorContainer = Color(0xFF410002);

  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightOnSurface = Color(0xFF1F1F1F);
  static const Color lightSurfaceContainerHighest = Color(0xFFF5F5F5);
  static const Color lightOnSurfaceVariant = Color(0xFF666666);

  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightOnBackground = Color(0xFF1F1F1F);

  static const Color lightOutline = Color(0xFFCCCCCC);
  static const Color lightOutlineVariant = Color(0xFFE0E0E0);

  static const Color lightInverseSurface = Color(0xFF1F1F1F);
  static const Color lightOnInverseSurface = Color(0xFFF8F8F8);
  static const Color lightInversePrimary = Color(0xFFFD99C9);

  // Semantic Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color successContainer = Color(0xFFE8F5E8);
  static const Color onSuccessContainer = Color(0xFF1B5E20);

  static const Color warning = Color(0xFFFF9800);
  static const Color onWarning = Color(0xFFFFFFFF);
  static const Color warningContainer = Color(0xFFFFF3E0);
  static const Color onWarningContainer = Color(0xFFE65100);

  static const Color info = Color(0xFF2196F3);
  static const Color onInfo = Color(0xFFFFFFFF);
  static const Color infoContainer = Color(0xFFE3F2FD);
  static const Color onInfoContainer = Color(0xFF0D47A1);

  // Home Feature Specific Colors (From Figma)
  static const Color eventCardBlue = Color(0xFF043D9E);
  static const Color eventCardYellow = Color(0xFFFEB822);
  static const Color liveRed = Color(0xFFCA4638);
  static const Color textSecondary = Color(0xFFAAA9A9);
  static const Color textTertiary = Color(0xFF616161);
  static const Color searchBarBackground = Color(0x52282828); // rgba(40, 40, 40, 0.81)
  static const Color categoryChipBackground = Color(0xCF151515); // rgba(21, 21, 21, 0.81)
  static const Color bottomNavBackground = Color(0x40070707); // rgba(7, 7, 7, 0.25)
  static const Color overlayBackground = Color(0x6E070707); // rgba(7, 7, 7, 0.43)
  static const Color dotSeparator = Color(0xFFD9D9D9);
  static const Color iconGray = Color(0xFFDCDCDC);
  static const Color successGreen = Color(0xFF7FD249);
  static const Color messageBubbleBackground = Color(0xCC282828); // rgba(40, 40, 40, 0.8)

  // Neutral Colors
  static const Color neutral10 = Color(0xFF1C1B1F);
  static const Color neutral20 = Color(0xFF313033);
  static const Color neutral30 = Color(0xFF484649);
  static const Color neutral40 = Color(0xFF605D62);
  static const Color neutral50 = Color(0xFF79747E);
  static const Color neutral60 = Color(0xFF938F99);
  static const Color neutral70 = Color(0xFFAEA9B4);
  static const Color neutral80 = Color(0xFFCAC4D0);
  static const Color neutral90 = Color(0xFFE6E1E5);
  static const Color neutral95 = Color(0xFFF4EFF4);
  static const Color neutral99 = Color(0xFFFFFBFE);

  // Neutral Variant Colors
  static const Color neutralVariant10 = Color(0xFF1D1A22);
  static const Color neutralVariant20 = Color(0xFF322F37);
  static const Color neutralVariant30 = Color(0xFF49454F);
  static const Color neutralVariant40 = Color(0xFF605D66);
  static const Color neutralVariant50 = Color(0xFF79747E);
  static const Color neutralVariant60 = Color(0xFF938F99);
  static const Color neutralVariant70 = Color(0xFFAEA9B4);
  static const Color neutralVariant80 = Color(0xFFCAC4D0);
  static const Color neutralVariant90 = Color(0xFFE7E0EC);
  static const Color neutralVariant95 = Color(0xFFF5EEFA);
  static const Color neutralVariant99 = Color(0xFFFFFBFE);

  /// Get color scheme for light theme
  static ColorScheme get lightColorScheme => const ColorScheme.light(
        primary: lightPrimary,
        onPrimary: lightOnPrimary,
        primaryContainer: lightPrimaryContainer,
        onPrimaryContainer: lightOnPrimaryContainer,
        secondary: lightSecondary,
        onSecondary: lightOnSecondary,
        secondaryContainer: lightSecondaryContainer,
        onSecondaryContainer: lightOnSecondaryContainer,
        tertiary: lightTertiary,
        onTertiary: lightOnTertiary,
        tertiaryContainer: lightTertiaryContainer,
        onTertiaryContainer: lightOnTertiaryContainer,
        error: lightError,
        onError: lightOnError,
        errorContainer: lightErrorContainer,
        onErrorContainer: lightOnErrorContainer,
        surface: lightSurface,
        onSurface: lightOnSurface,
        surfaceContainerHighest: lightSurfaceContainerHighest,
        onSurfaceVariant: lightOnSurfaceVariant,
        outline: lightOutline,
        outlineVariant: lightOutlineVariant,
        shadow: shadow,
        scrim: scrim,
        inverseSurface: lightInverseSurface,
        onInverseSurface: lightOnInverseSurface,
        inversePrimary: lightInversePrimary,
        surfaceTint: lightPrimary,
      );

  /// Get color scheme for dark theme (Faji App's primary theme)
  static ColorScheme get darkColorScheme => const ColorScheme.dark(
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimaryContainer,
        secondary: secondary,
        onSecondary: onSecondary,
        secondaryContainer: secondaryContainer,
        onSecondaryContainer: onSecondaryContainer,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiaryContainer,
        error: error,
        onError: onError,
        errorContainer: errorContainer,
        onErrorContainer: onErrorContainer,
        surface: surface,
        onSurface: onSurface,
        surfaceContainerHighest: surfaceContainerHighest,
        onSurfaceVariant: onSurfaceVariant,
        outline: outline,
        outlineVariant: outlineVariant,
        shadow: shadow,
        scrim: scrim,
        inverseSurface: inverseSurface,
        onInverseSurface: onInverseSurface,
        inversePrimary: inversePrimary,
        surfaceTint: primary,
      );
}