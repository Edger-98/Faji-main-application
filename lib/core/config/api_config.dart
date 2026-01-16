/// API Configuration for different environments
class ApiConfig {
  // For Android Emulator, use 10.0.2.2 instead of localhost
  // For iOS Simulator or physical device on same network, use your computer's IP
  static const String _devBaseUrl = 'https://faji-backend-52878caa6589.herokuapp.com/api/v1';
  static const String _stagingBaseUrl = 'https://faji-backend-52878caa6589.herokuapp.com/api/v1';
  static const String _productionBaseUrl = 'https://faji-backend-52878caa6589.herokuapp.com/api/v1';

  static const String _devWsUrl = 'ws://localhost:5001';
  static const String _stagingWsUrl = 'wss://faji-backend-52878caa6589.herokuapp.com';
  static const String _productionWsUrl = 'wss://faji-backend-52878caa6589.herokuapp.com';


  // https://faji-backend-52878caa6589.herokuapp.com/
  /// Get base URL based on environment
  static String get baseUrl {
    const environment = String.fromEnvironment('ENV', defaultValue: 'dev');
    
    switch (environment) {
      case 'production':
        return _productionBaseUrl;
      case 'staging':
        return _stagingBaseUrl;
      case 'dev':
        return _devBaseUrl;
      default:
        return _devBaseUrl; // Default to dev (localhost)
    }
  }

  /// Get WebSocket URL based on environment
  static String get wsUrl {
    const environment = String.fromEnvironment('ENV', defaultValue: 'dev');
    
    switch (environment) {
      case 'production':
        return _productionWsUrl;
      case 'staging':
        return _stagingWsUrl;
      case 'dev':
        return _devWsUrl;
      default:
        return _productionWsUrl; // Default to production
    }
  }

  /// Android emulator uses 10.0.2.2 instead of localhost
  static String get androidEmulatorBaseUrl {
    return 'http://10.0.2.2:5001/api/v1';
  }

  /// For physical devices, use your computer's IP address
  /// Find your IP:
  /// - Mac/Linux: ifconfig | grep "inet " | grep -v 127.0.0.1
  /// - Windows: ipconfig | findstr IPv4
  /// Example: 'http://192.168.1.100:5001/api/v1'
  static String getPhysicalDeviceBaseUrl(String computerIp) {
    return 'http://$computerIp:5001/api/v1';
  }

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
  static const List<String> allowedImageFormats = ['jpg', 'jpeg', 'png', 'webp'];

  /// Retry configuration
  static const int maxRetries = 3;
  static const int retryDelay = 1000; // 1 second

  /// Feature flags
  static const bool enableWebSocket = true;
  static const bool enableOfflineMode = false;
  static const bool enableAnalytics = true;
  static const bool enableCrashReporting = true;
}
