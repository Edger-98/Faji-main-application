import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/presentation/presentation.dart';
import 'package:fajimobileapp/presentation/widgets/common/faji_design_showcase.dart';

void main() async {
  // Initialize the application
  await AppInitializer.initialize();
  
  // Run the app with Riverpod
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch theme state
    final ThemeState themeState = ref.watch(themeProvider);
    
    // Update system brightness when app starts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Brightness brightness = MediaQuery.platformBrightnessOf(context);
      ref.read(themeProvider.notifier).updateSystemBrightness(
        isSystemDark: brightness == Brightness.dark,
      );
    });

    return MaterialApp(
      title: AppConstants.appName,
      theme: FajiAppTheme.lightTheme,
      darkTheme: FajiAppTheme.darkTheme,
      themeMode: _getThemeMode(themeState.themeMode),
      home: const FajiDesignShowcase(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeMode _getThemeMode(AppThemeMode appThemeMode) {
    switch (appThemeMode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }
}