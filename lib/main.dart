import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/presentation/presentation.dart';

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
    // Watch theme state (for future use)
    ref.watch(themeProvider);
    
    // Update system brightness when app starts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final Brightness brightness = MediaQuery.platformBrightnessOf(context);
      ref.read(themeProvider.notifier).updateSystemBrightness(
        isSystemDark: brightness == Brightness.dark,
      );
    });

    return ScreenUtilInit(
      designSize: const Size(393, 852), // iPhone 14 Pro size from Figma
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: AppConstants.appName,
          theme: FajiAppTheme.lightTheme,
          darkTheme: FajiAppTheme.darkTheme,
          themeMode: ThemeMode.dark, // Default to dark mode
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        );
      },
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