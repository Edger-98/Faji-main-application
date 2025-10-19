import 'package:flutter/material.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Bottom sheet variants for different use cases
enum AppBottomSheetVariant {
  modal,
  persistent,
  draggable,
}

/// Reusable bottom sheet component with consistent styling
class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    required this.child,
    super.key,
    this.title,
    this.showHandle = true,
    this.showCloseButton = true,
    this.padding,
    this.backgroundColor,
    this.shape,
    this.elevation,
    this.isScrollControlled = false,
    this.enableDrag = true,
    this.isDismissible = true,
  });

  final Widget child;
  final String? title;
  final bool showHandle;
  final bool showCloseButton;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final ShapeBorder? shape;
  final double? elevation;
  final bool isScrollControlled;
  final bool enableDrag;
  final bool isDismissible;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Handle
          if (showHandle)
            Container(
              width: 32,
              height: 4,
              margin: const EdgeInsets.only(top: AppSpacing.md),
              decoration: BoxDecoration(
                color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          
          // Header
          if (title != null || showCloseButton)
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: <Widget>[
                  if (title != null)
                    Expanded(
                      child: Text(
                        title!,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  if (showCloseButton)
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                ],
              ),
            ),
          
          // Content
          Flexible(
            child: Padding(
              padding: padding ?? const EdgeInsets.all(AppSpacing.lg),
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  /// Show modal bottom sheet
  static Future<T?> showModal<T>(
    BuildContext context, {
    required Widget child,
    String? title,
    bool showHandle = true,
    bool showCloseButton = true,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    ShapeBorder? shape,
    double? elevation,
    bool isScrollControlled = false,
    bool enableDrag = true,
    bool isDismissible = true,
    bool useRootNavigator = false,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      enableDrag: enableDrag,
      isDismissible: isDismissible,
      useRootNavigator: useRootNavigator,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: shape,
      builder: (BuildContext context) => AppBottomSheet(
        title: title,
        showHandle: showHandle,
        showCloseButton: showCloseButton,
        padding: padding,
        backgroundColor: backgroundColor,
        elevation: elevation,
        isScrollControlled: isScrollControlled,
        enableDrag: enableDrag,
        isDismissible: isDismissible,
        child: child,
      ),
    );
  }

  /// Show draggable scrollable bottom sheet
  static Future<T?> showDraggable<T>(
    BuildContext context, {
    required Widget child,
    String? title,
    bool showHandle = true,
    bool showCloseButton = true,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    double initialChildSize = 0.5,
    double minChildSize = 0.25,
    double maxChildSize = 0.9,
    bool expand = false,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (BuildContext context) => DraggableScrollableSheet(
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        expand: expand,
        builder: (BuildContext context, ScrollController scrollController) {
          return AppBottomSheet(
            title: title,
            showHandle: showHandle,
            showCloseButton: showCloseButton,
            padding: padding,
            backgroundColor: backgroundColor,
            child: SingleChildScrollView(
              controller: scrollController,
              child: child,
            ),
          );
        },
      ),
    );
  }

  /// Show persistent bottom sheet
  static PersistentBottomSheetController showPersistent(
    BuildContext context, {
    required Widget child,
    String? title,
    bool showHandle = false,
    bool showCloseButton = true,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    ShapeBorder? shape,
    double? elevation,
    AnimationController? transitionAnimationController,
  }) {
    return showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: shape,
      transitionAnimationController: transitionAnimationController,
      builder: (BuildContext context) => AppBottomSheet(
        title: title,
        showHandle: showHandle,
        showCloseButton: showCloseButton,
        padding: padding,
        backgroundColor: backgroundColor,
        elevation: elevation,
        child: child,
      ),
    );
  }
}