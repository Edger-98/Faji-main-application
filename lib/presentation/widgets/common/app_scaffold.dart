import 'package:flutter/material.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Reusable scaffold component with consistent styling and responsive behavior
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.padding,
    this.safeArea = true,
    this.showBackButton = false,
    this.title,
    this.actions,
    this.centerTitle,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final EdgeInsetsGeometry? padding;
  final bool safeArea;
  final bool showBackButton;
  final String? title;
  final List<Widget>? actions;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    var scaffoldBody = body;

    // Add padding if specified
    if (padding != null) {
      scaffoldBody = Padding(
        padding: padding!,
        child: scaffoldBody,
      );
    }

    // Add safe area if specified
    if (safeArea) {
      scaffoldBody = SafeArea(
        child: scaffoldBody,
      );
    }

    return Scaffold(
      appBar: _buildAppBar(context, theme),
      body: scaffoldBody,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      drawer: drawer,
      endDrawer: endDrawer,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      backgroundColor: backgroundColor ?? theme.colorScheme.surface,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      primary: primary,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context, ThemeData theme) {
    // Return provided app bar if available
    if (appBar != null) {
      return appBar;
    }

    // Build default app bar if title is provided
    if (title != null) {
      return AppBar(
        title: Text(title!),
        centerTitle: centerTitle,
        actions: actions,
        leading: showBackButton && Navigator.of(context).canPop()
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
      );
    }

    return null;
  }
}

/// Responsive scaffold that adapts to different screen sizes
class ResponsiveAppScaffold extends StatelessWidget {
  const ResponsiveAppScaffold({
    required this.body,
    super.key,
    this.mobileBody,
    this.tabletBody,
    this.desktopBody,
    this.appBar,
    this.floatingActionButton,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.padding,
    this.title,
    this.actions,
  });

  final Widget body;
  final Widget? mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final String? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double screenWidth = constraints.maxWidth;
        
        Widget responsiveBody;
        EdgeInsetsGeometry? responsivePadding;

        if (screenWidth < 600) {
          // Mobile layout
          responsiveBody = mobileBody ?? body;
          responsivePadding = padding ?? const EdgeInsets.all(AppSpacing.lg);
        } else if (screenWidth < 1200) {
          // Tablet layout
          responsiveBody = tabletBody ?? body;
          responsivePadding = padding ?? const EdgeInsets.all(AppSpacing.xl);
        } else {
          // Desktop layout
          responsiveBody = desktopBody ?? body;
          responsivePadding = padding ?? const EdgeInsets.all(AppSpacing.xxl);
        }

        return AppScaffold(
          appBar: appBar,
          body: responsiveBody,
          floatingActionButton: floatingActionButton,
          drawer: drawer,
          endDrawer: endDrawer,
          bottomNavigationBar: bottomNavigationBar,
          backgroundColor: backgroundColor,
          padding: responsivePadding,
          title: title,
          actions: actions,
        );
      },
    );
}