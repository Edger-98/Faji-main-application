import 'package:flutter/material.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Card variants for different use cases
enum AppCardVariant {
  elevated,
  filled,
  outlined,
}

/// Reusable card component with consistent styling
class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    super.key,
    this.variant = AppCardVariant.elevated,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.elevation,
    this.borderRadius,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
  });

  /// Factory constructor for elevated card
  const AppCard.elevated({
    required this.child,
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.elevation,
    this.borderRadius,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
  }) : variant = AppCardVariant.elevated;

  /// Factory constructor for filled card
  const AppCard.filled({
    required this.child,
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.elevation,
    this.borderRadius,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
  }) : variant = AppCardVariant.filled;

  /// Factory constructor for outlined card
  const AppCard.outlined({
    required this.child,
    super.key,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.elevation,
    this.borderRadius,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
  }) : variant = AppCardVariant.outlined;

  final Widget child;
  final AppCardVariant variant;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final double? elevation;
  final BorderRadius? borderRadius;
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    var card = _buildCard(theme, colorScheme);

    if (margin != null) {
      card = Padding(
        padding: margin!,
        child: card,
      );
    }

    return card;
  }

  Widget _buildCard(ThemeData theme, ColorScheme colorScheme) {
    final Widget cardChild = Padding(
      padding: padding ?? const EdgeInsets.all(AppSpacing.lg),
      child: child,
    );

    switch (variant) {
      case AppCardVariant.elevated:
        return _buildElevatedCard(theme, colorScheme, cardChild);
      case AppCardVariant.filled:
        return _buildFilledCard(theme, colorScheme, cardChild);
      case AppCardVariant.outlined:
        return _buildOutlinedCard(theme, colorScheme, cardChild);
    }
  }

  Widget _buildElevatedCard(
    ThemeData theme,
    ColorScheme colorScheme,
    Widget cardChild,
  ) => SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: elevation ?? AppElevation.card,
        color: color ?? colorScheme.surface,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor ?? colorScheme.surfaceTint,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
        child: onTap != null
            ? InkWell(
                onTap: onTap,
                borderRadius: borderRadius ?? BorderRadius.circular(12),
                child: cardChild,
              )
            : cardChild,
      ),
    );

  Widget _buildFilledCard(
    ThemeData theme,
    ColorScheme colorScheme,
    Widget cardChild,
  ) => SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 0,
        color: color ?? colorScheme.surfaceContainerHighest,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
        child: onTap != null
            ? InkWell(
                onTap: onTap,
                borderRadius: borderRadius ?? BorderRadius.circular(12),
                child: cardChild,
              )
            : cardChild,
      ),
    );

  Widget _buildOutlinedCard(
    ThemeData theme,
    ColorScheme colorScheme,
    Widget cardChild,
  ) => SizedBox(
      width: width,
      height: height,
      child: Card(
        elevation: 0,
        color: color ?? colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          side: BorderSide(
            color: colorScheme.outline,
            width: 1,
          ),
        ),
        child: onTap != null
            ? InkWell(
                onTap: onTap,
                borderRadius: borderRadius ?? BorderRadius.circular(12),
                child: cardChild,
              )
            : cardChild,
      ),
    );
}