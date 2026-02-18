import 'package:fajimobileapp/core/config/config.dart';

/// API Configuration for different environments
class ApiConfig {
  // ========================================
  // 🚀 SIMPLE TOGGLE: Change this to switch between localhost and Heroku
  // ========================================
  static const bool _useLocalhost = false; // Set to false for Heroku
  
  // ========================================
  // Local Development URLs (automatically detected)
  // ========================================
  static const String _localhostAndroidUrl = 'http://10.0.2.2:5001/api/v1';
  static const String _localhostIosUrl = 'http://localhost:5001/api/v1';
  static const String _localhostWsAndroidUrl = 'ws://10.0.2.2:5001';
  static const String _localhostWsIosUrl = 'ws://localhost:5001';
  
  // ========================================
  // Heroku Production URLs
  // ========================================
  static const String _herokuUrl = 'https://faji-backend-52878caa6589.herokuapp.com/api/v1';
  static const String _herokuWsUrl = 'wss://faji-backend-52878caa6589.herokuapp.com';

  /// Get base URL - automatically switches between localhost and Heroku
  /// This OVERRIDES the .env file configuration
  static String get baseUrl {
    if (_useLocalhost) {
      // Auto-detect platform for localhost
      return _getLocalhostUrl();
    } else {
      // Use Heroku for all environments
      return _herokuUrl;
    }
  }

  /// Get WebSocket URL - automatically switches between localhost and Heroku
  static String get wsUrl {
    if (_useLocalhost) {
      // Auto-detect platform for localhost WebSocket
      return _getLocalhostWsUrl();
    } else {
      // Use Heroku WebSocket for all environments
      return _herokuWsUrl;
    }
  }

  /// Get base URL from environment files (original behavior)
  /// Use this if you want to respect .env file settings
  static String get baseUrlFromEnv {
    try {
      return Config.baseUrl;
    } catch (e) {
      // Fallback to current toggle system if env fails
      return baseUrl;
    }
  }

  /// Auto-detect localhost URL based on platform
  static String _getLocalhostUrl() {
    // For now, default to Android emulator URL
    // You can enhance this with platform detection if needed
    return _localhostAndroidUrl;
  }

  /// Auto-detect localhost WebSocket URL based on platform
  static String _getLocalhostWsUrl() {
    // For now, default to Android emulator WebSocket URL
    // You can enhance this with platform detection if needed
    return _localhostWsAndroidUrl;
  }

  /// Quick access methods for manual switching (if needed)
  static String get androidEmulatorBaseUrl => _localhostAndroidUrl;
  static String get iosSimulatorBaseUrl => _localhostIosUrl;
  static String get herokuBaseUrl => _herokuUrl;

  /// For physical devices, use your computer's IP address
  /// Find your IP:
  /// - Mac/Linux: ifconfig | grep "inet " | grep -v 127.0.0.1
  /// - Windows: ipconfig | findstr IPv4
  /// Example: 'http://192.168.1.100:5001/api/v1'
  static String getPhysicalDeviceBaseUrl(String computerIp) => 'http://$computerIp:5001/api/v1';

  /// Request timeout in milliseconds
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  static const int sendTimeout = 30000; // 30 seconds

  /// Pagination defaults
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  /// Cache duration in minutes
  static const int eventListCacheDuration = 2;
  static const int eventDetailsCacheDuration = 5;

  /// Rate limiting
  static const int maxRequestsPerMinute = 100;
  static const int maxUploadsPerHour = 10;

  /// File upload limits
  static const int maxFileSize = 10 * 1024 * 1024; // 10MB
  static const List<String> allowedImageFormats = <String>['jpg', 'jpeg', 'png', 'webp'];

  /// Retry configuration
  static const int maxRetries = 3;
  static const int retryDelay = 1000; // 1 second

  /// Feature flags
  static const bool enableWebSocket = true;
  static const bool enableOfflineMode = false;
  static const bool enableAnalytics = true;
  static const bool enableCrashReporting = true;

  /// Debug info - shows current configuration
  static void printCurrentConfig() {
    print('🚀 API Configuration:');
    print('   Using Localhost Toggle: $_useLocalhost');
    print('   Toggle Base URL: $baseUrl');
    print('   Env Base URL: ${_safeGetEnvUrl()}');
    print('   WebSocket URL: $wsUrl');
    print('   Environment: ${_safeGetEnvironment()}');
    print('   ⚠️  Note: Toggle OVERRIDES .env files');
  }

  /// Safe getter for environment URL (won't crash if env not loaded)
  static String _safeGetEnvUrl() {
    try {
      return Config.baseUrl;
    } catch (e) {
      return 'Not loaded or invalid';
    }
  }

  /// Safe getter for environment (won't crash if env not loaded)
  static String _safeGetEnvironment() {
    try {
      return Config.environment;
    } catch (e) {
      return 'Not loaded';
    }
  }
}
