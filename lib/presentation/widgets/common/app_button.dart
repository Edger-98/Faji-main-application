import 'package:flutter/material.dart';


/// Button variants for different use cases
enum AppButtonVariant {
  primary,
  secondary,
  text,
  icon,
}

/// Button sizes for different contexts
enum AppButtonSize {
  small,
  medium,
  large,
}

/// Reusable button component with consistent styling
class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.child,
    super.key,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.width,
    this.height,
  });

  /// Factory constructor for primary button
  const AppButton.primary({
    required this.onPressed,
    required this.child,
    super.key,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.width,
    this.height,
  }) : variant = AppButtonVariant.primary;

  /// Factory constructor for secondary button
  const AppButton.secondary({
    required this.onPressed,
    required this.child,
    super.key,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.width,
    this.height,
  }) : variant = AppButtonVariant.secondary;

  /// Factory constructor for text button
  const AppButton.text({
    required this.onPressed,
    required this.child,
    super.key,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.width,
    this.height,
  }) : variant = AppButtonVariant.text;

  /// Factory constructor for icon button
  const AppButton.icon({
    required this.onPressed,
    required this.icon,
    super.key,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
    this.height,
  }) : variant = AppButtonVariant.icon, child = null;

  final VoidCallback? onPressed;
  final Widget? child;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isLoading;
  final bool isEnabled;
  final Widget? icon;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    if (isLoading) {
      return _buildLoadingButton(theme);
    }

    switch (variant) {
      case AppButtonVariant.primary:
        return _buildPrimaryButton(theme);
      case AppButtonVariant.secondary:
        return _buildSecondaryButton(theme);
      case AppButtonVariant.text:
        return _buildTextButton(theme);
      case AppButtonVariant.icon:
        return _buildIconButton(theme);
    }
  }

  Widget _buildPrimaryButton(ThemeData theme) => SizedBox(
      width: width,
      height: height ?? _getButtonHeight(),
      child: ElevatedButton.icon(
        onPressed: isEnabled ? onPressed : null,
        icon: icon ?? const SizedBox.shrink(),
        label: child ?? const SizedBox.shrink(),
        style: ElevatedButton.styleFrom(
          padding: _getButtonPadding(),
          textStyle: _getTextStyle(theme),
        ),
      ),
    );

  Widget _buildSecondaryButton(ThemeData theme) => SizedBox(
      width: width,
      height: height ?? _getButtonHeight(),
      child: OutlinedButton.icon(
        onPressed: isEnabled ? onPressed : null,
        icon: icon ?? const SizedBox.shrink(),
        label: child ?? const SizedBox.shrink(),
        style: OutlinedButton.styleFrom(
          padding: _getButtonPadding(),
          textStyle: _getTextStyle(theme),
        ),
      ),
    );

  Widget _buildTextButton(ThemeData theme) => SizedBox(
      width: width,
      height: height ?? _getButtonHeight(),
      child: TextButton.icon(
        onPressed: isEnabled ? onPressed : null,
        icon: icon ?? const SizedBox.shrink(),
        label: child ?? const SizedBox.shrink(),
        style: TextButton.styleFrom(
          padding: _getButtonPadding(),
          textStyle: _getTextStyle(theme),
        ),
      ),
    );

  Widget _buildIconButton(ThemeData theme) => SizedBox(
      width: width ?? _getButtonHeight(),
      height: height ?? _getButtonHeight(),
      child: IconButton(
        onPressed: isEnabled ? onPressed : null,
        icon: icon ?? const Icon(Icons.add),
        style: IconButton.styleFrom(
          padding: _getButtonPadding(),
        ),
      ),
    );

  Widget _buildLoadingButton(ThemeData theme) => SizedBox(
      width: width,
      height: height ?? _getButtonHeight(),
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          padding: _getButtonPadding(),
        ),
        child: SizedBox(
          width: _getLoadingIndicatorSize(),
          height: _getLoadingIndicatorSize(),
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              theme.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );

  double _getButtonHeight() {
    switch (size) {
      case AppButtonSize.small:
        return 48;
      case AppButtonSize.medium:
        return 59; // From Figma: 59px height
      case AppButtonSize.large:
        return 69;
    }
  }

  EdgeInsetsGeometry _getButtonPadding() {
    switch (size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        );
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: 32, // From Figma: More padding for rounded buttons
          vertical: 18,
        );
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        );
    }
  }

  TextStyle _getTextStyle(ThemeData theme) {
    switch (size) {
      case AppButtonSize.small:
        return theme.textTheme.labelSmall!;
      case AppButtonSize.medium:
        return theme.textTheme.labelMedium!;
      case AppButtonSize.large:
        return theme.textTheme.labelLarge!;
    }
  }

  double _getLoadingIndicatorSize() {
    switch (size) {
      case AppButtonSize.small:
        return 16;
      case AppButtonSize.medium:
        return 20;
      case AppButtonSize.large:
        return 24;
    }
  }
}