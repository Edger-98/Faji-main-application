import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// General utility helpers for common operations
class Helpers {
  Helpers._();

  /// Generate a random string of specified length
  static String generateRandomString(int length, {bool includeSymbols = false}) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    const symbols = r'!@#$%^&*()_+-=[]{}|;:,.<>?';
    
    final characterSet = includeSymbols ? chars + symbols : chars;
    final random = Random.secure();
    
    return List<String>.generate(
      length,
      (int index) => characterSet[random.nextInt(characterSet.length)],
    ).join();
  }

  /// Generate a UUID v4
  static String generateUuid() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (int i) => random.nextInt(256));
    
    // Set version (4) and variant bits
    bytes[6] = (bytes[6] & 0x0F) | 0x40;
    bytes[8] = (bytes[8] & 0x3F) | 0x80;
    
    final hex = bytes.map((int b) => b.toRadixString(16).padLeft(2, '0')).join();
    
    return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20, 32)}';
  }

  /// Hash a string using SHA-256
  static String hashString(String input) {
    final List<int> bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Encode string to Base64
  static String encodeBase64(String input) {
    final List<int> bytes = utf8.encode(input);
    return base64.encode(bytes);
  }

  /// Decode Base64 string
  static String decodeBase64(String input) {
    final List<int> bytes = base64.decode(input);
    return utf8.decode(bytes);
  }

  /// Check if string is valid JSON
  static bool isValidJson(String jsonString) {
    try {
      json.decode(jsonString);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Deep copy a Map
  static Map<String, dynamic> deepCopyMap(Map<String, dynamic> original) => json.decode(json.encode(original)) as Map<String, dynamic>;

  /// Merge two maps recursively
  static Map<String, dynamic> mergeMaps(
    Map<String, dynamic> map1,
    Map<String, dynamic> map2,
  ) {
    final result = Map<String, dynamic>.from(map1);
    
    for (final entry in map2.entries) {
      if (result.containsKey(entry.key) &&
          result[entry.key] is Map<String, dynamic> &&
          entry.value is Map<String, dynamic>) {
        result[entry.key] = mergeMaps(
          result[entry.key] as Map<String, dynamic>,
          entry.value as Map<String, dynamic>,
        );
      } else {
        result[entry.key] = entry.value;
      }
    }
    
    return result;
  }

  /// Debounce function calls
  static void Function() debounce(
    void Function() function,
    Duration delay,
  ) {
    Timer? timer;
    
    return () {
      timer?.cancel();
      timer = Timer(delay, function);
    };
  }

  /// Throttle function calls
  static void Function() throttle(
    void Function() function,
    Duration duration,
  ) {
    var isThrottled = false;
    
    return () {
      if (!isThrottled) {
        function();
        isThrottled = true;
        Timer(duration, () => isThrottled = false);
      }
    };
  }

  /// Copy text to clipboard
  static Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
  }

  /// Get text from clipboard
  static Future<String?> getFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    return data?.text;
  }

  /// Vibrate device (if supported)
  static Future<void> vibrate({Duration duration = const Duration(milliseconds: 100)}) async {
    await HapticFeedback.vibrate();
  }

  /// Light haptic feedback
  static Future<void> lightHaptic() async {
    await HapticFeedback.lightImpact();
  }

  /// Medium haptic feedback
  static Future<void> mediumHaptic() async {
    await HapticFeedback.mediumImpact();
  }

  /// Heavy haptic feedback
  static Future<void> heavyHaptic() async {
    await HapticFeedback.heavyImpact();
  }

  /// Selection haptic feedback
  static Future<void> selectionHaptic() async {
    await HapticFeedback.selectionClick();
  }

  /// Calculate distance between two points
  static double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371; // Earth's radius in kilometers
    
    final dLat = _degreesToRadians(lat2 - lat1);
    final dLon = _degreesToRadians(lon2 - lon1);
    
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    
    return earthRadius * c;
  }

  /// Convert degrees to radians
  static double _degreesToRadians(double degrees) => degrees * (pi / 180);

  /// Check if email is valid (basic check)
  static bool isValidEmail(String email) => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

  /// Check if URL is valid
  static bool isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }

  /// Get file extension from filename
  static String getFileExtension(String filename) {
    final lastDotIndex = filename.lastIndexOf('.');
    if (lastDotIndex == -1 || lastDotIndex == filename.length - 1) {
      return '';
    }
    return filename.substring(lastDotIndex + 1).toLowerCase();
  }

  /// Get filename without extension
  static String getFilenameWithoutExtension(String filename) {
    final lastDotIndex = filename.lastIndexOf('.');
    if (lastDotIndex == -1) {
      return filename;
    }
    return filename.substring(0, lastDotIndex);
  }

  /// Convert bytes to human readable format
  static String formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  /// Capitalize first letter of string
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  /// Convert camelCase to snake_case
  static String camelToSnake(String camelCase) => camelCase.replaceAllMapped(
      RegExp(r'[A-Z]'),
      (Match match) => '_${match.group(0)!.toLowerCase()}',
    );

  /// Convert snake_case to camelCase
  static String snakeToCamel(String snakeCase) => snakeCase.replaceAllMapped(
      RegExp(r'_([a-z])'),
      (Match match) => match.group(1)!.toUpperCase(),
    );

  /// Remove HTML tags from string
  static String stripHtml(String html) => html.replaceAll(RegExp(r'<[^>]*>'), '');

  /// Truncate string with ellipsis
  static String truncate(String text, int maxLength, {String ellipsis = '...'}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength - ellipsis.length)}$ellipsis';
  }

  /// Get contrast color (black or white) for given color
  static Color getContrastColor(Color color) {
    // Calculate luminance
    final luminance = (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;
    
    // Return black for light colors, white for dark colors
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  /// Convert Color to hex string
  static String colorToHex(Color color) => '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';

  /// Convert hex string to Color
  static Color hexToColor(String hex) {
    final hexColor = hex.replaceAll('#', '');
    return Color(int.parse('FF$hexColor', radix: 16));
  }

  /// Check if device is in dark mode
  static bool isDarkMode(BuildContext context) => Theme.of(context).brightness == Brightness.dark;

  /// Get screen size category
  static String getScreenSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    if (width < 600) return 'mobile';
    if (width < 1200) return 'tablet';
    return 'desktop';
  }

  /// Retry function with exponential backoff
  static Future<T> retry<T>(
    Future<T> Function() function, {
    int maxAttempts = 3,
    Duration initialDelay = const Duration(seconds: 1),
    double backoffMultiplier = 2.0,
  }) async {
    var attempts = 0;
    var delay = initialDelay;
    
    while (attempts < maxAttempts) {
      try {
        return await function();
      } catch (e) {
        attempts++;
        if (attempts >= maxAttempts) rethrow;
        
        await Future<void>.delayed(delay);
        delay = Duration(milliseconds: (delay.inMilliseconds * backoffMultiplier).round());
      }
    }
    
    throw StateError('This should never be reached');
  }

  /// Execute function with timeout
  static Future<T> withTimeout<T>(
    Future<T> Function() function,
    Duration timeout,
  ) async => await function().timeout(timeout);

  /// Safe cast with fallback
  static T? safeCast<T>(value) {
    try {
      return value as T?;
    } catch (e) {
      return null;
    }
  }

  /// Check if list is null or empty
  static bool isNullOrEmpty(List<dynamic>? list) => list == null || list.isEmpty;

  /// Check if string is null or empty
  static bool isNullOrEmptyString(String? str) => str == null || str.trim().isEmpty;
}