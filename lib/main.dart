import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

import 'package:fajimobileapp/core/core.dart';
import 'package:fajimobileapp/presentation/presentation.dart';
import 'package:fajimobileapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:fajimobileapp/core/services/auth_token_service.dart';

void main() async {
  // Initialize the application
  await AppInitializer.initialize();
  
  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  
  // Create ProviderContainer to initialize auth token
  final container = ProviderContainer(
    overrides: [
      // Override SharedPreferences provider
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
    ],
  );
  
  // Initialize auth token (load from storage and set in API service)
  await container.read(authTokenServiceProvider).initialize();
  
  // Run the app with Riverpod
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
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
        return ToastificationWrapper(
          child: MaterialApp.router(
            title: AppConstants.appName,
            theme: FajiAppTheme.lightTheme,
            darkTheme: FajiAppTheme.darkTheme,
            themeMode: ThemeMode.dark, // Default to dark mode
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
          ),
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