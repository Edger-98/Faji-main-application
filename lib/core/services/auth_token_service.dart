import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fajimobileapp/core/services/api_service.dart';

/// Service to manage authentication token and sync with API service
class AuthTokenService {
  
  AuthTokenService(this._secureStorage, this._apiService);
  final FlutterSecureStorage _secureStorage;
  final ApiService _apiService;
  
  static const String _tokenKey = 'auth_token';
  
  /// Get stored token
  Future<String?> getToken() async => await _secureStorage.read(key: _tokenKey);
  
  /// Save token and set it in API service
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
    _apiService.setToken(token);
  }
  
  /// Remove token from storage and API service
  Future<void> removeToken() async {
    await _secureStorage.delete(key: _tokenKey);
    _apiService.removeToken();
  }
  
  /// Initialize - Load token from storage and set in API service
  Future<void> initialize() async {
    final String? token = await getToken();
    if (token != null && token.isNotEmpty) {
      _apiService.setToken(token);
    }
  }
}

/// Provider for AuthTokenService
final Provider<AuthTokenService> authTokenServiceProvider = Provider<AuthTokenService>((ProviderRef<AuthTokenService> ref) {
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();
  final ApiService apiService = ref.read(apiServiceProvider);
  return AuthTokenService(secureStorage, apiService);
});
