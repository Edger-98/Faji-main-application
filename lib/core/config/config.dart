import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Configuration class for managing environment variables
class Config {
  // Private constructor to prevent instantiation
  Config._();

  /// Initialize configuration by loading environment variables
  static Future<void> initialize() async {
    await dotenv.load(fileName: _getEnvironmentFileName());
  }

  /// Get the appropriate .env file based on build mode
  static String _getEnvironmentFileName() {
    const String environment = String.fromEnvironment('ENVIRONMENT', defaultValue: 'dev');
    
    switch (environment.toLowerCase()) {
      case 'production':
      case 'prod':
        return '.env.production';
      case 'staging':
      case 'stage':
        return '.env.staging';
      case 'development':
      case 'dev':
      default:
        return '.env.dev';
    }
  }

  /// Get environment variable with optional default value
  static String _getEnvVar(String key, {String? defaultValue}) {
    final value = dotenv.env[key];
    if (value == null || value.isEmpty) {
      if (defaultValue != null) {
        return defaultValue;
      }
      throw Exception('Environment variable $key is not defined');
    }
    return value;
  }

  // API Configuration
  static String get baseUrl => _getEnvVar('BASE_URL');
  static String get apiVersion => _getEnvVar('API_VERSION', defaultValue: 'v1');
  static String get apiKey => _getEnvVar('API_KEY');

  // Firebase Configuration
  static String get firebaseProjectId => _getEnvVar('FIREBASE_PROJECT_ID');
  static String get firebaseApiKey => _getEnvVar('FIREBASE_API_KEY');
  static String get firebaseAppId => _getEnvVar('FIREBASE_APP_ID');

  // Feature Flags
  static bool get enableAnalytics => _getEnvVar('ENABLE_ANALYTICS', defaultValue: 'true').toLowerCase() == 'true';
  static bool get enableCrashlytics => _getEnvVar('ENABLE_CRASHLYTICS', defaultValue: 'true').toLowerCase() == 'true';
  static bool get enableLogging => _getEnvVar('ENABLE_LOGGING', defaultValue: 'true').toLowerCase() == 'true';
  static bool get enableDebugMode => _getEnvVar('DEBUG_MODE', defaultValue: 'false').toLowerCase() == 'true';

  // Environment Information
  static String get environment => _getEnvVar('ENVIRONMENT', defaultValue: 'dev');
  static bool get isProduction => environment.toLowerCase() == 'production';
  static bool get isDevelopment => environment.toLowerCase() == 'dev';
  static bool get isStaging => environment.toLowerCase() == 'staging';

  // Security Configuration
  static String get encryptionKey => _getEnvVar('ENCRYPTION_KEY');
  static String get jwtSecret => _getEnvVar('JWT_SECRET');

  // Third-party Services
  static String get googleMapsApiKey => _getEnvVar('GOOGLE_MAPS_API_KEY', defaultValue: '');
  static String get sentryDsn => _getEnvVar('SENTRY_DSN', defaultValue: '');

  /// Get full API URL with version
  static String get fullApiUrl => '$baseUrl/api/$apiVersion';

  /// Check if all required environment variables are set
  static bool validateConfiguration() {
    try {
      // Check required variables
      baseUrl;
      apiKey;
      firebaseProjectId;
      firebaseApiKey;
      firebaseAppId;
      encryptionKey;
      jwtSecret;
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get configuration summary for debugging (without sensitive data)
  static Map<String, dynamic> getConfigSummary() {
    return {
      'environment': environment,
      'baseUrl': baseUrl,
      'apiVersion': apiVersion,
      'enableAnalytics': enableAnalytics,
      'enableCrashlytics': enableCrashlytics,
      'enableLogging': enableLogging,
      'enableDebugMode': enableDebugMode,
      'isProduction': isProduction,
      'isDevelopment': isDevelopment,
      'isStaging': isStaging,
    };
  }
}