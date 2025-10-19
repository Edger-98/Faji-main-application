import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fajimobileapp/core/design_system/design_system.dart';

/// Theme mode state
enum AppThemeMode {
  light,
  dark,
  system,
}

/// Theme state class
@immutable
class ThemeState {
  const ThemeState({
    required this.themeMode,
    required this.isSystemDark,
  });

  final AppThemeMode themeMode;
  final bool isSystemDark;

  /// Get effective brightness based on theme mode and system setting
  Brightness get effectiveBrightness {
    switch (themeMode) {
      case AppThemeMode.light:
        return Brightness.light;
      case AppThemeMode.dark:
        return Brightness.dark;
      case AppThemeMode.system:
        return isSystemDark ? Brightness.dark : Brightness.light;
    }
  }

  ThemeState copyWith({
    AppThemeMode? themeMode,
    bool? isSystemDark,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      isSystemDark: isSystemDark ?? this.isSystemDark,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is ThemeState &&
        other.themeMode == themeMode &&
        other.isSystemDark == isSystemDark;
  }

  @override
  int get hashCode => themeMode.hashCode ^ isSystemDark.hashCode;
}

/// Theme notifier for managing theme state
class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier() : super(const ThemeState(
    themeMode: AppThemeMode.system,
    isSystemDark: false,
  )) {
    _loadTheme();
  }

  static const String _themeKey = 'app_theme_mode';

  /// Load saved theme from preferences
  Future<void> _loadTheme() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? savedTheme = prefs.getString(_themeKey);
      
      if (savedTheme != null) {
        final AppThemeMode themeMode = AppThemeMode.values.firstWhere(
          (AppThemeMode mode) => mode.name == savedTheme,
          orElse: () => AppThemeMode.system,
        );
        
        state = state.copyWith(themeMode: themeMode);
      }
    } on Exception {
      // Handle error silently, use default theme
    }
  }

  /// Save theme to preferences
  Future<void> _saveTheme(AppThemeMode themeMode) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(_themeKey, themeMode.name);
    } on Exception {
      // Handle error silently
    }
  }

  /// Set theme mode
  Future<void> setThemeMode(AppThemeMode themeMode) async {
    state = state.copyWith(themeMode: themeMode);
    await _saveTheme(themeMode);
  }

  /// Update system brightness
  void updateSystemBrightness({required bool isSystemDark}) {
    state = state.copyWith(isSystemDark: isSystemDark);
  }

  /// Toggle between light and dark theme
  Future<void> toggleTheme() async {
    final AppThemeMode newMode = state.themeMode == AppThemeMode.light 
        ? AppThemeMode.dark 
        : AppThemeMode.light;
    await setThemeMode(newMode);
  }
}

/// Theme provider
final StateNotifierProvider<ThemeNotifier, ThemeState> themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((StateNotifierProviderRef<ThemeNotifier, ThemeState> ref) => ThemeNotifier());

/// Current theme data provider
final Provider<ThemeData> currentThemeProvider = Provider<ThemeData>((ProviderRef<ThemeData> ref) {
  final ThemeState themeState = ref.watch(themeProvider);
  return FajiAppTheme.getTheme(themeState.effectiveBrightness);
});

/// Current brightness provider
final Provider<Brightness> currentBrightnessProvider = Provider<Brightness>((ProviderRef<Brightness> ref) {
  final ThemeState themeState = ref.watch(themeProvider);
  return themeState.effectiveBrightness;
});

/// Is dark theme provider
final Provider<bool> isDarkThemeProvider = Provider<bool>((ProviderRef<bool> ref) {
  final Brightness brightness = ref.watch(currentBrightnessProvider);
  return brightness == Brightness.dark;
});