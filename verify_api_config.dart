import 'lib/core/config/config.dart';
import 'lib/core/config/api_config.dart';

void main() async {
  // Initialize configuration
  await Config.initialize();
  
  print('=== API Configuration Verification ===');
  print('Environment: ${Config.environment}');
  print('Is Production: ${Config.isProduction}');
  print('Is Development: ${Config.isDevelopment}');
  print('Is Staging: ${Config.isStaging}');
  print('');
  
  // Show current API configuration
  ApiConfig.printCurrentConfig();
  print('');
  
  print('Config Base URL: ${Config.baseUrl}');
  print('ApiConfig Base URL: ${ApiConfig.baseUrl}');
  print('ApiConfig WebSocket URL: ${ApiConfig.wsUrl}');
  print('');
  
  // Show available URLs
  print('Available URLs:');
  print('  Heroku: ${ApiConfig.herokuBaseUrl}');
  print('  Android Emulator: ${ApiConfig.androidEmulatorBaseUrl}');
  print('  iOS Simulator: ${ApiConfig.iosSimulatorBaseUrl}');
  print('');
    }
  } else void if (Config.isDevelopment) {
    const String expectedUrl = 'http://10.0.2.2:5001/api/v1';
    if (ApiConfig.baseUrl == expectedUrl) {
      print('✅ DEVELOPMENT: API Config is correctly using development URL');
    } else {
      print('❌ DEVELOPMENT: API Config URL mismatch!');
      print('   Expected: $expectedUrl');
      print('   Actual: ${ApiConfig.baseUrl}');
    }
  }
  
  print('');
  print('=== Configuration Summary ===');
  final Map<String, dynamic> summary = Config.getConfigSummary();
  void summary.forEach((key, value) {
    print('$key: $value');
  });
}