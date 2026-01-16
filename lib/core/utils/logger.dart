import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

import '../config/config.dart';

/// Centralized logging utility
class Logger {
  // Private constructor to prevent instantiation
  Logger._();

  /// Log debug messages
  static void debug(String message, [Object? error, StackTrace? stackTrace]) {
    if (_isLoggingEnabled() && (kDebugMode || _isDebugModeEnabled())) {
      _log('DEBUG', message, error, stackTrace);
    }
  }

  /// Log info messages
  static void info(String message, [Object? error, StackTrace? stackTrace]) {
    if (_isLoggingEnabled()) {
      _log('INFO', message, error, stackTrace);
    }
  }

  /// Log warning messages
  static void warning(String message, [Object? error, StackTrace? stackTrace]) {
    if (_isLoggingEnabled()) {
      _log('WARNING', message, error, stackTrace);
    }
  }

  /// Log error messages
  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    if (_isLoggingEnabled()) {
      _log('ERROR', message, error, stackTrace);
    }
  }

  /// Check if logging is enabled (safe to call before config initialization)
  static bool _isLoggingEnabled() {
    try {
      return Config.enableLogging;
    } catch (e) {
      // Config not initialized yet, default to true in debug mode
      return kDebugMode;
    }
  }

  /// Check if debug mode is enabled (safe to call before config initialization)
  static bool _isDebugModeEnabled() {
    try {
      return Config.enableDebugMode;
    } catch (e) {
      // Config not initialized yet, default to false
      return false;
    }
  }

  /// Internal logging method
  static void _log(String level, String message, [Object? error, StackTrace? stackTrace]) {
    final timestamp = DateTime.now().toIso8601String();
    final logMessage = '[$timestamp] [$level] $message';
    
    if (kDebugMode) {
      // In debug mode, use developer.log for better formatting
      developer.log(
        message,
        time: DateTime.now(),
        level: _getLevelValue(level),
        name: 'FajiMobileApp',
        error: error,
        stackTrace: stackTrace,
      );
    } else {
      // In production, use print (will be filtered out in release builds)
      print(logMessage);
      if (error != null) {
        print('Error: $error');
      }
      if (stackTrace != null && _isDebugModeEnabled()) {
        print('StackTrace: $stackTrace');
      }
    }
  }

  /// Get numeric level value for developer.log
  static int _getLevelValue(String level) {
    switch (level) {
      case 'DEBUG':
        return 500;
      case 'INFO':
        return 800;
      case 'WARNING':
        return 900;
      case 'ERROR':
        return 1000;
      default:
        return 800;
    }
  }

  /// Log API requests (with sensitive data filtering)
  static void apiRequest(String method, String url, [Map<String, dynamic>? data]) {
    if (_isLoggingEnabled() && (kDebugMode || _isDebugModeEnabled())) {
      final sanitizedData = _sanitizeData(data);
      debug('API Request: $method $url', sanitizedData);
    }
  }

  /// Log API responses (with sensitive data filtering)
  static void apiResponse(String method, String url, int statusCode, [dynamic data]) {
    if (_isLoggingEnabled() && (kDebugMode || _isDebugModeEnabled())) {
      final sanitizedData = _sanitizeData(data);
      debug('API Response: $method $url [$statusCode]', sanitizedData);
    }
  }

  /// Sanitize sensitive data from logs
  static dynamic _sanitizeData(dynamic data) {
    bool isProduction = false;
    try {
      isProduction = Config.isProduction;
    } catch (e) {
      // Config not initialized, assume not production
      isProduction = false;
    }

    if (!isProduction) {
      return data; // Show all data in development
    }

    if (data is Map<String, dynamic>) {
      final sanitized = <String, dynamic>{};
      data.forEach((key, value) {
        if (_isSensitiveKey(key)) {
          sanitized[key] = '***REDACTED***';
        } else if (value is Map<String, dynamic>) {
          sanitized[key] = _sanitizeData(value);
        } else if (value is List) {
          sanitized[key] = value.map((item) => _sanitizeData(item)).toList();
        } else {
          sanitized[key] = value;
        }
      });
      return sanitized;
    }

    if (data is List) {
      return data.map((item) => _sanitizeData(item)).toList();
    }

    return data;
  }

  /// Check if a key contains sensitive information
  static bool _isSensitiveKey(String key) {
    final sensitiveKeys = [
      'password',
      'token',
      'secret',
      'key',
      'authorization',
      'auth',
      'credential',
      'pin',
      'ssn',
      'social_security',
      'credit_card',
      'card_number',
      'cvv',
      'cvc',
    ];

    return sensitiveKeys.any((sensitiveKey) => 
      key.toLowerCase().contains(sensitiveKey));
  }
}